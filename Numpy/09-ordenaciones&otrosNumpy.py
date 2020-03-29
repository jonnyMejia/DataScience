# Ordenaciones y otras funciones
import numpy as np

def selection_sort(x):
  for i in range(len(x)):
    swap=i+np.argmin(x[i:])
    (x[i],x[swap])=(x[swap],x[i])
  return x

x=np.array([2,1,4,3,5])
print(selection_sort(x))

# Usando la ordenacion de numpy
x=np.array([2,1,4,3,5])
print(np.sort(x))

x=np.array([2,1,4,3,5])
i=np.argsort(x)
print(i) # los ìndices de los elementos ordenados

print(x[i]) # los elementos ordenados

# Ordenando filas o columnas
rand=np.random.RandomState(42)
X=rand.randint(0,10,(4,6))
print(X)

print(np.sort(X,axis=0)) # ordenar cada columna de X
print(np.sort(X,axis=1)) # ordenar cada fila de X



