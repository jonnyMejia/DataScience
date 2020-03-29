# Importando Librerias
import pandas as pd
import numpy as np

# Creando una semilla para seguir obteniendo randoms
rng = np.random.RandomState(42)

# Creando una serie (lim_inf,lim_sup,tamaño)
ser = pd.Series(rng.randint(0, 10, 4))

# Creando un dataframe 
df = pd.DataFrame(rng.randint(0, 10, (3, 4)),
                  columns=['A', 'B', 'C', 'D'])

# OPERACIONES 
# cada valor de ser sera exponente de e ^ 
np.exp(ser)
# Cada valor del atframe multiplicara por pi y dividira entre 4
np.sin(df * np.pi / 4)

# CREANDO SERIES PARA OPERAR
# Area sin New York 
area = pd.Series({'Alaska': 1723337, 'Texas': 695662,
                  'California': 423967}, name='area')
# Population sin Alaska
population = pd.Series({'California': 38332521, 'Texas': 26448193,
                        'New York': 19651127}, name='population')
# Dividira los que tienen indices iguales, por eso es que Alaska y New York salen NaN
population / area
"""
Alaska              NaN
California    90.413926
New York            NaN
Texas         38.018740
"""

# OUTPUT: ['Alaska', 'California', 'New York', 'Texas']
area.index | population.index
# A no tiene indice 3
A = pd.Series([2, 4, 6], index=[0, 1, 2])
# B no tiene indice 0
B = pd.Series([1, 3, 5], index=[1, 2, 3])
"""
output:
0    NaN
1    5.0
2    9.0
3    NaN
"""
A + B

# Sumar los valores de A + B, si una de las listas no tiene un valor en cierto indice, rellenar con 0 para sumar
A.add(B, fill_value=0)

# Crea un dataframe con columnas A Y B
A = pd.DataFrame(rng.randint(0, 20, (2, 2)),
                 columns=list('AB'))

B = pd.DataFrame(rng.randint(0, 10, (3, 3)),
                 columns=list('BAC'))

"""
      A     B   C
0   2.0  20.0 NaN
1  19.0  19.0 NaN
2   NaN   NaN NaN
"""
# El dataframe A solo tiene columnas A y B ademas solo dos registros(index= 0,1)
# El dataframe B tiene 3 columnas A, B Y C ademas tiene tres registros(index 0,1,2)
# Por lo tanto columna c tendra puros NaN y el indice 3 tendra puros NaN
A + B

# Stack apila todo el datframe en una sola columna con fines operativos
fill = A.stackck().mean()
A.add(B, fill_value=fill)


# Creando un array
A = rng.randint(10, size=(3, 4))
"""
A=[
[4, 8, 6, 1],
 [3, 8, 1, 9],
 [8, 9, 4, 1]]
"""
"""
A[0]=[4, 8, 6, 1]
"""
# Restar a todas las filas la primera fila
A - A[0]

# Crea un dataframe con 4 columnas
df = pd.DataFrame(A, columns=list('QRST'))

# Restar todas las filas con la primera fila del dataframe
df - df.iloc[0]

# Restar a todas las columnas la columna 'R'
df.subtract(df["R"], axis=0)

# Mostrar el primer registro y las columnas de dos en dos
halfrow = df.iloc[0, ::2]

# Resra a df la columna halfrow, mostrara NaN en R y t porque halfrow no tiene indices R Y T
"""
     Q   R    S   T
0  0.0 NaN  0.0 NaN
1 -5.0 NaN  0.0 NaN
2  3.0 NaN  1.0 NaN
"""
df - halfrow



