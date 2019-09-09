# Data Base II

* ***Email curso:*** sisbd2udenar@gmail.com
* ***Email Profe:*** siritimar@gmail.com
## Proceso de Normalización
### Clase 1: 4/sep/2019
La normalizacion es un proceso de refinamiento por anomalias de diseño por la no deteccion en el momento de diseño, que puede ser por insercion, modificacion,
el __Objetivo__ es eliminar estas anomalis que se presentan, para esto necesitamos saber los atributos de esa relacion, de quien estan dependiendo.

___Dependencia funcional___, todos los atributos de una realacion deben depender funcionalmente de la llave primaria.
>* __Ejemplo:__ si conosco el codigo de un estudiante con este puedo conoser a todos los campos o atributos de dicho estudiante, pero si existen mas de un registro entonces estos datos no dependen del codigo del estudiante.
> __Entonces__: cedula -> nombre, que nos dice que nombre depende funcionalmente de cedula, donde cedula es un determinante.

## ___Anomalias en una relacion___
Es una falla que puede ser de 3 tipos:
* Insercion
* Modiifcacion
* Eliminacion

### __Anomalia de inserciion__
para poder conocer el valor de un atributo se debe insertar una tupla o un registro.
### __Anomalia de Modificacion__
Si se modifica el valor de un atributo es posible que no se modifique o actulicen en otras tuplas con similares caracteristicas. En otras palabras, si un valor de un atributo esta presente en varios registros pero no por medio de un identificador, en ese caso cuando se intente modificar un valor de esos comunes, no se va a editar en los demas registros.
### __Anomalias de Eliminacion__
Cuando al eliminar una tupla referente a los valores de ciertos atributos. 

## ___Solucion de Anomalias___
Se utiliz el pricipio __divide y venceras__, que consiste en dividir de acuerdo a las dependencias funcionales, que atributo determina a quien, y si hay un atributo que no es determinado por el __id__ es señal que sebe salir a ser una llave primaria por medio de una realcion.

### __Formas normales__
Son reglas o estado en la cual debe tener una realcion para que se encuentre en una forma normal. Existen las siguentes formas normales:
* _1FN_: Una relacion esta en primera forma normal si es una relación y atributos atomicos, y para cumplir esta forma se debe eliminar la no atomisidad o convertir ese atributo no atomico como llave compuesta con le primary key. 
* _2FN_: Para que una relacion debe estan en _1FN_ y que todos los atributos deben depender totalmente de la llave primaria. Toda relacion que tiene una llave primaria sencilla ya se encuentra en _2FN_, pero cunado hay llaves primarias compuestas puede que la dependencia sea parcial
* _3FN_
* _BCFN (Boyce-Codd Forma Normal)_


