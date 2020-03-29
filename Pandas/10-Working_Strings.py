







import numpy as np
x = np.array([2, 3, 5, 7, 11, 13])
x * 2





data = ['peter', 'Paul', 'MARY', 'gUIDO']
[s.capitalize() for s in data]





data = ['peter', 'Paul', None, 'MARY', 'gUIDO']
[s.capitalize() for s in data]





import pandas as pd
names = pd.Series(data)
names





names.str.capitalize()






monte = pd.Series(['Graham Chapman', 'John Cleese', 'Terry Gilliam',
                   'Eric Idle', 'Terry Jones', 'Michael Palin'])





monte.str.lower()





monte.str.len()





monte.str.startswith('T')





monte.str.split()







monte.str.extract('([A-Za-z]+)', expand=False)





monte.str.findall(r'^[^AEIOU].*[^aeiou]$')







monte.str[0:3]





monte.str.split().str.get(-1)





full_monte = pd.DataFrame({'name': monte,
                           'info': ['B|C|D', 'B|D', 'A|C',
                                    'B|D', 'B|C', 'B|C|D']})
full_monte





full_monte['info'].str.get_dummies('|')











try:
    recipes = pd.read_json('recipeitems-latest.json')
except ValueError as e:
    print("ValueError:", e)





with open('recipeitems-latest.json') as f:
    line = f.readline()
pd.read_json(line).shape





with open('recipeitems-latest.json', 'r') as f:
    data = (line.strip() for line in f)
    data_json = "[{0}]".format(','.join(data))
recipes = pd.read_json(data_json)




recipes.shape





recipes.iloc[0]





recipes.ingredients.str.len().describe()





recipes.name[np.argmax(recipes.ingredients.str.len())]





recipes.description.str.contains('[Bb]reakfast').sum()





recipes.ingredients.str.contains('[Cc]innamon').sum()





recipes.ingredients.str.contains('[Cc]inamon').sum()






spice_list = ['salt', 'pepper', 'oregano', 'sage', 'parsley',
              'rosemary', 'tarragon', 'thyme', 'paprika', 'cumin']





import re
spice_df = pd.DataFrame(dict((spice, recipes.ingredients.str.contains(spice, re.IGNORECASE))
                             for spice in spice_list))
spice_df.head()





selection = spice_df.query('parsley & paprika & tarragon')
len(selection)





recipes.name[selection.index]




