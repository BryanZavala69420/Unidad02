
# Informe

### 1. ¿Cuál era la principal superficie de ataque?

La principal superficie de ataque estaba formada por el servicio PostgreSQL expuesto en la red, sus puertos de escucha, las reglas de acceso definidas en `pg_hba.conf`, los mecanismos de autenticación y los privilegios asignados a los usuarios. Una configuración demasiado permisiva podía facilitar conexiones no autorizadas o el abuso de cuentas legítimas.

### 2. ¿Qué configuración representaba el mayor riesgo?

Una configuración de acceso excesivamente permisiva, como reglas amplias en `pg_hba.conf`, autenticación débil o privilegios innecesarios, representaba un riesgo importante. En particular, permitir conexiones desde redes no confiables sin controles adecuados aumentaba la posibilidad de accesos indebidos.

El riesgo concreto debe determinarse a partir de la configuración encontrada durante la inspección inicial.

### 3. ¿Qué cambio produjo la mayor reducción de exposición?

Restringir las conexiones de red a las direcciones IP y redes que realmente necesitan acceder al servidor produjo una reducción importante de la exposición. Esto puede lograrse limitando `listen_addresses`, ajustando las reglas de `pg_hba.conf` y aplicando reglas de firewall.

La eficacia depende de la configuración inicial y de los cambios realmente aplicados y verificados.

### 4. ¿Qué diferencia existe entre firewall y `pg_hba.conf`?

El firewall controla el tráfico de red que puede llegar al servidor, utilizando criterios como direcciones IP, puertos y protocolos. En cambio, `pg_hba.conf` determina qué conexiones a PostgreSQL pueden intentar autenticarse, considerando parámetros como la base de datos, el usuario, el origen de la conexión y el método de autenticación.

Ambos controles son complementarios: el firewall reduce la exposición de red y `pg_hba.conf` restringe el acceso al servicio PostgreSQL.

### 5. ¿Qué diferencia existe entre autenticación y autorización?

La autenticación verifica la identidad de quien intenta conectarse, por ejemplo, mediante una contraseña o un certificado. La autorización determina qué acciones puede realizar esa identidad una vez autenticada, como consultar tablas, insertar registros o administrar objetos.

Una conexión autenticada no implica que el usuario deba tener permisos sobre todos los recursos de la base de datos.

### 6. ¿Por qué una cuenta de aplicación no debe ser `SUPERUSER`?

Porque el atributo `SUPERUSER` permite eludir numerosas restricciones de seguridad y realizar operaciones administrativas de alto impacto. Si una aplicación es comprometida, un atacante podría aprovechar esos privilegios para acceder a información, modificar configuraciones o afectar otras bases de datos del servidor.

La cuenta de aplicación debe seguir el principio de mínimo privilegio y recibir únicamente los permisos necesarios para sus funciones.

### 7. ¿Por qué cambiar el puerto de PostgreSQL no constituye hardening suficiente?

Cambiar el puerto predeterminado puede reducir algunos intentos automatizados que buscan el puerto habitual, pero no impide que un atacante descubra el nuevo puerto mediante un escaneo de red. Tampoco corrige reglas de acceso permisivas, contraseñas débiles, privilegios excesivos ni una exposición innecesaria del servicio.

El hardening efectivo requiere controles de red, autenticación robusta, autorización adecuada, actualizaciones y una configuración segura.

### 8. ¿Por qué `listen_addresses='*'` puede ser innecesario?

Porque este valor permite que PostgreSQL escuche en todas las interfaces de red disponibles, lo que puede exponer el servicio en interfaces que no necesitan aceptar conexiones. Si el servidor solo debe recibir conexiones locales o desde una interfaz privada específica, es preferible limitar `listen_addresses` a las direcciones necesarias.

Esta opción debe complementarse con el firewall y las reglas de `pg_hba.conf`. Por sí sola, no concede acceso automático a todos los clientes.

### 9. ¿Qué papel tiene el sistema operativo en la seguridad de PostgreSQL?

El sistema operativo protege los archivos de configuración, los datos, los registros y las credenciales mediante permisos de archivos, propietarios, grupos y controles de acceso. También proporciona actualizaciones de seguridad, aislamiento de procesos, administración de servicios y filtrado de red.

Los directorios y archivos de PostgreSQL deben ser accesibles únicamente para las cuentas que los necesitan. Además, el servicio debe ejecutarse con una cuenta dedicada y con privilegios limitados.

### 10. ¿Qué controles deberían revisarse periódicamente?

Los principales controles que deben revisarse son:

- Las direcciones de escucha configuradas en `listen_addresses`.
- Las reglas y los métodos de autenticación de `pg_hba.conf`.
- El uso de autenticación segura, como SCRAM-SHA-256 cuando corresponda.
- Los roles, los atributos `SUPERUSER` y los privilegios sobre bases de datos, esquemas y tablas.
- Las cuentas inactivas, innecesarias o con permisos excesivos.
- Los límites de conexiones y los parámetros de recursos.
- Los permisos del sistema operativo sobre archivos, directorios y registros.
- Las reglas del firewall y la exposición de los puertos.
- La configuración TLS cuando se requiera cifrado de las conexiones.


