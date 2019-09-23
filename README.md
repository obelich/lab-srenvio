# README

Proyecto de prueba este pequeño sistema esta echo con el poder de Ruby On Rails 


* Ruby 2.6.3
* Rails 6.0.0
* Yarn 1.17.3
* SqLite

# Gemas
* Fedex https://github.com/jazminschroeder/fedex
* Devise  https://github.com/plataformatec/devise

# Carpeta Adicionales

En esta carpeta se encuentra el diagrama de la base de datos y otros archivos que son relacionados al proyecto

# Diagrama Base de datos

Para el diagrama de la base de datos se uso Mysql Workbrench

![Drag Racing](database_diagram.png)

# Variables de entorno 

Llenar cada una de ellas con sus respectivos valores

estas variables se tienen que agregar en `.bashrc` en Gnu/Linux 
```
export SRENVIO_FEDEX_KEY=''
export SRENVIO_FEDEX_PASSWORD=''
export SRENVIO_FEDEX_ACCOUNT=''
export SRENVIO_FEDEX_MASTER=''
export SRENVIO_FEDEX_MODE='development'
```
# Instalación

* git clone https://github.com/obelich/lab-srenvio.git
* cd lab-srenvio
* bundle install
* yarn install
* rails db:migrate
* rail db:seed

Acceso al sistema

Usuario: admin@srenvio.com

Password: renvios@321

# Ejecución en modo desarrollo
En una terminal ejecutamos 

```
rails s
```

En otra terminal ejecutamos

```
 ./bin/webpack-dev-server
```


