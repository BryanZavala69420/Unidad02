------ CONFIGURACIONES ------


--- Revisar extensiones
SELECT
    extname,
    extversion
FROM pg_extension
ORDER BY extname;

--- Revisar configuraciones 
SHOW max_connections;
SHOW superuser_reserved_connections;
SHOW statement_timeout;
SHOW idle_in_transaction_session_timeout;


--- Revisar permisos del S.O
SHOW data_directory;
SHOW config_file;
SHOW hba_file;


--- Revisar la conexion actual

SELECT
    pid,
    usename,
    client_addr,
    ssl,
    version,
    cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();

--- REvisar parametros relevantes de seguridad

SELECT
    name,
    setting,
    unit,
    source,
    pending_restart
FROM pg_settings
WHERE name IN (
    'listen_addresses',
    'port',
    'ssl',
    'password_encryption',
    'max_connections',
    'superuser_reserved_connections',
    'statement_timeout',
    'idle_in_transaction_session_timeout',
    'ssl_min_protocol_version'
)
ORDER BY name;