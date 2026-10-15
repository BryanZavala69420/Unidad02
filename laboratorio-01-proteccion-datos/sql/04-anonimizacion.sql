
--------- ACTIVIDAD 5 ANONIMIZACION -----------

---- Generalidar Edad 

SELECT 
    CASE 
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,
    COUNT(*) AS total
FROM clientes
GROUP BY 1;

---- GENERALIZAR LA REGION

SELECT
    LEFT(codigo_postal, 2) AS region,
    COUNT(*) AS total
FROM clientes
GROUP BY 1;

---- COMBINAR ATRIBUTOS

SELECT
    CASE
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,

    LEFT(codigo_postal, 2) AS region,

    COUNT(*) AS total

FROM clientes

GROUP BY 1, 2;

---- SUPRIMIR GRUPOS PEQUEÑOS

SELECT
    CASE
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,

    LEFT(codigo_postal, 2) AS region,

    COUNT(*) AS total

FROM clientes

GROUP BY 1, 2

HAVING COUNT(*) >= 5;



------------- ACTIVIDAD 6 ANALISIS DE RIESGO DE REIDENTIFIACION


SELECT
    CASE
        WHEN edad BETWEEN 18 AND 40 THEN '18-40'
        ELSE '41+'
    END AS rango_edad,

    LEFT(codigo_postal, 1) AS region,

    COUNT(*) AS total

FROM clientes

GROUP BY 1, 2

HAVING COUNT(*) >= 10;