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
tabla_2 = crea.tablaX(c(0,1,0,
                       1,0,0,
                       1/2,1/2,0), 
                      numalternativas = 3, numestados = 3)
# dibuja.criterio.Hurwicz_Intervalos(tabla2, favorable = T)
# debug(dibuja.criterio.Hurwicz_Intervalos)
# undebug(dibuja.criterio.Hurwicz_Intervalos)
sol2 = criterio.Hurwicz(tabla_2, favorable = T)
sol2




## PROBLEMA 3 ----
tabla_3 = crea.tablaX(c(24,19,10,16,
                       22,22,23,20,
                       23,23,21,15,
                       25,24,18,14),
                     numalternativas = 4, numestados = 4)
rownames(tabla_3) = c("Deportivo","Berlina","Monovolumen","Todo-terreno")
tabla_3
sol3 = criterio.Todos(tabla_3, alfa = 0.5, T)
sol3
# CONCLUSIÓN: 
# Según el criterio Wald, Hurwicz, Savage, LaPlace y el Punto Ideal, la mejor 
# opción seria el Berlina.
#  Sin embargo, segun el criterio Optimista la mejor opción es el Todo-terreno. 
# Entonces, la mayoria de criterios eligen el Berlina, la opción que le recomendaria 
# a la empresa seria el Berlina.




## PROBLEMA 4 ----
# Un decisor
# Modelo de costos (desfavorable)
# Alternativas:
#   - d1 =“Seguro con Security”
#   - d2 =“Seguro con Curadita”
#   - d3 =“Seguro con Preventiva”
# Estados de la naturaleza:
#   - e1 = “da a luz antes de un año”
#   - e2 = “da a luz despues de un año”
# Tabla de valoraciones:
#   Alternativa d1:
    x11 = 30*12 + (600+3000)/2 
    x12 = 30*12
#  Alternativa d2:
    x21 = 60*12
    x22 = 60*12
#  Alternativa d3:
    x31 = 40*12 + 3000
    x32 = 40*12

tabla_4 = crea.tablaX(c(x11,x12,
                       x21,x22,
                       x31,x32),
                     numalternativas = 3, numestados = 2)
rownames(tabla_4) <- c("Security","Curadita","Preventiva")
colnames(tabla_4) <- c("Antes de un año", "Despues de un año")
tabla_4
sol4 = criterio.Todos(tabla_4,alfa = 0.6,favorable = F)
sol4                      
# CONCLUSIÓN:
# La mejor decisión seria utilizar la alternativa d2 que seria el seguro Curadita 
# ya que es la alternativa optima mayoritaria en los criterios.

# Añadimos el gráfico del método de Hurwicz:
dibuja.criterio.Hurwicz(tabla_4,favorable = F)




## PROBLEMA 5 ----
# Un decisor (dos personas que actuan como un único decisor)
# Modelo de costos(desfavorable)
# Alternativas:
#   - d1 = “Música Loca”
#   - d2 = “Baratito”
#   - d3 = “Restaurante de al lado”
# Estados de la naturaleza:
#   - e1 = “comer, copas y taxis”
#   - e2 = “comer y volver andando sin copas”
# Valoraciones (costos de los dos):
#  Estado e1:
  x11 = 60*2 +5 
  x21 = 30*2 + 6 + 10*2 + 30*2 + 10
  x31 = 40*2 + 25*2
#  Estado e2:
  x12 = 60*2
  x22 = 30*2
  x32 = 40*2

tabla_5 = crea.tablaX(c(125,120,
                       156,60,
                       130,80),
                     numalternativas = 3, numestados = 2)
rownames(tabla_5) <- c("La musica loca", "El Baratito","Restaurante de al lado")
colnames(tabla_5) <- c("comer, copas y taxis", "comer y volver andando sin copas")
tabla_5
sol5 = criterio.Todos(tabla5, 0.5,F)
sol5
# CONCLUSIÓN: 
# Podemos ver que la mejor alternativa seria d3 que consiste en ir al restaurante de al lado.

# Vamos a dibujar el criterio de Hurwicz:
dibuja.criterio.Hurwicz(tabla_5,favorable = F)




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
tabla_6 = crea.tablaX(c(m11,m12,
                       m21,m22,
                       m31,m32),3,2)
tabla_6
sol6 = criterio.Todos(tabla_6, alfa = 0.5, favorable = T)
sol6
# CONCLUSIÓN: 
# La decisiOn optima para Alberto seria d1, es decir, invertir 25% variable y 75% fijo
# y para Juan la mejor decision seria d3, es decir, invertir 75% variable y 25% fijo

# Vamos a dibujar ek criterio de Hurwicz:
dibuja.criterio.Hurwicz(tabla_6,favorable = T)




## PROBLEMA 7 ----
# Un decisor (dos personas que deciden de forma independiente)
# Modelo de beneficios (favorable). Van a usar los 900 euros
# Alternativas:
#   - d1 = "Invertir en negocio de un amigo"
#   - d2 = "Negocio propio de alquiler de bicicletas"
#   - d3 =“Montar un chiringuito”
# Estados de la naturaleza:
#   - e1 = "Tiempo bueno"
#   - e2 = "Tiempo malo"
# Matriz de decisión o valoraciones
a11 = 900 * 0.05
a21 = 900 * 0.60
a31 = 900
a12 = 900 * 0.05
a22 = -900 * 0.20
a32 = -900

tabla_7 = crea.tablaX(c(a11, a12,
                       a21, a22, 
                       a31, a32), 
                     numalternativas = 3, numestados = 2)
tabla_7
sol7 = criterio.Todos(tabla_7, alfa = 0.5, favorable = T)
sol7

### Aparado a) Criterio pesimista ----
sol7a = criterio.Wald(tabla_7)
sol7a
sol7a$AlternativaOptima
# CONCLUSIÓN:
# La mejor decision que deberia tomar María es d1 que consiste en invertir en el 
# negocio de un amigo.


### Aparado b) Criterio Savage ----
sol7b = criterio.Savage(tabla_7)
sol7b
sol7b$AlternativaOptima
# CONCLUSION: 
# La mejor decision que deberia tomar el amigo seria la opción d2 que seria un 
# negocio propio de bicicletas.




## PROBLEMA 8 ----
# Un decisor
# Modelo de beneficios(favorable). Beneficios = Ganancias- Costos
# Alternativas:
#   - d1 =“Contrato con editorial”
#   - d2 =“Publica el mismo”
# Estados de la naturaleza:
#   - e1 = “Si tiene exito”
#   - e2 = “No tiene exito”
# Valoraciones (se expresa en unidades de 1000 euros):
#  Estado e1:
    m11 = (20000 + 200000 * 1)/1000 
    m21 = (-90000 + 200000 * 2)/1000
#  Estado e2:
    m12 = (20000 + 10000 * 1)/1000 
    m22 = (-90000 + 10000 * 2)/1000 

tabla_8 = crea.tablaX(c(m11, m12,
                       m21, m22), 
                     numalternativas = 2, numestados = 2)
tabla_8
sol8 = criterio.Todos(tabla_8, alfa = 0.5, favorable = TRUE)
sol8
# CONCLUSIÓN: 
# La mejor decisión que podría tomar el autor seria aceptar la oferta de la editorial.
# La mejor opción es publicarla con la editorial d1
 

# estoy probando 

