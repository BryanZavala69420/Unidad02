# Introducción

El objetivo de esta práctica fue comprender la importancia de proteger la información almacenada en una base de datos PostgreSQL, así como los datos que se transmiten entre el cliente y el servidor.

En un sistema de información se pueden almacenar datos sensibles, como contraseñas, RFC, correos electrónicos e información financiera. Si estos datos no cuentan con mecanismos de protección adecuados, una persona que obtenga acceso no autorizado podría consultarlos, copiarlos o utilizarlos de manera indebida.

# Protección de credenciales

Las credenciales permiten comprobar la identidad de los usuarios de un sistema. Por esta razón, las contraseñas deben almacenarse mediante mecanismos especializados que dificulten su recuperación en caso de una filtración.

**Texto plano:**El texto claro consiste en almacenar una contraseña exactamente como fue proporcionada por el usuario. Por ejemplo, si la contraseña es Password123, ese mismo valor aparece en la tabla de la base de datos.

Esta práctica es insegura porque cualquier persona que obtenga acceso de lectura a la tabla puede conocer directamente la contraseña y posiblemente utilizarla para acceder a otros sistemas.

**Hash:**Un hash es una representación calculada a partir de un dato mediante una función diseñada para producir un resultado que no permita recuperar directamente el valor original.

En la práctica se utilizó la extensión pgcrypto de PostgreSQL, específicamente las funciones `crypt()` y `gen_salt()`.

**Cifrado:**El cifrado transforma la información original en un formato que no puede interpretarse directamente sin la clave correspondiente. A diferencia del hash, el cifrado está diseñado para permitir la recuperación del dato mediante el proceso de descifrado.

En esta práctica se utilizó `pgp_sym_encrypt()` para cifrar un RFC y `pgp_sym_decrypt()` para recuperar su valor original.

# Protección de datos sensibles

En el laboratorio se utilizó el RFC como ejemplo de información sensible que puede requerir protección adicional.

Se creó la tabla clientes_protegidos, que contiene un identificador, el nombre del cliente y el RFC cifrado en una columna de tipo BYTEA.

El cifrado se realizó mediante la función `pgp_sym_encrypt()`, utilizando una clave de demostración ficticia. Posteriormente, se utilizó `pgp_sym_decrypt()` para recuperar el RFC original.


# TLS

TLS (Transport Layer Security) es un protocolo que protege la comunicación entre un cliente y un servidor. Su función es ayudar a mantener la confidencialidad e integridad de los datos durante la transmisión y, cuando se valida correctamente el certificado, permitir la autenticación del servidor.
ç

# Gestión de claves

Las claves criptográficas son fundamentales para mantener la confidencialidad de la información cifrada. Si una persona no autorizada obtiene una clave, podría descifrar los datos protegidos con ella.

Por este motivo, las claves no deben almacenarse junto con los scripts SQL que las utilizan. Si el repositorio se publica, se comparte o se compromete, las claves podrían quedar expuestas junto con la información necesaria para utilizarlas.

# Resultados


# Problemas encontrados

Durante el laboratorio se estudiaron varios procedimientos de seguridad, en los que se identificaron los riegos de almacenar contraseñas en texto plano y se revisó el uso de varias funciones para crear hashes con contraseñas, asi mismo, se verificó la comparación entre los hashes y las contraseñas.

Se cifró y se gestionaron claves criptograficas y sus riesgos de añadirlos a los archivos de SQL, además de comprobar la configuración de SSL/TLS y el estado de la conexión actual.

# Conclusiones

La práctica permitió comprender que la seguridad de una base de datos requiere varios mecanismos complementarios. No basta con crear usuarios y asignar permisos: también es necesario proteger las contraseñas, cifrar los datos sensibles cuando corresponda, asegurar las comunicaciones y administrar correctamente las claves criptográficas.


---

# Preguntas de reflexión

**1- ¿Por qué una contraseña no debe almacenarse como texto claro?**
Porque cualquier persona que obtenga acceso de lectura a la tabla podría conocer inmediatamente la contraseña. Además, si una persona utiliza la misma contraseña en otros servicios, una filtración podría comprometer varias cuentas. El almacenamiento mediante un algoritmo especializado para contraseñas dificulta su recuperación y reduce el impacto de una filtración.

**2- ¿Por qué un hash no es equivalente a un cifrado?**
Porque tienen objetivos diferentes. El hash está diseñado para comprobar un valor sin tener que recuperar el original, mientras que el cifrado permite recuperar la información mediante una clave. Las contraseñas se almacenan mediante hashes especializados; los datos que necesitan recuperarse pueden protegerse mediante cifrado.

**3- ¿Por qué el cifrado de una columna no sustituye al control de acceso?**

Porque el cifrado protege la confidencialidad del dato, pero no administra los permisos de los usuarios. Si una cuenta no autorizada puede consultar la tabla y también tiene acceso a la clave de descifrado, podrá recuperar la información. Por ello, deben combinarse el cifrado, los permisos de PostgreSQL y una gestión segura de las claves.

**4- Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?**

Porque TLS protege los datos durante la transmisión y puede ayudar a verificar la identidad del servidor, pero no determina las operaciones que cada usuario tiene permitidas. PostgreSQL debe seguir utilizando roles, privilegios y políticas de acceso para controlar las consultas y modificaciones de datos.

**5- ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?**

La organización podría perder la capacidad de descifrar los datos protegidos con esa clave. Si no existe una copia de respaldo segura o un mecanismo de recuperación, la información podría quedar inaccesible permanentemente.

**6- ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?**

La clave debe considerarse comprometida, incluso si el repositorio es privado. Una persona que obtenga la clave podría descifrar información protegida con ella, dependiendo de los datos y permisos disponibles.


**7- Por qué un repositorio privado no debe considerarse un almacén de secretos?**

Porque los repositorios pueden ser compartidos con colaboradores, sufrir accesos no autorizados, generar copias locales o conservar secretos en el historial de versiones. La privacidad del repositorio reduce la exposición.

**8- ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?**

La protección de información almacenada, también conocida como protección en reposo, busca evitar que los datos guardados en tablas, archivos o respaldos sean utilizados por personas no autorizadas. Puede incluir cifrado de columnas, cifrado de discos y cifrado de respaldos.

**9- ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?**

Porque un algoritmo sólido no puede proteger la información si la clave se expone, se pierde o se administra incorrectamente. Una clave comprometida puede permitir el descifrado de datos sin necesidad de romper el algoritmo. Por ello, deben controlarse su generación, almacenamiento, acceso, rotación, respaldo, revocación y eliminación.

**10- ¿Qué mecanismo adicional implementarías en una organización para proteger los respaldos de las bases de datos?**

Implementaría el cifrado de los respaldos antes de almacenarlos, utilizando claves administradas por un servicio especializado y separadas de los archivos de respaldo. También aplicaría controles de acceso estrictos, almacenamiento aislado o inmutable, copias fuera del entorno principal y pruebas periódicas de restauración.