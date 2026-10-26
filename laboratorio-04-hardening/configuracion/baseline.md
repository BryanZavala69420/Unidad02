
# Baseline de Seguridad para PostgreSQL 16

## 1. Red

- **Interfaces autorizadas:** Escuchar únicamente en las interfaces necesarias mediante `listen_addresses`.
- **Puerto:** Utilizar TCP/5432 por defecto.
- **Firewall:** Permitir conexiones únicamente desde equipos autorizados.
- **Redes permitidas:** Restringir el acceso mediante direcciones IP y subredes autorizadas en el firewall y `pg_hba.conf`.
- **Exposición pública:** No permitir conexiones directas desde Internet.

## 2. Autenticación

- **Método:** Utilizar `scram-sha-256` para autenticación mediante contraseña.
- **Credenciales:** Usar contraseñas únicas y seguras; almacenar secretos de forma protegida.
- **Cuentas administrativas:** Limitar el acceso a personal autorizado y evitar el uso habitual de `SUPERUSER`.
- **Acceso remoto:** Exigir conexiones cifradas mediante TLS y reglas `hostssl`.
- **Acceso local:** Restringir las conexiones locales según la política del sistema operativo.

## 3. Autorización

- **Roles:** Separar roles administrativos, de lectura y de aplicación.
- **Privilegios:** Aplicar el principio de mínimo privilegio.
- **Cuentas de aplicación:** Crear cuentas independientes por aplicación y evitar privilegios administrativos.
- **Permisos:** Restringir el acceso a bases de datos, esquemas y objetos necesarios.
- **Revisión:** Auditar periódicamente los roles y sus privilegios.

## 4. Configuración

- **Parámetros relevantes:** Configurar `listen_addresses`, `port`, `password_encryption`, `ssl` y los parámetros de registro.
- **Extensiones:** Instalar únicamente extensiones necesarias y autorizadas.
- **Conexiones:** Establecer límites de conexiones según la capacidad del servidor.
- **Registros:** Habilitar el registro de conexiones, desconexiones y errores relevantes.
- **Cambios:** Revisar y probar las modificaciones antes de aplicarlas en producción.

## 5. Sistema operativo

- **Propietario de archivos:** Utilizar la cuenta de servicio `postgres` como propietaria del directorio de datos.
- **Permisos:** Restringir los permisos del directorio de datos y los archivos de configuración.
- **Protección de datos:** Impedir el acceso de usuarios no autorizados a `PGDATA`.
- **Cuenta de servicio:** Ejecutar PostgreSQL con una cuenta dedicada y sin privilegios de administrador.
- **Actualizaciones:** Mantener el sistema operativo y sus componentes actualizados.

## 6. Cifrado

- **TLS:** Habilitar TLS para las conexiones remotas y validar los certificados del servidor.
- **Credenciales:** Proteger las contraseñas mediante SCRAM y almacenarlas en un gestor de secretos.
- **Claves privadas:** Restringir el acceso a los archivos de claves TLS.
- **Información sensible:** Aplicar cifrado en reposo cuando corresponda.
- **Copias de seguridad:** Cifrar los respaldos y restringir su acceso.

## 7. Mantenimiento

- **Actualización:** Aplicar regularmente actualizaciones de seguridad de PostgreSQL y del sistema operativo.
- **Revisión periódica:** Revisar mensualmente cuentas, privilegios, conexiones y registros.
- **Copias de seguridad:** Realizar respaldos y comprobar periódicamente su restauración.
- **Documentación:** Mantener actualizado el inventario, la configuración y los procedimientos de recuperación.
- **Excepciones:** Documentar y aprobar cualquier desviación del baseline.
