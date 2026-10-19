# Actividad 10 - Crear una politica minima de proteccion de claves


## Reglas de la politica

**1- Generacion de claves** 
Todas las claves criptográficas deberán generarse mediante algoritmos y herramientas criptográficas confiables, utilizando generadores de números aleatorios criptográficamente seguros. Se prohíbe crear claves manualmente, reutilizar claves débiles o emplear algoritmos obsoletos.

**2- Almacenamiento seguro**
Las claves deberán almacenarse cifradas o en sistemas especializados de gestión de claves (KMS) o módulos de seguridad de hardware (HSM), según el nivel de riesgo. Queda prohibido almacenarlas en texto plano, repositorios de código fuente, documentos compartidos o dispositivos no autorizados.

**3- Control de acceso**
El acceso a las claves se limitará al personal y a los sistemas que lo requieran para realizar sus funciones. Se aplicarán el principio de mínimo privilegio, la autenticación multifactor para accesos administrativos cuando corresponda y el registro de las operaciones realizadas con las claves.

**4- Rotación de claves**
Las claves deberán renovarse periódicamente de acuerdo con su finalidad, nivel de riesgo y requisitos normativos. También deberán rotarse cuando exista sospecha de compromiso, cambios relevantes en los sistemas o finalización de una relación con un proveedor que tuviera acceso autorizado.

**5- Respaldo y recuperación**
Las claves críticas deberán contar con respaldos protegidos, cifrados y con acceso restringido. Los respaldos se almacenarán en ubicaciones seguras y separadas del entorno principal, y se realizarán pruebas periódicas de recuperación para garantizar la continuidad operativa.

**6- Revocación de claves**
Las claves comprometidas, vencidas, innecesarias o asociadas a usuarios cuyo acceso haya sido retirado deberán revocarse o deshabilitarse de inmediato. Cuando corresponda, se deberán reemplazar los certificados, actualizar los sistemas dependientes y evaluar si es necesario volver a cifrar la información afectada.

**7- Gestion de la exposición accidental**
Si una clave se expone accidentalmente en correos electrónicos, registros, repositorios, sistemas públicos o cualquier medio no autorizado, deberá reportarse inmediatamente al equipo de seguridad. La clave se considerará comprometida hasta que se demuestre lo contrario, por lo que deberá revocarse o rotarse, investigarse el incidente y documentarse su resolución.
