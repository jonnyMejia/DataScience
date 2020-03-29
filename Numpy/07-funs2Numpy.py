# funciones para calculos grandes
import numpy as np

x=np.arange(5)
y=np.empty(5)
np.multiply(x,10,out=y)
print(y)

y=np.zeros(10)
np.power(2,x,out=y[::2])
print(y)

# Resumen
x=np.arange(1,6)
print(np.add.reduce(x))

print(np.multiply.reduce(x))

L=np.random.random(100)
print(sum(L))

print(np.sum(L))

big_array=np.random.rand(1000000)
print(sum(big_array)) 
print(np.sum(big_array))

print(min(big_array))
print(max(big_array))

print(big_array.min())
print(big_array.max())
print(big_array.sum())

M=np.random.random((3,4))
print(M)

print(M.sum())
print(M.min(axis=0))
