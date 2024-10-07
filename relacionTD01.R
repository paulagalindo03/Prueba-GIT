# RELACION 1 ----

source("teoriadecision_funciones_incertidumbre.R")

## PROBLEMA 1 ----

### Aparado a) ----
tb01 = crea.tablaX(c(5,4,6,
                     2,3,1,
                     -1,8,7,
                     5,2,0), numalternativas = 4, numestados = 3)

#### · Criterio pesimista (Wald) ----
p1_pes = criterio.Wald(tb01,T)
p1_pes
names(p1_pes$AlternativaOptima) # la mejor decisión es la alternativa 1
#### · Criterio optimista ----
p1_opt = criterio.Optimista(tb01,T)
p1_opt
names(p1_opt$AlternativaOptima) # la mejor decisión es la alternativa 3
#### · Criterio de Hurwicz ----
p1_hur = criterio.Hurwicz(tb01,T)
p1_hur
names(p1_hur$AlternativaOptima) # la mejor decisión es la alternativa 3
#### · Criterio de Savage ----
p1_sav = criterio.Savage(tb01,T)
p1_sav
names(p1_sav$AlternativaOptima) # la mejor decisión es la alternativa 1
#### · Criterio de Laplace ----
p1_lap = criterio.Laplace(tb01,T)
p1_lap
p1_lap$AlternativaOptima
p1_lap$ValorAlternativas
#### · Criterio del punto ideal ----
p1_pid = criterio.PuntoIdeal(tb01,T)
p1_pid
p1_pid$AlternativaOptima
p1_pid$ValorAlternativas

#### Resumen de todos los métodos ----
p1_todos = criterio.Todos(tb01,alfa=0.5,T)
p1_todos

dibuja.criterio.Hurwicz(tb01,T)
dibuja.criterio.Hurwicz_Intervalos(tb01,T)


### Aparado b) ----
tb02 = crea.tablaX(c(2,12,-3,
                     5,5,-1,
                     0,10,-2), numalternativas = 3, numestados = 3)
dibuja.criterio.Hurwicz(tb02, F) # se pone F porque es desfavorable




## PROBLEMA 2 ----
tabla2 = crea.tablaX(c(0,1,0,
                       1,0,0,
                       1/2,1/2,0), 3, 3)
dibuja.criterio.Hurwicz_Intervalos(tabla2, favorable = T)
debug(dibuja.criterio.Hurwicz_Intervalos)
undebug(dibuja.criterio.Hurwicz_Intervalos)




## PROBLEMA 3 ----
tabla3 = crea.tablaX(c(24,19,10,16,
                       22,22,23,20,
                       23,23,21,15,
                       25,24,18,14),4,4)
criterio.Todos(tabla3, alfa = 0.5, T)




## PROBLEMA 4 (sin terminar) ----
tabla4 = crea.tablaX(c(2160,360,
                       720,720
                       ))




## PROBLEMA 5 ----
tabla5 = crea.tablaX(c(125,120,
                       156,60,
                       130,80),3,2)
criterio.Todos(tabla5, 0.5,F)
# la mejor alternativa es la tercera: "Cerca de casa"




## PROBLEMA 6 ----
# Única decisión que tomará cada uno de los dos amigos con la misma tabla de decisión
# para cada uno de ellos.
# Modelo de beneficios --> favorable
# Estados de la naturaleza:
#  - e1 = "sube la bolsa" (ganan un 10% en variable y ganan un 4% en fija)
#  - e2 = "baje la bolsa" (pierden un 10% en variable y ganan un 4% en fija)
# Alternativas:
#  - d1 = "25% en variable y 75% en fija"
#  - d2 = "50% en variable y 50% en fija"
#  - d3 = "75% en variable y 25% en fija"
# Matriz de decisión o de valoraciones (beneficio conseguido):
#  - Estado e1:
m11 = 1000*0.25*0.10 + 1000*0.75*0.04
m21 = 1000*0.50*0.10 + 1000*0.50*0.04
m31 = 1000*0.75*0.10 + 1000*0.25*0.04
#  - Estado e2:
m12 = -1000*0.25*0.10 + 1000*0.75*0.04
m22 = -1000*0.50*0.10 + 1000*0.50*0.04
m32 = -1000*0.75*0.10 + 1000*0.25*0.04
# La solución sería:
tabla6 = crea.tablaX(c(m11,m12,
                       m21,m22,
                       m31,m32),3,2)
criterio.Todos(tabla6, alfa = 0.5, favorable = T)




## PROBLEMA 7 ----
# Matroz de decisión o valoriaciones
a11 = 900 * 0.05
a21 = 900 * 0.60
a31 = 900
a12 = 900 * 0.05
a22 = -900 * 0.20
a32 = -900

tabla7 = crea.tablaX(c(a11, a12,
                       a21, a22, 
                       a31, a32), 3, 2)
tabla7
criterio.Todos(tabla7, alfa = 0.5, favorable = T)




## PROBLEMA 8 ----
tabla8 = crea.tablaX(c(m11, m12,
                       m21, m22), 2, 2)
tabla8 = crea.tablaX(c(220, 30,
                       310, -70), 2, 2)
criterio.Todos(tabla8, alfa = 0.5, favorable = TRUE)
# La mejor opción es publicarla con la editorial d1
 