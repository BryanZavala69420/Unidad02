# Actividad 7 — Comparar protección en reposo y protección en tránsito


| Situación | Mecanismo apropiado | ¿Qué protege? |
|---|---|---|
| Contraseña de usuario | Hashing con salt (bcrypt o Argon2) | Protege las contraseñas almacenadas, evitando guardar las contraseñas en texto plano. |
| RFC almacenado en una tabla | Cifrado en reposo (AES-256) | Protege la confidencialidad de los datos personales almacenados en la base de datos. |
| Consulta enviada desde un cliente al servidor | TLS/HTTPS | Protege los datos en tránsito contra la interceptación y la modificación durante la comunicación. |
| Respaldo de una base de datos | Cifrado en reposo (AES-256) | Protege la información de las copias de seguridad contra accesos no autorizados. |
| Clave criptográfica | Gestión segura de claves (KMS o HSM) | Protege la clave contra el robo, la exposición y el uso no autorizado. |