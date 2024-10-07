# RELACION 2 ----

install.packages("formattable")
install.packages("webshot")
webshot::install_phantomjs()
install.packages("devtools")  
install.packages("kableExtra")
# Si hay problemas con kableExtra instalarlo con el siguiente comando
# devtools::install_github("kupietz/kableExtra")
install.packages("factoextra")
install.packages("diagram")
install.packages("qgraph")
devtools::install_github("calote/ahp")

source("teoriadecision_funciones_multicriterio.R")
source("teoriadecision_funciones_multicriterio_diagram.R")
source("teoriadecision_funciones_multicriterio_utiles.R")


## PROBLEMA 1 ----
### Apartado a) ----
tabla_1a = multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                                  1,1,1,
                                                  0,0,1), numalternativas = 3)
tabla_1a
solucion_1a = multicriterio.constfuncutilidad.maximales(tabla_1a)
solucion_1a
sort(solucion_1a, decreasing = T) # la alternativa 2 es la mejor 


### Apartado b) ----
tabla_1b = multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                                   1,1,1,
                                                   1,0,1), numalternativas = 3)
tabla_1b
solucion_1b = multicriterio.constfuncutilidad.maximales(tabla_1b)
solucion_1b
sort(solucion_1b,T) # la alternativa 2 es la mejor


### Apartado c) ----
tabla_1c = multicriterio.crea.matrizvaloraciones(c(1,1,1,
                                                   1,1,1,
                                                   1,1,1), numalternativas = 3)
tabla_1c
solucion_1c = multicriterio.constfuncutilidad.maximales(tabla_1c)
solucion_1c
sort(solucion_1c,T) 


### Apartado d) ----
tabla_1d = multicriterio.crea.matrizvaloraciones(c(1,1,1,0,1,
                                                   0,1,0,0,1,
                                                   1,0,1,0,1,
                                                   1,1,1,1,0,
                                                   0,0,0,0,1), numalternativas = 5)
tabla_1d
solucion_1d = multicriterio.constfuncutilidad.maximales(tabla_1d)
solucion_1d
sort(solucion_1d,T) # la alternativa 4 es la mejor
# para quitar el empate
solucion_1d.1 = multicriterio.constfuncutilidad.estructuraborrosa(tabla_1d)
solucion_1d.1
sort(solucion_1d.1,T)




## PROBLEMA 2 ----
### Apartado a) ----
tabla2a = multicriterio.crea.matrizvaloraciones(c(0,0.4,0.7,
                                                  0.2,0,0.5,
                                                  0.3,0.6,0), numalternativas = 3)
tabla2a
solucion2a = multicriterio.constfuncutilidad.estructuraborrosa(tabla2a)
solucion2a # la mejro es la alternativa 1

### Apartado b) ----




## PROBLEMA 3 ----
tabla3 = multicriterio.crea.matrizdecision(c(100,15,7,40,50,
                                             200,25,7,60,200,
                                             100,20,4,25,25,
                                             200,30,20,70,350,
                                             250,25,15,100,500), numalternativas = 5, numcriterios = 5)
tabla3

### Apartado 1) ----
solucion3.1 = multicriterio.homogeneizacion.nadir(tabla3)
solucion3.1

### Apartado 2) ----
solucion3.2 = multicriterio.homogeneizacion.promethee(tabla3, v.delta.min = c(30,3,4,20,100),
                                                      v.delta.max = c(120,12,10,60,400))
solucion3.2  # según el criterio 2, la mejor alternativa es la 4








