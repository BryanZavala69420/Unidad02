# Evaluaciòn de integridad.

## Análisis de riesgos de privacidad en la base de datos de clientes

| Problema | Principio afectado | Riesgo | Control propuesto |
|---|---|---|---|
| 1. Todos los empleados de analítica acceden a la tabla completa | Minimización y confidencialidad | Acceso indebido a datos personales | Limitar los permisos según las funciones de cada usuario |
| 2. Se consultan datos personales para generar estadísticas | Minimización de datos | Exposición innecesaria de información | Utilizar datos agregados o anonimizados |
| 3. Los datos se conservan desde hace 12 años sin una política | Limitación del plazo de conservación | Acumulación innecesaria de datos y mayor impacto de filtraciones | Definir plazos de retención y procedimientos de eliminación |
| 4. No existe una política documentada de retención | Responsabilidad proactiva | No se puede justificar cuánto tiempo se conservan los datos | Crear y documentar una política de conservación |
| 5. Los desarrolladores reciben copias completas de la base de datos | Confidencialidad y minimización | Acceso excesivo a información de clientes | Entregar únicamente datos necesarios para las pruebas |
| 6. Las copias de desarrollo contienen datos reales | Seguridad y privacidad desde el diseño | Filtración de información personal en entornos de prueba | Usar datos sintéticos o anonimizados |
| 7. Marketing utiliza correos para promociones sin una finalidad documentada | Limitación de la finalidad | Uso incompatible con el propósito original o sin base legal adecuada | Verificar la base legal, informar a los clientes y gestionar sus preferencias |
| 8. No existe documentación sobre la finalidad de cada dato | Limitación de la finalidad y responsabilidad proactiva | Uso de información sin una justificación clara | Crear un inventario de datos con su finalidad y base legal |
| 9. Se almacenan nombre, RFC, teléfono y correo aunque analítica solo necesita estadísticas | Minimización de datos | Exposición de identificadores que no son necesarios | Excluir los identificadores de las consultas analíticas |
| 10. No se especifican controles de acceso para los datos sensibles o identificables | Confidencialidad e integridad | Accesos no autorizados y posibles filtraciones | Aplicar roles, autenticación robusta y registros de acceso |
| 11. No se menciona un procedimiento para eliminar datos cuando dejan de ser necesarios | Limitación del plazo de conservación | Los datos pueden permanecer almacenados indefinidamente | Establecer procesos periódicos de revisión y eliminación |
| 12. No se indica cómo se protegen las copias de las bases de datos | Seguridad de los datos | Robo, pérdida o divulgación de información personal | Cifrar las copias, restringir su acceso y controlar su eliminación |

