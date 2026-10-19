# Actividad 8 — Analisis de escenario de seguridad


Considera la siguiente situación:

    Una empresa almacena los siguientes elementos:

        nombre
        correo electrónico
        contraseña
        RFC
        información financiera
        claves criptográficas

    La base de datos utiliza usuarios y roles correctamente.

    Sin embargo:

        las contraseñas están almacenadas en texto claro
        el RFC está almacenado en texto claro
        las conexiones utilizan una configuración sin validación adecuada del servidor
        las claves criptográficas aparecen en archivos SQL
        los respaldos se almacenan sin protección adicional

**Responde:**
---




**1- ¿Cuáles son los principales riesgos?**

**1.1- Contraseñas en texto plano:**  Un atacante accede a la base de datos, puede obtener las contraseñas directamente y utilizarlas para acceder a las cuentas de los usuarios.

**1.2- RFC en texto plano:** Puede provocar el robo de identidad, la suplantación de personas y el uso indebido de datos personales.
**1.3- Conexiones sin validación adecuada del servidor:**Permien ataques de intermediario en los queun atacantepodría interceptar información transmitida. 

**1.4- Claves criptográficas en archivos SQL:**Pueden quedar expuestas al compartir, almacenar o publicar esos archivos, lo que permitiría descifrar información o suplantar sistemas.

**1.5Respaldos sin protección adicional:**Si alguien obtiene una copia de seguridad, podría acceder a una gran cantidad de información sensible sin necesidad de ingresar al sistema principal.

**2- ¿Qué mecanismo utilizarías para cada elemento?**
| Elemento | Mecanismo recomendado | Justificación |
|---|---|---|
| Nombre | Control de acceso y cifrado cuando el riesgo lo requiera | Reduce la exposición de los datos personales. |
| Correo electrónico | Control de acceso y cifrado cuando sea necesario | Protege la información de contacto ante accesos indebidos. |
| Contraseña | Hash seguro con sal, como Argon2id, scrypt o bcrypt | Evita almacenar contraseñas recuperables en texto claro. |
| RFC | Cifrado a nivel de campo y gestión segura de claves | Protege la información fiscal ante accesos no autorizados. |
| Información financiera | Cifrado en reposo y en tránsito mediante TLS | Reduce el riesgo de filtración e interceptación. |
| Claves criptográficas | KMS o HSM, con acceso restringido y auditoría | Evita que las claves queden expuestas en archivos SQL. |
| Conexiones a la base de datos | TLS con validación del certificado y del nombre del servidor | Ayuda a prevenir ataques de intermediario y suplantación. |
| Respaldos | Cifrado, acceso restringido y almacenamiento separado | Protege la información ante robos o filtraciones. |


**3-¿Cuál de los problemas consideras más crítico y por qué?**

Considero que la exposición de las claves criptográficas en archivos SQL es uno de los problemas más críticos, porque una clave comprometida puede permitir descifrar información protegida y afectar a múltiples sistemas. Si una clave protege datos personales, información financiera o respaldos, su exposición puede comprometer grandes cantidades de información.


**4-¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos?**

No. Tener usuarios y roles correctamente configurados es una medida importante, pero no elimina todos los riesgos de seguridad.

Los controles de acceso determinan quién puede consultar o modificar los datos; sin embargo, no sustituyen los mecanismos de protección criptográfica.

