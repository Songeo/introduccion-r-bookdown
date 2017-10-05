


# Tipos de Datos {#tiposdatos}

En R existen cinco tipos de datos básicos:

  \@ref(vectores) Vector 
  
  \@ref(matrices) Matriz
  
  \@ref(factores) Factor
  
  \@ref(data-frame) Data frame
  
  \@ref(listas) Lista



<img src="figures/data-estructure.png" width="50%" style="display: block; margin: auto;" />


<img src="figures/estructura-objetos.png" width="90%" style="display: block; margin: auto;" />



## Vectores {#vectores}


\BeginKnitrBlock{information}<div class="information">Un vector es un arreglo de una dimensión.</div>\EndKnitrBlock{information}



### Tipo de vectores

En R existen tres clases principales de vectores y se 
crean con la función *combine* `c()` .

- Numérico

```r
num_vec <- c(-1, 2.5, 3, 4, 5.1)
```

- Caracter

```r
cha_vec <- c("Mon", "Tue", "Wed", "Thu", "Sat", "Sun")
```

- Lógico

```r
boo_vec <- c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
```


\BeginKnitrBlock{nota}<div class="nota">En R se asigna el objeto a un nombre 
con: `<-`.</div>\EndKnitrBlock{nota}



<br>

La función `class()` nos dice cuál es la clase o tipo del vector.


```r
class(num_vec)
```

```
## [1] "numeric"
```

Otra función importante es `length()` que 
nos dice cuál es la longitud del vector.


```r
length(num_vec)
```

```
## [1] 5
```

<br>

#### Ej: Ganancias - Ruleta y poker {-}

Mis ganancias de poker por día de la semana son:

```r
poker_gan <- c(150, 178, -6, 166, -80, -119, -142)
print(poker_gan)
```

```
## [1]  150  178   -6  166  -80 -119 -142
```

Mis ganancias en ruleta son: 

- lunes -48
- martes 151
- miércoles 198
- jueves -16
- viernes 134
- sábado -153
- domingo 126

Usando la función combine `c()` asigna
las ganancias por día al vector `ruleta_gan`.

```r
ruleta_gan <- c()
print(ruleta_gan)
```





<br>

---

### Nombres de vectores

La función `names()` nos permite nombrar 
los elementos de cada vector. 

Por ejemplo, a cada elemento de 
las ganancias de poker del ejercicio anterior,
asignaremos el nombre del día de la 
semana en que se obtuvieron. 


```r
dias <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(poker_gan) <- dias
print(poker_gan)
```

```
##  Mon  Tue  Wed  Thu  Fri  Sat  Sun 
##  150  178   -6  166  -80 -119 -142
```





#### Ej: Días - Ruleta y poker. {-}

Asigna los nombres del día de la 
semana a cada elemento del vector de las 
ganancias de ruleta. 


```r
names(ruleta_gan) <- 
print(ruleta_gan)
```




<br>

---


### Selección de elementos en vectores

La selección de elementos de un vector se 
realiza indicando las posiciones 
a seleccionar entre `[ ]`.

Estas posiciones pueden 
indicarse por medio de un vector 
numérico o de caracteres si los
elementos del vector están nombrados. 


- **Vector numérico:**


```r
poker_gan[ c(1, 5) ]
```

```
## Mon Fri 
## 150 -80
```

La función `seq()` o el uso de dos puntos `:` permiten
crear un vector de secuencias numéricas:


```r
poker_gan[ 1:3 ]
```

```
## Mon Tue Wed 
## 150 178  -6
```

```r
poker_gan[ seq(from = 7, to = 5) ]
```

```
##  Sun  Sat  Fri 
## -142 -119  -80
```


- **Nombres:** 


```r
poker_gan[ c("Mon", "Tue")]
```

```
## Mon Tue 
## 150 178
```




#### Ej: Miercoles - Ruleta y poker. {-}

Extrae las ganancias de ambos juegos del día **miercoles** y 
calcula la ganancia total de ese día. 


```r
wed_gan <- poker_gan[ ] + ruleta_gan[]
print(wed_gan)
```

<br>

---

### ¿Qué pasa si sumamos los días de fin de semana?

Seleccionamos únicamente los días de fin de semana
para ambos juegos. 


```r
poker_fin <- poker_gan[ dias[5:7] ] 
poker_fin
```

```
##  Fri  Sat  Sun 
##  -80 -119 -142
```


```r
ruleta_fin <- ruleta_gan[ 5:7 ]
ruleta_fin
```

```
##  Fri  Sat  Sun 
##  134 -153  126
```

¿Qué pasa cuando sumo los vectores?

```r
poker_fin + ruleta_fin
```

```
##  Fri  Sat  Sun 
##   54 -272  -16
```



\BeginKnitrBlock{information}<div class="information">**Element wise:** 
  
En R para cualquier operación (`+, -, *, /`) de vectores, 
las operaciones son elemento a elemento (element wise). 

Por ejemplo, al sumar vectores:

  - la primera posición del primer
vector se suma con la primera posicion del segundo vector,

  - la segunda posición del primer
vector se suma con la segunda posicion del segundo vector

y así sucesivamente. </div>\EndKnitrBlock{information}


<br>

#### Ej: Diario - Ruleta y poker. {-}

Calcula las ganancias diarias y asígnalas al objeto
`diario_gan`. ¿Qué día se gana más y qué día se pierde más?


```r
diario_gan <- 
```

Usando el vector `diario_gan` y la función 
`sum()` calcula las ganancias totales
de la semana. 


```r
sum(diario_gan)
```

¿Me conviene seguir jugando?



```
##  Mon  Tue  Wed  Thu  Fri  Sat  Sun 
##  102  329  192  150   54 -272  -16
```




<br>

---

### Comparación de elementos

La comparación de elementos se realiza 
con los siguientes comandos: 

- `>` mayor a
- `>=` mayor o igual
- `<` menor a 
- `<=` menor o igual a 
- `==` igual a
- `!=` distinto de 
- `%in%` contenido en


Este tipo de operaciones regresan
un vector lógico dependiendo si la condición 
se cumple o no. 


```r
poker_gan
```

```
##  Mon  Tue  Wed  Thu  Fri  Sat  Sun 
##  150  178   -6  166  -80 -119 -142
```

```r
poker_pos <- poker_gan >= 0
print(poker_pos)
```

```
##   Mon   Tue   Wed   Thu   Fri   Sat   Sun 
##  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE
```


Este vector lógico también nos ayuda a seleccionar 
los elementos del vector que cumplen la condición.


```r
poker_gan[poker_pos]
```

```
## Mon Tue Thu 
## 150 178 166
```


El comando `%in%` regresa un vector lógico
si los elementos indicados están contenidos en 
el vector.


```r
ciudades <-  c("Aguascalientes", "Aguascalientes", 
               "Monterrey", "Monterrey", 
               "Guadalajara", 
               "Mexico", "Mexico")
ciudades_cond <- ciudades %in% c("Mexico", "Monterrey")
ciudades_cond
```

```
## [1] FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
```


```r
sum(ciudades_cond)
```

```
## [1] 4
```


<br>


Otra función importante es la función `which()`, que 
regresa las posiciones numéricas del 
vector en las que se cumple la condición:


```r
ciudades_pos <- which(ciudades_cond)
ciudades_pos
```

```
## [1] 3 4 6 7
```


```r
ciudades[ciudades_pos]
```

```
## [1] "Monterrey" "Monterrey" "Mexico"    "Mexico"
```




<br>

---

### Gráfica de vectores

En R existe la función `plot()`que permite 
crear gráficas usando vectores numéricos.


```r
plot(x = poker_gan)
```

<img src="02-tipos-datos_files/figure-html/unnamed-chunk-33-1.png" width="480" />


```r
plot(x = poker_gan, y = ruleta_gan)
```

<img src="02-tipos-datos_files/figure-html/unnamed-chunk-34-1.png" width="480" />

Un histograma del vector se
crea con la función `hist()`.


```r
hist(x = poker_gan)
```

<img src="02-tipos-datos_files/figure-html/unnamed-chunk-35-1.png" width="480" />


<br>

---

### Vectores de distribuciones

En R existen funciones que generan vectores 
de realizaciones aleatorias
de distribuciones probabilísticas.


- Distribución Normal:

```r
norm_vec <- rnorm(n = 100, mean = 0, sd = 10)
hist(norm_vec)
```

<img src="02-tipos-datos_files/figure-html/unnamed-chunk-36-1.png" width="576" />

- Distribución Uniforme:

```r
unif_vec <- runif(n = 100, min = 10, max = 100)
hist(unif_vec)
```

<img src="02-tipos-datos_files/figure-html/unnamed-chunk-37-1.png" width="576" />


<br>

#### Ej: Normal {-}


Usando la función `rnorm()` genera 1000 realizaciones
de una distribución con media $\mu$ 10 y desviación
estándar $\sigma$ 5.


```r
norm1000_vec <- rnorm()
```


Realiza un histograma del vector obtenido.


```r
hist()
```


<br>

---

## Matrices {#matrices}

\BeginKnitrBlock{information}<div class="information">Una matriz es un arreglo de dos dimensiones
en el que todos los elementos son
del mismo tipo, por ejemplo: numéricos</div>\EndKnitrBlock{information}



### Crear una matriz 

La función `matrix()` permite crear la
matriz de un vector especificando las dimensiones,
por ejemplo:


```r
matrix(data = 1:9, nrow = 3, ncol = 3, byrow = F)
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
```

<br>

En el siguiente vector se presentan 
los ingresos totales y de lanzamiento
de cada película de la saga Harry Potter.

[Box Office Mojo: Harry Potter](http://www.boxofficemojo.com/franchises/chart/?id=harrypotter.htm)



```r
sales_hp <- c(497066400, 426630300, 401608200, 399302200, 377314200, 
              359788300, 357233500, 328833900, 141823200, 189432500, 
              142414700, 135197600, 99635700, 92756000, 134119300, 
              138752100)
sales_mat <- matrix(sales_hp, nrow = 8, byrow = F)
sales_mat
```

```
##           [,1]      [,2]
## [1,] 497066400 141823200
## [2,] 426630300 189432500
## [3,] 401608200 142414700
## [4,] 399302200 135197600
## [5,] 377314200  99635700
## [6,] 359788300  92756000
## [7,] 357233500 134119300
## [8,] 328833900 138752100
```

La función `dim()` regresa la dimensión de la
matriz (renglones y columnas). 


```r
dim(sales_mat)
```

```
## [1] 8 2
```


La función `nrow()` regresa el número de 
renglones de la matriz y `ncol()` el número 
de columnas.


```r
nrow(sales_mat)
```

```
## [1] 8
```


```r
ncol(sales_mat)
```

```
## [1] 2
```


<br> 

----

### Nombres de matrices 

En R es posible agregar nombres a los renglones
y columnas de una matriz con las funciones 
`colnames()` y `rownames()`. 

Considerando los siete títulos de la saga,
asignamos los títulos de las películas
a los renglones con la función `rownames()`:


```r
titles_hp <- c(
  "1. HP and the Sorcerer's Stone",
  "8. HP and the Deathly Hallows Part 2",
  "4. HP and the Goblet of Fire",
  "2. HP and the Chamber of Secrets",
  "5. HP and the Order of the Phoenix",
  "6. HP and the Half-Blood Prince",
  "3. HP and the Prisoner of Azkaban",
  "7. HP and the Deathly Hallows Part 1")
rownames(sales_mat) <- titles_hp
sales_mat
```

```
##                                           [,1]      [,2]
## 1. HP and the Sorcerer's Stone       497066400 141823200
## 8. HP and the Deathly Hallows Part 2 426630300 189432500
## 4. HP and the Goblet of Fire         401608200 142414700
## 2. HP and the Chamber of Secrets     399302200 135197600
## 5. HP and the Order of the Phoenix   377314200  99635700
## 6. HP and the Half-Blood Prince      359788300  92756000
## 3. HP and the Prisoner of Azkaban    357233500 134119300
## 7. HP and the Deathly Hallows Part 1 328833900 138752100
```


<br>

#### Ej: Tipo de ventas. {-}

Usando la función `colnames()` asigna 
el nombre del tipo de ventas 
a cada columna:


```r
sales_hp <- c("total", "release_date")
colnames() <- 
sales_mat
```





<br>

---

### Selección de elementos en una matriz

Al igual que un vector, los elementos de una matriz pueden seleccionarse
con un vector de posiciones o un vector de nombres. Pero, en este 
se define la posición de ambas
dimensiones, renglones y columnas  `[ , ]`.

Por ejemplo, si queremos obtener una submatriz para las 
primeras tres películas de las ventas :

```r
sales_mat[c(1, 4, 7), 1:2]
```

```
##                                       total release_date
## 1. HP and the Sorcerer's Stone    497066400    141823200
## 2. HP and the Chamber of Secrets  399302200    135197600
## 3. HP and the Prisoner of Azkaban 357233500    134119300
```

O bien:

```r
titles_first3 <- c("1. HP and the Sorcerer's Stone",
  "2. HP and the Chamber of Secrets",
  "3. HP and the Prisoner of Azkaban")
sales_mat[titles_first3, ]
```

```
##                                       total release_date
## 1. HP and the Sorcerer's Stone    497066400    141823200
## 2. HP and the Chamber of Secrets  399302200    135197600
## 3. HP and the Prisoner of Azkaban 357233500    134119300
```


\BeginKnitrBlock{nota}<div class="nota">Para seleccionar todos los
elementos de una dimensión se
deja vacía la posición. </div>\EndKnitrBlock{nota}



<br>


---

### Operaciones en matrices

Al igual que los vectores, las operaciones son elemento a elemento
o *element wise*.

Siguiendo con el ejemplo de ingresos, 
para facilitar la lectura de los datos
dividimos entre un millón cada valor.


```r
sales_mat_mill <- sales_mat/1e6
sales_mat_mill
```

```
##                                         total release_date
## 1. HP and the Sorcerer's Stone       497.0664     141.8232
## 8. HP and the Deathly Hallows Part 2 426.6303     189.4325
## 4. HP and the Goblet of Fire         401.6082     142.4147
## 2. HP and the Chamber of Secrets     399.3022     135.1976
## 5. HP and the Order of the Phoenix   377.3142      99.6357
## 6. HP and the Half-Blood Prince      359.7883      92.7560
## 3. HP and the Prisoner of Azkaban    357.2335     134.1193
## 7. HP and the Deathly Hallows Part 1 328.8339     138.7521
```


Lo mismo sucede con un vector. 
Supongamos que el siguiente vector
contiene el número de cines en los que se
exhibió cada película.

```r
theaters_vec <- c(3672, 4375, 3858, 3682, 4285, 4325, 3855, 4125)
theaters_vec
```

```
## [1] 3672 4375 3858 3682 4285 4325 3855 4125
```

Calculemos el ingreso promedio
por cada cine para el total de ingresos
y en la fecha de lanzamiento.

```r
sales_mat_avg <- sales_mat/theaters_vec
sales_mat_avg
```

```
##                                          total release_date
## 1. HP and the Sorcerer's Stone       135366.67     38622.88
## 8. HP and the Deathly Hallows Part 2  97515.50     43298.86
## 4. HP and the Goblet of Fire         104097.51     36914.13
## 2. HP and the Chamber of Secrets     108447.09     36718.52
## 5. HP and the Order of the Phoenix    88054.66     23252.21
## 6. HP and the Half-Blood Prince       83188.05     21446.47
## 3. HP and the Prisoner of Azkaban     92667.57     34791.00
## 7. HP and the Deathly Hallows Part 1  79717.31     33636.87
```


<br>

#### Ej: Total de visitas {-}

Calcula el número de visitas si 
el costo del boleto promedio es de $8.89
dólares.


```r
visits_mat <- sales_mat
visits_mat
```





<br>

----

### Operaciones por dimensiones

En R existen funciones que permiten 
realizar operaciones 
por columnas o renglones de una matriz.

- `colSums()`


```r
colSums(sales_mat_mill)
```

```
##        total release_date 
##     3147.777     1074.131
```

- `rowSums()`


```r
rowSums(sales_mat_mill)
```

```
##       1. HP and the Sorcerer's Stone 8. HP and the Deathly Hallows Part 2 
##                             638.8896                             616.0628 
##         4. HP and the Goblet of Fire     2. HP and the Chamber of Secrets 
##                             544.0229                             534.4998 
##   5. HP and the Order of the Phoenix      6. HP and the Half-Blood Prince 
##                             476.9499                             452.5443 
##    3. HP and the Prisoner of Azkaban 7. HP and the Deathly Hallows Part 1 
##                             491.3528                             467.5860
```


<br>

#### Ej: Ingresos promedio {-}

Usando la función `colMeans()` calcula 
el ingreso promedio 
total y en la fecha de lanzamiento.



```r
avg_income <- colMeans()
```





<br>

---


### Nuevos valores

Existen funciones que 
nos permiten aumentar la dimensión de una 
matriz. Para columnas `cbind()`
y reglones `rbind()`.


Agreguemos el vector de número de salas
a la matriz de ingresos por millón.


```r
sales_mat_theat <- cbind(sales_mat_mill, theaters_vec)
sales_mat_theat
```

```
##                                         total release_date theaters_vec
## 1. HP and the Sorcerer's Stone       497.0664     141.8232         3672
## 8. HP and the Deathly Hallows Part 2 426.6303     189.4325         4375
## 4. HP and the Goblet of Fire         401.6082     142.4147         3858
## 2. HP and the Chamber of Secrets     399.3022     135.1976         3682
## 5. HP and the Order of the Phoenix   377.3142      99.6357         4285
## 6. HP and the Half-Blood Prince      359.7883      92.7560         4325
## 3. HP and the Prisoner of Azkaban    357.2335     134.1193         3855
## 7. HP and the Deathly Hallows Part 1 328.8339     138.7521         4125
```

<br>

#### Ej: Más información {-}

Agrega un reglón a la matriz `sales_mat_theat`
con el promedio de ventas totales, 
ingresos en la fechas de lanzamientos y 
salas de exhibición.

Tip: Usa las funciones `colMeans()` y `rbind()`.

```r
avg_row <- colMeans()
rbind(sales_mat_theat, )
```


<br>


---

## Factores {#factores}


\BeginKnitrBlock{information}<div class="information">Un factor en R es un tipo de vector con un enfoque estadístico
que se usa para variables categóricas.

La característica de un factor es que tiene un número 
limitado de valores llamados **niveles**.

Existen dos tipos de variables categóricas: nominal u ordinal. 
En R un factor también se puden definir de esta forma.</div>\EndKnitrBlock{information}

Las variables categóricas son comunes
en bases de datos de encuestas.



### Variable categórica nominal

Un ejemplo de variable categórica nominal 
es el sexo de una persona: femenino (F) o 
masculino (M)


```r
sex_vec <- c("F", "M", "M", "F", "M")
```

En R un factor se define con la función 
`factor()`.


```r
sex_fct <- factor(sex_vec)
sex_fct
```

```
## [1] F M M F M
## Levels: F M
```

En automático define los niveles del factor y 
los ordena en orden alfabético. Si se desea cambiar
esto el argumento `levels = c()` permite asignar
un vector de niveles específico.



```r
sex_lev_fct <- factor(sex_vec, levels = c("M", "F"))
sex_lev_fct
```

```
## [1] F M M F M
## Levels: M F
```


<br>

---

### Variable categórica ordinal

Una variable categórica ordinal 
como el nombre lo dice tiene  
orden en los niveles del factor. 

Para dar orden a los niveles
en R se modifica el argumento `ordered = TRUE`
de la función `factor()`. 


Se tiene el siguiente vector de temperaturas y 
se desea crear un factor ordenado de menor temperatura
a mayor temperatura.

```r
temp_vec <- c("High", "Low", "Medium", "Low", 
              "Low", "Medium", "High", "Low", 
              "Medium", "Low", "Low")
temp_fct <- factor(temp_vec, 
                   levels = c("Low", "Medium", "High"), 
                   ordered = T)
temp_fct
```

```
##  [1] High   Low    Medium Low    Low    Medium High   Low    Medium Low   
## [11] Low   
## Levels: Low < Medium < High
```

Ahora los niveles tiene una jerarquía.

```r
levels(temp_fct)
```

```
## [1] "Low"    "Medium" "High"
```


Una forma de modificar las etiquetas de los niveles
es reasignando un vector.

```r
levels(temp_fct) <- c("L", "M", "H")
temp_fct
```

```
##  [1] H L M L L M H L M L L
## Levels: L < M < H
```


<br>

----

### Resúmen de factores

La función `summary()` permite resumir la 
información del vector. En particular para un 
factor calcula la frecuencia de cada nivel, 
lo que no sucede si es un caracter.


```r
summary(sex_vec)
```

```
##    Length     Class      Mode 
##         5 character character
```


```r
summary(sex_fct)
```

```
## F M 
## 2 3
```



<br>

#### Ej: Analistas {-}

Se tienen 5 analistas, cada uno con 
las siguientes características de
velocidad de trabajo.

Analista 1: rápido
Analista 2: normal
Analista 3: normal
Analista 4: rápido
Analista 5: lento

1. Crea un factor ordinal de analistas

```r
analistas_vec <-  c()
analistas_fct <-  factor(, 
                         levels = , 
                         ordered = )
```


2. Comprueba si el analista 2 es más rápido que el 
analista 5. Tip: es una comparación `>`.


```r
analistas_vec[] > analistas_vec[]
```





<br>

\BeginKnitrBlock{warning}<div class="warning">Este tipo de vector es importante porque
los modelos estadísticos que
desarrolles más adelante tratan diferente 
las variable numéricas y las variables categóricas.</div>\EndKnitrBlock{warning}





<br>


---

## Dataframe {#data-frame}

\BeginKnitrBlock{information}<div class="information">Un dataframe es un objeto de dos dimensiones en R.
Puede verse como un arreglo de vectores de la misma 
dimensión, similar a una matriz. 

La ventaja de un dataframe, es que a diferencia de una 
matriz, los vectores o columnas pueden ser de diferentes
tipos.</div>\EndKnitrBlock{information}

En general, funcionan para guardar tablas de datos. Donde
las columnas representan variables y los renglones
observaciones. Es similar a la carga de datos 
en paquetes estadísticos como SAS y SPSS.


<br>

### Crear un dataframe

En R se crean dataframes con la función `data.frame()`.

Una forma de crear un dataframe es
asignando vectores.

```r
muestra_df <- data.frame(secuencia = 1:5,
                         aleatorio = rnorm(5),
                         letras = c("a", "b", "c", "d", "e"))
muestra_df
```

```
##   secuencia  aleatorio letras
## 1         1  0.4663137      a
## 2         2 -1.0043280      b
## 3         3 -0.6544573      c
## 4         4 -0.2315481      d
## 5         5 -0.2093135      e
```

O bien, se pude transformar una matriz con la misma
función.
Tomemos los datos de los ingresos de las películas
de la saga de HP y hagamos una matriz.


```r
sales_df <- data.frame(sales_mat)
sales_df
```

```
##                                          total release_date
## 1. HP and the Sorcerer's Stone       497066400    141823200
## 8. HP and the Deathly Hallows Part 2 426630300    189432500
## 4. HP and the Goblet of Fire         401608200    142414700
## 2. HP and the Chamber of Secrets     399302200    135197600
## 5. HP and the Order of the Phoenix   377314200     99635700
## 6. HP and the Half-Blood Prince      359788300     92756000
## 3. HP and the Prisoner of Azkaban    357233500    134119300
## 7. HP and the Deathly Hallows Part 1 328833900    138752100
```

<br>

---

### Nombres de dimensiones

Al igual que matrices, las funciones `rownames()` y `colnames()` 
permiten nombrar los renglones y columnas del objeto. 


```r
colnames(sales_df) <- c("total_grosses", "opening_grosses")
sales_df
```

```
##                                      total_grosses opening_grosses
## 1. HP and the Sorcerer's Stone           497066400       141823200
## 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 4. HP and the Goblet of Fire             401608200       142414700
## 2. HP and the Chamber of Secrets         399302200       135197600
## 5. HP and the Order of the Phoenix       377314200        99635700
## 6. HP and the Half-Blood Prince          359788300        92756000
## 3. HP and the Prisoner of Azkaban        357233500       134119300
## 7. HP and the Deathly Hallows Part 1     328833900       138752100
```



<br>

----


### Seleccion de elementos

Para dataframes, ademas de seleccionar posiciones de
renglones y columnas con `[ , ]`, se puede 
usar el signo `$`.


```r
sales_df$total_grosses
```

```
## [1] 497066400 426630300 401608200 399302200 377314200 359788300 357233500
## [8] 328833900
```

Usando este mismo signo se pueden agregar
nuevas columnas al objeto. 

Por ejemplo, tomemos los títulos que se 
heredaron de la matriz como nombres de columnas.
Incluyamos una variable al dataframe de los
títulos como un factor. 


```r
sales_df$title <- factor(rownames(sales_df))
sales_df
```

```
##                                      total_grosses opening_grosses
## 1. HP and the Sorcerer's Stone           497066400       141823200
## 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 4. HP and the Goblet of Fire             401608200       142414700
## 2. HP and the Chamber of Secrets         399302200       135197600
## 5. HP and the Order of the Phoenix       377314200        99635700
## 6. HP and the Half-Blood Prince          359788300        92756000
## 3. HP and the Prisoner of Azkaban        357233500       134119300
## 7. HP and the Deathly Hallows Part 1     328833900       138752100
##                                                                     title
## 1. HP and the Sorcerer's Stone             1. HP and the Sorcerer's Stone
## 8. HP and the Deathly Hallows Part 2 8. HP and the Deathly Hallows Part 2
## 4. HP and the Goblet of Fire                 4. HP and the Goblet of Fire
## 2. HP and the Chamber of Secrets         2. HP and the Chamber of Secrets
## 5. HP and the Order of the Phoenix     5. HP and the Order of the Phoenix
## 6. HP and the Half-Blood Prince           6. HP and the Half-Blood Prince
## 3. HP and the Prisoner of Azkaban       3. HP and the Prisoner of Azkaban
## 7. HP and the Deathly Hallows Part 1 7. HP and the Deathly Hallows Part 1
```

Ahora los títulos de las películas son un 
factor con los siguientes niveles:

```r
levels(sales_df$title)
```

```
## [1] "1. HP and the Sorcerer's Stone"      
## [2] "2. HP and the Chamber of Secrets"    
## [3] "3. HP and the Prisoner of Azkaban"   
## [4] "4. HP and the Goblet of Fire"        
## [5] "5. HP and the Order of the Phoenix"  
## [6] "6. HP and the Half-Blood Prince"     
## [7] "7. HP and the Deathly Hallows Part 1"
## [8] "8. HP and the Deathly Hallows Part 2"
```


Como los títulos ya los tenemos como una variable
podemos borrar los nombres de los renglones usando `NULL`.

```r
rownames(sales_df) <- NULL
sales_df
```

```
##   total_grosses opening_grosses                                title
## 1     497066400       141823200       1. HP and the Sorcerer's Stone
## 2     426630300       189432500 8. HP and the Deathly Hallows Part 2
## 3     401608200       142414700         4. HP and the Goblet of Fire
## 4     399302200       135197600     2. HP and the Chamber of Secrets
## 5     377314200        99635700   5. HP and the Order of the Phoenix
## 6     359788300        92756000      6. HP and the Half-Blood Prince
## 7     357233500       134119300    3. HP and the Prisoner of Azkaban
## 8     328833900       138752100 7. HP and the Deathly Hallows Part 1
```

<br>

#### Ej: Salas de cine {-}

Agrega una columna con el 
número de cines en los que se exhibió la 
película usando el vector que generamos antes `theaters_vec`.



```r
sales_df$theaters <- 
sales_df
```





<br>

----

### Orden de posiciones

La función `order()` ordena el vector 
y regresa la posición de los elementos ordenados
de menor a mayor.


Siguiendo con el ejemplo de los ingresos de la saga, 
obtengamos el vector de posiciones de 
las películas ordenado por
el total de ingresos.

El vector de total de ingresos es el siguiente:

```r
sales_df$total_grosses
```

```
## [1] 497066400 426630300 401608200 399302200 377314200 359788300 357233500
## [8] 328833900
```

El vector con las posiciones ordenadas

```r
total_order <- order(sales_df$total_grosses)
total_order
```

```
## [1] 8 7 6 5 4 3 2 1
```

Seleccionamos las posiciones del total de ingresos
en el orden que nos dice el vector ordenado `total_order`
para obtener el vector de ingresos ordenado.

```r
sales_df$total_grosses[total_order]
```

```
## [1] 328833900 357233500 359788300 377314200 399302200 401608200 426630300
## [8] 497066400
```


De la misma forma, es posible ordenar el dataframe:

```r
sales_order_df <- sales_df[ total_order , c(3, 1, 2)]
sales_order_df
```

```
##                                  title total_grosses opening_grosses
## 8 7. HP and the Deathly Hallows Part 1     328833900       138752100
## 7    3. HP and the Prisoner of Azkaban     357233500       134119300
## 6      6. HP and the Half-Blood Prince     359788300        92756000
## 5   5. HP and the Order of the Phoenix     377314200        99635700
## 4     2. HP and the Chamber of Secrets     399302200       135197600
## 3         4. HP and the Goblet of Fire     401608200       142414700
## 2 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 1       1. HP and the Sorcerer's Stone     497066400       141823200
```


<br>

#### Ej: Fechas de lanzamiento {-}

Agrega otra columna al dataframe `sales_order_df` con las fechas de lanzamiento 
del vector que se presenta a continuación. 


```r
release_hp <- c("11/16/01", "7/15/11", "11/18/05", "11/15/02", "7/11/07", "7/15/09", "6/4/04", "11/19/10")
names(release_hp) <-  titles_hp
release_hp
```

```
##       1. HP and the Sorcerer's Stone 8. HP and the Deathly Hallows Part 2 
##                           "11/16/01"                            "7/15/11" 
##         4. HP and the Goblet of Fire     2. HP and the Chamber of Secrets 
##                           "11/18/05"                           "11/15/02" 
##   5. HP and the Order of the Phoenix      6. HP and the Half-Blood Prince 
##                            "7/11/07"                            "7/15/09" 
##    3. HP and the Prisoner of Azkaban 7. HP and the Deathly Hallows Part 1 
##                             "6/4/04"                           "11/19/10"
```

Existe un problema con este vector. Tiene el orden 
de la matriz original. 

Usando la función `order()` arregla la posición del 
vector con el orden de los títulos y este vector arreglado 
inclúyelo, finalmente, al df. 


```r
sales_order_df$release_date <- release_hp[]
sales_order_df
```


```
##                                  title total_grosses opening_grosses
## 8 7. HP and the Deathly Hallows Part 1     328833900       138752100
## 7    3. HP and the Prisoner of Azkaban     357233500       134119300
## 6      6. HP and the Half-Blood Prince     359788300        92756000
## 5   5. HP and the Order of the Phoenix     377314200        99635700
## 4     2. HP and the Chamber of Secrets     399302200       135197600
## 3         4. HP and the Goblet of Fire     401608200       142414700
## 2 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 1       1. HP and the Sorcerer's Stone     497066400       141823200
##   release_date
## 8     11/19/10
## 7       6/4/04
## 6      7/15/09
## 5      7/11/07
## 4     11/15/02
## 3     11/18/05
## 2      7/15/11
## 1     11/16/01
```


<br>


---

### Funciones útiles para data frames

Existen algunas que ayudan a tratar dataframes.


- `head()` y `tail()`: 


```r
head(sales_order_df)
```

```
##                                  title total_grosses opening_grosses
## 8 7. HP and the Deathly Hallows Part 1     328833900       138752100
## 7    3. HP and the Prisoner of Azkaban     357233500       134119300
## 6      6. HP and the Half-Blood Prince     359788300        92756000
## 5   5. HP and the Order of the Phoenix     377314200        99635700
## 4     2. HP and the Chamber of Secrets     399302200       135197600
## 3         4. HP and the Goblet of Fire     401608200       142414700
##   release_date
## 8     11/19/10
## 7       6/4/04
## 6      7/15/09
## 5      7/11/07
## 4     11/15/02
## 3     11/18/05
```



```r
tail(sales_order_df)
```

```
##                                  title total_grosses opening_grosses
## 6      6. HP and the Half-Blood Prince     359788300        92756000
## 5   5. HP and the Order of the Phoenix     377314200        99635700
## 4     2. HP and the Chamber of Secrets     399302200       135197600
## 3         4. HP and the Goblet of Fire     401608200       142414700
## 2 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 1       1. HP and the Sorcerer's Stone     497066400       141823200
##   release_date
## 6      7/15/09
## 5      7/11/07
## 4     11/15/02
## 3     11/18/05
## 2      7/15/11
## 1     11/16/01
```


- `str()`


```r
str(sales_order_df)
```

```
## 'data.frame':	8 obs. of  4 variables:
##  $ title          : Factor w/ 8 levels "1. HP and the Sorcerer's Stone",..: 7 3 6 5 2 4 8 1
##  $ total_grosses  : num  3.29e+08 3.57e+08 3.60e+08 3.77e+08 3.99e+08 ...
##  $ opening_grosses: num  1.39e+08 1.34e+08 9.28e+07 9.96e+07 1.35e+08 ...
##  $ release_date   : chr  "11/19/10" "6/4/04" "7/15/09" "7/11/07" ...
```


- `dim()`, `nrow()` y `ncol()`


```r
nrow(sales_order_df)
```

```
## [1] 8
```


- `subset()`


```r
avg_total_gr <- mean(sales_order_df$total_grosses)
subset(sales_order_df, total_grosses > avg_total_gr)
```

```
##                                  title total_grosses opening_grosses
## 4     2. HP and the Chamber of Secrets     399302200       135197600
## 3         4. HP and the Goblet of Fire     401608200       142414700
## 2 8. HP and the Deathly Hallows Part 2     426630300       189432500
## 1       1. HP and the Sorcerer's Stone     497066400       141823200
##   release_date
## 4     11/15/02
## 3     11/18/05
## 2      7/15/11
## 1     11/16/01
```




<br>

---

## Listas {#listas}


\BeginKnitrBlock{information}<div class="information">Una lista en R es un objeto que permite una
estructura de datos complicada, una super estructura. 
Esto porque permite reunir diferentes tipos de objetos:

  - Vectores
  - Matrices
  - Dataframes
  - Listas
  
Es decir, puede almacenar cualquier cosa. </div>\EndKnitrBlock{information}

Muchas funciones que usarás en el futuro, sobre todo de modelación, 
regresan resultados de estructuras complicadas y lo almacenan en 
listas. Por ejemplo, la función `lm()`.

<br>

### Crear una lista

La función `list()` permite crear una lista. 


```r
ejem_list <- list(
  vector = 1:10,
  matriz = matrix(1:9, nrow = 3),
  dataframe = mtcars[1:5,]
)
ejem_list
```

```
## $vector
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $matriz
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
## 
## $dataframe
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
```



<br>

---

### Nombres de elementos

Equivalente a un vector, la función `names()` permite
extraer el nombre de cada elemento de la lista.


```r
names(ejem_list) 
```

```
## [1] "vector"    "matriz"    "dataframe"
```

También permite modificar los nombres.

```r
names(ejem_list) <-  c("vec", "mat", "df")
ejem_list
```

```
## $vec
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $mat
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
## 
## $df
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
```


La función `length()` nos
dice cuantos elementos tiene la lista.


```r
length(ejem_list)
```

```
## [1] 3
```



<br>

---

### Selección de elementos en una lista

La selección de elementos de una lista puede 
realizarse de tres maneras: 

1. `[ ]`



```r
ejem_list[1]
```

```
## $vec
##  [1]  1  2  3  4  5  6  7  8  9 10
```

2. `[[ ]]`


```r
ejem_list[[1]]
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

3. `$`


```r
ejem_list$vector
```

```
## NULL
```

<br>

---

### Nuevos valores a la lista

Existen dos formas de agregar nuevos valores a la 
lista. 

Supongamos que deseamos agregar a la 
lista de ejemplos 
un número aleatorio de la distribución normal.


```r
rand_num <- rnorm(1)
rand_num
```

```
## [1] 0.4796716
```


Una forma es usando la función combine `c()`,
similar a un vector: 

```r
ejem_list_random <- c(ejem_list, 
                           random = rand_num)
ejem_list_random
```

```
## $vec
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $mat
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
## 
## $df
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## 
## $random
## [1] 0.4796716
```


La segunda es usando el signo `$` 


```r
ejem_list_random$random_num <- rand_num
ejem_list_random
```

```
## $vec
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $mat
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
## 
## $df
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## 
## $random
## [1] 0.4796716
## 
## $random_num
## [1] 0.4796716
```


<br>

---

### Funciones útiles para listas

Algunas funciones que pueden ayudarte en un futuro 
para manipular listas son:

- `unlist()`


```r
unlist(ejem_list)
```

```
##     vec1     vec2     vec3     vec4     vec5     vec6     vec7     vec8 
##    1.000    2.000    3.000    4.000    5.000    6.000    7.000    8.000 
##     vec9    vec10     mat1     mat2     mat3     mat4     mat5     mat6 
##    9.000   10.000    1.000    2.000    3.000    4.000    5.000    6.000 
##     mat7     mat8     mat9  df.mpg1  df.mpg2  df.mpg3  df.mpg4  df.mpg5 
##    7.000    8.000    9.000   21.000   21.000   22.800   21.400   18.700 
##  df.cyl1  df.cyl2  df.cyl3  df.cyl4  df.cyl5 df.disp1 df.disp2 df.disp3 
##    6.000    6.000    4.000    6.000    8.000  160.000  160.000  108.000 
## df.disp4 df.disp5   df.hp1   df.hp2   df.hp3   df.hp4   df.hp5 df.drat1 
##  258.000  360.000  110.000  110.000   93.000  110.000  175.000    3.900 
## df.drat2 df.drat3 df.drat4 df.drat5   df.wt1   df.wt2   df.wt3   df.wt4 
##    3.900    3.850    3.080    3.150    2.620    2.875    2.320    3.215 
##   df.wt5 df.qsec1 df.qsec2 df.qsec3 df.qsec4 df.qsec5   df.vs1   df.vs2 
##    3.440   16.460   17.020   18.610   19.440   17.020    0.000    0.000 
##   df.vs3   df.vs4   df.vs5   df.am1   df.am2   df.am3   df.am4   df.am5 
##    1.000    1.000    0.000    1.000    1.000    1.000    0.000    0.000 
## df.gear1 df.gear2 df.gear3 df.gear4 df.gear5 df.carb1 df.carb2 df.carb3 
##    4.000    4.000    4.000    3.000    3.000    4.000    4.000    1.000 
## df.carb4 df.carb5 
##    1.000    2.000
```

- `str()`


```r
str(ejem_list)
```

```
## List of 3
##  $ vec: int [1:10] 1 2 3 4 5 6 7 8 9 10
##  $ mat: int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
##  $ df :'data.frame':	5 obs. of  11 variables:
##   ..$ mpg : num [1:5] 21 21 22.8 21.4 18.7
##   ..$ cyl : num [1:5] 6 6 4 6 8
##   ..$ disp: num [1:5] 160 160 108 258 360
##   ..$ hp  : num [1:5] 110 110 93 110 175
##   ..$ drat: num [1:5] 3.9 3.9 3.85 3.08 3.15
##   ..$ wt  : num [1:5] 2.62 2.88 2.32 3.21 3.44
##   ..$ qsec: num [1:5] 16.5 17 18.6 19.4 17
##   ..$ vs  : num [1:5] 0 0 1 1 0
##   ..$ am  : num [1:5] 1 1 1 0 0
##   ..$ gear: num [1:5] 4 4 4 3 3
##   ..$ carb: num [1:5] 4 4 1 1 2
```



<br>


---

## Ejercicios 

### Ej: Hidden Figures IMDB

Usando los siguientes objetos crea una lista 
de tres elementos con nombres: director, stars y reviews.


```r
director_hf <- "Theodore Melfi"
stars_hf <- c( "Taraji P. Henson", "Octavia Spencer", "Janelle Monáe",
             "Kirsten Dunst", "Kevin Costner", "Jim Parsons", 
             "Mahershala Ali")
reviews_hf <- data.frame(
    scores = c(9, 6, 5, 10),
    source = c( rep("IMDB", 4) ),
    comments = c("It made for an old-fashioned movie going experience...",
                 "Evident Heroism, Hidden Doubts",
                 "OK, but very disappointing",
                 "Don't let Hidden Figures be a hidden treasure!")
    )
```

La lista se llama `hidden_figures`:


```r
hidden_figures <- list(
  director = ,
  stars = ,
  reviews = 
)
str(hidden_figures)
```









---

### Ej: Calificación promedio

Extrae los scores de la película `hidden_figures` y 
con la función `mean()` calcula el promedio. 

1. Primero deberás extraer el elemento que contiene los scores. Es un dataframe.
2. Después deberás seleccionar la columna de *scores*.
3. Por último calcular el promedio y asignarlo a `avg_reviews_hf`.


Tip: Usando la función `str()` sobre la lista ubica el nivel
en el que esta el valor *scores*.



```r
reviews_df <- hidden_figures
reviews_vec <- 
avg_reviews_hf <- mean(  )
avg_reviews_hf
```




---

### Ej: Pesos a dolares

El siguiente vector presenta el precio de 
la gasolina en diferentes localidades. 


```r
gas_cdmx <- c(15.82, 15.77, 15.83, 15.23, 14.95, 15.42, 15.55)
gas_cdmx
```

```
## [1] 15.82 15.77 15.83 15.23 14.95 15.42 15.55
```


Usando la siguiente lista de tipo de cambio por mes:

- Julio: 17.3808 
- Agosto: 17.6084  
- Septiembre: 17.7659 

Crea un dataframe donde cada 
variable/columna sea el precio en dolares 
por cada mes. 


```r
gas_usd_df <- data.frame(
  julio = gas_cdmx/
  agosto = 
  septiembre = 
)
print(gas_usd_df)
```


