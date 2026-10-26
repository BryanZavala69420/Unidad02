
# Tabla de cambios realizados

| N.º | Sección | Cambios realizados |
|---:|---|---|
| 1 | Inspección del servidor | Se agregó la consulta para identificar la versión de PostgreSQL. |
| 2 | Configuración de red | Se incorporó la revisión del puerto, las interfaces de escucha, SSL y el cifrado de contraseñas. |
| 3 | Conexiones activas | Se añadieron consultas para identificar usuarios, bases de datos, direcciones IP y aplicaciones conectadas. |
| 4 | Archivos de configuración | Se incluyó la identificación de las rutas de los archivos de datos y configuración. |
| 5 | Parámetros de red | Se agregó la revisión de los parámetros de red, su origen y los reinicios pendientes. |
| 6 | Reglas de autenticación | Se incorporó la inspección de `pg_hba.conf` para identificar reglas, direcciones y errores. |
| 7 | Reglas permisivas | Se añadió una consulta para detectar configuraciones de acceso potencialmente permisivas. |
| 8 | Roles y cuentas | Se incluyó la revisión de atributos administrativos, inicio de sesión y límites de conexión. |
| 9 | Membresías de roles | Se agregó la consulta de membresías y permisos para administrar roles. |
| 10 | Privilegios de bases de datos | Se incorporó la revisión de las listas de control de acceso de las bases de datos. |
| 11 | Extensiones | Se añadió la identificación de las extensiones instaladas y sus versiones. |
| 12 | Parámetros de seguridad | Se incluyeron configuraciones de conexiones, tiempos de espera y conexiones reservadas. |
| 13 | Cifrado TLS | Se agregó la verificación del estado SSL, la versión TLS y el cifrado de la conexión actual. |
| 14 | Verificación final | Se agruparon consultas para comprobar la red, autenticación, roles administrativos, extensiones y conexiones. |
| 15 | Organización del script | Se organizaron las consultas por secciones para facilitar la inspección y auditoría. |

## Observaciones

- Se identificaron consultas repetidas en la verificación final, como las de roles administrativos, extensiones y conexiones activas.
- Se recomienda mejorar la detección de reglas permisivas para contemplar correctamente las redes `0.0.0.0/0` y `::/0`.
- Las consultas SQL no verifican directamente los permisos del sistema operativo ni las reglas del firewall.
- La inspección permite identificar configuraciones relevantes, pero los resultados deben compararse con el baseline de seguridad aprobado.
