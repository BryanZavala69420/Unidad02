# Propuesta conceptual para separar la información según su finalidad

## 1. Diseño de la arquitectura

```text
                         BASE DE DATOS
                               |
                ┌──────────────┼──────────────┐
                |              |              |
           OPERACIÓN        ANALÍTICA      AUDITORÍA
                |              |              |
        Datos necesarios   Datos agregados  Registros de
        para el servicio   o anonimizados   actividad
                |              |              |
        ┌───────┴──────┐       |              |
        |              |       |              |
    Acceso por     Protección   Minimización   Trazabilidad
    roles          de datos     de datos       y monitoreo
        |              |       |              |
        └──────────────┼───────┴──────────────┘
                       |
              CONTROLES GENERALES
                       |
       ┌───────────────┼────────────────┐
       |               |                |
   RETENCIÓN       ELIMINACIÓN     ATENCIÓN DE
   LIMITADA        SEGURA          SOLICITUDES
       |               |                |
   Plazos según    Borrado de      Acceso, rectificación,
   la finalidad    datos y copias  cancelación y oposición
                       |
              RESPALDOS Y RÉPLICAS
                       |
              Control de acceso,
              cifrado y eliminación
              conforme a políticas
```

