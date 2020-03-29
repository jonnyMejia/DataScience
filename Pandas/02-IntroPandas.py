#!/usr/bin/env python
# coding: utf-8

import numpy as np
import pandas as pd

##### SERIES ####

# Creando Una serie, es un Vector de datos
data = pd.Series([0.25, 0.5, 0.75, 1.0])
# Mostrara los datos con los indices
print(data)

# Obtener los valores
data.values

# Obtener los indices
data.index

# Mostrando el dato indice 1 al 2 sin contar el 3
data[1:3]

# Tambien se puede cambiar el valor de los indices 
data = pd.Series([0.25, 0.5, 0.75, 1.0],
                 index=['a', 'b', 'c', 'd'])
# Funciona igual que un diccionario
data['b']

# Creando un diccionario de 5 elementos
population_dict = {'California': 38332521,
                   'Texas': 26448193,
                   'New York': 19651127,
                   'Florida': 19552860,
                   'Illinois': 12882135}
# Toma como indices los nombres de ciudades
population = pd.Series(population_dict)

# Funiona como un diccionario con nombres como indices
population['California']

# Igualmente se puede mostrar muchos valores entre estos, tambien mostrara Illinois
population['California':'Illinois']

# Tendra 5 registros con valor 5 pero indices 100, 200, 300
pd.Series(5, index=[100, 200, 300])

# Tendra solo dos registros, EL INDICE MANDA, con las claves de 3 y 2
pd.Series({2:'a', 1:'b', 3:'c'}, index=[3, 2])

##### DATAFRAMES #####

# Creando Diccionarios de las mismas ciudades
area_dict = {'California': 423967, 'Texas': 695662, 'New York': 141297,
             'Florida': 170312, 'Illinois': 149995}
population_dict = {'California': 38332521,
                   'Texas': 26448193,
                   'New York': 19651127,
                   'Florida': 19552860,
                   'Illinois': 12882135}
# Crear Series de cada atributo, Area y population 
area = pd.Series(area_dict)
population = pd.Series(population_dict)

# Creando DataFrame donde el header sera Population y Area, pero los indices 
# no serian numericos sino los nombres de las ciudades
states = pd.DataFrame({'population': population,
                       'area': area})
# ['California', 'Texas', 'New York', 'Florida', 'Illinois']
[x for x in states.index]

# ['population', 'area']
[x for x in states.columns]

# A parte de imprimir por el indice, tambien se imprime por el nombre de column
states['area']

# Esto es un dataframe de una sola columna de nombre population
population_frame= pd.DataFrame(population, columns=['population'])

# Lista  de diccionarios
data = [{'a': i, 'b': 2 * i}
        for i in range(3)]
# Es un dataframe con columnas a y b
pd.DataFrame(data)

# Lista de diccionaarios con columnas a, b y c justamente como todas las claves
# Pero en cada elemento hay diccionarios que no contienen una clave 
# en el primero solo sales clave a, b pero no la c, entonces saldra como NaN
pd.DataFrame([{'a': 1, 'b': 2}, {'b': 3, 'c': 4}])
"""
# OUTPUT: 
     a  b    c
0  1.0  2  NaN
1  NaN  3  4.0
"""

# Dataframe y Numpy 
# Creando un data frame con valores random, con columnas foo y bar e indices a, b y c
pd.DataFrame(np.random.rand(3, 2),
             columns=['foo', 'bar'],
             index=['a', 'b', 'c'])
"""
# OUTPUT: 
        foo       bar
a  0.366323  0.496422
b  0.991961  0.705566
c  0.221496  0.825595
"""

# Crea un Arreglo de ceros, con 3 registros, con tres columnas de nombre a(int64),b(float64),c(float64)
A = np.zeros(3, dtype=[('A', 'i8'), ('B', 'f8'),('c', 'f8')])
# Creando el Dataframe
pd.DataFrame(A)
"""
# OUTPUT:
   A    B    c
0  0  0.0  0.0
1  0  0.0  0.0
2  0  0.0  0.0
"""

#### Indices ####
# Solo se crea el indice sin ningun valor
ind = pd.Index([2, 3, 5, 7, 11])
# Mostrar los indices de dos en 2
ind[::2]
# output : 5 (5,) 1 int64
print(ind.size, ind.shape, ind.ndim, ind.dtype)

# Crear indices como si fuesen arreglos
indA = pd.Index([1, 3, 5, 7, 9])
indB = pd.Index([2, 3, 5, 7, 11])

# Ver indices repetidos
indA & indB  # intersection

# Unir todos los indices
indA | indB  # union

# Ver los indices diferentes 
indA ^ indB  # symmetric difference
