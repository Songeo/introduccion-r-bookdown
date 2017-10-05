
# Manipulación

<br>

> "Happy families are all alike; every unhappy family is unhappy
> in its own way." — Leo Tolstoy

> "Tidy datasets are all alike; but every messy dataset is messy
> in its own way." — Hadley Wickham

<br>



### Proceso estándar {-}


La relevancia de esta sección se puede ver en el 
diagrama del proceso de un proyecto análisis de datos 
estándar propuesto por Hadley Wickham.

<img src="figures/datascience_diagram.png" style="display: block; margin: auto;" />



La etapa de manipulación involucra la importación de datos a R, 
la limpieza y la transformación constante de los datos para
realizar modelos y visualización. 


#### Descarga e instalacion {-}

Para esta sección usaremos las librerías:

- `readr`
- `readxl`
- `tidyr`
- `dplyr`

La manera más facil de instalar los paquetes es usando
`tidyverse` que incluye varios paquetes.


```r
install.packages("tidyverse")
```


```r
library("tidyverse")
```


<img src="figures/lib-tidyverse.png" style="display: block; margin: auto;" />


<br>

---



## Importación de datos


<img src="figures/lib-imports.png" style="display: block; margin: auto;" />



---


## Pipes

<img src="figures/lib-magrittr.png" width="12%" style="display: block; margin: auto;" />



El objetivo de usar *pipes* es hacer el desarrollo de código
**más fácil de escribir, mas rápido de leer y más sencillo 
darle mantenimiento.**

\BeginKnitrBlock{nota}<div class="nota">Funciona con el operador **forwad pipe** `%>%` 
que envía un valor a una función. </div>\EndKnitrBlock{nota}



<img src="figures/pipes.png" style="display: block; margin: auto;" />


La función básica puede verse de la siguiente forma:

- `x %>% f` equivale a `f(x)`.
- `x %>% f(y)` equivale a `f(x, y)`.
- `x %>% f %>% g %>% h` equivale a `h(g(f(x)))`.



Colocación de valores en argumentos por posición 
se realiza con un punto `.`:

- `x %>% f(y, .)` equivale a `f(y, x)`.
- `x %>% f(y, z = .)` equivale a `f(y, z = x)`


\BeginKnitrBlock{comentario}<div class="comentario">**Shortcut**

El shortcut de forward pipe `%>%` es command/ctrl + shift + m</div>\EndKnitrBlock{comentario}


#### Ejemplos {-}

Por ejemplo, en una función de 
un solo argumento.

```r
pordos_fun <- function(base){
  base*2
} 
# Con operador pipe
4 %>% pordos_fun
```

```
## [1] 8
```

```r
# Equivalente a
pordos_fun(4)
```

```
## [1] 8
```


Una función de dos argumentos, como la que 
se muestra en el siguiente ejemplo, envía 
el valor al **primer argumento**. 


```r
porexponente_fun <- function(base, exponente){
  base*exponente
} 
# Con operador pipe
4 %>% porexponente_fun(exponente = 2)
```

```
## [1] 8
```

```r
# Equivalente a
porexponente_fun(4, 2)
```

```
## [1] 8
```


Otro ejemplo es anidar operaciones a un vector 
de valores numéricos.

```r
# Con operador pipe
1:10 %>% range() %>% mean() %>% round()
```

```
## [1] 6
```

```r
# Equivalente a
round(mean(range(1:10)))
```

```
## [1] 6
```


<br> 

\BeginKnitrBlock{warning}<div class="warning">El paquete `dplyr` funciona con *pipes* y esta pensado
con una estructura de datos ordenada o *tidy*.</div>\EndKnitrBlock{warning}






---

## Limpieza y reestructura 


<img src="figures/lib-tidyr.png" width="12%" style="display: block; margin: auto;" />



La mayor parte de las bases de datos en estadística 
tienen forma rectangular por lo que únicamente se trataran
este tipo de estructura de datos. 


\BeginKnitrBlock{nota}<div class="nota">Una **base de datos** es una colección de valores numéricos o 
categóricos con tres características: 

- Cada **valor** pertenece a una variable y a una observación. 

- Una **variable** contiene los valores del atributo (genero, fabricante, ingreso) 
de la variable por unidad. 

- Una **observación**
contiene todos los valores medidos por la misma 
unidad (personas, día, autos, municipios) 
para diferentes atributos.</div>\EndKnitrBlock{nota}




### Principios de datos limpios

Los principios de datos limpios 
([Tidy Data de Hadley Wickham]<http://vita.had.co.nz/papers/tidy-data.pdf>) 
proveen una manera estándar de organizar la información:

1. Cada variable forma una columna.
2. Cada observación forma un renglón.
3. Cada tipo de unidad observacional forma una tabla.


<img src="figures/tidy_data.png" style="display: block; margin: auto;" />





<br>

#### Ejemplos {-}

Supongamos un experimento con 3 pacientes 
cada uno tiene resultados de 
dos tratamientos (A y B):


||tratamientoA|tratamientoB
----|------------|---------
Juan Aguirre|- |2
Ana Bernal  |16|11
José López  |3 |1


La tabla anterior también se puede estructurar de la siguiente manera:

 ||Juan Aguirre| Ana Bernal|José López
--|------------|-----------|----------
tratamientoA|- |    16     |   3
tratamientoB|2 |    11     |   1


Entonces, siguiendo los principios de _datos limpios_ obtenemos la siguiente estructura: 

nombre|tratamiento|resultado
------------|-----|---------
Juan Aguirre|a    |-
Ana Bernal  |a    |16
José López  |a    |3
Juan Aguirre|b    |2
Ana Bernal  |b    |11
José López  |b    |1




---

## *Split-apply-combine*

<img src="figures/lib-dplyr.png" width="12%" style="display: block; margin: auto;" />

Filtros, cálculos y agregación de datos.
