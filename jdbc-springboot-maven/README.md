# Descripción del ejemplo

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