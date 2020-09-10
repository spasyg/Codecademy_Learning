from matplotlib import pyplot as plt
import numpy as np
import pandas as pd


# Plot a bar chart of numbers of viewers for different games
games = ["LoL", "Dota 2", "CS:GO", "DayZ", "HOS", "Isaac", "Shows", "Hearth", "WoT", "Agar.io"]
viewers =  [1070, 472, 302, 239, 210, 171, 170, 90, 86, 71]

plt.bar(range(len(games)), viewers, color='mediumvioletred')
plt.title('Number of viewers for popular games')
plt.legend(["Twitch Games"])
plt.xlabel('Game')
plt.ylabel('Number of Viewers')
ax = plt.subplot()
ax.set_xticks([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
ax.set_xticklabels(games, rotation=45)
plt.show()
plt.clf()

# Plot a pie chart of League of Legends Viewers' Whereabouts

labels = ["US", "DE", "CA", "N/A", "GB", "TR", "BR", "DK", "PL", "BE", "NL", "Others"]
countries = [447, 66, 64, 49, 45, 28, 25, 20, 19, 17, 17, 279]
colors = ['lightskyblue', 'gold', 'lightcoral', 'gainsboro', 'royalblue', 'lightpink', 'darkseagreen', 'sienna', 'khaki', 'gold', 'violet', 'yellowgreen']
explode = (0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

plt.pie(countries, explode=explode,colors=colors, shadow=True, startangle=345, autopct='%1.0f%%', pctdistance=1.2)
plt.axis('equal')
plt.title('Locations of League of Legends Viewers')
plt.legend(labels, loc="right")
plt.show()
plt.clf()

# Plot a line graph to show time series of viewers across a 24 hour period

hour = range(24)
viewers_hour = [30, 17, 34, 29, 19, 14, 3, 2, 4, 9, 5, 48, 62, 58, 40, 51, 69, 55, 76, 81, 102, 120, 71, 63]
y_upper = [i*1.15 for i in viewers_hour]
y_lower = [i*0.75 for i in viewers_hour]

plt.plot(hour, viewers_hour)
plt.title('Twitch Viewers in Each Hour')
plt.xlabel('Hour of the Day')
plt.ylabel('Number of Viewers')
plt.legend(["Twitch Viewers"], loc='lower right')
ax = plt.subplot()
ax.set_xticks(hour)
plt.fill_between(hour, y_lower, y_upper, alpha=0.2)
plt.show()
