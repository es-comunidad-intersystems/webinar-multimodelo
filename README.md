# webinar-multimodelo

Ejemplos y demostraciones para el Webinar Bases de Datos Multimodelo

El proyecto está dividido en varios ejemplos:

## jdbc-springboot-maven

En este ejemplo se utiliza un simple proyecto springboot con maven que utiliza el conector Java JDBC de InterSystems IRIS para conectarse a una instancia de IRIS Community Edition que se levanta en un contenedor Docker.

Más detalle en el [README](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/jdbc-springboot-maven) del proyecto

## jdbc-jpa-rest

En este ejemplo se utiliza igualmente Spring Boot y Maven. En este caso se utiliza Hybernate JPA para vincular las tablas a entidades. Se genera una API REST que puede ser utilizada por cualquier aplicación.

Más detalle en el [README](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/jdbc-jpa-rest) del proyecto

## webminar-web

Aplicación Angular de ejemplo que utiliza la API desarrollada en el ejemplo anterior

Más detalle en el [README](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/webminar-web) del proyecto

## node-express-rest

En este ejmplo utilizamos node.js y accedemos directamente a los Globals de InterSystems IRIS para establecer, recuperar y eliminar datos almacenados. Construimos una API REST que es capaz de recibir GET, POST y DELETE de un objeto JSON personalizado y estructurar sus propiedades en Globals de InterSystems IRIS.

Más detalle en el [README](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/node-express-rest) del proyecto

## iris-phoneapp

Este ejemplo tiene dos proyectos.

El primer proyecto es una API completamente desarrollada en IRIS mediante ObjectScript. En este ejemplo se utilizan las carácteristicas de IRIS para el uso como Base de Datos Orientada a Objetos. Se utiliza la persistencia de objetos nativa de IRIS y además se proporciona una API REST para manipular los objetos de la base de datos.

El segundo proyecto es una simple aplicación desarrollada en Angular 7 que hace uso de la API publicada en IRIS.

Más detalle en el [README de la api](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/iris-phoneapp/api) y en el [README de la app](https://github.com/es-comunidad-intersystems/webinar-multimodelo/tree/master/iris-phoneapp/app)
