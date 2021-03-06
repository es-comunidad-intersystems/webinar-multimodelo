# Descripción del proyecto

En este ejmplo utilizamos node.js y accedemos directamente a los Globals de InterSystems IRIS para establecer, recuperar y eliminar datos almacenados. Construimos una API REST que es capaz de recibir GET, POST y DELETE de un objeto JSON personalizado y estructurar sus propiedades en Globals de InterSystems IRIS.

Este proyecto utiliza:
Express Web server (<https://expressjs.com/>)

Por defecto según la configuración el servidor se levanta en el puerto 8000 y la URL base es:
 <http://localhost:8000/api/test>.

Puedes probar lo siqguiente:

URL | Description
--- | -----------
GET /api/test/:id | Recupera un objeto con el id especificado
GET /api/test| Recupepera todos los objetos almacenados
POST /api/test| Crea un nuevo objeto, el objeto es un objeto JSON arbitrario
POST /api/test/:id | Actualiza el objeto con el id especificado
DELETE /api/test/:id| Elimina el objeto con el id especificado

En general la API devuelve:

CODE | Description
---- | -----------
200 | Actualizado OK
201 | Creado OK
404 | No se encuentra el objeto con el id especificado
500 | Error en el servidor

## Como probar este ejemplo

**npm** recupera todos los paquetes para ti excepto *iris.node* que debe copiarse manualmente. Así que deberemos copiar el fichero iris.node a la carpeta `/node_module/iris` (crear el directorio si no existe previamente).

El fichero iris.node se puede obtener desde WRC o también desde el directorio /bin de una instancia de InterSystems IRIS (ojo porque es un binario y depende de la distribución especifica de IRIS).

Hay que tener cuidado y chequear que el fichero del adaptador copiado sea de una versión compatible con la versión de nuestra instalación de node. En mi caso estoy usando la versión de **node v8.12.0** así que necesitaré el fichero `iris800.node` (la idea es que la versión 8 de node coincide con el primer número del nombre del fichero del adaptador). Recuerda renombrar luego el fichero a iris.node al copiarlo a la carpeta.

Despues de conseguir y copiar el adaptador es muy importante configurar adecuadamente los parámetros de conexión a una instancia de IRIS que están en el fichero `/config/config.js`. Una vez configurado podemos probar la conectividad con el siguiente comando:

```bash
npm install
node ./tests/test.js
```

Una vez confirmemos que la conectividad es correcta, ejecutar el siguiente comando para arrancar el servidor:

```bash
npm start
```

A partir de este momento ya podemos comezar a probar las invocaciones HTTP:

Crear un nuevo objeto

```bash
curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/test
```

Actualizar un objeto existente

```bash
curl -d '{"key1":"abc", "key2":"abc"}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/test/1
```

Recuperar todos los objetos

```bash
curl http://localhost:8000/api/test
```

Recuperar un objeto especifico

```bash
curl http://localhost:8000/api/test/1
```

Borrar un objeto existente

```bash
curl -X DELETE http://localhost:8000/api/test/1
```
