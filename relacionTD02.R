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



# RELACIÓN 2 

source("teoriadecision_funciones_multicriterio.R")
source("teoriadecision_funciones_multicriterio_diagram.R")
source("teoriadecision_funciones_multicriterio_utiles.R")


# PROBLEMA 1 ----

## Solo pregunta de relación binaria no borrosa de preferencia-indiferencia.

## Apartado a) ----
m1A <- multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                               1,1,1,
                                               0,0,1),numalternativas = 3,
                                             v.nombres.alternativas = NULL)
m1A

# Método de construcción de la función de utilidad “Maximal”
sol1A <- multicriterio.constfuncutilidad.maximales(m1A)
sol1A
# Nos esta diciendo que la mejor alternativa seria a2.
# Ordenadas de mejor a peor:
sort(sol1A, decreasing = T)

# Método de construccion de la funcion de utilidad “Borroso” (no lo pide)
sol1ABorroso <- multicriterio.constfuncutilidad.estructuraborrosa(m1A)
sol1ABorroso
sort(sol1ABorroso,decreasing = T)


## Apartado b) ----
m1B <- multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                               1,1,1,
                                               1,0,1),numalternativas = 3,
                                             v.nombres.alternativas = NULL)
m1B

# Método de construcción de la función de utilidad “Maximal”
sol1B <- multicriterio.constfuncutilidad.maximales(m1B)
sol1B
# Nos esta diciendo que la mejor alternativa seria a2.
# Ordenadas de mejor a peor:
sort(sol1B, decreasing = T)



## Apartado c) ----
m1C <- multicriterio.crea.matrizvaloraciones(c(1,1,1,
                                               1,1,1,
                                               1,1,1),numalternativas = 3,
                                             v.nombres.alternativas = NULL)
m1C
# Método de construcción de la función de utilidad “Maximal”
sol1C <- multicriterio.constfuncutilidad.maximales(m1C)
sol1C
# Nos esta diciendo que cualquier alternativa es valida.
# Ordenadas de mejor a peor:
sort(sol1C, decreasing = T)



## Apartado d) ----
m1D <- multicriterio.crea.matrizvaloraciones(c(1,1,1,0,1,
                                               0,1,0,0,1,
                                               1, 0, 1, 0, 1,
                                               1, 1, 1, 1, 0,
                                               0, 0, 0, 0, 1),numalternativas = 5,
                                             v.nombres.alternativas = NULL)
m1D
# Método de construcción de la función de utilidad “Maximal”
sol1D <- multicriterio.constfuncutilidad.maximales(m1D)
sol1D
# Ordenadas de mejor a peor:
sort(sol1D, decreasing = T)
# Nos esta diciendo que la mejor alternativa seria a4.



## Apartado e) ----
m1E <- multicriterio.crea.matrizvaloraciones(c(1,1,1,0,1,
                                               0,1,0,0,1,
                                               1, 1, 1, 0, 1,
                                               1, 1, 1, 1, 0,
                                               0, 0, 0, 0, 1),numalternativas = 5,
                                             v.nombres.alternativas = NULL)
m1E
# Método de construcción de la función de utilidad “Maximal”
sol1E <- multicriterio.constfuncutilidad.maximales(m1E)
sol1E
# La mejor alternativa seria a4.
# Ordenadas de mejor a peor:
sort(sol1E, decreasing = T)





# PROBLEMA 2 ----

## Apartado a) ----
m2A <- multicriterio.crea.matrizvaloraciones(c(0, 0.4, 0.7,
                                               0.2, 0, 0.5,
                                               0.3, 0.6, 0),
                                             numalternativas = 3,
                                             v.nombres.alternativas = NULL)
m2A
# Método de construccion de la funcion de utilidad “Borroso”
sol2A <- multicriterio.constfuncutilidad.estructuraborrosa(m2A)
sol2A
# Ordenamos de mayor a menor:
sort(sol2A,decreasing = T)
# La mejor alternativa seria a1



## Apartado b) ----
m2B <- multicriterio.crea.matrizvaloraciones(c(0, 0.2, 0.4,
                                               0.9, 0, 0.8,
                                               0.1, 0.3, 0),
                                             numalternativas = 3,
                                             v.nombres.alternativas = NULL)
m2B
# Método de construccion de la funcion de utilidad “Borroso”
sol2B <- multicriterio.constfuncutilidad.estructuraborrosa(m2B)
sol2B
# Ordenamos de mayor a menor:
sort(sol2B,decreasing = T)
# La mejor alternativa sera a2.





# PROBLEMA 3 ----

m3 <- multicriterio.crea.matrizdecision(c(100, 15, 7, 40, 50,
                                          200, 25, 7, 60, 200,
                                          100, 20, 4, 25, 25,
                                          200, 30, 20, 70, 350,
                                          250, 25, 15, 100, 500),
                                        numalternativas = 5,
                                        numcriterios = 5)
m3


## Apartado a)
sol3A <- multicriterio.homogeneizacion.nadir(m3)
sol3A
# Con columna 1 de “minimizar”, ponemos los valores en negativo
m3A <- multicriterio.crea.matrizdecision(c(-100, 15, 7, 40, 50,
                                           -200, 25, 7, 60, 200,
                                           -100, 20, 4, 25, 25,
                                           -200, 30, 20, 70, 350,
                                           -250, 25, 15, 100, 500),
                                         numalternativas = 5,
                                         numcriterios = 5)
m3A
sol3A_C1min <- multicriterio.homogeneizacion.nadir(m3A)
sol3A_C1min



## Apartado b)
sol3B <- multicriterio.homogeneizacion.promethee(m3,
                                                 v.delta.min = c(30,3,4,20,100),
                                                 v.delta.max = c(120,12,10,60,400))
sol3B





# PROBLEMA 4 ----

## Funciones en script de R ----

# Introducir los datos
# · Matriz de criterios:
n.criterios <- c("Rendimiento","Riesgo")
t0401 <- multicriterio.crea.matrizvaloraciones_mej(c(2),
                                                   numalternativas = 2,v.nombres.alternativas = n.criterios)
t0401
# · Matriz de Alternativas/Criterios
#    · Rendimiento:
n.alternativas <- c("A","B")
t0402a <- multicriterio.crea.matrizvaloraciones_mej(c(3),
                                                    numalternativas = 2,v.nombres.alternativas = n.alternativas)
t0402a
#    · Riesgo:
n.alternativas <- c("A","B")
t0402b <- multicriterio.crea.matrizvaloraciones_mej(c(1/2),
                                                    numalternativas = 2,v.nombres.alternativas = n.alternativas)
t0402b


### Apartado a) ----

# El diagrama con la estructura jerarquica:
xmatn01 <- t0401
xmatn02 <- array(NA,dim = c(2,2,2)) # num.altern, num.altern, num.crit
xmatn02[,,1] <- t0402a
xmatn02[,,2] <- t0402b
dimnames(xmatn02)[[1]] <- n.alternativas
dimnames(xmatn02)[[2]] <- n.alternativas
dimnames(xmatn02)[[3]] <- n.criterios
multicriterio.metodoahp.diagrama(xmatn01,xmatn02)


### Apartado b) ----

# Los pesos locales se pueden calcular de diferentes maneras
# Obtenemos los pesos locales:

#   · Pesos locales de la Matriz de Criterios
# Metodo mayor autovalor
pl0401 <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0401)
pl0401

# Metodo de la media geometrica
multicriterio.metodoAHP.variante2.mediageometrica(t0401)

# Metodo basico
multicriterio.metodoAHP.variante3.basico(t0401)

# · Pesos locales Rendimiento:
pl0402a <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0402a)
pl0402a

# · Pesos locales Risngo:
pl0402b <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0402b)
pl0402b


### Apartado c) ----

#  Obtener los pesos globales:
# Esta funcion solo esta preparada para problemas de dos niveles
# Primero ponemos el primer nivel y en rbind() ponemos los del segundo nivel
pg04 <- multicriterio.metodoAHP.pesosglobales_entabla(pl0401$valoraciones.ahp,
                                                      rbind(pl0402a$valoraciones.ahp,
                                                            pl0402b$valoraciones.ahp))
pg04

# CONCLUSIÓN: Elegimos la alternativa A en cuanto al rendimiento y en cuanto al riesgo es mejor la B que la A.
# Esto es porque el peso mayor en cuanto al rendimiento se encuentra en la alternativa A como se puede ver en
# el siguiente resultado.
which.max(pg04[,1])
# y en cuanto a al riesgo el peso mayor se encuentra en la alternativa B como se puede ver en el siguiente
# resultado.
which.max(pg04[,2])




## Con el paquete AHP ----

# ahp::RunGUI()
library(ahp)
dt04 <- Load("ej04.ahp")
dt04

### Apartado a) ----

# Diagrama de jerarquías:
# Esta funcion es para que no aparezcan los mensajes que aparecen
# en la funcion Visualize()
Visualize_mej = function(modeloahp) {
  sink("temp.txt")
  s1 = Visualize(modeloahp)
  sink()
  unlink("temp.txt")
  s1
}
Visualize_mej(dt04)


### Apartado b) ----
Calculate(dt04)
print(dt04,priority= function(x)x$parent$priority["Total", x$name])
Analyze(dt04,variable= "priority",sort ="orig" )
Analyze(dt04,variable= "priority")
# · Usamos priority para calcular los pesos locales
# · Usamos sort=“orig” para obtener los pesos en el orden de las alternativas 
#   puestas en nuestro modelo.


### Apartado c) ----
AnalyzeTable(dt04,sort = "orig")
AnalyzeTable(dt04)
aa = AnalyzeTable(dt04)
formattable::as.htmlwidget(aa)
aab = AnalyzeTable(dt04,variable = "priority")
formattable::as.htmlwidget(aab)





# PROBLEMA 5 ----

## Con funciones R ----

# Introducir los datos
# · Matriz de criterios:
n.criterios <- c("Liderazgo","HabPersonal","HabGestion")
t0501 <- multicriterio.crea.matrizvaloraciones_mej(c(1/3,1/4,2),
                                                   numalternativas = 3,
                                                   v.nombres.alternativas = n.criterios)
t0501
# · Matriz de Alternativas/Criterios
#   · Liderazgo:
n.alternativas <- c("A","B")
t0502a <- multicriterio.crea.matrizvaloraciones_mej(c(4),2,n.alternativas)
t0502a
#   · Habilidad personal:
t0502b <- multicriterio.crea.matrizvaloraciones_mej(c(3),2,n.alternativas)
t0502b
#   · Habilidad gestion:
t0502c <- multicriterio.crea.matrizvaloraciones_mej(c(2),2,n.alternativas)
t0502c


### Apartado a) ----
# Calculo de la jerarquia
num.alt <- 2
num.crit <- 3
Xmatriznivel2 <- array(NA,dim = c(num.alt,num.alt,num.crit))
Xmatriznivel2[,,1] <- t0502a
Xmatriznivel2[,,2] <- t0502b
Xmatriznivel2[,,3] <- t0502c
dimnames(Xmatriznivel2)[[1]] = n.alternativas
dimnames(Xmatriznivel2)[[2]] = n.alternativas
dimnames(Xmatriznivel2)[[3]] = n.criterios
multicriterio.metodoahp.diagrama(t0501,Xmatriznivel2)


### Apartado b) ----
# Calculo de pesos locales
# · Pesos locales de los criterios:
# Le pasamos la tabla a la que le queremos que nos haga los calculos
pl0501 <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0501)
pl0501
# · Pesos locales del Liderazgo:
pl0502a <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0502a)
pl0502a
# · Pesos locales de la Habilidad Personal:
pl0502b <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0502b)
pl0502b
# · Pesos locales de la Habilidad Gestion:
pl0502c <- multicriterio.metodoAHP.variante1.autovectormayorautovalor(t0502c)
pl0502c


### Apartado c) ----
# Calculo de pesos globales:
# Esta funcion solo esta preparada para problemas de dos niveles
# Primero ponemos el primer nivel y en rbind() ponemos los del segundo nivel
pg05 <- multicriterio.metodoAHP.pesosglobales_entabla(pl0501$valoraciones.ahp,
                                                      rbind(pl0502a$valoraciones.ahp,
                                                            pl0502b$valoraciones.ahp,
                                                            pl0502c$valoraciones.ahp))
pg05
# CONCLUSIÓN: Elegimos la alternativa A en cuanto al liderazgo, habilidad personal y habilidad gestion.
# Esto es porque los mayores pesos en cuanto a ellos se encuentran en la alternativa A
# el siguiente resultado.
which.max(pg05[,1])
which.max(pg05[,2])
which.max(pg05[,3])



## Con la libreria AHP ----

# Cargamos la libreria y leemos el fichero AHP
# ahp::RunGUI()
library(ahp)
ahp_ej05 <- Load("ej05.ahp")
ahp_ej05

### Apartado a) ----
# Visualizar la jerarquía 
Visualize_mej(ahp_ej05)


### Apartado b) ----
# Calcular las prioridades
Calculate(ahp_ej05)
print(ahp_ej05,priority= function(x)x$parent$priority["Total", x$name])
# Analizar
Analyze(ahp_ej05,variable= "priority",sort= "orig")


### Apartado c) ----
Analyze(ahp_ej05,sort="orig")
# Analizar con Tabla Mejorada
aa =AnalyzeTable(ahp_ej05)
formattable::as.htmlwidget(aa)
aab = AnalyzeTable(ahp_ej05,variable ="priority")
formattable::as.htmlwidget(aab)





# PROBLEMA 6 ----

## Resolución con diagrama de las funciones R de clase ---- ####################

# Después de introducir los datos, llamamos a la función que obtiene los 
# resultados y los representa en un diagrama en forma de árbol (solamente
# funciona para problemas de dos niveles):

# Matriz de criterios:
n.criterios <-c("Costo","Confiabilidad","PlazoEntrega")
Xmat.criterios= multicriterio.crea.matrizvaloraciones(
  c(1,7,9,1/7,1,3,1/9,1/3,1),3,n.criterios)
Xmat.criterios

# Matriz de Alternativas/Criterios
# · Costo:
n.alternativas <- c("Alt. A","Alt. B","Alt. C")
Xmat.costo = multicriterio.crea.matrizvaloraciones(c(1,1/3,6,3,1,8,1/6,1/8,1),3,
                                                   n.alternativas)
Xmat.costo
# · confiabilidad:
Xmat.confiabilidad = multicriterio.crea.matrizvaloraciones(
  c(1,6,2,1/6,1,1/3,1/2,3,1),3,n.alternativas)
Xmat.confiabilidad
# · Plazo de entrega:
Xmat.plazoentrega = multicriterio.crea.matrizvaloraciones(
  c(1,8,1,1/8,1,1/8,1,8,1), 3,n.alternativas)
Xmat.plazoentrega


### Apartado a) ----
# Realizamos la representación gráfica de la jerarquia:
num.alt=3
num.cri=3
Xmatriznivel2 = array(NA,dim=c(num.alt,num.alt,num.cri))
Xmatriznivel2[,,1] = Xmat.costo
Xmatriznivel2[,,2] = Xmat.confiabilidad
Xmatriznivel2[,,3] = Xmat.plazoentrega
dimnames(Xmatriznivel2)[[1]] = n.alternativas
dimnames(Xmatriznivel2)[[2]] = n.alternativas
dimnames(Xmatriznivel2)[[3]] = n.criterios
multicriterio.metodoahp.diagrama(Xmat.criterios,Xmatriznivel2)


### Apartado b) ----
# Calculamos los pesos locales:
# · Pesos locales de los criterios:
pesos.criterios = multicriterio.metodoAHP.variante3.basico(Xmat.criterios)
pesos.criterios


### Apartado c) ----
# · Pesos locales de los costos:
pesos.costo= multicriterio.metodoAHP.variante3.basico(Xmat.costo)
pesos.costo
# · Pesos locales de confiabilidad:
pesos.confiabilidad = multicriterio.metodoAHP.variante3.basico(Xmat.confiabilidad)
pesos.confiabilidad
# · Pesos locales de plazo entrega:
pesos.plazoentrega = multicriterio.metodoAHP.variante3.basico(Xmat.plazoentrega)
pesos.plazoentrega


### Apartado d) ----
# Consistencia de los criterios:
multicriterio.metodoAHP.coef.inconsistencia(Xmat.criterios)
# · Consistencia de los costos:
multicriterio.metodoAHP.coef.inconsistencia(Xmat.costo)
# · Consistencia de los Plazo Entrega:
multicriterio.metodoAHP.coef.inconsistencia(Xmat.plazoentrega)
# · Cosistencia de la confiabilidad
multicriterio.metodoAHP.coef.inconsistencia(Xmat.confiabilidad)


### Apartado e) ----
# Calculo de los pesos globales:
tabla.pesosglobales.ahp =
  multicriterio.metodoAHP.pesosglobales_entabla(
    pesos.criterios$valoraciones.ahp,
    rbind(pesos.costo$valoraciones.ahp,
          pesos.confiabilidad$valoraciones.ahp,
          pesos.plazoentrega$valoraciones.ahp))
knitr::kable(tabla.pesosglobales.ahp)
# En porcentajes:
knitr::kable(tabla.pesosglobales.ahp*100,digits = 2)
# Pesos de las ramas:
vPn1 = tabla.pesosglobales.ahp[4,1:3]
mPn2 = tabla.pesosglobales.ahp[1:3,1:3]
mPondRamasb = mPn2*matrix(vPn1,ncol=3,nrow=3,byrow = T)
mPondRamas = tabla.pesosglobales.ahp
mPondRamas[1:3,1:3] = mPondRamasb
mPondRamas[4,4] = 1
knitr::kable(mPondRamas)
# En porcentajes de las ramas:
knitr::kable(mPondRamas*100,digits = 2)



## Resolución con libreria AHP ---- ############################################

# Cargar el modelo
# ahp::RunGUI()
library(ahp)

ahp_ej06 = ahp::Load("ej06.ahp")
ahp_ej06


#### Apartado a) ----
Visualize(ahp_ej06)


#### Apartados b), c), d) ----
Calculate(ahp_ej06)
print(ahp_ej06, priority = function(x) x$parent$priority["Total", x$name])
# Analizar
Analyze(ahp_ej06,variable="priority")


#### Apartado e) ----
Analyze(ahp_ej06)
# Analizar con tabla mejorada
aa= AnalyzeTable(ahp_ej06)
formattable::as.htmlwidget(aa)
aab=AnalyzeTable(ahp_ej06,variable="priority")
formattable::as.htmlwidget(aab)





# PROBLEMA 7 ----

## Solución con Electre ----

# 1) Introducir datos y resolver:
#    · MAXIMIZAR: C1,C2,C3,C4 --> Positivos
#    · MINIMIZAR: C5 --> Negativos
p7 <- multicriterio.crea.matrizdecision(
  c(100, 15, 7 ,40 ,-50,
    200, 25, 7 ,60 ,-200,
    100, 20, 4 ,25 ,-25,
    200, 30, 20, 70,-350,
    250, 25, 15, 100,-500),
  numalternativas = 5,numcriterios = 5,
)
p7
W <- c(0.25, 0.25, 0.2, 0.2, 0.2) # pesos de cada criterio
alpha <- 0.7 # índice de concordancia mínimo
d <- c(60,Inf,4,Inf,Inf)
sol7 <- multicriterio.metodoELECTRE_I(p7,
                                      pesos.criterios = W,
                                      nivel.concordancia.minimo.alpha = alpha,
                                      no.se.compensan = d,
                                      que.alternativas = TRUE)
sol7
qgraph::qgraph(sol7$relacion.dominante)
sol7$nucleo_aprox

# 2) Se reducen alternativas y/o alpha
# Para intentar quedarse con una única alternativa óptima:
#  · reducir el grafo a las alternativas en el nucleo y/o
#  · reducir el valor de α ∈ [0.5,1]
sol7b <- multicriterio.metodoELECTRE_I(p7,
                                       pesos.criterios = c(0.25, 0.25, 0.2, 0.2, 0.2),
                                       nivel.concordancia.minimo.alpha = 0.7,
                                       no.se.compensan = c(60,Inf,4,Inf,Inf),
                                       que.alternativas = c(4,5))  # son las que salen del paso anterior sol7$nucleo_aprox
sol7b$relacion.dominante
sol7b$nucleo_aprox
qgraph::qgraph(sol7b$relacion.dominante)


# 3) Se reducen alternativas y/o alphas
# Ahora voy probando y disminuyendo el alfa poco a poco (en 0,05) hasta que me resulte 
# una sola alternativa. Es un intento de afinar la selección de la mejor alternativa.
sol7c <- multicriterio.metodoELECTRE_I(p7,
                                       pesos.criterios = c(0.25, 0.25, 0.2, 0.2, 0.2),
                                       nivel.concordancia.minimo.alpha = 0.55, #se uso: 0.65,0.6
                                       no.se.compensan = c(60,Inf,4,Inf,Inf),
                                       que.alternativas = c(4,5))
sol7c$relacion.dominante
qgraph::qgraph(sol7c$relacion.dominante)
sol7c$nucleo_aprox

# CONCLUSIÓN: Por tanto, la mejor alternativa es a4


## La representación de las tablas kableExtra ----
r7 <- func_ELECTRE_Completo(sol7)
r7$MIndices$KE #Esta linea seria suficiente para construir salida html
#ejercutar antes y luego comentar para salida PDF
#library(webshot2)
#r7$MIndices$KE%>% save_kable("test.png")
include_graphics("test.png") #para salida PDF y HTML
#r7$TConcordancia$KE%>% save_kable("test2.png")
include_graphics("test2.png")
#r7$TDiscordancia$KE%>% save_kable("test3.png")
include_graphics("test3.png")
#r7$TSuperacion$KE%>% save_kable("test4.png")
include_graphics("test4.png")
r7$Grafo
qgraph::qgraph(r7$Grafo)
r7$Nucleo


## Solución con Promethee ----
sol7promethee <- multicriterio.metodo.promethee_i(p7,
                                                  pesos.criterios = c(0.25, 0.25, 0.2,
                                                                      0.2, 0.2)/sum(c(0.25, 0.25, 0.2, 0.2, 0.2)),
                                                  tab.fpref = matrix(c(1,0,0,0,
                                                                       1,0,0,0,
                                                                       1,0,0,0,
                                                                       1,0,0,0,
                                                                       1,0,0,0),ncol = 4,byrow = T))
# es tipo 1, luego no tiene ni pi ni qi
sol7promethee
sol7promethee2 <- multicriterio.metodo.promethee_ii(p7,
                                                    pesos.criterios = c(0.25, 0.25, 0.2,
                                                                        0.2, 0.2)/sum(c(0.25, 0.25, 0.2, 0.2, 0.2)),
                                                    tab.fpref = matrix(c(1,0,0,0,
                                                                         1,0,0,0,
                                                                         1,0,0,0,
                                                                         1,0,0,0,
                                                                         1,0,0,0),ncol = 4,byrow = T))
# es tipo 1, luego no tiene ni pi ni qi
sol7promethee2
order(sol7promethee2$vflujos.netos,decreasing = T)
# CONCLUSIÓN: Por tanto vemos que la mejor alternativa es a4.


## Solución con Método Axiomático de Arrow y Raymond ----
sejarrow <- multicriterio.metodoaxiomatico.ArrowRaymond(p7)
sejarrow
# Alternativas ordenadas de mejor a peor:
sejarrow$alternativasordenadas
# CONCLUSIÓN: Por tanto vemos que la mejor alternativa es a4 seguida de las a5, a2, a3, a1.


## Análisis paramétrico o de sensibilidad aplicación Método axiomático de Arrow y Raymond ----
intalpha = seq(1,2,0.1)
sols = vector("list",length(intalpha))
for (i in 1:length(intalpha)) {
  p7_i = p7
  p7_i[1,] = p7_i[1,] * intalpha[i]
  sej7_i = multicriterio.metodoaxiomatico.ArrowRaymond(p7_i)
  sols[[i]] = sej7_i$alternativasordenadas
}
sols
# ¿Qué posiciones ha tenido “a1” para los distintos valores de α?
posiciones_a1 = rep(NA,length(intalpha))
for (i in 1:length(intalpha)) {
  #i = 1
  posiciones_a1[i] = which(sols[[i]]=="a1")
}
posiciones_a1
# Representar gráficamente estos cambios:
plot(intalpha,posiciones_a1,type= "l")
intalpha <- seq(1,0.5,by=-0.05)
intalpha
sols <- vector("list",length(intalpha))
for(i in 1: length(intalpha)) {
  p7i = p7
  p7i[4,] = p7i[4,] * intalpha[i]
  sol = multicriterio.metodoaxiomatico.ArrowRaymond(p7i)
  sols[[i]] = sol$alternativasordenadas
}
sols
# Ver las posiciones de la altrnativa “a4”:
posiciones_a4 <- rep(NA,length(intalpha))
for(i in 1:length(intalpha)) {
  posiciones_a4[i] = which(sols[[i]] == "a4")
}
posiciones_a4
plot(intalpha,posiciones_a4,type= "l",
     main = "Posiciones de la alternativa a4")





# PROBLEMA 8 ----

## Solución con método Promethee ----

# Debemos de tener cuidado al introducir los datos
# ya que cuando sea MAX el valor sera positivo
# pero cuando sea MIN el valor sera negativo
p8 <- multicriterio.crea.matrizdecision(c(-80,90,-6,-5.4,-8,5,
                                          -65,58,-2,-9.7,-1,1,
                                          -83,60,-4,-7.2,-4,7,
                                          -40,80,-10,-7.5,-7,10,
                                          -52,72,-6,-2,-3,8,
                                          -94,96,-7,-3.6,-5,6),
                                        numalternativas = 6,
                                        numcriterios = 6,
                                        v.nombresalt = paste0("A",1:6),
                                        v.nombrescri = paste0("f",1:6))
p8

# Son todos iguales porque el enunciado nos dice que los 6 criterios
# tienen la misma importancia
pesos.criterios <- rep(1/6,6)  # los pesos deben de sumar 1

# La tabla de preferencias la rellenamos de la siguiente manera
## NOTA  →  cuando en el enunciado no se especifica el valor de pi se asume 
##          que pi = 1, esto indica una preferencia mínima o nula.

#      num.funcion(tipo), qi, pi, si
tab.fpref <- matrix(c(2, 10,  1, 0,
                      3,  0, 30, 0,
                      5, 0.5, 5, 0,
                      4,  1,  6, 0,
                      1,  0,  1, 0,
                      6,  0,  1, 5),ncol = 4,byrow = T)
colnames(tab.fpref) <- c("num.pref","qi","pi","si")
tab.fpref


### Representación gráfica de las funciones de preferencias

# · Criterio usual
fpref.criterio_usual_di = function(di) {
  #di = vaj- vah;
  if(di <= 0) {
    res = 0;
  } else {
    res = 1;
  }
  return(res);
}
# · Cuasi-criterio
fpref.cuasi_criterio_di = function(di,qi) {
  #di = vaj- vah;
  if (di <= qi) {
    res = 0;
  } else {
    res = 1;
  }
  return(res)
}
# · Criterio de preferencia lineal
fpref.criterio_preflineal_di = function(di,pi) {
  #di = vaj- vah;
  if (di <= 0) {
    res = 0;
  } else if (di > pi){
    res = 1;
  } else {
    res = di/pi;
  }
  return(res);
}
# · Criterio de nivel
fpref.criterio_nivel_di= function(di,qi,pi) {
  #di = vaj- vah;
  if (di<=qi) {
    res = 0;
  } else if (di> pi){
    res = 1;
  } else {
    res= 0.5;
  }
  return(res);
}
# · Criterio de preferencia lineal y área de indiferencia
fpref.criterio_prelineal_indif_di =function(di,qi,pi) {
  # di = vaj- vah;
  if (di <= qi) {
    res = 0;
  } else if (di > pi){
    res = 1
  } else {
    res= (di-qi)/(pi-qi);
  }
  return(res);
}
# Criterio Gaussiano
fpref.criterio_gaussiano_di= function(di,qi,pi,si){
  #di = vaj- vah;
  if (di <= 0) {
    res= 0;
  } else {
    res= 1- exp((-di^2)/(2*si^2));
  }
  return(res);
}

# Criterio usual
x <-seq(-10,10,length.out=100)
y <-sapply(x,fpref.criterio_usual_di)
plot(x,y,type="l",col="blue",main= "CriterioUsual:F1")

# Cuasi-criterio
x <- seq(-10,10,length.out=100)
y <- sapply(x, function (xx) fpref.cuasi_criterio_di(xx,qi=2))
plot(x,y,type = "l",col="blue",main = "Criterio Cuasi Criterio: F2 (con qi=2)")

# Criterio preferencia lineal 
x <- seq(-10,10,length.out=100)
y <- sapply(x, function (xx) fpref.criterio_preflineal_di(xx,pi=2))
plot(x,y,type = "l",col="blue",main = "Criterio Pref. Lineal: F3 (con pi=2)")

# Criterio nivel
x <- seq(-10,10,length.out=100)
y <- sapply(x, function (xx) fpref.criterio_nivel_di(xx,qi=2,pi=4))
plot(x,y,type = "l",col="blue",main = "Criterio Nivel: F4 (con qi=2 y pi=4)")

# Criterio prefrencia lineal y área de indiferencia 
x <- seq(-10,10,length.out=100)
y <- sapply(x, function (xx) fpref.criterio_prelineal_indif_di(xx,qi=2,pi=4))
plot(x,y,type = "l",col="blue",
     main = "Criterio Pref. Lineal Indiferencia: F5 (con qi=2 y pi=4)")

# Criterio gaussiano
x <- seq(-10,10,length.out=100)
y <- sapply(x, function (xx) fpref.criterio_gaussiano_di(xx,qi=2,pi=4,
                                                         si=3))
plot(x,y,type = "l",col="blue",
     main = "Criterio Gaussiano: F6 (con qi=2, pi=4 y si = 3)")


# Método Promethee I
tab.Pthee.i <- multicriterio.metodo.promethee_i(p8, pesos.criterios, tab.fpref)
tab.Pthee.i
qgraph::qgraph(tab.Pthee.i$tablarelacionsupera)
# CONCLUSIÓN:  Podemos ver la A5 es la que domina a las demás.

# Método Promethee II
tab.Pthee.ii <- multicriterio.metodo.promethee_ii(p8,pesos.criterios,tab.fpref)
tab.Pthee.ii
qgraph::qgraph(tab.Pthee.ii$tablarelacionsupera)
# Ordenacion final alternativas del Método Promethee II
# La ordenación que establecen seria la siguiente:
order(tab.Pthee.ii$vflujos.netos,decreasing = T)
# CONCLUSIÓN: Por tanto vemos que la mejor alternativa es a5, seguida de a2,a4,a6,a3,a1.


#  Metodo Promethee I (medias)
tab.Pthee.i_med <- multicriterio.metodo.promethee_i_med(p8,pesos.criterios,
                                                        tab.fpref)
tab.Pthee.i_med
qgraph::qgraph(tab.Pthee.i_med$tablarelacionsupera)

# Método Promethee II (medias)
tab.Pthee.ii_med <- multicriterio.metodo.promethee_ii_med(p8,pesos.criterios,
                                                          tab.fpref)
tab.Pthee.ii_med
qgraph::qgraph(tab.Pthee.ii_med$tablarelacionsupera)
# Ordenacion final alternativas del Método Promethee II(medias)
# La ordenación que establecen seria la siguiente:
order(tab.Pthee.ii_med$vflujos.netos,decreasing = T)
# CONCLUSIÓN: Por tanto vemos que la mejor alternativa es a5, seguida de a2,a4,a6,a3,a1.


# Comparativa Promethee II: sin medias y con medias
# La ordenación que establecen sería la siguiente:
order(tab.Pthee.ii$vflujos.netos, decreasing = T)
order(tab.Pthee.ii_med$vflujos.netos, decreasing = T)
# Vemos que el orden de las alternativas de mejor a peor se mantiene igual




## Solución con método Electre ----
sol8Electre <- multicriterio.metodoELECTRE_I(p8,
                                             pesos.criterios = rep(1/6,6),
                                             nivel.concordancia.minimo.alpha = 0.7,
                                             no.se.compensan = rep(Inf,6),
                                             que.alternativas = TRUE)
sol8Electre$relacion.dominante
sol8Electre$nucleo_aprox
# Reduzco alternativas
sol8Electre_2 <- multicriterio.metodoELECTRE_I(p8,
                                               pesos.criterios = rep(1/6,6),
                                               nivel.concordancia.minimo.alpha = 0.7,
                                               no.se.compensan = rep(Inf,6),
                                               que.alternativas = c(2,4,5)) # son las alternativas resultantes de arriba sol8Electre$nucleo_aprox
sol8Electre_2$relacion.dominante
sol8Electre_2$nucleo_aprox
# Reduzco alfa
sol8Electre_3 <- multicriterio.metodoELECTRE_I(p8,
                                               pesos.criterios = rep(1/6,6),
                                               nivel.concordancia.minimo.alpha = 0.55,
                                               no.se.compensan = rep(Inf,6),
                                               que.alternativas = c(2,4,5))
sol8Electre_3$relacion.dominante
sol8Electre_3$nucleo_aprox
sol8Electre_2$nucleo_aprox
# Reduzco alternativas 
sol8Electre_4 <- multicriterio.metodoELECTRE_I(p8,
                                               pesos.criterios = rep(1/6,6),
                                               nivel.concordancia.minimo.alpha = 0.55,
                                               no.se.compensan = rep(Inf,6),
                                               que.alternativas = c(4,5))
sol8Electre_4$relacion.dominante
sol8Electre_4$nucleo_aprox
# Reduzco alfa 
sol8Electre_5 <- multicriterio.metodoELECTRE_I(p8,
                                               pesos.criterios = rep(1/6,6),
                                               nivel.concordancia.minimo.alpha = 0.505,
                                               no.se.compensan = rep(Inf,6),
                                               que.alternativas = c(4,5))
sol8Electre_5$relacion.dominante
sol8Electre_5$nucleo_aprox

# CONCLUSIÓN: por tanto las mejores alternativas serían a4 y a5, ya que no podemos 
# seguir reduciendo el valor de alfa.


