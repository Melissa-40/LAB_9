# Hecho con gusto por Ruth Melissa Cobos Ruiz

# T1_03_ESPACIO PRODUCTO(2) - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################
install.packages("EconGeo")
library (EconGeo)
M = as.matrix(
  read.csv("E:/DOCTORADO/4to semestre/LABS/LAB_9/INPUT/rca_2014.csv", sep = ",", 
           header = T, 
           row.names = 1))
M
head (M[,1:10])
dim (M)

# co-ocurrencia entre personas/paises/estados

co_occurrence(M)

# co-ocurrencia entre productos t es transpuesta
c=co_occurrence(t(M))
c


# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

r=relatedness(c)
r

#opcional (sólo para trabajar con datos binarios)
r[r<1] = 0
r[r>1] = 1
r

library (igraph)
g1=graph_from_adjacency_matrix(r,mode = "undirected")
plot(g1)

#exportar resultados de co ocurrencias
write.csv(r,file="relatedness,csv")
write.csv(c,file="cocurrences,csv")

