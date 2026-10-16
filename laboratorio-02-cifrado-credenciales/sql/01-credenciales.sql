----- ACTIVIDAD 1 PROTECCION DE CREDENCIALES

---Creacion de la tabla
CREATE TABLE usuarios_insegura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);


---Insertar usuario de prueba

INSERT INTO usuarios_insegura (usuario, password) VALUES ('juan', 'Password123');

---Consultar si se insertaron bien

SELECT * FROM usuarios_insegura;

---Generar una representacion no reversible
SELECT crypt('Password123',gen_salt('bf'));

---ejecutar nuevamentwe
SELECT crypt('Password123',gen_salt('bf'));

---Crear tabla para credenciales protegidas

CREATE TABLE usuarios_segura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

--- insertar usuarios
INSERT INTO usuarios_segura (usuario, password_hash)VALUES ('juan',crypt('Password123', gen_salt('bf')));

---consultar en la tabla
SELECT * FROM usuarios_segura;

---verificar la contraseña 


SELECT usuario,password_hash = crypt('Password123', password_hash) AS contraseña_correcta
FROM usuarios_segura WHERE usuario = 'juan';


---Verificar con una contraseña diferente


SELECT usuario,password_hash = crypt('DuermanLaUAS', password_hash) AS contraseña_correcta
FROM usuarios_segura WHERE usuario = 'juan';


