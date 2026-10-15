
----- ACTIVIDAD 3 SEUDONIMIZACION --------

----CREAR LOS ESQUEMAS

CREATE SCHEMA pii;

CREATE SCHEMA analitica;


----- CREAR LA TABLA DE CORRESPONDENCIA

CREATE TABLE pii.mapa_cliente (
    token UUID PRIMARY KEY,
    cliente_id BIGINT UNIQUE
        REFERENCES public.clientes(id)
);

---- GENERAR LOS TOKENS

INSERT INTO pii.mapa_cliente (token, cliente_id)
SELECT 
    gen_random_uuid(),
    id
FROM clientes;

---- VERIFICAR
SELECT * FROM pii.mapa_cliente;

---- CREAR EL CONJUNTO DE DATOS DE ANALITICA

CREATE TABLE analitica.clientes
AS SELECT
    m.token AS cliente_token,
    c.edad,
    c.ciudad,
    c.codigo_postal,
    c.fecha_alta
FROM pii.mapa_cliente m
JOIN clientes c
    ON c.id = m.cliente_id;

---- VERIFICAR

SELECT * FROM analitica.clientes;


------------- ACTIVIDAD 4 SEPERACION DE FUNCIONES--------------


---- CREAR EL ROL

CREATE ROLE analista_2 NOLOGIN;

---- CONCEDER ACCESO AL CONJUNTO DE DATOS

GRANT USAGE ON SCHEMA analitica to analista_2;

GRANT SELECT ON analitica.clientes to analista_2;

---- No dedbera contener acceso a pii.mapa_cliente
---- ni public.clientes
GRANT analista_2 TO u_20406894_bryan_zavala; 
---- VERIFICAR PERMISOS
SELECT * FROM analitica.clientes;
---- EL ACCESO AL MAPA DEBE ESTAR RESTRINGIDO
SELECT * FROM pii.mapa_cliente;
--TAMBIEN DEBE DE ESTAR RESTRINGIDO EL ACCESO DIRECTO A LOS DATOS ORIGINALES
SELECT * FROM public.clientes;