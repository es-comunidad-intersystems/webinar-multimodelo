# WebinarWeb

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 6.1.5.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
=======
# webinar-multimodelo

Ejemplos y demostraciones para el Webinar Bases de Datos Multimodelo

El proyecto está dividido en varios ejemplos:

## jdbc-springboot-maven

En este ejemplo se utiliza un simple proyecto springboot con maven que utiliza el conector Java JDBC de InterSystems IRIS para conectarse a una instancia de IRIS Community Edition que se levanta en un contenedor Docker.

El controlador JDBC reside en un directorio de la instancia de IRIS y se debe traer al equipo local:

```bash
root@localhost:/# df
Filesystem     1K-blocks      Used Available Use% Mounted on
overlay         61255492  35660284  22453884  62% /
tmpfs              65536         0     65536   0% /dev
tmpfs            2534072         0   2534072   0% /sys/fs/cgroup
osxfs          976900220 846849764 117767420  88% /shared
/dev/sda1       61255492  35660284  22453884  62% /etc/hosts
shm                65536       664     64872   2% /dev/shm
tmpfs            2534072         0   2534072   0% /proc/acpi
tmpfs            2534072         0   2534072   0% /sys/firmware

root@localhost:/shared# iris list

Configuration 'IRIS'   (default)
        directory:    /usr/irissys
        versionid:    2019.2.0.107.0com
        datadir:      /usr/irissys
        conf file:    iris.cpf  (SuperServer port = 51773, WebServer = 52773)
        status:       running, since Mon Jun 17 18:15:15 2019
        state:        ok
        product:      InterSystems IRIS

root@localhost:/shared# cp /usr/irissys/dev/java/lib/JDK18/intersystems-jdbc-3.0.0.jar /shared/
```

Posteriormente se debe registrar la librería para que pueda ser referenciada por Maven:

```bash
mv intersystems-jdbc-3.0.0.jar ../drivers
mvn install:install-file -Dfile="drivers/intersystems-jdbc-3.0.0.jar" -DgroupId="com.intersystems.jdbc" -DartifactId="IRISDriver" -Dversion="3.0.0" -Dpackaging=jar
```

## jdbc-jpa-rest

En este ejemplo se utiliza igualmente Spring Boot y Maven. En este caso se utiliza Hybernate JPA para vincular las tablas a entidades

## node-express-rest

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

### Como probar este ejemplo

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

