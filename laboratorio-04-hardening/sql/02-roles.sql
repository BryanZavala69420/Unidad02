-------- ROLES --------

--- Roles existentes y atributos administrativos

SELECT
    rolname,
    rolsuper,
    rolinherit,
    rolcreaterole,
    rolcreatedb,
    rolcanlogin,
    rolreplication,
    rolconnlimit,
    rolvaliduntil
FROM pg_roles ---gaturroña, si son un buen.
ORDER BY rolname;


--- Membresia entre los roles

SELECT
    member.rolname AS miembro,
    role.rolname AS rol_concedido,
    membership.admin_option
FROM pg_auth_members AS membership
JOIN pg_roles AS role
    ON role.oid = membership.roleid
JOIN pg_roles AS member
    ON member.oid = membership.member
ORDER BY member.rolname, role.rolname;

--- Privilegios de la base de datos

SELECT
    datname,
    datacl
FROM pg_database
ORDER BY datname;





