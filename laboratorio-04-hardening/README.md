
# LAB-04 — Hardening y configuración segura de PostgreSQL

## Objetivo

Identificar la superficie de ataque de PostgreSQL 16, evaluar su configuración de seguridad y proponer medidas de hardening para reducir riesgos relacionados con la red, autenticación, autorización, sistema operativo y cifrado.

## Entorno

| Elemento | Descripción |
|---|---|
| Motor de base de datos | PostgreSQL 16 |
| Sistema operativo | Linux |
| Puerto predeterminado | 5432/TCP |
| Archivos principales | `postgresql.conf`, `pg_hba.conf`, `pg_ident.conf` |
| Herramientas | SQL, terminal Linux y herramientas de red |

## Superficie de ataque inicial

Se realizaron consultas para identificar la versión del servidor, las interfaces de escucha, el puerto, el estado de TLS y el método de autenticación.

También se revisaron las conexiones activas, los archivos de configuración, las reglas de acceso, los roles, los privilegios y las extensiones instaladas.

| Elemento | Estado actual | ¿Es necesario? | Riesgo |
|---|---|---|---|
| Puerto PostgreSQL | Por verificar | Sí | Exposición del servicio |
| Interfaces de escucha | Por verificar | Sí | Acceso desde redes innecesarias |
| Conexiones remotas | Por verificar | Según necesidad | Acceso no autorizado |
| Usuarios administrativos | Por verificar | Sí | Privilegios excesivos |
| SSL/TLS | Por verificar | Sí, para conexiones remotas sensibles | Interceptación de comunicaciones |
| Métodos de autenticación | Por verificar | Sí | Autenticación débil o inadecuada |
| Reglas de `pg_hba.conf` | Por verificar | Sí | Acceso desde orígenes no autorizados |
| Permisos del sistema operativo | Por verificar | Sí | Lectura o modificación de archivos sensibles |

## Hallazgos

Durante la inspección se deben documentar los siguientes aspectos:

- Interfaces de escucha y exposición del puerto 5432.
- Reglas de autenticación demasiado amplias, como `0.0.0.0/0` o `::/0`.
- Cuentas con privilegios administrativos innecesarios.
- Cuentas de aplicación con permisos excesivos.
- Uso de métodos de autenticación y cifrado.
- Extensiones instaladas que no sean necesarias.
- Límites de conexiones y tiempos de espera.
- Permisos del directorio de datos y archivos de configuración.
- Configuración del firewall y redes autorizadas.
- Estado de las actualizaciones y los registros de actividad.

Los hallazgos definitivos deben basarse en los resultados obtenidos durante la inspección del servidor.

## Cambios realizados

| N.º | Área | Cambio o actividad |
|---:|---|---|
| 1 | Red | Se inspeccionaron el puerto y las interfaces de escucha. |
| 2 | Conexiones | Se revisaron las conexiones activas y sus direcciones de origen. |
| 3 | Configuración | Se identificaron las rutas de los archivos de PostgreSQL. |
| 4 | Autenticación | Se revisaron las reglas de `pg_hba.conf` y el método de autenticación. |
| 5 | Roles | Se inspeccionaron los atributos administrativos y las membresías. |
| 6 | Privilegios | Se revisaron los permisos de las bases de datos. |
| 7 | Extensiones | Se consultaron las extensiones instaladas. |
| 8 | Parámetros | Se revisaron los límites de conexiones y tiempos de espera. |
| 9 | Cifrado | Se verificó la configuración SSL/TLS y la conexión actual. |
| 10 | Sistema operativo | Se identificaron los archivos y directorios cuyos permisos deben comprobarse. |
| 11 | Firewall | Se plantearon reglas para permitir únicamente redes autorizadas. |
| 12 | Verificación | Se organizaron consultas para comprobar la configuración de seguridad. |

**Nota:** las actividades de inspección no implican que todos los controles hayan sido modificados. Registrar cada cambio aplicado y su evidencia antes de marcarlo como completado.

## Justificación de los cambios

- **Red:** limitar las interfaces y las redes autorizadas reduce la exposición del servicio.
- **Autenticación:** utilizar `scram-sha-256` y proteger las credenciales disminuye el riesgo de accesos indebidos.
- **Autorización:** aplicar el mínimo privilegio limita el impacto de una cuenta comprometida.
- **Configuración:** revisar los parámetros permite detectar valores inseguros y conexiones excesivas.
- **Extensiones:** habilitar únicamente las necesarias reduce la funcionalidad innecesaria.
- **Sistema operativo:** restringir los permisos protege los datos, las claves y los archivos de configuración.
- **Cifrado:** TLS protege las comunicaciones frente a la interceptación cuando se valida correctamente el certificado.
- **Mantenimiento:** las actualizaciones, revisiones y respaldos ayudan a conservar la seguridad y disponibilidad del servicio.

## Verificación

Las siguientes consultas permiten comprobar aspectos importantes de la configuración.

### Versión y red

```sql
SELECT version();

SHOW port;
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;
```

### Reglas de autenticación

```sql
SELECT
    rule_number,
    type,
    database,
    user_name,
    address,
    auth_method,
    error
FROM pg_hba_file_rules
ORDER BY rule_number;
```

### Roles administrativos

```sql
SELECT
    rolname,
    rolsuper,
    rolcreaterole,
    rolcreatedb,
    rolcanlogin
FROM pg_roles
WHERE rolsuper = TRUE
ORDER BY rolname;
```

### Cifrado de la conexión actual

```sql
SELECT
    pid,
    usename,
    client_addr,
    ssl,
    version,
    cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();
```

### Parámetros de conexiones

```sql
SHOW max_connections;
SHOW superuser_reserved_connections;
SHOW statement_timeout;
SHOW idle_in_transaction_session_timeout;
```

### Criterio de verificación

Comparar los resultados obtenidos con la configuración aprobada. Los valores desconocidos deben investigarse y las desviaciones deben documentarse antes de considerar el laboratorio terminado.

Las consultas SQL no sustituyen la inspección del firewall ni la comprobación de permisos en el sistema operativo.

## Checklist de hardening

| # | Control | Verificado | Evidencia |
|---:|---|---|---|
| 1 | Puerto documentado | Pendiente | 
| 2 | Interfaces de escucha justificadas | Pendiente | |
| 3 | `pg_hba.conf` revisado | Pendiente | |
| 4 | Redes autorizadas restringidas | Pendiente | |
| 5 | Autenticación segura configurada | Pendiente | |
| 6 | Superusuarios identificados | Pendiente | |
| 7 | Cuentas de aplicación separadas | Pendiente | |
| 8 | Privilegios mínimos aplicados | Pendiente | |
| 9 | Extensiones revisadas | Pendiente | |
| 10 | TLS verificado | Pendiente | |
| 11 | Archivos de configuración protegidos | Pendiente | |
| 12 | Directorio de datos protegido | Pendiente | |
| 13 | Firewall documentado | Pendiente | |
| 14 | Límites de conexiones revisados | Pendiente | |
| 15 | Actualizaciones documentadas | Pendiente | |
| 16 | Registros de actividad revisados | Pendiente | |
| 17 | Copias de seguridad verificadas | Pendiente | |
| 18 | Configuración final documentada | Pendiente | |

## Conclusiones

El laboratorio LAB-04 permite evaluar los principales componentes de seguridad de PostgreSQL 16 e identificar posibles configuraciones que aumenten su superficie de ataque.

La aplicación del hardening debe enfocarse en restringir el acceso de red, fortalecer la autenticación, separar las cuentas administrativas de las cuentas de aplicación, aplicar el mínimo privilegio y proteger los archivos del servidor.

Asimismo, es necesario verificar TLS, revisar los parámetros de conexión y mantener las actualizaciones y la documentación al día.

La implementación se considerará completa cuando los controles hayan sido comprobados mediante evidencias, las desviaciones estén corregidas o justificadas y la configuración final cumpla con el baseline de seguridad definido.
