# Atributos
import numpy as np
np.random.seed(0)  # semilla

x1 = np.random.randint(10, size=6)  # una dim
print("x1 = ",x1)
print("x1 ndim: ", x1.ndim)
print("x1 size: ", x1.size)
print("x1 dtype:", x1.dtype)
print("x1 itemsize:", x1.itemsize, "bytes")
print("x1 nbytes:", x1.nbytes, "bytes")
'''
x2 = np.random.randint(10, size=(3, 4))  # dos dimens
print("x2 = ",x2)
print("x2 ndim: ", x2.ndim)
print("x2 shape:", x2.shape)
print("x2 size: ", x2.size)

x3 = np.random.randint(10, size=(3, 4, 5))  # tres dimens
'''
