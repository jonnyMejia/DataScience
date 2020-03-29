# Operaciones aritmeticas
import numpy as np

x=np.array([-2,-1,0,1,2])
print(abs(x))

print(np.absolute(x))
print(np.abs(x))

x=np.array([3-4j,4-3j,2+0j,0+1j])
print(np.abs(x))

# funciones trigonométricas
theta = np.linspace(0,np.pi,3)

print("theta      = ",theta)
print("seno(theta) = ",np.sin(theta))
print("coseno(theta) = ",np.cos(theta))
print("tan(theta) = ",np.tan(theta))

x=[-1,0,1]
print("x         = ",x)
print("arcsin(x) = ",np.arcsin(x))
print("arccos(x) = ",np.arccos(x))
print("arctan(x) = ",np.arctan(x))

