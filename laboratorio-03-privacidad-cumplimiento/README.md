# Laboratorio 03 — Privacidad y cumplimiento


## Introducción 

El objetivo de este laboratorio es analizar cómo aplicar los principios de privacidad y cumplimiento en la administración de bases de datos. La empresa almacena información personal de sus clientes, como nombres, correos electrónicos, teléfonos y RFC, que debe protegerse y utilizarse únicamente para finalidades justificadas.

Por ello, se propone aplicar minimización de datos, separación por finalidades, control de acceso, políticas de retención y procedimientos para atender los derechos ARCO.


## Inventario de datos

 Dato | ¿Es dato personal? | Finalidad | ¿Es necesario? | Acceso |
|---|---|---|---|---|
| id | Puede identificar indirectamente | Identificación interna | Sí | Según función |
| nombre | Sí | Identificar al cliente | Sí | Atención y facturación |
| correo | Sí | Contacto y notificaciones | Si se necesita contacto | Atención al cliente |
| telefono | Sí | Contacto | Si es necesario | Atención al cliente |
| rfc | Sí | Facturación | Cuando corresponda | Facturación |
| edad | Puede serlo al vincularse con una persona | Estadísticas | Solo si es necesaria | Analítica limitada |
| ciudad | Puede serlo al vincularse con una persona | Estadísticas geográficas | Según finalidad | Analítica |
| codigo_postal | Puede serlo al vincularse con una persona | Dirección o análisis geográfico | Según necesidad | Personal autorizado |
| fecha_alta | Puede serlo al vincularse con una persona | Administración de clientes | Generalmente sí | Según función |


## Finalidades

Se analizaron las necesidades de las áreas de atención al cliente, facturación y analítica.

- **Atención al cliente:** necesita nombre, correo y teléfono para comunicarse con los clientes.
- **Facturación:** requiere el nombre, RFC y los datos fiscales necesarios.
- **Analítica:** necesita información estadística, como ciudad y rangos de edad, sin identificar individualmente a los clientes.
- **Marketing:** requiere una revisión previa para determinar si el uso de los datos con fines promocionales está justificado y permitido.


## Minimización

Se analizó la propuesta de crear una tabla de soporte que copiara todos los campos de la tabla principal.

Se determinó que algunos datos, como el RFC y la edad, no son necesarios para las tareas habituales de atención al cliente.

Por ello, se propuso una tabla reducida con los campos `id`, `nombre`, `correo` y `telefono`, utilizando instrucciones SQL para copiar únicamente la información requerida.

También se planteó el uso de consultas agregadas para analítica, reduciendo la exposición de datos personales.

## Control de acceso

Se propuso crear el rol `analista` en PostgreSQL y otorgarle permisos únicamente sobre una vista destinada a analítica.

La vista proporciona información sobre la ciudad y el rango de edad de los clientes, evitando exponer directamente nombres, correos electrónicos, teléfonos y RFC.

Se utilizaron instrucciones `CREATE ROLE`, `CREATE VIEW` y `GRANT` para establecer los permisos correspondientes.

## Derechos ARCO

Se analizaron las implicaciones técnicas de los derechos de acceso, rectificación, cancelación y oposición.

- **Acceso:** se propuso una consulta SQL para localizar los datos personales de un cliente.
- **Rectificación:** se revisó cómo actualizar un dato incorrecto mediante `UPDATE`, verificando previamente que el cambio esté autorizado.
- **Cancelación:** se identificó la necesidad de revisar tablas relacionadas, respaldos, réplicas, exportaciones y sistemas externos antes de ejecutar una eliminación.
- **Oposición:** se analizó cómo limitar el uso de los datos para una finalidad específica sin necesariamente eliminarlos de todos los procesos.


## Retención

Se analizó el riesgo de conservar todos los datos indefinidamente bajo el argumento de que podrían ser útiles en el futuro.

Se identificó que esta práctica aumenta la exposición de información personal, los costos de almacenamiento y las dificultades para gestionar solicitudes de los titulares.

## Gobierno de datos

Se diseñó una matriz conceptual para relacionar cada dato con su finalidad, responsable, usuarios autorizados, medidas de protección, periodo de conservación y acción al finalizar dicho periodo.

## Evaluación integral

Se analizaron los riesgos presentes en el escenario de una empresa con 50,000 clientes, cuyos datos se conservan desde hace 12 años.

Entre los principales problemas identificados se encuentran:

1. Acceso directo e innecesario de los analistas a la tabla completa.
2. Exposición de datos personales que no se requieren para generar estadísticas.
3. Ausencia de una política documentada de retención.
4. Entrega de copias completas de producción a los desarrolladores.
5. Uso de información real en ambientes de desarrollo.
6. Utilización de correos electrónicos para marketing sin una documentación clara de las finalidades.
7. Falta de documentación sobre el uso permitido de cada dato.
8. Ausencia de procedimientos claramente definidos para atender solicitudes ARCO.
9. Riesgos relacionados con respaldos, réplicas y exportaciones.
10. Falta de separación entre los datos operativos y los utilizados para analítica.

Para reducir estos riesgos se propusieron roles específicos, vistas limitadas, datos sintéticos para pruebas, políticas de retención, registros de auditoría y procedimientos documentados.

## Conclusiones

Se identificó que la minimización y la separación por finalidades permiten reducir la exposición de datos personales. Asimismo, los controles de acceso ayudan a limitar los privilegios según las responsabilidades de cada usuario.

También se comprendió que la retención debe formar parte del ciclo de vida de los datos y que las solicitudes ARCO pueden requerir acciones sobre múltiples tablas, respaldos y sistemas.

Finalmente, se concluyó que el DBA tiene la responsabilidad de implementar controles técnicos, pero debe trabajar junto con las áreas de privacidad, jurídicas y funcionales para garantizar que las decisiones sobre el tratamiento estén debidamente justificadas.




