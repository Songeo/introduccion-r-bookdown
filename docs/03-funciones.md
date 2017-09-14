

# Funciones

> Si todo lo que existe en R es un objeto, 
todo lo que pasa en R es una función.

R es un lenguaje de programación funcional. Es decir, 
proporciona muchas herramientas para la creación y 
manipulación de funciones. 

En R las funciones, al igual que los vectores, se
pueden asignar a variables, guardarlas en listas, 
usarlas como argumentos en otras funciones, 
crearlas dentro de otras funciones, e incluso
regresar como resultado de una función más funciones.



### Una caja negra {-}

\BeginKnitrBlock{information}<div class="information">Una función puede verse como una caja negra
que realiza un proceso o serie de instrucciones
condicionadas a un valor de entrada
cuyo resultas es un valor de salida. </div>\EndKnitrBlock{information}


<img src="figures/functions-blackbox.png" style="display: block; margin: auto;" />


En R existen algunas funciones pre cargadas que 
ya hemos usado en ejercicios pasados. Por ejemplo:
la función `mean()`.


```r
input <- c(1:5)
output <- mean( input )
output
```

```
## [1] 3
```


Sin embargo, también es posible escribir nuestras propias
funciones. 

<br>

---

## Escibir una función

En R es posible escribir funciones y es muy recomendable
para dar soluciones a problemas simples. 

Existen ocasiones en las que al programar
copias y pegas cierto código varias veces
para una meta en especial. 
En ese momento, es necesario 
pasar el código a una función. 


\BeginKnitrBlock{nota}<div class="nota">Una función soluciona un problema en particular. </div>\EndKnitrBlock{nota}


La función `function()` nos permite 
crear funciones con la siguiente estructura:


```r
my_fun <- function( arg1 ){
  
  body
  
  return()
}
```

\BeginKnitrBlock{warning}<div class="warning">En general, esta estructura se respeta en las funciones
predeterminadas de R.</div>\EndKnitrBlock{warning}



Creamos una función que sume uno a cualquier número. 


```r
suma_uno_fun <- function( x ){
   y = x + 1
   return(y)
}
```

Aplicamos la función:


```r
suma_uno_fun(5)
```

```
## [1] 6
```

Podemos ver que en nuestra sesión ya existe la función con 
la función `ls()`. 

```r
ls()
```

```
## [1] "input"        "output"       "suma_uno_fun"
```

Esta función en lista los objetos 
existente en la sesión actual.

<br>



---


## Argumentos de funciones

En R los argumentos de las funciones pueden llamarse por
**posición** o **nombre**. 

Por ejemplo, considerando la siguiente función
en la que se eleva un numero 
a un exponente determinado.


```r
potencia_fun <- function(base, exponente){
  base^exponente
}
```

Los argumentos pueden indicarse por posición:

```r
potencia_fun(2, 3)
```

```
## [1] 8
```

O bien por nombre:

```r
potencia_fun(exponente = 2, base = 3)
```

```
## [1] 9
```


<br> 

### Argumentos predeterminados

En una función es posible asignar 
valores predeterminados a los argumentos.

Por ejemplo, modificamos la función
para asignar un valor predeterminado 
del exponente.

```r
potencia_default_fun <- function(base, exponente = 2){
  base^exponente
}
```

Al llamar la función, no es necesario 
definir un valor para el exponente y 
en automático tomará el valor `exponente = 2`.


```r
potencia_default_fun(2)
```

```
## [1] 4
```


### Argumentos nulos

Una función puede no tener argumentos y 
simplemente correr un proceso. 

En este caso, usaremos la función `sample()` que elige una
muestra aleatoria de tamaño 1 de un vector de 1 a 6
imitando un dado dentro la la función `lanza_dado()`.

```r
lanza_dado <- function() {
  numero <- sample(1:6, size = 1)
  numero
}
```

Ahora tiraremos dos veces los dados.

**Primer lanzamiento:**

```r
lanza_dado()
```

```
## [1] 4
```

**Segundo lanzamiento:**

```r
lanza_dado()
```

```
## [1] 5
```





<br>

---


## Alcance de la función 


Es importante mencionar que 
las variables que son definidas dentro de la función no 
son accesibles fuera de la función. Es decir, 
las funciones en R tienen un **ambiente local**.


Por ejemplo, al correr la siguiente función 
e intentar imprimir el objeto `x` regresa un 
error. 

```r
xs_fun <- function(a){
  x <- 2
  a*x
}
xs_fun(2)
```

```
## [1] 4
```

```r
# print(x)
```



La función crea un ambiente nuevo dentro de la misma, 
en caso de no encontrar el valor de la variable en el 
ambiente local, **sube un nivel**. 

Este nuevo nivel puede ser el ambiente global. Por ejemplo:


```r
y <- 10
ys_fun <- function(a){
  a*y
}
ys_fun(2)
```

```
## [1] 20
```

Si la función está contenida en otra función, primero buscará
en el ambiente local, después en el ambiente local
de la función superior y luego en el 
ambiente global.

Por ejemplo:

```r
y <- 10
mas_uno_fun <- function(a){
  c <- 1
  y <- 1
  ys_add_fun <- function(a){
    a*y + c
  }
  ys_add_fun(a)
}
```

Si llamamos la función con un valor `a = 2` al igual que 
en el ejemplo anterior, ¿por qué da el siguiente resultado y no 21 o 20?

```r
mas_uno_fun(a = 2)
```

```
## [1] 3
```





<br>


---


## Funciones para funciones

Algunas funciones útiles al manejar funciones 
son las funciones de ayuda para funciones
predeterminadas.

- `help()`

```r
help(sd)
```

- `?`

```r
?sd
```



O bien funciones para entender las
partes de la función. 

- `body()`

```r
body(suma_uno_fun)
```

```
## {
##     y = x + 1
##     return(y)
## }
```



- `args()`

```r
args(mean.default)
```

```
## function (x, trim = 0, na.rm = FALSE, ...) 
## NULL
```


- `if()`

Una función que se usa al programar funciones
es `if()` que permite
agregar una condición. 


```r
divide_fun <- function(num, den){
  if(den == 0){
    return("Denominador es cero")
  }else{
    return(num/den)
  }
}
```

Al ejecutar la función y tener cero en el denominador
imprime el string.

```r
divide_fun(10, 0)
```

```
## [1] "Denominador es cero"
```

Al no tener cero en el denominador la 
operación se ejecuta.

```r
divide_fun(10, 2)
```

```
## [1] 5
```




<br>

---

## R Packages

Una de las ventajas de R es que se mantiene
actualizado gracias a que tiene una activa comunidad. 
Solo en CRAN hay cerca de 4000 paquetes, lo que 
le da a R gran funcionalidad.

Aprovechar la funcionalidad de R es la mejor
forma de usarlo para análisis de datos.

Una de las ventajas de R es que el código de los
paquetes es abierto, incluyen documentación,
y es reproducible. 


<img src="figures/rstudiopackages.png" style="display: block; margin: auto;" />




<br>

---

### Paquetes predeterminados


R tiene siete paquetes predeterminados 
al iniciar una nueva sesión:

1. `base`
2. `utils`
3. `datasets`
4. `methods`
5. `stats`
6. `graphics`
7. `grDevices`


La función `search()` da la lista de los paquetes
cargados en la sesión de R abierta. 


```r
search()
```

```
## [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
## [4] "package:grDevices" "package:utils"     "package:datasets" 
## [7] "Autoloads"         "package:base"
```



<br>

---

### Instalar paquetes


A pesar de los paquetes predeterminados, muchas
veces es necesario instalar paquetes de CRAN. 

Existen dos formas de instalar paquetes al 
espacio de trabajo de R:
  
1. Desde RStudio:
  
<img src="figures/install_packages.png" style="display: block; margin: auto;" />
  
  
2. Desde la consola:


```r
install.packages('nombre_del_paquete')
```


\BeginKnitrBlock{warning}<div class="warning">Los paquetes se instalan una vez en el 
ambiente de trabajo local de R. 

No es necesario instalar los paquetes cada sesión nueva que
abras.

Sin embargo, al de descargar una nueva versión 
de R el ambiente de trabajo de R local cambia, por
lo que deberás instalar de nuevo los paquetes.</div>\EndKnitrBlock{warning}


<br>

---

### Cargar paquetes

Una vez instalados los paquetes, 
se cargan a la sesión de R en uso
con la función `library()`.
  

```r
library('nombre_del_paquete')
```

Los paquetes básicos que se recomiendan para análisis de datos
y algunos que utilizaremos más adelante:
  
1. `tidyr` manipulación de datos
2. `dplyr` filtros, cálculos y agregación de datos.
3. `ggplot2` gráficas
4. `readr` y `readxl` para leer datos
5. `lubridate` para  manejar fechas
6. `stringr` para manipular caracteres


\BeginKnitrBlock{warning}<div class="warning">Los paquetes se cargan en cada sesion nueva  
de R.</div>\EndKnitrBlock{warning}



<br>





---



## Ayuda en R
  
Existen diferentes formas de pedir ayuda en R.

* `help.start()`: ayuda en general
* `help(fun)` o `?fun`: ayuda sobre la función *fun*
* `apropos("fun")`: lista de funciones que contiene la palabra *fun*
* `example(fun)`: muestra un ejemplo de la función *fun*
  

```r
help(read_csv)
?read_csv2
```


### Vignettes

En general los paquetes incluyen viñetas o *vignettes* de las
funciones. 

\BeginKnitrBlock{nota}<div class="nota">Vignettes es documentación de temas o funciones sobre el paquete y en ocasiones 
incluyen algunos ejemplos.</div>\EndKnitrBlock{nota}

Para consultar viñetas:
  
* `vignette()`: muestra las viñetas disponibles sobre los paquetes instalados.
* `vignette("nombre_de_librería")`: muestra la viñetas incluidas en la librería.

Por ejemplo:

```r
vignette('ggplot2-specs')
```


---


### Más referencias

Si lo anterior no funciona se presentan los siguientes recursos:
  
- Buscar ayuda: Google, [StackOverflow](http://stackoverflow.com/questions/tagged/r).

- [Cheat sheets de RStudio](https://www.rstudio.com/resources/cheatsheets/)

- Para aprender programación avanzada en R, el libro gratuito 
[Advanced R](http://adv-r.had.co.nz/) de Hadley Wickham 
es una buena referencia. En particular es conveniente leer 
la guía de estilo (para todos: principiantes, intermedios y avanzados).

- Para aprender programación en R enfocada a la ciencia de 
datos, el libro gratuito 
[R for Data Science](http://r4ds.had.co.nz//) de Hadley Wickham.

- Para mantenerse al tanto de las noticias de la comunidad de 
[R](https://cran.r-project.org) pueden visitar [R-bloggers](http://www.r-bloggers.com/).

- Para entretenerse en una tarde domingo pueden navegar 
los reportes en [RPubs](https://rpubs.com/).



---

## Ejercicios



### Ej: Suma de valores absolutos 

Crea una función que sume los valores
absolutos de dos números. Los argumentos 
deben ser estos números. 

Tip: Usa la función `abs()` para obtener 
el valor absoluto de la función.


```r
suma_abs_fun <- function(a, b){
  
}
suma_abs_fun(-4, 2) 
```


```
## [1] 6
```


---




### Ej: Likes 

Considerando el siguiente vector de likes
de cada día de la semana.


```r
likes <- c(16, 7, 9, 20, 2, 17, 11)
names(likes) <-  c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
likes
```

```
## Mon Tue Wed Thu Fri Sat Sun 
##  16   7   9  20   2  17  11
```

Crea una función en la
imprima *Hoy fuiste popular* si
los likes del día fueron mayores a 15 y
regrese el número de likes.

Si el número de likes es menor a 15, entonces
imprime *:(* y regresa 0.

Usa la función `print()`.


```r
likes_fun <- function(num) {
  if (num > ) {
    print()
    return()
  } else {
    print()    
    return()
  }
}
```

Prueba la función para el primer elemento 
del vector `likes`.

```r
likes_fun(likes[1])
```






---

### Ej: Grafica de gasolina

El siguiente vector presenta el precio de 
la gasolina en diferentes localidades. 


```r
gas_cdmx <- c(15.82, 15.77, 15.83, 15.23, 14.95, 15.42, 15.55)
gas_cdmx
```

```
## [1] 15.82 15.77 15.83 15.23 14.95 15.42 15.55
```

Completa la siguiente función tal que 
considerando el argumento tipo de cambio, 
imprima una grafica del vector en dolares y regrese este vector.


```r
grafica_dolar_fun <- function(precio, tipo_cambio){
  precio_en_dolar <- precio/
  print(plot())
  return()
}
```




Considerando el tipo de cambio 
de los siguientes meses obten
el vector y la grafica de cada mes. 

- Julio: 17.3808 
- Agosto: 17.6084  



```r
gas_dolar_julio <- grafica_dolar_fun(, 17.3808)
gas_dolar_agosto <- grafica_dolar_fun(, 17.6084)
```





---


### Ej: Instala y carga 

Instala y carga en tu computadora los paquetes
en listados antes.

  

```r
install.packages(readr)
install.packages(readxl)
install.packages(tidyr)
install.packages(dplyr)
install.packages(stringr)
install.packages(ggplot)
install.packages(lubridate)
```


```r
library(readr)
library(readxl)
library(lubridate)
library(stringr)
library(tidyr)
library(dplyr)
library(ggplot)
```


---



### Ej: Search 

Después de cargar los paquetes 
llama el comando `search()`

¿Observas las nuevas librerías de la sesión?


