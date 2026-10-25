# INVENTARIO-DATOS.md


## Matriz de análisis de datos personales

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
|---|---|---|---|---|---|
| `id` | Sí, si permite identificar o vincular a una persona. | Identificar de forma única cada registro. | Sí, para distinguir los registros. | Interno: personal autorizado. | Mientras exista el registro y sea necesario; después, eliminar o anonimizar. |
| `nombre` | Sí, identifica directamente a una persona. | Identificar al usuario y personalizar la atención. | Sí, si el servicio requiere identificar al usuario. | Restringido: personal autorizado. | Mientras la cuenta esté activa y durante el plazo legal aplicable. |
| `correo` | Sí, puede identificar a una persona. | Enviar notificaciones, contactar y recuperar el acceso. | Sí, si se utiliza para comunicaciones o autenticación. | Restringido: personal autorizado. | Mientras sea necesario para el servicio y las obligaciones legales. |
| `telefono` | Sí, puede vincularse con una persona. | Contacto, verificación o recuperación de cuenta. | No, salvo que sea indispensable para el servicio. | Restringido: personal que lo necesite. | Hasta que deje de ser necesario o venza el plazo legal aplicable. |
| `rfc` | Sí, identifica fiscalmente a una persona física. | Facturación y cumplimiento de obligaciones fiscales. | Solo si se requiere para facturación u otra obligación legal. | Altamente restringido: personal fiscal o contable autorizado. | Durante el plazo exigido por la legislación aplicable. |
| `edad` | Sí, si está asociada con una persona identificable. | Verificar requisitos de edad y adaptar el servicio. | No, si basta con verificar el requisito sin guardar la edad exacta. | Restringido: personal autorizado. | Durante el tiempo necesario para la finalidad. |
| `ciudad` | Sí, si está vinculada con una persona identificable. | Personalizar el servicio y determinar la cobertura. | Solo si la ubicación es relevante para el servicio. | Interno: personal autorizado. | Mientras sea necesaria; después, eliminar o anonimizar. |
| `codigo_postal` | Sí, si puede vincularse con una persona identificable. | Validar cobertura, calcular envíos o realizar análisis geográficos. | Solo si se necesita para prestar el servicio. | Restringido: personal de logística o atención autorizado. | Mientras sea necesario para la operación y las obligaciones legales. |
| `fecha_alta` | Sí, cuando se relaciona con una cuenta identificable. | Registrar el alta, administrar la cuenta y mantener auditorías. | Sí, si se necesita para la administración o trazabilidad. | Interno: personal autorizado. | Mientras la cuenta esté activa y durante el plazo legal aplicable. |

