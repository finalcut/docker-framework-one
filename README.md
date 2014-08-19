docker-framework-one
====================

A docker data container containing fw/1 version 3 (beta1).. That means aop1 and di1 are included.
The framework is exposed via the container at volumne /tmp/fw1



# What is FW/1
[FW/1](http://framework-one.github.io/) is a mvc framework that favors convention over configuration..  It was developed primarily by Sean Corfield.  Framework-one actually contains two additional libraries at this point - di/1 (dependency injection) and aop/1 (aspect oriented programming that extends di/1).

## How to use this Image
=============

### start the image

```
  docker run -it --name fw1 finalcut/framework-one
```
After the container starts feel free to `exit` it.  The container does not need to be running to be used.


### connect to it from another container

```
  docker run -d -p 8880:80 -v /var/www:/var/www --volumes-from fw1 finalcut/coldfusion10
```

The --volumes-from switch is what exposes the volume /tmp/fw1 from the finalcut/framework-one container.
Once your coldfusion container is running you will probably want to add a global mapping to the fw1 framework directory

```cfm
<cfscript>
    // Login is always required.
        adminObj = createObject("component","cfide.adminapi.administrator");
        adminObj.login("Adm1n$");
        mapObj = createObject("component", "cfide.adminapi.extensions");
        mapObj.setMapping("framework", "/tmp/fw1/framework");
</cfscript>
```

Once the framework directory is mapped you can use FW/1 as documented by that framework (your `application.cfc` extending `framework.one`).
