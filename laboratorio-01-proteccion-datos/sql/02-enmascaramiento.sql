--------ACTIVIDAD 2 ENMASCARAMIENTO----------

---CREAR EL ROL
CREATE ROLE soporte NOLOGIN;
----CREAR LA VISTA CON ACCESO RESTRINGIDO
CREATE VIEW v_clientes_soporte AS
SELECT 
    id,
    nombre,

    CONCAT(
        LEFT(correo, 2),
        '*****',
        SUBSTRING(correo FROM POSITION('@' IN correo))

    ) AS correo,

    CONCAT(
        '******'
        RIGHT(telefono, 4)
    ) AS telefono,

    CONCAT(
        '*********'
        RIGHT(rfc, 4)
    )AS rfc

FROM clientes;

--CONSULTAR LA VISTA
SELECT * FROM v_clientes_soporte;

--CONCEDER ACCESO A LA VISTA
GRANT USAGE ON SCHEMA public TO soporte;

GRANT SELECT ON v_clientes_soporte TO soporte;
---REVOCAR ACCESO DIRECTO A LA TABLA
REVOKE ALL on clientes FROM soporte;
--VERIFICAR RESULTADOI
SELECT * FROM v_clientes_soporte;
--ACCESO DIRECTO A LA TABLA DEBE ESTAR RESTRINGIDO PARA EL ROL DE soporte
SELECT * FROM clientes;

