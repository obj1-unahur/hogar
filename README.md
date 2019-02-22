# Hogar

Este sistema simula la relación entre una familia y la casa donde vive para sacar conclusiones.  

Una casa tiene varias **habitaciones**, las mismas pueden ser de distintos tipos: _habitaciones de uso general_, 
_dormitorios_, _baños_ y _cocinas_.   
Por supuesto puede haber más de una habitación del mismo tipo en una casa. 
Una casa podría tener, por ejemplo, 3 baños, 2 cocinas, 4 dormitorios y 1 habitación de uso general. 

Por su parte, una familia está compuesta por varias **personas**.

Un dato que debe registrarse, y que va a ser útil más adelante, es qué personas duermen en cada dormitorio. 

<br>

## 1. Nivel de confort de las Habitaciones

De cada habitacion interesa saber el _nivel de confort_ que le aporta a una persona, 

Todas las habitaciones aportan, como base, 10 unidades de confort a cualquier persona.   
Además existen reglas por cada tipo de habitación que podrían adicionar puntos

- **Uso general**: no aporta nada adicional

- **Baño**: Aporta 2 unidades de confort extra si se trata de un niño de 4 o menos años. 4 unidades extra si la persona 
  tiene 5 o más años.   

- **Dormitorio**:  Si la persona duerme en el dormitorio, entonces aporta como extra  10 dividido la cantidad de personas que duermen en el dormitorio. (En caso de un dormitorio en el que duermen dos personas, sumaría 5 a cada una). Caso contrario, no aporta nada extra de confort.
  
- **Cocina**: En caso de que se trate de una persona con habilidades de cocina, aporta una cantidad de unidades de confort extra que se calcula como un porcentaje de la cantidad de metros cuadrados de esa cocina.  
  Ese porcentaje es un valor que se configura al inicio de la ejecución y es el mismo para todas las cocinas. 
  Ese valor puede cambiar en cualquier momento y las cocinas ya creadas deben usar el valor modificado. Un buen valor por defecto es 10%.  
  _Aclaración_: cualquier persona puede tener habilidades de cocina o no. 
  Una persona que al principio no tiene habilidades de cocina podría aprender y adquirirlas.

<br> 

**Requerimientos**

- 1.1 Saber los puntos de confort que aporta una habitación a una persona
- 1.2 Configurar el porcentaje utilizado en el cálculo de los puntos de confort de las cocinas. 

<br> 
		
## 2. Entrar a una habitación
Cada habitación tiene _ocupantes_ (o sea, personas que están en la habitación) que van variando según se use el sistema. 
Al inicio del sistema, las habitaciones están vacías. 

Una persona siempre puede entrar a una habitación que está vacía (no importa de que tipo de habitación se trate).   
En caso de que haya algún ocupante dependerá de cada caso:

- **Uso general**: no hay requisito adicional, siempre puede entrar.

- **Baño**: Puede entrar si alguno de sus ocupantes es un niño de 4 años o menos, 
  ya que se supone que lo va a asistir en sus tareas higiénicas.
  
- **Dormitorio**: Las personas que duermen en el dormitorio pueden entrar siempre. Para que una persona que no duerme en el dormitorio pueda entrar, todos los que duermen en el dormitorio deben estar ocupándolo. 

- **Cocina**: Si se trata de una persona con habilidades de cocina, sólo puede entrar si no hay ya entre sus
ocupantes otra persona con habilidades de cocina.  
Es decir, puede haber muchos ocupantes, pero como máximo un cocinero.

<br>

**Requerimientos**

- 2.1 Saber si una persona puede entrar en una habitación
- 2.2 Saber los ocupantes de una habitacion.
- 2.3 Que una persona entre en una habitación. (debe abandonar la habitacion previa donde estaba, 
si es que estaba en alguna y quedarse en la nueva). 

<br>

**NOTAS**  
- Asumir que al principio, todas las habitaciones están vacías, o sea, no tienen ningún ocupante, y ninguna persona está en una habitación, 
- Tener en cuenta qué sucede si la persona no podía entrar y se solicita que ingrese igual.
- Depende de como armes el modelo, podrías necesitar o no una casa que contenga a las habitaciones
para poder saber en que habitación está una persona.  Hay soluciones buenas que la necestian y soluciones
buenas que no la necesitan. De todas maneras el concepto de casa surge en el siguiente punto.

<br>

  
## 3. Consultas sobre la familia y la casa
En este punto se incorporan al modelo las **familias** y las **casas** (si no se habían agregado antes). De cada familia conocemos sus integrantes (un conjunto de personas) y la casa en la que viven.  
La casa posee un conjunto de habitaciones.

<br>

**Requerimientos** 
- 3.1 Saber las habitaciones que están ocupadas de una casa (tienen al menos un ocupante)
- 3.2 Saber los responsables de la casa, el cual es el conjunto formado por el ocupante más viejo de cada habitación ocupada.
- 3.3 Saber el nivel de confort promedio de la familia, calculado como la suma del nivel de confort de cada miembro para la casa donde vive la familia, dividido cantidad de miembros.   
El nivel de confort de un miembro para una casa es la sumatoria del confort que le aporta cada habitación de la casa.
- 3.4 Saber si una familia está a gusto, 
Para lo cual tiene que suceder que el nivel de confort promedio de la familia sea superior a 40
y cada miembro _se sienta a gusto_ en la casa donde vive la familia.
Esto último depende de cómo sea la _persona_:
	* **Obsesives**: puede entrar en al menos una habitación y todas las habitaciones tienen como máximo 2 ocupantes.
	* **Goloses**: puede entrar en al menos una habitaciṕn y al menos un miembro de la familia tiene habilidades de cocina.
	* **Sencilles**: puede entrar en al menos una habitación y la casa tiene al menos 1 habitación más que la cantidad de miembros de la familia (p.ej. si la familia tiene 4 integrantes, la casa debe tener 5 habitaciones o más).

**Nota**  
Para preguntarle a una persona si se siente a gusto en una casa, vale pasarle dos parámetros: la casa y la familia.
