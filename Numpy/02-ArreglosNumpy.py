# Arreglos
import numpy as np

# Array de ceros de 5 registros, una columna
print(np.zeros(5, dtype=int))

# Array de unos de maño 5 tipo float
print(np.ones(5, dtype=float))

# Array de unos de tamaño (4,6) 
print(np.ones((4, 6), dtype=float))

# Array de tamaño (4,6) con valor unico 3.141592654
print(np.full((4, 6), 3.141592654))

# Arange, imprime valores saltando de 3 en 3 desde el 5
# Una vez que pasa o es igual a el 23 ya no imprime 
# [ 5  8 11 14 17 20]
print(np.arange(5, 23, 3))

# Linspace imprime los valores entre el 0 y 1 una cantidad de 6 con distancia igual entre ellos
# OUTPUT : [0.  0.2 0.4 0.6 0.8 1. ]
print(np.linspace(0, 1, 6))

##### Randoms ##### 
# Imprime un unico numero random entre el 0 y 1
print(np.random.random())
# Imprime 3 valores randoms
print(np.random.random(3))
# Imprime una matriz de (3,3) con valores random
print(np.random.random((3, 3)))
# Imprime una matriz de tamaño (4,3) con valores entre el 0 y el 10 sin contar al 10
print(np.random.randint(0, 10, (4, 3))) # num alea entre 0 y 10
# Imprime una matriz Identidad(Diagonal igual a 1)
print(np.eye(4))
# Imprime una lista con datos a aleatorios cualquiera dependiendo de lo que tiene la memoria dinamica
print(np.empty((3,4,5)))

# Imprime valores con una media de 0 con desviacion estandar de 1 -> [-1,1] sin contar los extremos
# media, desviacion estandar, Tamaño
print(np.random.normal(0, 1, (3, 1)))
