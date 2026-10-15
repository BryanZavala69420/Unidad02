----------- ACTIVIDAD 7 RETENCION DE DATOS --------------

SELECT * FROM clientes WHERE fecha_alta < CURRENT_DATE - INTERVAL '5 years';




-------- VERIFICACION FINAL -------


---- AREA DE SOPORTE DEBE DE CONSULTAR

SELECT * FROM v_clientes_soporte;

---- PERO NO ACCEDER DIRECTAMENTE A:
SELECT * FROM clientes;

---- AREA DE ANALITICA DEBE PODER CONSULTAR
SELECT * FROM analitica.clientes;

---- PERO NO
SELECT * FROM pii.mapa_cliente;

---- NI:
SELECT * FROM public.clientes;