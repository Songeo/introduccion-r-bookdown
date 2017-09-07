
# Taller de Introducción a R



# ========= # 
# Funciones #
# ========= # 



### Una caja negra ----

input <- c(1:5)
output <- mean( input )
output


## Escibir una función ----
suma_uno_fun <- function( x ){
  y = x + 1
  return(y)
}

suma_uno_fun(5)

ls()

#### Ej: Suma de valores absolutos ----

# Crea una función que sume los valores
# absolutos de dos números. Los argumentos 
# deben ser estos números. 
# 
# Tip: Usa la función `abs()` para obtener 
# el valor absoluto de la función.


suma_abs_fun <- function(a, b){
  
}
suma_abs_fun(-4, 2) 



## Argumentos de funciones ----

potencia_fun <- function(base, exponente){
  base^exponente
}
potencia_fun(2, 3)
potencia_fun(exponente = 2, base = 3)



### Argumentos default ----

potencia_default_fun <- function(base, exponente = 2){
  base^exponente
}
potencia_default_fun(2)


### Argumentos nulos ----

lanza_dado <- function() {
  numero <- sample(1:6, size = 1)
  numero
}
lanza_dado()
lanza_dado()




## Alcance de la función  ----

xs_fun <- function(a){
  x <- 2
  a*x
}
xs_fun(2)
print(x)


y <- 10
ys_fun <- function(a){
  a*y
}
ys_fun(2)


## Funciones para funciones ----

help(sd)
?sd

body(suma_uno_fun)

args(mean.default)

divide_fun <- function(num, den){
  if(den == 0){
    return("Denominador es cero")
  }else{
    return(num/den)
  }
}
divide_fun(10, 0)
divide_fun(10, 2)



#### Ej: Likes ----

# Considerando el siguiente vector de likes
# de cada día de la semana.
#
# Crea una función en la
# imprima *Hoy fuiste popular* si
# los likes del día fueron mayores a 15 y
# regrese el número de likes.

# Si el nuúmero de likes es menor a 15, entonces
# imprime *:(* y regresa 0.

# Usa la función `print()`.
           
likes <- c(16, 7, 9, 20, 2, 17, 11)
names(likes) <-  c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
likes

likes_fun <- function(num) {
 if (num > ) {
   print()
   return()
 } else {
   print()    
   return()
 }
}

likes_fun(likes[1])



## R Packages ----


### Paquetes predeterminados----

search()



#### Ej: Instala y carga los paquetes ----

install.packages(readr)
install.packages(readxl)
install.packages(tidyr)
install.packages(dplyr)
install.packages(stringr)
install.packages(ggplot)
install.packages(lubridate)


library(readr)
library(readxl)
library(lubridate)
library(stringr)
library(tidyr)
library(dplyr)
           
vignette('ggplot2-specs')

























