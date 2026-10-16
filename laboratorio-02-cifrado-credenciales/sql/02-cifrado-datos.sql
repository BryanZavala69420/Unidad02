-------- ACTIVIDAD 2 CIFRADO DE INFORMACION SENSIBLE ------

---Crear tabla demonstracion


CREATE TABLE clientes_protegidos (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    rfc_cifrado BYTEA NOT NULL
);

---insertar registro con cifrado simetrico
INSERT INTO clientes_protegidos (nombre,
rfc_cifrado)VALUES ('Ana López',pgp_sym_encrypt('LOPA900101ABC', 'CLAVE-DE-PRUEBA'));


---consulta en la tabla 

SELECT * FROM clientes_protegidos;

---Recuperar el dato
SELECT id,nombre,
    pgp_sym_decrypt(rfc_cifrado,'CLAVE-DE-PRUEBA') AS rfc
FROM clientes_protegidos;










