import pandas as pd
import numpy as np

df = pd.read_csv("negocio clacla.csv", ';')

# print(df.head())
# cols = df.columns.tolist()
# for i, col in enumerate(cols):
#     print(i, col)
df['SECTOR'] = df['SECTOR'].astype(str)
df['SECTOR'] = df['SECTOR'].replace(['nan', 'None'], '')
print(df['SECTOR'])
df['SECTOR'] = df['SECTOR'].replace(['LOMAS DE SAN SEBASTIAN', 'LOMAS DE SAN SEBASTIÁN'], 'LOMAS SAN SEBASTIAN')
df['SECTOR'] = df['SECTOR'].replace(['LOMAS DE SAN ANDRÉS'], 'LOMAS DE SAN ANDRES')

sectores = list(df.SECTOR.unique())

sect_ord = [ str(sector) for sector in sectores]
sect_ord.sort()
for i in sect_ord:
    print(i)
