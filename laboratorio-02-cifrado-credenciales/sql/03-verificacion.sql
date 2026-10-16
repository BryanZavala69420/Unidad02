--------- ACTIVIDAD 5 Verificaar el estado del TLS
---Consultar el SSL
SHOW ssl;

---tambien se puede, pero me da error de permisos :(

SHOW ssl_min_protocol_version;

--consultar el puerto

SHOW port;
SHOW listen_addresses;


---Verificar las conexiones actuales

SELECT inet_client_addr(),inet_client_port();


---y verificar si la sesion actual utiliza TLS

SELECT ssl,version,cipher FROM pg_stat_ssl WHERE pid = pg_backend_pid();