







import numpy as np
import pandas as pd
import seaborn as sns
titanic = sns.load_dataset('titanic')




titanic.head(5)






titanic.groupby('sex')[['survived']].mean()





titanic.groupby(['sex', 'class'])['survived'].aggregate('mean').unstack()






titanic.pivot_table('survived', index='sex', columns='class')






age = pd.cut(titanic['age'], [0, 18, 80])
titanic.pivot_table('survived', ['sex', age], 'class')





fare = pd.qcut(titanic['fare'], 2)
titanic.pivot_table('survived', ['sex', age], [fare, 'class'])






titanic.pivot_table(index='sex', columns='class',
                    aggfunc={'survived':sum, 'fare':'mean'})






titanic.pivot_table('survived', index='sex', columns='class', margins=True)










births = pd.read_csv('data/births.csv')





births.head()





births['decade'] = 10 * (births['year'] // 10)
births.pivot_table('births', index='decade', columns='gender', aggfunc='sum')





get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib.pyplot as plt
births.pivot_table('births', index='year', columns='gender', aggfunc='sum').plot()
plt.ylabel('total births per year');






quartiles = np.percentile(births['births'], [25, 50, 75])
mu = quartiles[1]
sig = 0.74 * (quartiles[2] - quartiles[0])





births = births.query('(births > @mu - 5 * @sig) & (births < @mu + 5 * @sig)')





births['day'] = births['day'].astype(int)





births.index = pd.to_datetime(10000 * births.year +
                              100 * births.month +
                              births.day, format='%Y%m%d')

births['dayofweek'] = births.index.dayofweek





import matplotlib.pyplot as plt
import matplotlib as mpl

births.pivot_table('births', index='dayofweek',
                    columns='decade', aggfunc='mean').plot()
plt.gca().set_xticklabels(['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'])
plt.ylabel('mean births by day');





births_by_date = births.pivot_table('births', 
                                    [births.index.month, births.index.day])
births_by_date.head()





births_by_date.index = [pd.datetime(2012, month, day)
                        for (month, day) in births_by_date.index]
births_by_date.head()





fig, ax = plt.subplots(figsize=(12, 4))
births_by_date.plot(ax=ax);



