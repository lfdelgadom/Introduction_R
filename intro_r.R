# --------------------------------------------------------------------------------------------------
# ------------------------------------------- Introduccion a la programacion con R ------------------
# --------------------------------------------------------------------------------------------------

# ------ -----------------------------------------------SESION 1 -----------------------------------

# Guardar el trabajo ctrl+s
# Ejecutar la linea de codigo ctrl+enter

# Borrar todo el espacio de trabajo

rm(list = ls()) # funcion para limpiar todo el enviroment ctrl + enter

# Creacion del directorio de trabajo (crear nuevo proyecto)



##Verificacion del directorio de trabajo

getwd()


# -------------------------------------------------------------------------------------------------- 
# ----------------------------------------------- Estructura ---------------------------------------                                                                                              #
# --------------------------------------------------------------------------------------------------

##Ayuda en R
help()

##Ayuda sobre una funcionn (exige que sepamos el nombre de la funcion)

help(sd) #Ayuda sobre la funcion de desviacion estandar
?mean # ayuda sobre la funcion promedio
?round() # ayuda sobre funcion redondeo


##Buscar ayuda sobre un concepto estadistico
help.search("regression")
??regression



## Creacion de objetos

x <- c(1,2,3,4,5) # vector de tipo numero
x
class(x)

x1 <- c("1", "2", "3", "4", "5") # vector de tipo caracter
x1
class(x1)

# La funcion semilla
set.seed(12)
y <- x + rnorm(5, mean = 0, sd = 1)
y


z <- x + y
z


w <- seq(from = 1, to = 100, by = 3)#secuencia que comienza en 1, con 100 datos y sea de dos en dos###
w

##Guardar el workspace
save.image("Ejemplo_AreaTrabajo.RData")

##Mirar objeto que se encuentran en el workspace
ls()

##Borrar un objeto del workspace
rm(x)

##Borrar mas de un objeto del workspace
rm(y,x1)

##Borrar todos los objetos del workspace
rm(list=ls())

##Recuperar el ?rea de trabajo
load("Ejemplo_AreaTrabajo.RData")

##Para ver el contenido de la carpeta
dir()


##Instalacion de paquetes

#Para ver que paquetes estan instalados
installed.packages()

#Para instalar un paquete, por ejemplo el paquete "ade4"
install.packages("ade4")

#Para cargar un paquete, por ejemplo el paquete "ade4"
library(ade4)
require(ade4)



#############################################################################################################
##3)Importar y exportar datos                                                                               #
#############################################################################################################

library(tibble)

##Importar datos 
datos1 <- read.csv("Datos_1.csv", dec=".", header = T, sep = ",")
class(datos1)

datos1 = as_tibble(datos1)
datos1

#############################################################################################################
##4)Tipos de datos en R                                                                                     #
#############################################################################################################

##Identificar la clase del objeto
class(datos1)
class(x)
x

is.double(x)
is.numeric(datos1)
is.data.frame(datos1)

#Cambiar la clase de un objeto
as.data.frame(x)
as.character(x)


#Operaciones con la clase "numeric"

#Suma
2+2

#Resta
3-4

#Multiplicacio
4*6

#Exponenciacion
2^3

#Comparacion
3==3
4>=2
5>1
7<=10
1!=2

#Operaciones con la clase "character"

#Crear un objeto de la clase "character"
ec <- c("Luisfernando", "Juan", "camilo", "viudo")
ec

#Concatenar cadenas
c1 <- "hola"
c2 <- "como"
c3 <- "esta"

paste(c1,c2,c3) #por defecto usa el separador por espacios
paste(c1,c2,c3, sep="") #sin separador
paste(c1,c2,c3, sep="_") #cambiando el separador a ","

#Extracci?n de subcadenas
ejemplo <- "EstadisticaDescriptiva"
ejemplo
substr(ejemplo, start = 12, stop = 22)

#Operaciones clase factor
x <- c("A", "B", "A", "C", "A", "C")
class(x)

#Convertir a la clase factor
fx = factor(x)
fx
class(fx)

#Ver niveles de un factor
levels(fx)

#Recuento de las frecuencias absolutas
table(fx)


#############################################################################################################
##5)Estructura de datos                                                                                    #
#############################################################################################################

#Vectores
b<-c(10,12,13,14) #crear un vector
class(b)

x<-c(1,2,3,"2","3") #deben ser de la misma clase
x
class(x)

w<-c(TRUE,TRUE,FALSE)
w
class(w)

#asceder a los elementos de un vector
x<-c(1,2,56,78,5,47,7,8)
x
x[3] #elemento que ocupa la tercera posicion

x[-4] #eliminar elemento que ocupa la posicion 4

x[c(7,8)] #extraer algunos elementos del vector

x[5:8] #extraer los elementos de la posicion 5 a 8

x[x>3]


#Matrices
m <- c(4,7,8,9,10,12,1,9,11)
dim(m)<-c(3,3)
m

m2 <- matrix(c(4,7,8,9,10,12,1,9,11), ncol=3, nrow=3)
m2

m3 <- matrix(c(4,7,8,9,10,12,1,9,11), ncol=3, nrow=3, byrow=T)
m3

#Extraer elementos de una matriz
m[1,2]

#Extraer la primera fila
m[1,]

#Extra la segunda columna
m[,2]

m1<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3)
m1

m2<-m1*15
m2

#Suma de matrices
m1+m2

#Resta de matrices
m1-m2
m2-m1

#Producto de matrices
m1%*%m2

#Transoposici?n de una matriz
t(m1)
t(m2)

#Determinante de una matriz
det(m3)

#dataframes
v1 <- c(1,2,3,4,5)
v2 <- c("A","B","A","A","C")
dto <- data.frame(v1,"v2"=as.factor(v2))
dto

#dimension del dataframe
dim(dto)

#Etiquetar el dataframe
rownames(dto) <- c("Primero", "Segundo", "Tercero", "Cuarto", "Quinto")
colnames(dto) <- c("Variable1", "Variable2")
dto

#Extraer la segunda fila
dto[-2, ] # [fila,columna]

#Extraer la segunda columna
dto[ ,2]

#Referirnos a una columna por el nombre
dto$Variable1


#########################################################################################################################
#                                                         SESION 2                                                      #
#########################################################################################################################


#Tratamiento preliminar de los datos

# renombrar datos de ejemplo (aji)

datos_ajies <- datos1

#Nombres de la variables de "datos_ajies"
names(datos_ajies)

# analisis rapido del contenido de "datos_ajies"
str(datos_ajies)

datos_ajies1 <- datos_ajies[ ,-1]#?se quito la primera columna de N? acceciones

# names(datos_ajies1) <- datos_ajies$n_acces 

#Recodificaci?n de valores de variables cambiar 999 ? 9 por NA
datos_ajies1$diametro_de_fruto_promedio_mm[datos_ajies1$diametro_de_fruto_promedio_mm==999]<-NA
datos_ajies1$peso_100_semillas[datos_ajies1$peso_100_semillas==999]<-NA
datos_ajies1$n_flores_axila[datos_ajies1$n_flores_axila==999]<-NA
datos_ajies1$peso_10_frutos_gr[datos_ajies1$peso_10_frutos_gr==999]<-NA
datos_ajies1$altura_promedio_planta[datos_ajies1$altura_promedio_planta==999]<-NA
datos_ajies1$longitud_fruto_promedio_mm[datos_ajies1$longitud_fruto_promedio_mm==999]<-NA

datos_ajies1$color_de_corola[datos_ajies1$color_de_corola==9]<-NA
datos_ajies1$tipo_epidermis_fruto[datos_ajies1$tipo_epidermis_fruto==9]<-NA
datos_ajies1$forma_fruto[datos_ajies1$forma_fruto==9]<-NA
datos_ajies1$posicion_de_la_flor[datos_ajies1$posicion_de_la_flor==9]<-NA
datos_ajies1$forma_de_corola_flor[datos_ajies1$forma_de_corola_flor==9]<-NA

#Vericar si hay NA de forma general
sum(is.na(datos_ajies1))

#verificar si hay NA por variable
sum(is.na(datos_ajies1$diametro_de_fruto_promedio_mm))

#Identificar valores perdidos por filas
rowSums(is.na(datos_ajies1))

#Cuantos valores perdidos hay
sum(rowSums(is.na(datos_ajies1))) #41 observaciones tienen 38 valores perdidos


##Analisis descriptivo

##Variables cualitativas

#Frecuencias absolutas
table(datos_ajies1$color_de_corola)
table(datos_ajies1$posicion_de_la_flor)

#Analisis conjunto (frecuencias absolutas)
table(datos_ajies1$color_de_corola,datos_ajies1$posicion_de_la_flor)

#Analisis conjunto (frecuencias relativas)
prop.table(table(datos_ajies1$color_de_corola,datos_ajies1$posicion_de_la_flor))

#Analisis conjunto (frecuencias relativas) por fila
prop.table(table(datos_ajies1$color_de_corola,datos_ajies1$posicion_de_la_flor),1)

#Analisis conjunto (frecuencias relativas) por columnas
prop.table(table(datos_ajies1$color_de_corola,datos_ajies1$posicion_de_la_flor),2)


#Creacion de variables para ejemplo
var1 <- c(rep(1,15), rep(2,7), rep(2,9))
var2 <- c(rep(1,6), rep(2,16), rep(1,9))



#Grafico de barras
barplot(table(var1))
barplot(table(var2))
barplot(table(datos_ajies1$color_de_corola))


#Variables cuantitativas
summary(datos_ajies1$diametro_de_fruto_promedio_mm)
summary(datos_ajies1$peso_100_semillas)

#Correlaci?n entre dos variables
cor(datos_ajies1$diametro_de_fruto_promedio_mm, datos_ajies1$peso_100_semillas, use = "complete.obs")
cor(datos_ajies1$diametro_de_fruto_promedio_mm, datos_ajies1$peso_10_frutos_gr, use = "complete.obs")

#Histograma de frecuencias
hist(datos_ajies1$diametro_de_fruto_promedio_mm)

#Boxplot
boxplot(datos_ajies1$diametro_de_fruto_promedio_mm)

#Boxplot por grupos
boxplot(datos_ajies1$color_de_corola,datos_ajies1$diametro_de_fruto_promedio_mm)

#Diagrama de dispersion
plot(datos_ajies1$diametro_de_fruto_promedio_mm, datos_ajies1$peso_10_frutos_gr)




#medidas de tendencia central#####
datos=c(5,6,6,7,7,7,8,8,9,10)
install.packages("modeest") #paquete necesario para calculo de la moda 
library(modeest)
mfv(datos) #(most frecuent value)
median(datos)
mean(datos)

#Ejercicio= hacer lo mismo con el siguiente conjunto de datos 
#5 6 6 7 7 7 8 8 9 20


