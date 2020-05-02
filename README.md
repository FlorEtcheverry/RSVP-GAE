# RSVP
## Ejercicio de Aplicaciones Cloud con Google App Engine

Implementación del TP3 para la materia Taller de Programación III (75.61) de la Facultad de Ingeniería de la Universidad de Buenos Aires. 2do cuatrimestre 2015.


- Config and setup:

  - Start/stop RabbitMQ server:
  `sudo invoke-rc.d rabbitmq-server start/stop`

  - Estado:
   `rabbitmqctl status`

  - Activar/desactivar management plugin:
  `rabbitmq-plugins enable rabbitmq_management`

  - Ver management plugin: (en browser) usuario y contras: guest.
  http://localhost:15672

  - Agregar JARs (que estan en current directory) a variable de entorno
  `export CP=.:commons-io-1.2.jar:commons-cli-1.1.jar:rabbitmq-client.jar`

  - Compilar:
  `javac -cp rabbitmq-client.jar *.java`

  - Correr:
  `java -cp $CP MiClase`
