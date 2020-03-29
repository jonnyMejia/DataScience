# Ordenaciones y otras funciones
import numpy as np

name=['Alice', 'Bob', 'Cathy', 'Doug']
age=[25,45,37,19]
weight =[55.0,85.5,68.0,61.5]

x =np.zeros(4,dtype=int)

data=np.zeros(4,dtype={'names':('name', 'age', 'weight'),
               'formats':('U10', 'i4', 'f8')})
print(data.dtype)

data['name']=name
data['age']=age
data['weight']=weight
print(data)

# Get all names
print(data['name'])

# Get first row of data
print(data[0])

# Get the name from the last row
print(data[-1]['name'])

# Get names where age is under 30
print(data[data['age']<30]['name'])

# Creando estructuras de datos
print(np.dtype({'names':('name', 'age', 'weight'), 'formats':('U10', 'i4', 'f8')}))

print(np.dtype({'names':('name', 'age', 'weight'), 'formats':((np.str_,10), int,np.float32)}))


