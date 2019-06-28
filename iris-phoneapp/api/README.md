# Descripción del Proyecto

API desarrollada en ObjectScript que se ejecuta directamente en IRIS

## Preparación

- Levantar el contenedor para IRIS CE (Community Edition)
- Importar y compilar el paquete demo completo (son solo 3 clases)
- Iniciar session en IRIS `docker exec -it iris_webminar iris session IRIS`
- Ejecutar el siguiente comando `do ##class(demo.setup).setup()`

El comando anterior creará una aplicación (o endpoint) en la siguiente URL [http:9092//phoneapp/api]

Puedes probar que la API está funcionando con los siguientes comandos

```bash
curl http://localhost:9092/phoneapp/api/test                    <-- Probar que la API funciona
curl http://localhost:9092/api/mgmnt/ -v --user superuser:****  <-- Descubrir las APIs existentes
curl http://localhost:9092/api/mgmnt/v1/DEMO/spec/phoneapp/api --user superuser:**** <-- Obtener la especificación swagger para la API
```
