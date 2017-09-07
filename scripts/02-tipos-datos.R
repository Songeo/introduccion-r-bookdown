
# Taller de Introducción a R
 


# ============== # 
# Tipos de Datos #
# ============== # 


## a. Vector ----


### Tipos de vectores ---
num_vec <- c(-1, 2.5, 3, 4, 5.1)
cha_vec <- c("Mon", "Tue", "Wed", "Thu", "Sat", "Sun")
boo_vec <- c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)

class(num_vec)
length(num_vec)



#### Ej: Ganancias - Ruleta y poker ----

# Mis ganancias de poker por día de la semana son:

poker_gan <- c(150, 178, -6, 166, -80, -119, -142)
print(poker_gan)

# Mis ganancias en ruleta son: lunes -48, 
# martes 151, miercoles 198, jueves -16, 
# viernes 134, sábado -153, domingo 126.
# Usando la función combine `c()` asigna
# las ganancias por día al vector `ruleta_gan`.

ruleta_gan <- c()
print(ruleta_gan)



### Nombres de vectores ---

dias <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(poker_gan) <- dias
print(poker_gan)



#### Ej: Días - Ruleta y poker ---- 

# Asigna los nombres del día de la 
# semana a cada elemento del vector de las 
# ganancias de ruleta. 

names(ruleta_gan) <- 
print(ruleta_gan)



### Selección de elementos en vectores ----

poker_gan[ c(1, 5) ]
poker_gan[ 1:3 ]
poker_gan[ seq(from = 7, to = 5) ]
poker_gan[ c("Mon", "Tue")]


#### Ej: Miercoles - Ruleta y poker. ----

# Extrae las ganancias de ambos juegos del día **miercoles** y 
# calcula la ganancia total de ese día. 

wed_gan <- poker_gan[ ] + ruleta_gan[ ]
print(wed_gan)



### ¿Qué pasa si sumamos los días de fin de semana? ----

poker_fin <- poker_gan[ dias[5:7] ] 
ruleta_fin <- ruleta_gan[ 5:7 ]
poker_fin + ruleta_fin



#### Ej: Diario - Ruleta y poker. ----

# Calcula las gananacias diarias y asignalas al objeto
# `diario_gan`. ¿Qué día se gana más y qué día se pierde más?

diario_gan <- 

# Usando el vector `diario_gan` y la función 
# `sum()` calcula las ganancias totales
# de la semana. 

sum(diario_gan)

# ¿Me conviene seguir jugando?




### Comparaciones ----

# Condición mayor o igual
poker_gan
poker_pos <- poker_gan >= 0
print(poker_pos)
poker_gan[poker_pos]

# Condición contenido en
ciudades <-  c("Aguascalientes", "Aguascalientes", 
               "Monterrey", "Monterrey", 
               "Guadalajara", 
               "Mexico", "Mexico")
ciudades_cond <- ciudades %in% c("Mexico", "Monterrey")
ciudades_cond

sum(ciudades_cond)

# which()
ciudades_pos <- which(ciudades_cond)
ciudades_pos
ciudades[ciudades_pos]



### Gráfica de vectores ----

plot(x = poker_gan)
plot(x = poker_gan, y = ruleta_gan)
hist(x = poker_gan)


### Vectores de distribuciones ----

norm_vec <- rnorm(n = 100, mean = 0, sd = 10)
hist(norm_vec)

unif_vec <- runif(n = 100, min = 10, max = 100)
hist(unif_vec)

#### Ej: Normal ----

# Usando la función `rnorm()` genera 1000 realizaciones
# de una distribución con media 10 y desviación 
# estándar 5.

norm1000_vec <- rnorm()

# Realiza un histograma del vector obtenido.

hist()



## b. Matriz ----

### Crear una matriz ----
matrix(data = 1:9, nrow = 3, ncol = 3, byrow = F)

sales_hp <- c(497066400, 426630300, 401608200, 399302200, 377314200, 
              359788300, 357233500, 328833900, 141823200, 189432500, 
              142414700, 135197600, 99635700, 92756000, 134119300,
              138752100)
sales_mat <- matrix(sales_hp, nrow = 8, byrow = F)
sales_mat

dim(sales_mat)
nrow(sales_mat)
ncol(sales_mat)


### Nombres de matrices ----

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


#### Ej: Tipo de ventas. ----

# Usando la función `colnames()` asigna 
# el nombre del tipo de ventas 
# a cada columna:
  
sales_hp <- c("total", "release_date")
colnames() <- 
print(sales_mat)


### Selección de elementos en una matriz ----

sales_mat[c(1, 4, 7), 1:2]
titles_first3 <- c("1. HP and the Sorcerer's Stone",
                   "2. HP and the Chamber of Secrets",
                   "3. HP and the Prisoner of Azkaban")
sales_mat[titles_first3, ]


### Operaciones en matrices ----
sales_mat_mill <- sales_mat/1e6
sales_mat_mill

theaters_vec <- c(3672, 4375, 3858, 3682, 4285, 4325, 3855, 4125)
theaters_vec

sales_mat_avg <- sales_mat/theaters_vec
sales_mat_avg


#### Ej: Total de visitas ----

# Calcula el número de visitas si 
# el costo del boleto promedio es de $8.89
# dólares.

visits_mat <- sales_mat
visits_mat


### Operaciones por dimensiones ----

colSums(sales_mat_mill)
rowSums(sales_mat_mill)


#### Ej: Ingresos promedio ----

# Usando la funcion `colMeans()` calcula 
# el ingreso promedio 
# total y en la fecha de lanzamiento.

avg_income <- colMeans()



### Nuevos valores ----
sales_mat_theat <- cbind(sales_mat_mill, theaters_vec)
sales_mat_theat

#### Ej: Más información ----

# Agrega un reglón a la matriz `sales_mat_theat`
# con el promedio de ventas totales, 
# ingresos en la fechas de lanzamientos y 
# salas de exhibición.

# Tip: Usa las funciones `colMeans()` y `rbind()`.

avg_row <- colMeans()
rbind(sales_mat_theat, )


## c. Factores ----


### Variable categórica nominal ----
sex_vec <- c("F", "M", "M", "F", "M")

sex_fct <- factor(sex_vec)
sex_fct

sex_lev_fct <- factor(sex_vec, levels = c("M", "F"))
sex_lev_fct


### Variable categórica ordinal ----

temp_vec <- c("High", "Low", "Medium", "Low", 
              "Low", "Medium", "High", "Low", 
              "Medium", "Low", "Low")
temp_fct <- factor(temp_vec, 
                   levels = c("Low", "Medium", "High"), 
                   ordered = T)
temp_fct

levels(temp_fct)

levels(temp_fct) <- c("L", "M", "H")
temp_fct


### Resúmen de factores ----

table(sex_fct)
summary(temp_fct)


#### Ej: Analistas ----

# Se tienen 5 analistas, cada uno con 
# las siguientes características de
# velocidad de trabajo.
# 
# Analista 1: rápido
# Analista 2: normal
# Analista 3: normal
# Analista 4: rápido
# Analista 5: lento

# 1. Crea un factor ordinal de analistas

analistas_vec <-  c()
analistas_fct <-  factor(, 
                         levels = , 
                         ordered = )


# 2. Comprueba si el analísta 2 es más rápido que el 
# analista 5. Tip: es una comparación `>`.

analistas_vec[] > analistas_vec[]



## d. Dataframe ----

### Crear un dataframe ----

muestra_df <- data.frame(secuencia = 1:5,
                         aleatorio = rnorm(5),
                         letras = c("a", "b", "c", "d", "e"))
muestra_df

sales_df <- data.frame(sales_mat)
sales_df


### Nombres de dimensiones ----

colnames(sales_df) <- c("total_grosses", "opening_grosses")
sales_df


### Seleccion de elementos ----

sales_df$total_grosses
sales_df$title <- factor(rownames(sales_df))
sales_df$title

sales_df

levels(sales_df$title)

rownames(sales_df) <- NULL
sales_df

#### Ej: Salas de cine ----

# Agrega una columna con el 
# número de cines en los que se exhibió la 
# película usando el vector que generamos antes `theaters_vec`.

sales_df$theaters <- 
sales_df


### Orden de posiciones ----

sales_df$total_grosses

total_order <- order(sales_df$total_grosses)
total_order

sales_df$total_grosses[total_order]

sales_order_df <- sales_df[ total_order , c(3, 1, 2)]
sales_order_df


#### Ej: Fechas de lanzamiento ----

# Agrega otra columna al df `sales_order_df` con las fechas de lanzamiento 
# del vector que se presenta a continuación. 

release_hp <- c("11/16/01", "7/15/11", "11/18/05", "11/15/02", "7/11/07", "7/15/09", "6/4/04", "11/19/10")
names(release_hp) <-  titles_hp
release_hp


# Existe un problema con este vector. Tiene el orden 
# de la matriz original. 
# 
# Usando la función `order()` arregla la posicion del 
# vector con el orden de los títulos y este vector arreglado 
# incluyelo, finalmente, al df. 


sales_order_df$release_date <- release_hp[]
sales_order_df



### Funciones útiles para data frames ----

head(sales_order_df)

tail(sales_order_df)

str(sales_order_df)

nrow(sales_order_df)

avg_total_gr <- mean(sales_order_df$total_grosses)
subset(sales_order_df, total_grosses > avg_total_gr)




## e. Listas ----

### Crear una lista ----

ejem_list <- list(
  vector = 1:10,
  matriz = matrix(1:9, nrow = 3),
  dataframe = mtcars[1:5,]
)
ejem_list


### Nombres de elementos ----

names(ejem_list) 
names(ejem_list) <-  c("vec", "mat", "df")
ejem_list

length(ejem_list)


#### Ej: Hidden Figures IMDB ----

# Usando los siguientes objetos crea una lista 
# de tres elementos con nombres: director, stars y reviews.

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

# La lista se llama `hidden_figures`:
  
hidden_figures <- list()
hidden_figures



### Selección de elementos en una lista ----

hidden_figures[1]
hidden_figures[[1]]
hidden_figures$director



### Nuevos valores a la lista ----

budget_hf <- 25000000

hidden_figures_budget <- c(hidden_figures, 
                           budget = budget_hf)
hidden_figures_budget

hidden_figures_budget$budget_millions <- budget_hf/1e6
hidden_figures_budget



#### Ej: Calificación promedio ----

# Extrae los scores de la película `hidden_figures` y 
# con la función `mean()` calcula el promedio. 
# 
# 1. 1. Primero deberás extraer el elemento que contiene los scores. 
# Es un dataframe.
# 2. Después deberas seleccionar la columna de *scores*.
# 3. Por último calcular el promedio y asignarlo a `avg_reviews_hf`.

reviews_df <- hidden_figures
reviews_vec <- 
  avg_reviews_hf <- mean(  )
avg_reviews_hf



### Funciones útiles para listas ----

unlist(hidden_figures)
str(hidden_figures)







