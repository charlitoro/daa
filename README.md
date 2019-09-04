# Data Base II

* ***Email curso:*** sisbd2udenar@gmail.com
* ***Email Profe:*** siritimar@gmail.com
## Proceso de Normalización
### Clase 1: 4/sep/2019
La normalizacion es un proceso de refinamiento por anomalias de diseño por la no deteccion en el momento de diseño, que puede ser por insercion, modificacion,
el __Objetivo__ es eliminar estas anomalis que se presentan, para esto necesitamos saber los atributos de esa relacion, de quien estan dependiendo.

___Dependencia funcional___, todos los atributos de una realacion deben depender funcionalmente de la llave primaria.
>* __Ejemplo:__ si conosco el codigo de un estudiante con este puedo conoser a todos los campos o atributos de dicho estudiante, pero si existen mas de un registro entonces estos datos no dependen del codigo del estudiante.
>* __Entonces__: cedula -> nombre, que nos dice que nombre depende funcionalmente de cedula, donde cedula es un determinante.

## Anomalias en una relacion
Es una falla que puede ser de 3 tipos:
* Insercion
* Modiifcacion
* Eliminacion

