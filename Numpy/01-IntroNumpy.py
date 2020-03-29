# Importando Numpy
import numpy as np

# Imprimir la version del numpy
print("Version numpy:",np.__version__)

# Creando un numpy array de tipo int a partir de una list
a = [1, 2, 3, 4]

# Si no se especifica el tipo, numpy lo maneja
b = np.array(a) # int16, int32, int64
# b =  [1 2 3 4] , es de tipo  <class 'numpy.ndarray'> y sus elementos son int32
print("b = ",b,", es de tipo ",type(b),"y sus elementos son", b.dtype)

# Cambiando el tipo del numpy array a int64
c = np.array(a, dtype = 'int64')
# c =  [1 2 3 4] , es de tipo  <class 'numpy.ndarray'> y sus elementos son int64
print("c = ",c,", es de tipo ",type(c),"y sus elementos son", c.dtype)

# Cambiando el tipo del numpy array a float64
d = np.array(a, dtype = 'float64') #float64 es prederteminado cuando no se especifica dtype
# d =  [1. 2. 3. 4.] , es de tipo  <class 'numpy.ndarray'> y sus elementos son float64
print("d = ",d,", es de tipo ",type(d),"y sus elementos son", d.dtype)

# Secuencia Generada
# Generar ranges de los elementos de la lista [2,4,6] 
# Range(2,5) -> [2,3,4]
e = [range(i, i + 3) for i in [2, 4, 6]]

# Lista e =  [range(2, 5), range(4, 7), range(6, 9)]
print("Lista e = ",e)

# Creando numpy array
f = np.array(e)
"""
[[2 3 4]
 [4 5 6]
 [6 7 8]]
"""
print(f)

