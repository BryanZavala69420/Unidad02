--------- INSPECCION ---------

--- Version del servidor

SELECT version();


--- Configuracion de red

SHOW port;
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;

--- Ver las conexiones

SELECT pid, usename, datname, client_addr, client_port, application_name
FROM pg_stat_activity ORDER BY usename, datname;

--- Rutas de configuración 

SHOW data_directory;
SHOW config_file;
SHOW hba_file;

--- Parametros y escuchas

SELECT name, setting, source, pending_restart
FROM pg_settings
WHERE name IN ('listen_addresses', 'port');

---- Reglas del pg_hba.conf

SELECT
    rule_number,
    file_name,
    line_number,
    type,
    database,
    user_name,
    address,
    auth_method,
    error
FROM pg_hba_file_rules
ORDER BY rule_number;

--- Reglas Potencialmente permisivas

SELECT
    rule_number,
    type,
    database,
    user_name,
    address,
    auth_method,
    error
FROM pg_hba_file_rules
WHERE
    'all' = ANY(database)
    OR 'all' = ANY(user_name)
    OR address = '0.0.0.0'
    OR address = '::'
ORDER BY rule_number;

