



# Iteraciones 

\BeginKnitrBlock{nota}<div class="nota">**Definición:** Acto de repetir un proceso con la 
intención de alcanzar un objetivo o resultado. 

Replica *automatizada* de instrucciones. 

A cada repetición del proceso se le denomina una **iteración**.

*Looping*, *ciclar*, *iterar*</div>\EndKnitrBlock{nota}



<br>

Existen dos tipos de iteraciones o loops:

- `For`: iteración condicionada a repetirse un
número de veces fijo, controlado por un
contador o índice que se incrementa con cada ciclo.


<img src="figures/forloop.png" style="display: block; margin: auto;" />



```r
for(k in 1:5){
  print( paste("Iteración", k) )
}
```

```
## [1] "Iteración 1"
## [1] "Iteración 2"
## [1] "Iteración 3"
## [1] "Iteración 4"
## [1] "Iteración 5"
```


- `While`:  iteración limitada a repetirse hasta que se 
cumple una condición lógica.


<img src="figures/whileloop.png" style="display: block; margin: auto;" />



```r
k <- 1
while(k <= 5){
  print( paste("Iteración", k) )
  k <-  k + 1
}
```

```
## [1] "Iteración 1"
## [1] "Iteración 2"
## [1] "Iteración 3"
## [1] "Iteración 4"
## [1] "Iteración 5"
```





## For loop y familia Apply 

La familia de funciones **apply** pertenece a la librería `base` en R y
facilitan la manipulación de datos de forma repetitiva.

Las funciones de esta familia son: [apply()], 
[lapply()], [sapply()], `vapply()`, `mapply()`, 
`rapply()`, and `tapply()`.

\BeginKnitrBlock{comentario}<div class="comentario">La estructura de los datos de entrada y el formato del resultado o salida
determinarán cual función usar. </div>\EndKnitrBlock{comentario}

En este taller solo se verán las primeras tres funciones. 

---

### apply()

Esta es la función que manipula arreglos homogéneos, en particular, 
se revisa el caso de matrices que son arreglos de dos dimensiones.

La función tiene los siguientes argumentos:
`apply(X, MARGIN, FUN, ...)`

- `X` representa el arreglo de dos dimensiones.
- `MARGIN` representa la dimensión sobre la que 
se va a resumir la información. Donde **1 = renglon o primera dimensión** y 
**2 = columna o segunda dimensión**.
- `FUN` representa la función que resume la información.


Tomemos la siguiente matriz de simulaciones

```r
set.seed(1)
mat_norm <- matrix(rnorm(24, mean = 0, sd = 1), nrow = 4, ncol = 6)
mat_norm
```

```
##            [,1]       [,2]       [,3]        [,4]        [,5]        [,6]
## [1,] -0.6264538  0.3295078  0.5757814 -0.62124058 -0.01619026  0.91897737
## [2,]  0.1836433 -0.8204684 -0.3053884 -2.21469989  0.94383621  0.78213630
## [3,] -0.8356286  0.4874291  1.5117812  1.12493092  0.82122120  0.07456498
## [4,]  1.5952808  0.7383247  0.3898432 -0.04493361  0.59390132 -1.98935170
```

<br>

**Deseamos obtener la suma 
de cada columna de la matriz.**

<br>

El primer método, quizá el mas intuitivo en este momento, es 
obtener cada elemento o columna, aplicar la función a cada elemento 
y concatenar:

```r
prom_col_m1 <- c(sum(mat_norm[, 1]), 
                 sum(mat_norm[, 2]), 
                 sum(mat_norm[, 3]), 
                 sum(mat_norm[, 4]),
                 sum(mat_norm[, 5]),
                 sum(mat_norm[, 6]))
prom_col_m1
```

```
## [1]  0.3168417  0.7347931  2.1720174 -1.7559432  2.3427685 -0.2136730
```


Segundo método

```r
prom_col_m2 <- vector( length = ncol(mat_norm))
for(j in 1:ncol(mat_norm)){
  prom_col_m2[j] <- sum(mat_norm[, j])
}
prom_col_m2
```

```
## [1]  0.3168417  0.7347931  2.1720174 -1.7559432  2.3427685 -0.2136730
```

Tercer método

<img src="figures/applycol.png" style="display: block; margin: auto;" />



```r
prom_col_m3 <- apply(X = mat_norm, MARGIN = 2, FUN = sum)
prom_col_m3
```

```
## [1]  0.3168417  0.7347931  2.1720174 -1.7559432  2.3427685 -0.2136730
```


Cuarto método

```r
prom_col_m4 <- colSums(mat_norm)
prom_col_m4
```

```
## [1]  0.3168417  0.7347931  2.1720174 -1.7559432  2.3427685 -0.2136730
```


<br>

Ahora, para obtener la suma
por renglón usando el tercer método de la función
`apply()`, únicamente 
es necesario cambiar la dimensión sobre
la que voy a resumir con el argumento `MARGIN = 1`.


```r
prom_row_m3 <- apply(mat_norm, 1, sum)
prom_row_m3
```

```
## [1]  0.5603818 -1.4309408  3.1842987  1.2830648
```

Que es equivalente al primer método que usamos.

```r
prom_row_m1 <- c(sum(mat_norm[1, ]), 
                 sum(mat_norm[2, ]), 
                 sum(mat_norm[3, ]), 
                 sum(mat_norm[4, ]))
prom_row_m1
```

```
## [1]  0.5603818 -1.4309408  3.1842987  1.2830648
```


La ventaja de usar la función `apply()` es que 
se puede usar cualquier función.
Por ejemplo, obtener la desviación 
estándar.

```r
apply(mat_norm, 1, sd)
```

```
## [1] 0.6341809 1.1718660 0.8338847 1.2066403
```


O bien, una crear una función propia (definida por el usuario) con 
la función `function()`

```r
cv_vec_m3 <- apply(mat_norm, 1, function(reng){
  cv <- mean(reng)/sd(reng)
  return(cv)
})
cv_vec_m3
```

```
## [1]  0.1472718 -0.2035131  0.6364386  0.1772228
```

\BeginKnitrBlock{nota}<div class="nota">**Funciones Anónimas:**

A este tipo de funciones se les llama
**funciones anónimas** porque no se nombran ni guardan en
el ambiente de R
y únicamente funcionan dentro del
comando que las llama.</div>\EndKnitrBlock{nota}



---

### lapply()

La función `lapply()` aplica una función sobre
una lista o un vector y regresa el resultado en 
otra lista.


Usando el vector de ciudades,

```r
ciudades_vec <- c("Aguascalientes", "Monterrey", "Guadalajara", "México")
ciudades_vec
```

```
## [1] "Aguascalientes" "Monterrey"      "Guadalajara"    "México"
```



```r
res_nchar_l <- lapply(ciudades_vec, nchar)
res_nchar_l
```

```
## [[1]]
## [1] 14
## 
## [[2]]
## [1] 9
## 
## [[3]]
## [1] 11
## 
## [[4]]
## [1] 6
```


\BeginKnitrBlock{comentario}<div class="comentario">Esta función permite implementar funciones que regresen
objetos de diferentes tipos, porque la listas permiten
almacenar contenido heterogéneo.</div>\EndKnitrBlock{comentario}

<br>

La función `lapply()` permite incluir 
argumentos de las funciones que implementa. 
Estos argumentos se incluyen dentro 
de `lapply()` despues de la función a implementar.

Por ejemplo, usamos la función potencia que 
se creó antes.


```r
potencia_fun <- function(base, exponente){
  base^exponente
}
```

El objetivo es aplicar a cada elemento de la 
siguiente lista la función potencia y elevarlo al cubo. 

```r
nums_lista <- list(1, 3, 4)
nums_lista
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] 3
## 
## [[3]]
## [1] 4
```

En la función `lapply()` se agrega el argumento `exponente = 3`
como último argumento. 

```r
potencia_lista <- lapply(nums_lista, potencia_fun, exponente = 3)
potencia_lista
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] 27
## 
## [[3]]
## [1] 64
```


Una forma de reducir la lista obtenida a un 
vector es con la función `unlist()` que vimos antes.


```r
unlist(potencia_lista)
```

```
## [1]  1 27 64
```



<br>

---

### sapply()


La función `sapply()` es muy similar a `lapply()`. 
La única diferencia es la **s** que surge de 
**simplified apply**. 

Al igual que `lapply()` aplica una función sobre
una lista o un vector pero simplifica el resultado en
un arreglo.



```r
res_nchar_s <- sapply(ciudades_vec, nchar)
res_nchar_s
```

```
## Aguascalientes      Monterrey    Guadalajara         México 
##             14              9             11              6
```


\BeginKnitrBlock{warning}<div class="warning">Esta función es *peligrosa* ya que únicamente simplifica
la estructura del resultado
cuando es posible, de lo contrario, regresará una lista
igual que `lapply()`.</div>\EndKnitrBlock{warning}




---

## While Loop

Este tipo de iteraciones 
implementan un proceso hasta que una condición se cumple.

Por ejemplo:

```r
ctr <- 0
while(ctr <= 7){
  
  print( paste("El valor de ctr", ctr))
  print( paste("El resultado de la condicion", ctr <= 7))
  print(ctr)
  
  ctr = ctr + 1
}
```

```
## [1] "El valor de ctr 0"
## [1] "El resultado de la condicion TRUE"
## [1] 0
## [1] "El valor de ctr 1"
## [1] "El resultado de la condicion TRUE"
## [1] 1
## [1] "El valor de ctr 2"
## [1] "El resultado de la condicion TRUE"
## [1] 2
## [1] "El valor de ctr 3"
## [1] "El resultado de la condicion TRUE"
## [1] 3
## [1] "El valor de ctr 4"
## [1] "El resultado de la condicion TRUE"
## [1] 4
## [1] "El valor de ctr 5"
## [1] "El resultado de la condicion TRUE"
## [1] 5
## [1] "El valor de ctr 6"
## [1] "El resultado de la condicion TRUE"
## [1] 6
## [1] "El valor de ctr 7"
## [1] "El resultado de la condicion TRUE"
## [1] 7
```


Existen ocasiones en las que la condición 
puede tardar mucho en cimplirse o incluso no cumplirse y 
queremos **interrumpir** el loop. 
La función `break()` o *break statement*
nos permite hacerlo.


```r
ctr <- 1
while(ctr <= 7){
  print( paste("El valor de ctr", ctr))
  print( paste("El resultado de la condicion", ctr <= 7))
  
  if((ctr %% 5) == 0){
    break()
  }
  ctr = ctr + 1
}
```

```
## [1] "El valor de ctr 1"
## [1] "El resultado de la condicion TRUE"
## [1] "El valor de ctr 2"
## [1] "El resultado de la condicion TRUE"
## [1] "El valor de ctr 3"
## [1] "El resultado de la condicion TRUE"
## [1] "El valor de ctr 4"
## [1] "El resultado de la condicion TRUE"
## [1] "El valor de ctr 5"
## [1] "El resultado de la condicion TRUE"
```






---

## Ejercicios


### Ej: Ciudad de México

Considerando la lista siguiente,


```r
cdmx_list <- list(
  pop = 8918653,
  delegaciones = c("Alvaro Obregón", "Azcapotzalco" ,"Benito Juárez" ,
                   "Coyoacán" ,"Cuajimalpa de Morelos" ,"Cuauhtémoc" ,
                   "Gustavo A. Madero" ,
                   "Iztacalco" ,"Iztapalapa" ,
                   "Magdalena Contreras" ,"Miguel Hidalgo" ,"Milpa Alta" ,
                   "Tláhuac" ,"Tlalpan" ,
                   "Venustiano Carranza" ,"Xochimilco"),
  capital = TRUE
)
```


obten la clase 
de cada elemento con la función `lapply()`.


```r
lapply( , class)
```


---

### Ej: Mínimo y máximo

La siguiente función extrae la letra de menor posicion
y mayor posicion en orden alfabético. 

```r
min_max_fun <- function(nombre){
  nombre_sinespacios <- gsub(" ", "", nombre)
  letras <- strsplit(nombre_sinespacios, split = "")[[1]]
  c(minimo = min(letras), maximo = max(letras))
}
```

Es decir, si incluímos las letras `abcz` la letra 
*mínima* es a y la *máxima* es z.

```r
min_max_fun("abcz")
```

```
## minimo maximo 
##    "a"    "z"
```


El siguiente vector incluye el nombre 
de las 16 delegaciones de la Ciudad de México.

```r
delegaciones <- c("Alvaro Obregon", "Azcapotzalco" ,"Benito Juarez" ,
                   "Coyoacan" ,"Cuajimalpa de Morelos" ,"Cuauhtemoc" ,
                   "Gustavo Madero" ,
                   "Iztacalco" ,"Iztapalapa" ,
                   "Magdalena Contreras" ,"Miguel Hidalgo" ,"Milpa Alta" ,
                   "Tlahuac" ,"Tlalpan" ,
                   "Venustiano Carranza" ,"Xochimilco")
```


Aplica la función `sapply()` para obtener un 
arreglo con la letra máxima y mínima de cada nombre. 


```r
sapply(, )
```




---


### Ej: Precio de la gasolina

El siguiente vector incluye el precio de la
gasolina en diferentes estados del país en julio 
de 2017. 


```r
gas_cdmx <- c(15.82, 15.77, 15.83, 15.23, 14.95, 15.42, 15.55)
gas_cdmx
```

```
## [1] 15.82 15.77 15.83 15.23 14.95 15.42 15.55
```


1. Crea una función que convierta el precio a dolares
suponiendo que un dolar equivale a 17.76 pesos.


```r
conv_fun <- function(precio){
  /17.76
  return()
}
```



2. Usando la función `lapply()`
convierte el precio de la gasolina a dolares.


```r
gas_cdmx_usd_lista <- lapply(, conv_fun)
```



3. Usa la función `unlist()` para convertir la 
lista a un vector. 



```r
gas_cdmx_usd <- unlist()
print(gas_cdmx_usd)
```






---


### Ej: Estadísticos importantes



```r
estadisticos <- c("GAUSS:1777", "BAYES:1702", "FISHER:1890", "PEARSON:1857")
split_estadisticos <- strsplit(estadisticos, split = ":")
split_estadisticos
```

```
## [[1]]
## [1] "GAUSS" "1777" 
## 
## [[2]]
## [1] "BAYES" "1702" 
## 
## [[3]]
## [1] "FISHER" "1890"  
## 
## [[4]]
## [1] "PEARSON" "1857"
```

Usa la función predefinida `tolower()` y 
`lapply()` para convertir a minúsculas 
cada letra de la lista `split_estadisticos`.


```r
split_lower <- lapply( , )
print(split_lower)
```


---

### Ej: Nombres y fechas

Usando el vector `split_estadísticos` del 
ejercicio anterior.

1. Crea una función que regrese la 
primera posición. 


```r
primera_pos_fun <- function(lista){
  
}
```

2. Crea una función que 
regrese la segunda posición.

```r
segunda_pos_fun <- function(lista){
  
}
```


3. Usando `lapply()` crea una lista con los
nombres de los estadísticos
y otra con la fecha de nacimiento. 


```r
nombres <- lapply()
fechas <- lapply()
```



---


### Ej: Función anónima

Usando una función anónima y el vector `split_estadísticos` 
en un solo `lapply()` o `sapply()` obten 
un vector compuesto de la primera posición, es decir el nombre,
en minúsculas. 

Tip: si usas `lapply()` recuerda usar la función `unlist()`.


```r
nombre_estadisticos <- (split_estadisticos, function(elemento){
  tolower()
})
nombre_estadisticos
```


---

### Ej: Tempraturas

En la siguiente lista se presenta el registro 
de temperatura de tres ciudades
a las 07:00 am, 10:00 am, 01:00 pm, 
04:00 pm y  07:00 pm.

```r
temp_lista <- list(
  cdmx = c(13, 15, 19, 22, 20),
  guadalajara = c(18, 18, 22, 26, 27),
  tuxtla_gtz = c(22, 24, 29, 32, 28)
)
str(temp_lista)
```

```
## List of 3
##  $ cdmx       : num [1:5] 13 15 19 22 20
##  $ guadalajara: num [1:5] 18 18 22 26 27
##  $ tuxtla_gtz : num [1:5] 22 24 29 32 28
```

Completa la siguiente función que obtiene el promedio entre
el valor mínimo y máximo registrados. 

```r
promedio_extremos_fun <-  function(x) {
  ( min() + max() ) / 2
}
```

Implementa la función a la lista y obten
la temperatura promedio de extremos para cada
ciudad usando `lapply()` y `sapply()`.


```r
lapply(,)
```


```r
sapply(,)
```








---

### Ej: Reducción de velocidad

Crea una función del tipo `while` en la que 
mientras la velocidad sea mayor a 50 km/hr 
se reduzca de la siguiente forma:

- Si es mayor a 80 km/hr se reducen 20 km/hr e imprime
**¡Demasido rápido!**.

- Si es menor o igual a 80km/hr se reducen únicamente 
5 km/hr.



```r
velocidad_act <- 140
while(velocidad_act > ){
  
  if(velocidad_act > ){
    print()
    velocidad_act <- 
  }
  if(velocidad_act < ){
    velocidad_act <- 
  }
  
  velocidad_act
}
```





