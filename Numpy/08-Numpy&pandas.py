# Lecturas con Pandas y Analisis con Numpy
import numpy as np
import pandas as pd
data=pd.read_csv('data/estaturas.csv')
heights=np.array(data['height(cm)'])
print(heights)

print("Mean height:       ",heights.mean())
print("Standard deviation:",heights.std())
print("Minimum height:    ",heights.min())
print("Maximum height:    ",heights.max())

print("25th percentile:   ",np.percentile(heights,25))
print("Median:            ",np.median(heights))
print("75th percentile:   ",np.percentile(heights,75))


