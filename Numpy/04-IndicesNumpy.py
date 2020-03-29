# Indices
import numpy as np
np.random.seed(0)  # semilla
'''
# Accesos
x1 = np.random.randint(10, size=6)  # una dim
print("x1 = ",x1)
print(x1[0])
print(x1[4])
print(x1[-1])
print(x1[-3])


x2 = np.random.randint(10, size=(3, 4))  # dos dimens
print("x2 = ",x2)
print(x2[0,0])
print(x2[2,0])
print(x2[2,-1])
print(x2[-1,-1])

# Modificaciones
x2[0, 0] = 15
print("x2 = ",x2)

x2[1, 1] = 2.7172
print("x2 = ",x2) # ??

x = np.arange(5, 15)
print(x)
# x[inicio:fin:paso]
print(x[:5])
print(x[5:])
print(x[4:7])
print(x[::2])
print(x[1::2])
print(x[::-1])
print(x[5::-2])

# Varias dims
print("x2 = ",x2)
print(x2[:2, :3])
print(x2[:3, ::2])
print(x2[::-1, ::-1])

print(x2[:, 0])
print(x2[0, :])
print(x2[0])

# sub matrices
print("x2 = ",x2)
x2_sub = x2[:2, :2]
print("x2_sub = ",x2_sub)
x2_sub[0, 0] = 77
print(x2_sub)

print("x2 = ",x2) # ups!!!

# copiando
x2_sub_copy = x2[:2, :2].copy()
print(x2_sub_copy)

x2_sub_copy[0, 0] = 999
print(x2_sub_copy)
print("x2 = ",x2) 

# redimensionar
m = np.arange(1, 10).reshape((3, 3))
print("m = ",m)

x = np.array([1, 2, 3])
print("x = ",x)
# vector fila de 3 cols con reshape
print(x.reshape((1, 3)))

# vector fila de 3 cols con newaxis
print(x[np.newaxis, :])

# vector col con reshape
print(x.reshape((3, 1)))

# vector col con newaxis
print(x[:, np.newaxis])
print()
print()
'''