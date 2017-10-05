
# Manipulación

<br>

> "Happy families are all alike; every unhappy family is unhappy
> in its own way." — Leo Tolstoy

> "Tidy datasets are all alike; but every messy dataset is messy
> in its own way." — Hadley Wickham

<br>



### Proceso estándar {-}


La manipulación de datos es algo primordial en el
diagrama del proceso de un proyecto análisis de datos.
Este taller se basa en el proceso
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

La manera más fácil de instalar los paquetes es usando
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



## Importación y exportación de datos

Hay muchas maneras de **importar** datos en R, 
se recomiendan 
las librerías **readr** y **readxl** que 
forman parte del *tidyverse*.

<img src="figures/lib-imports.png" style="display: block; margin: auto;" />


### Working directory

Un paso importante para la importación de datos en R
es definir el directorio actual de trabajo o *working directory*
porque se usarán rutas relativas para importar datos. 

Es decir, saber donde RStudio está guardando los documentos que genero, 
por ejemplo Rscripts. 

La función `getwd()` nos ayuda a identificar la 
ruta en la que estoy actualmente. 

```r
getwd()
```

```
## [1] "/Users/soniamendizabal/Documents/trabajo/intro-r-bookdown"
```



La función `setwd()` permite cambiar esta ruta o *path* de
trabajo.


```r
setwd("/Users/soniamendizabal/Documents/trabajo/intro-r-material/")
```


<br>

---

### Importar datos locales

Uno de los formatos más comunes de datos es `.csv` (comma separated values), 
cualquier hoja de excel se puede extraer en este formato.

Del paquete `readr` se llama la función `read_csv()`
para leer un archivo. 
Esta función tiene como argumento 
la ruta a la base de datos `file = "path_of_file"`.


```r
library(tidyverse)
bnames <- read_csv(file = "datos/bnames2.csv")
```

```
## Parsed with column specification:
## cols(
##   year = col_integer(),
##   name = col_character(),
##   percent = col_double(),
##   sex = col_double()
## )
```

```r
head(bnames)
```

```
## # A tibble: 6 x 4
##    year    name  percent   sex
##   <int>   <chr>    <dbl> <dbl>
## 1  1880    John 0.081541     1
## 2  1880 William 0.080511     1
## 3  1880   James 0.050057     1
## 4  1880 Charles 0.045167     1
## 5  1880  George 0.043292     1
## 6  1880   Frank 0.027380     1
```

\BeginKnitrBlock{comentario}<div class="comentario">La función equivalente en el paquete básico de 
R es `read.csv()`. Los argumentos cambian por lo que es 
necesario, si deseas usar esta función, consultar la ayuda de la 
función. </div>\EndKnitrBlock{comentario}



<br>

---

### Importar datos en línea

Otra forma común de importar datos en línea, es decir, 
obtener base de datos accesible desde la red, incluyendo internet.


Tomaremos la base de datos **Iris** disponible 
en la página (http://archive.ics.uci.edu/ml/datasets/Iris).

La función `read_delim()` permite importar archivos 
delimitados como un archivo *csv* que esta delimitado por comas
o un archivo *tsv* delimitado por *tabs*.

Los argumentos de esta función son `file` el archivo, 
`delim` el delimitador que será una coma, y dado 
que la base de datos no tiene *header* 
se define con el argumento `col_names`.


```r
iris.uci <- 
  read_delim(file = "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",
             delim = ",", 
             col_names = c("sepal_length", "sepal_width", 
                           "petal_length", "petal_width", 
                           "class"))
```

```
## Parsed with column specification:
## cols(
##   sepal_length = col_double(),
##   sepal_width = col_double(),
##   petal_length = col_double(),
##   petal_width = col_double(),
##   class = col_character()
## )
```

```r
head(iris.uci)
```

```
## # A tibble: 6 x 5
##   sepal_length sepal_width petal_length petal_width       class
##          <dbl>       <dbl>        <dbl>       <dbl>       <chr>
## 1          5.1         3.5          1.4         0.2 Iris-setosa
## 2          4.9         3.0          1.4         0.2 Iris-setosa
## 3          4.7         3.2          1.3         0.2 Iris-setosa
## 4          4.6         3.1          1.5         0.2 Iris-setosa
## 5          5.0         3.6          1.4         0.2 Iris-setosa
## 6          5.4         3.9          1.7         0.4 Iris-setosa
```

\BeginKnitrBlock{comentario}<div class="comentario">La función equivalente en el paquete básico de 
R es `read.delim()`. Los argumentos cambian por lo que es 
necesario, si deseas usar esta función, consultar la ayuda de la 
función. </div>\EndKnitrBlock{comentario}

<br>

---


### Exportar datos

Es posible **guardar** objetos en distintos formatos, que dependerá
del uso que se le desee dar. 

1. Podemos guardar un dataframe en formato `.csv` usando 
la instrucción `write_csv`.


```r
write_csv(x = tabla, path = "ejemplo_tabla.csv")
read_csv(file = "ejemplo_tabla.csv")
```


2. Es posible guardar objetos creados en R usando 
el formato `.RData` que es exclusivo de R.


```r
save(tabla, file = "ejemplo_tabla.RData")
load(file = "ejemplo_tabla.RData")
```


3. También es posible guardar objetos en formato 
RDS usando `write_rds` 
y volverlos a leer con `read_rds`.

Este tipo de almacenamiento es más confiable 
y la lectura de los datos es más rápida:

```r
write_rds(x = tabla, path = "ejemplo_tabla.Rds")
read_rds(path = "ejemplo_tabla.Rds")
```



<br>

---


## Pipes

<img src="figures/lib-magrittr.png" width="12%" style="display: block; margin: auto;" />

El objetivo de usar *pipes* es hacer el desarrollo de código
**más fácil de escribir, mas rápido de leer y más sencillo 
de dar mantenimiento.**

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
[Tidy Data de Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf)
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


<br>

La tabla anterior también se puede estructurar de la siguiente manera:

 ||Juan Aguirre| Ana Bernal|José López
--|------------|-----------|----------
tratamientoA|- |    16     |   3
tratamientoB|2 |    11     |   1

<br>

Entonces, siguiendo los principios de _datos limpios_ obtenemos la siguiente estructura: 

nombre|tratamiento|resultado
------------|-----|---------
Juan Aguirre|a    |-
Ana Bernal  |a    |16
José López  |a    |3
Juan Aguirre|b    |2
Ana Bernal  |b    |11
José López  |b    |1

<br> 

---

### Problemas más comunes

Algunos de los problemas más comunes en las bases de datos que 
no están _limpias_ son:

a. Los encabezados de las columnas son valores y no nombres de variables. 
b. Más de una variable por columna. 
c. Las variables están organizadas tanto en filas como en columnas. 
d. Más de un tipo de observación en una tabla.
e. Una misma unidad observacional está almacenada en múltiples tablas. 


<br> 

---

### Funciones de reestructura

Existe cuatro funciones principales para la
manipulación de los datos.


\BeginKnitrBlock{nota}<div class="nota">Funciones principales:

- `gather()`
- `spread()`
- `unite()`
- `separate()`</div>\EndKnitrBlock{nota}

Para entender los conceptos se presentan varios ejemplos usando
la base de datos siguiente.


```r
df.ejem <- data_frame(
  mes = c("1_ene", "2_feb", "3_mar", "4_abr", "5_may"),
  `2005`= c(8.6, 9.1, 8.7, 8.4, 8.5),
  `2006`= c(8.5, 8.5, 9.1, 8.6, 7.9),
  `2007`= c(9.0, 10.7, 20.0, 21, 16.2))
df.ejem
```

```
## # A tibble: 5 x 4
##     mes `2005` `2006` `2007`
##   <chr>  <dbl>  <dbl>  <dbl>
## 1 1_ene    8.6    8.5    9.0
## 2 2_feb    9.1    8.5   10.7
## 3 3_mar    8.7    9.1   20.0
## 4 4_abr    8.4    8.6   21.0
## 5 5_may    8.5    7.9   16.2
```


<br>

* `gather()`: junta columnas en renglones. 

También se le conoce 
como *melt* o derretir la base.
Recibe múltiples columnas y las junta en pares de nombres y 
valores, convierte los datos anchos en largos.  

<img src="figures/reshape-gather.png" style="display: block; margin: auto;" />

`tidyr::gather(data, key = name_variablelabel, value = name_valuelabel, select_columns)`


```r
df.ejem.long <- df.ejem %>% 
  gather(key = year, value = tasa, `2005`:`2007`)
# vemos las primeras líneas de nuestros datos alargados 
df.ejem.long %>% head
```

```
## # A tibble: 6 x 3
##     mes  year  tasa
##   <chr> <chr> <dbl>
## 1 1_ene  2005   8.6
## 2 2_feb  2005   9.1
## 3 3_mar  2005   8.7
## 4 4_abr  2005   8.4
## 5 5_may  2005   8.5
## 6 1_ene  2006   8.5
```


<br> 

* `spread()`: separa renglones en columnas. 

Recibe dos columnas
y las separa, haciendo los datos más anchos.

<img src="figures/reshape-spread.png" style="display: block; margin: auto;" />

`tidyr::spread(data, key = name_variablelabel, value = name_valuelabel)`



```r
df.ejem.spread <- df.ejem.long %>% 
  tidyr::spread(mes, tasa)
df.ejem.spread %>% head
```

```
## # A tibble: 3 x 6
##    year `1_ene` `2_feb` `3_mar` `4_abr` `5_may`
##   <chr>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
## 1  2005     8.6     9.1     8.7     8.4     8.5
## 2  2006     8.5     8.5     9.1     8.6     7.9
## 3  2007     9.0    10.7    20.0    21.0    16.2
```

<br> 

* `unite()`: une varias columnas en una sola. 

<img src="figures/reshape-unite.png" style="display: block; margin: auto;" />


`tidyr::unite(data, col = name_variabletoadd,  c(columns to unite), sep)`



```r
df.ejem.unite <- df.ejem.long %>% 
  unite(col = month_year, c(mes, year), sep = "_")
df.ejem.unite %>% head
```

```
## # A tibble: 6 x 2
##   month_year  tasa
##        <chr> <dbl>
## 1 1_ene_2005   8.6
## 2 2_feb_2005   9.1
## 3 3_mar_2005   8.7
## 4 4_abr_2005   8.4
## 5 5_may_2005   8.5
## 6 1_ene_2006   8.5
```

<br> 

* `separate()`: separa una columna en varias columnas.

<img src="figures/reshape-separate.png" style="display: block; margin: auto;" />


`tidyr::separate(data, col = name_variabletoseparate, into = c(vector with names using ""), sep)`


```r
df.ejem.separate <- df.ejem.unite %>% 
  separate(col = month_year, c('mes.num', 'mes', 'year'), sep = "_")
df.ejem.separate %>% head
```

```
## # A tibble: 6 x 4
##   mes.num   mes  year  tasa
##     <chr> <chr> <chr> <dbl>
## 1       1   ene  2005   8.6
## 2       2   feb  2005   9.1
## 3       3   mar  2005   8.7
## 4       4   abr  2005   8.4
## 5       5   may  2005   8.5
## 6       1   ene  2006   8.5
```



Otras funciones útiles:

* `arrange()`: ordena un dataframe de acuerdo a variables específicas.
* `rename()`: permite renombrar variables.
* `select()`: selecciona variables.






---

## *Split-apply-combine*

<img src="figures/lib-dplyr.png" width="12%" style="display: block; margin: auto;" />

Muchos problemas de análisis de datos involucran la aplicación de la estrategia
**_split-apply-combine_** ([Hadley Whickam, 2011](http://www.jstatsoft.org/v40/i01/paper)). 
Esto se traduce en realizar filtros, cálculos y agregación de datos.



\BeginKnitrBlock{nota}<div class="nota">**_Split-apply-combine_**
  
1. **Separa** la base de datos original.  
2. **Aplica** funciones a cada subconjunto.  
3. **Combina** los resultados en una nueva base de datos.

Consiste en romper un problema en pedazos (de acuerdo a una variable de interés),
operar sobre cada subconjunto de manera independiente
(calcular la media de cada grupo) y después unir los pedazos nuevamente. </div>\EndKnitrBlock{nota}



<img src="figures/divide-aplica-combina.png" style="display: block; margin: auto;" />


Cuando pensamos como implementar la estrategia divide-aplica-combina es 
natural pensar en iteraciones
para recorrer cada grupo de interés y aplicar las funciones. 


\BeginKnitrBlock{comentario}<div class="comentario">Para esto usaremos la librería `dplyr` que 
contiene funciones que facilitan la implementación de la 
estrategia.</div>\EndKnitrBlock{comentario}



En este taller se estudiarán las siguientes funciones
de la librería `dplyr`:
  
* **filter**: obtiene un subconjunto de las filas de acuerdo a una condición.
* **select**: selecciona columnas de acuerdo al nombre.
* **arrange**: re ordena las filas.
* **mutate**: agrega nuevas variables.
* **summarise**: reduce variables a valores (crear nuevas bases de datos).

Para mostrar las funciones se usará el siguiente 
dataframe.
  

```r
df_ej <- data.frame(genero = c("mujer", "hombre", "mujer", "mujer", "hombre"), 
                    estatura = c(1.65, 1.80, 1.70, 1.60, 1.67))
df_ej
```

```
##   genero estatura
## 1  mujer     1.65
## 2 hombre     1.80
## 3  mujer     1.70
## 4  mujer     1.60
## 5 hombre     1.67
```

#### Filtrar {-}

Filtrar una base de datos dependiendo de una condición 
requiere la función `filter()` que
tiene los siguientes argumentos
`dplyr::filter(data, condition)`. 


```r
df_ej %>% filter(genero == "mujer")
```

```
##   genero estatura
## 1  mujer     1.65
## 2  mujer     1.70
## 3  mujer     1.60
```


#### Seleccionar {-}

Elegir columnas de un conjunto de datos
se puede hacer con la función `select()` que
tiene los siguientes argumentos
`dplyr::select(data, seq_variables)`. 


```r
df_ej %>% select(genero)
```

```
##   genero
## 1  mujer
## 2 hombre
## 3  mujer
## 4  mujer
## 5 hombre
```

También, existen funciones que se usan 
exclusivamente en `select()`:

- `starts_with(x, ignore.case = TRUE)`: los nombres empiezan con _x_.
- `ends_with(x, ignore.case = TRUE)`: los nombres terminan con _x_.
- `contains(x, ignore.case = TRUE)`: selecciona las variable que contengan _x_.
- `matches(x, ignore.case = TRUE)`: selecciona las variable que igualen la expresión regular _x_.
- `num_range("x", 1:5, width = 2)`: selecciona las variables (numéricamente) de x01 a x05.
- `one_of("x", "y", "z")`: selecciona las variables que estén en un vector de caracteres.
- `everything()`: selecciona todas las variables.

Por ejemplo:

```r
df_ej %>% select(starts_with("g"))
```

```
##   genero
## 1  mujer
## 2 hombre
## 3  mujer
## 4  mujer
## 5 hombre
```




#### Arreglar {-}

Arreglar u ordenar de acuerdo al valor de una o más variables
es posible con la función `arrange()` que tiene los siguientes argumentos
`dplyr::arrange(data, variables_por_las_que_ordenar)`. 
La función `desc()` permite que se ordene de forma descendiente. 
  

```r
df_ej %>% arrange(desc(estatura))
```

```
##   genero estatura
## 1 hombre     1.80
## 2  mujer     1.70
## 3 hombre     1.67
## 4  mujer     1.65
## 5  mujer     1.60
```


#### Mutar {-}

Mutar consiste en crear nuevas variables 
con la función `mutate()` que tiene los siguientes
argumentos `dplyr::mutate(data, nuevas_variables = operaciones)`:


```r
df_ej %>% mutate(estatura_cm = estatura * 100) 
```

```
##   genero estatura estatura_cm
## 1  mujer     1.65         165
## 2 hombre     1.80         180
## 3  mujer     1.70         170
## 4  mujer     1.60         160
## 5 hombre     1.67         167
```


#### Resumir {-}

Los resúmenes permiten crear nuevas bases de datos
que son agregaciones de los datos originales. 

La función `summarise()`
permite realizar este resumen 
`dplyr::summarise(data, nuevas_variables = operaciones)`:


```r
df_ej %>% dplyr::summarise(promedio = mean(estatura))
```

```
##   promedio
## 1    1.684
```


También es posible hacer resúmenes agrupando por 
variables determinadas de la base de datos. Pero, 
primero es necesario crear una base agrupada con 
la función `group_by()` con argumentos
`dplyr::group_by(data, add = variables_por_agrupar)`:
  

```r
df_ej %>% 
  group_by(genero)
```

```
## # A tibble: 5 x 2
## # Groups:   genero [2]
##   genero estatura
##   <fctr>    <dbl>
## 1  mujer     1.65
## 2 hombre     1.80
## 3  mujer     1.70
## 4  mujer     1.60
## 5 hombre     1.67
```

Después se opera sobre cada grupo, 
creando un resumen a nivel grupo y uniendo los 
subconjuntos en una base nueva:


```r
df_ej %>% 
  group_by(genero) %>% 
  dplyr::summarise(promedio = mean(estatura))
```

```
## # A tibble: 2 x 2
##   genero promedio
##   <fctr>    <dbl>
## 1 hombre    1.735
## 2  mujer    1.650
```



<br>

---

## Referencias


- **R for Data Science**. Capítulo 3 Data visualisation. 
G. Growlemund and H. Wickham. 1st Edition. O'Reilly J. 2016.
http://r4ds.had.co.nz/data-visualisation.html

- **Tidy Data**. H. Wickham. 
Journal of Statistical Software. August 2014, Volume 59, Issue 10.
<https://www.jstatsoft.org/article/view/v059i10>

- Data Wrangling with **tidyr** and **dplyr** - Cheat Sheet. Septiembre 2016.
<https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf>

- Cheatsheet for **dplyr* Join Functions. Septiembre 2016.
<http://stat545.com/bit001_dplyr-cheatsheet.html>

- **Data Transformation Cheat Sheet**. Rstudio Resources. Enero 2017.
https://www.rstudio.com/resources/cheatsheets/
