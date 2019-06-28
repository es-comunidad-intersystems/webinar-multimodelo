# jdbc-springboot-maven

En este ejemplo se utiliza un simple proyecto SpringBoot con Maven que utiliza el conector Java JDBC de InterSystems IRIS para conectarse a una instancia de IRIS Community Edition que se levanta en un contenedor Docker.

## Configuración básica del entorno

El primer paso sera instalar [Maven](https://maven.apache.org/download.cgi) en nuestro equipo y si utilizas un entorno de Windows configurar en las variables de entorno la ruta donde se encuentra mvn.exe bajo el nombre M2_HOME.

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

Este proyecto esta desarrollado siguiendo el framework de Spring Boot con MAVEN de tal forma que tendremos una clase (Application.java) con un metodo main que funcionará como iniciador. Desde dicho metodo crearemos nuestras tablas en la base de datos e insertaremos registros en ellos. Spring Boot por defecto buscara un archivo application.properties del que obtendra los datos para configurar un objeto DataSource desde el que podremos gestionar nuestra base de datos.

Consultaremos en el archivo application.properties los datos de conexion a nuestra bdd, siendo los mas importantes:
	1 spring.datasource.driverClassName: nombre del driver de conexion a bdd.
	2 spring.datasource.url: url de conexion y namespace al que nos conectaremos.
	3 spring.datasource.username: usuario
	4 spring.datasource.password: password
	5 spring.datasource.initialization-mode: comportamiento con la base de datos al iniciar la aplicacion (actualizar, crear si no existe, borrar y recrear...)


## Arranque de la aplicación

Una vez descargado y configurado el código en nuestro PC únicamente tendremos que acceder a la ruta del mismo y ejecutar:

```
mvn clean install
mvn spring-boot:run
```

Esto desplegará nuestra aplicación (Spring Boot cuenta con, podremos acceder a el portal de [IRIS](http://localhost:9092/csp/sys/UtilHome.csp) y comprobar como se ha generado la tabla que hemos definido.