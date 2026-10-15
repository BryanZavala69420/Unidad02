## Matriz de clasificación de los datos

| Campo | ¿Identifica directamente? | ¿Puede contribuir a identificar? | ¿Requiere protección? | Justificación |
|---|---|---|---|---|
| `id` | No | Sí | Sí | Es un identificador único del registro que puede relacionarse con otros datos para identificar a un cliente. |
| `nombre` | Sí, dependiendo de su especificidad | Sí | Sí | Permite reconocer o distinguir a una persona, especialmente cuando se combina con otros datos. |
| `correo` | Sí | Sí | Sí | Puede identificar directamente a una persona y permite establecer comunicación con ella. |
| `telefono` | Sí | Sí | Sí | Puede vincularse con una persona y utilizarse para contactarla. |
| `rfc` | Sí | Sí | Sí | Es un identificador fiscal que permite relacionar información con una persona física o moral. |
| `edad` | No | Sí | Sí | Por sí sola generalmente no identifica a una persona, pero combinada con otros atributos puede facilitar su identificación. |
| `ciudad` | No | Sí | Sí | Es un dato de ubicación que puede contribuir a identificar a alguien cuando se combina con otros datos. |
| `codigo_postal` | No | Sí | Sí | Permite delimitar una zona geográfica y puede contribuir a identificar a una persona junto con otros atributos. |
| `fecha_alta` | No | Sí | Sí | Permite conocer cuándo se registró un cliente y puede ayudar a relacionar registros con otras fuentes de información. |

**1- ¿Qué campos identificarian directamente a una persona?** Los elementos que identifican a una persona persona directamente serían el ID, al ser el identificador unico del usuario en si, el nombre al saber como se llaba la persona, y el RFC puesto que está ligado a la persona fisica o moral del trabajador. 
**2- ¿Qué campos no identifican por sí solos, pero podrían contribuir a hacerlo?**
Los campos `edad`, `ciudad`, `codigo_postal` y `fecha_alta` generalmente no identifican directamente a una persona por sí solos, pero pueden contribuir a su identificación cuando se combinan con otros datos.

Por ejemplo, conocer la edad de una persona puede reducir el número de personas con las que coincide esa información. El campo `ciudad`, aunque no revele directamente la identidad, puede vincularse con otros registros que sí la revelen.

**3-¿Qué combinación de campos podría incrementar el riesgo de reidentificación?**
La combinación de `nombre`, `edad`, `ciudad`, `codigo_postal` y `fecha_alta` podría incrementar el riesgo de reidentificación, ya que permite relacionar a una persona con características específicas y reducir las posibilidades de distinguirla de otras.
 **4-¿Todos los datos que deben protegerse son necesariamente datos personales sensibles desde el punto de vista jurídico?**
 Los datos personales son aquellos que permiten identificar o hacer identificable a una persona. Los datos personales sensibles constituyen una categoría específica que puede incluir información sobre la salud, el origen racial o étnico, las creencias religiosas o aspectos de la vida íntima, entre otros supuestos previstos por la legislación aplicable.


---
**1- ¿Qué información continua existiendo en la tabla origina?**
El `id` y el `nombre` son los unicos datos que siguen existiendo. 

**2- ¿Qué informaciòn puede visualizar el usuario `soporte`?**
La información que puede visualizar es el `id`, `nombre`, `correo`(pseudonimizado), `telefono`(pseudonimizado) y `rfc`(pseudonimizado).

**3- ¿Por qué no es suficiente ocultar los datos unicamente en la aplicación?**
Porque al ocultar los datos unicamente en la aplicación y no en otros medios, puede haber una filtración de seguridad. 

**4- ¿Qué ocurriría si `soporte` tuviera acceso a `clientes`?** 
El rol de soporte podría ver sin algún tipo de censura todo el contenido de la tabla clientes, así obteniendo todos sus datos. 

---

**1- ¿Qué ocurriría si `analista` pudiera consultar tambien `pii.mapa_cliente?`**
Si analista pudiera ver pii.mapa_cliente, podría ver los tokens de cada cliente enlazado con el ID.

**2- ¿Qué principios de seguridad se está aplicando al separar ambos accesos?**
El principio del privilegio minimo al solo dar acceso a ciertas vistas.

**3- ¿Por qué la seudonimización no equivale a anonimización?**
Porque la seudonimización solo esconde el dato original bajo identificadores, pero no lo reemplaza por otros. 

**4- ¿Qué información permite volver a relacionar el token con una persona?**
El `id`.

---
**1-¿Qué identificadores directos fueron eliminados?**
En las consultas se dejaron de mostrar identificadores directos como `id`, `nombre`, `correo`, `telefono` y `rfc`. En su lugar, se presentan únicamente rangos de edad, regiones y cantidades de clientes.
**2-¿Qué cuasi-identificadores permanecen?**
Permanecen los atributos `rango_edad` y `region`, derivados de los campos `edad` y `codigo_postal`.
**3-¿Qué combinaciones de atributos podrían reducir el anonimato?**
La combinación de `rango_edad` y `region` puede reducir el anonimato cuando existen pocos clientes con esas características.

También podrían aumentar el riesgo otros atributos, como el sexo, la ocupación, la fecha de registro o cualquier dato disponible en fuentes externas que permita distinguir a una persona.

**4- ¿Qué sucede cuando un grupo contiene pocos registros?**
Cuando un grupo contiene pocos registros, resulta más fácil distinguir a sus integrantes y relacionarlos con información externa.

**5- ¿Qué atributos deberían generalizarse?**
Deberían generalizarse los atributos que permitan distinguir demasiado a una persona, como `edad`, `codigo postal`, `fecha de alta`.

**6- ¿Qué información debería suprimirse?**
Deberían suprimirse los identificadores directos que no sean necesarios para el análisis, como `nombre`, `correo`, `telefono`, `rfc` e identificadores individuales.

**7- ¿Es correcto afirmar que el conjunto de datos es “100 % anónimo”? ¿Por qué?**
No. No es correcto afirmar que el conjunto de datos es 100 % anónimo únicamente porque se eliminaron los identificadores directos y se generalizaron algunos atributos.

---

**1- ¿Qué registros serían afectados?**
Serían identificados los registros de la tabla `clientes` cuya fecha de alta sea anterior a la fecha límite de cinco años.

Estos registros serían candidatos a una revisión para determinar si corresponde conservarlos o eliminarlos.

**2- ¿Cuál sería la justificación del periodo de conservación?**
En un entorno real, el plazo de cinco años tendría que justificarse de acuerdo con la finalidad del tratamiento, las obligaciones legales aplicables y las políticas internas de la organización.

3- **¿Qué aprobación debería existir antes de eliminar información?** 

La aprobación debería documentarse mediante una solicitud autorizada que indique el motivo de la eliminación, los registros involucrados, la fecha prevista y los responsables que aprobaron el procedimiento.

**4- ¿Qué respaldo debería existir?**
Antes de realizar cualquier eliminación física, debería existir un respaldo confiable que permita recuperar la información en caso de error, asi como incluir los registros que se pretende eliminar, que estos estén en una ubicación segura y con acceso restringido.

**5- ¿Qué evidencia debería conservarse?**
Debería de conservarse la consulta SQL con los registros, la fecha y hora de ejecución de la consulta, la cantidad de registos identificados, un reporte de los registros afectados, protegido mediante controles de acceso, la justificacion del perdiodo de conservación.

**6- ¿Qué procedimiento permitiría recuperar información eliminada accidentalmente?**

---
## CLAFICIACIÓN 
Los datos de la tabla clientes se clasifican como datos personales porque permiten identificar o contactar a una persona. Entre ellos se encuentran el nombre, correo electrónico, teléfono y RFC. También deben protegerse la edad, ciudad, código postal y fecha de alta, ya que al combinarse pueden facilitar la identificación de los clientes.

El identificador interno id permite relacionar los registros con la información original, por lo que también debe controlarse su acceso. Por esta razón, se aplicaron medidas de protección para reducir la exposición de los datos y limitar el acceso únicamente a usuarios autorizados.


---
## ENMASCARAMIENTO
Se ocultaron parcialmente los datos personales de los clientes, como el correo electrónico, el número de teléfono y el RFC, para evitar que se mostraran completos a usuarios que no necesitan conocerlos.

---
## SEUDONIMIZACION
Se creó el esquema pii para almacenar la tabla mapa_cliente, que relaciona los identificadores originales de los clientes con tokens UUID generados mediante la función gen_random_uuid().

Posteriormente, se creó el esquema analitica, donde se almacenaron los datos necesarios para realizar análisis sin utilizar directamente el identificador original del cliente. La tabla analitica.clientes contiene el token, la edad, la ciudad, el código postal y la fecha de alta.

---
## ANONIMIZACIÓN 
Se realizaron consultas para reducir el nivel de detalle de los datos y obtener estadísticas sin mostrar directamente la información individual de los clientes.

Se eliminaron de los resultados los identificadores directos, como el nombre, correo electrónico, teléfono, RFC e identificador interno. Además, se generalizó la edad en tres grupos: de 18 a 30 años, de 31 a 45 años y de 46 años en adelante.

---
## RETENCIÓN 
Se utilizó una consulta para identificar los registros cuya fecha de alta es anterior a cinco años respecto de la fecha actual. Este criterio permite localizar datos antiguos para evaluar si todavía es necesario conservarlos.

Los datos deben conservarse mientras exista una finalidad legítima o una obligación legal que lo justifique. La información que ya no sea necesaria podría eliminarse, siempre que no existan obligaciones pendientes que requieran mantenerla.

---
## CONCLUSIONES

**1- ¿Qué técnica utilizarías para un área de soporte?**
Utilizaría el enmascaramiento de datos mediante una vista restringida, como v_clientes_soporte, para mostrar parcialmente el correo electrónico, el teléfono y el RFC. De esta manera, el personal de soporte puede consultar la información necesaria para realizar sus actividades sin visualizar todos los datos personales completos.

**2- ¿Qué técnica utilizarías para un área de analítica?**
Utilizaría la seudonimización, sustituyendo los identificadores originales por tokens UUID y separando el mapa de correspondencia de los datos analíticos. Esto permite analizar información de los clientes sin exponer directamente sus identidades. También aplicaría la generalización de atributos cuando sea necesario reducir el riesgo de identificación.

**3- ¿Qué técnica utilizarías para publicar estadísticas?**
Utilizaría la anonimización mediante la eliminación de identificadores directos, la generalización de atributos y la supresión de grupos pequeños. Por ejemplo, publicaría cantidades de clientes por rangos de edad y regiones generales, evitando mostrar registros individuales. También evaluaría el riesgo de reidentificación antes de divulgar los resultados.

**4- ¿Por qué ninguna de estas técnicas sustituye al control de acceso?**
Porque estas técnicas protegen los datos de diferentes maneras, pero no impiden por sí solas que usuarios no autorizados consulten las tablas originales o accedan a información sensible. El control de acceso permite definir quién puede consultar, modificar o eliminar los datos mediante roles y permisos. Por ello, es necesario combinar las técnicas de protección con el principio de mínimo privilegio, la separación de funciones y la revisión periódica de los permisos para mantener la seguridad de la información.

---

## PREGUNTAS DE REFLEXION

**1- ¿Cuál es la diferencia entre enmascaramiento y seudonimización?**

El enmascaramiento consiste en ocultar parcial o totalmente ciertos datos, por ejemplo, mostrar solamente los últimos cuatro dígitos de un teléfono. La seudonimización sustituye los identificadores originales por otros, como tokens UUID, para dificultar la identificación directa de una persona.

**2- ¿Por qué la seudonimización no significa anonimización?**

Porque los datos seudonimizados pueden relacionarse nuevamente con una persona mediante un mapa de correspondencia u otra información disponible. En cambio, la anonimización busca impedir que una persona pueda ser identificada razonablemente a partir de los datos publicados.

**3- ¿Por qué eliminar nombre y RFC no garantiza que un conjunto de datos sea anónimo?**

Porque todavía pueden existir otros atributos que permitan identificar a una persona, como la edad, la ciudad, el código postal o la fecha de alta. Al combinar estos datos con información externa, es posible deducir la identidad de un cliente.

**4- ¿Qué función tienen los cuasi-identificadores?**

Son atributos que, aunque no identifican directamente a una persona por sí solos, pueden facilitar su identificación cuando se combinan con otros datos. Algunos ejemplos son la edad, el código postal y la ciudad.

**5- ¿Por qué es importante separar el mapa de seudonimización?**

Porque el mapa contiene la relación entre los tokens y los identificadores originales. Mantenerlo separado y restringir su acceso reduce el riesgo de que una persona pueda relacionar los datos analíticos con los clientes reales.

**6- ¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?**

Se aplica el principio de mínimo privilegio, que consiste en otorgar a cada usuario únicamente los permisos necesarios para realizar sus funciones. También se aplica la separación de funciones, al mantener los datos analíticos separados de la información que permite identificar a los clientes.

**7- ¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?**

Porque una vista permite mostrar solamente las columnas y los datos que necesita consultar un usuario. Por ejemplo, el personal de soporte puede ver el correo electrónico, el teléfono y el RFC parcialmente enmascarados sin tener acceso directo a la tabla original.

**8- ¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?**

Proteger un dato para visualización significa modificar la forma en que se presenta, por ejemplo, ocultando algunos caracteres. Protegerlo contra acceso no autorizado significa impedir que usuarios sin permisos puedan consultar la información original. El enmascaramiento no sustituye los permisos de seguridad, ya que un usuario podría acceder a los datos completos si conserva privilegios sobre la tabla original.

**9- ¿Por qué la retención forma parte de la protección de datos?**

Porque conservar información durante más tiempo del necesario aumenta la exposición a accesos indebidos, filtraciones y usos no autorizados. Establecer plazos de conservación permite mantener únicamente los datos que siguen siendo necesarios para una finalidad legítima o una obligación aplicable.

**10- ¿Qué riesgo existe si una organización conserva información indefinidamente?**

Existe un mayor riesgo de filtraciones, robo de identidad, uso indebido de información personal y acceso no autorizado. Además, la organización puede acumular datos que ya no necesita, aumentando los costos de almacenamiento y las consecuencias de un incidente de seguridad. Por eso, es importante establecer políticas de retención y procedimientos seguros de eliminación.