#Visualising Fifa World Cup data obtained from Kaggle

import codecademylib3_seaborn
from matplotlib import pyplot as plt
import pandas as pd
import seaborn as sns

df = pd.read_csv("WorldCupMatches.csv")
print(df.head())

df['Total Goals'] = df["Home Team Goals"] + df["Away Team Goals"]
print(df.head())

sns.set_style("darkgrid")
sns.set_context("poster", font_scale=0.7)
f, ax = plt.subplots()
plt.subplots(figsize=(12, 7))
ax = sns.barplot(data=df, x="Year", y="Total Goals")
ax.set_title("Mean Number of Goals Per Game for Each World Cup Year")
plt.show()

df_goals = pd.read_csv("goals.csv")
print(df_goals.head())

sns.set_context("notebook", font_scale=1.2)
f, ax2 = plt.subplots()
plt.subplots(figsize=(12, 7))
ax2 = sns.boxplot(data=df_goals, x="year", y="goals", palette="Spectral")
ax2.set_title("Mean and Dispersion for Number of Goals Per Game for Each World Cup Year")
plt.show()


# See separate file for outputs
