

[Spas-MacBook-Pro:Learn SQL/SQL population projects/sql-population-queries-part-ii-starting] sgetov% sqlite3 db.sqlite
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE countries (
      id INTEGER NOT NULL,
      name TEXT NOT NULL,
      continent TEXT NOT NULL,
      PRIMARY KEY(id)
    );
CREATE TABLE population_years (
      id INTEGER NOT NULL,
      population NUMBER,
      year NUMBER,
      country_id INTEGER NOT NULL,
      PRIMARY KEY(id),
      FOREIGN KEY(country_id) REFERENCES countries(id)
    );
sqlite> sqlite> SELECT COUNT(*) FROM couuntries WHERE continent = 'Africa';
56
sqlite> SELECT * FROM countries Wuntries WHERE continent = 'Africa';
115|Algeria|Africa
116|Angola|Africa
117|Benin|Africa
118|Botswana|Africa
119|Burkina Faso|Africa
120|Burundi|Africa
121|Cameroon|Africa
122|Cape Verde|Africa
123|Central African Republic|Africa
124|Chad|Africa
125|Comoros|Africa
126|Congo (Brazzaville)|Africa
127|Congo (Kinshasa)|Africa
128|Cote dIvoire (IvoryCoast)|Africa
129|Djibouti|Africa
130|Egypt|Africa
131|Equatorial Guinea|Africa
132|Eritrea|Africa
133|Ethiopia|Africa
134|Gabon|Africa
135|Gambia, The|Africa
136|Ghana|Africa
137|Guinea|Africa
138|Guinea-Bissau|Africa
139|Kenya|Africa
140|Lesotho|Africa
141|Liberia|Africa
142|Libya|Africa
143|Madagascar|Africa
144|Malawi|Africa
145|Mali|Africa
146|Mauritania|Africa
147|Mauritius|Africa
148|Morocco|Africa
149|Mozambique|Africa
150|Namibia|Africa
151|Niger|Africa
152|Nigeria|Africa
153|Reunion|Africa
154|Rwanda|Africa
155|Saint Helena|Africa
156|Sao Tome and Principe|Africa
157|Senegal|Africa
158|Seychelles|Africa
159|Sierra Leone|Africa
160|Somalia|Africa
161|South Africa|Africa
162|Sudan|Africa
163|Swaziland|Africa
164|Tanzania|Africa
165|Togo|Africa
166|Tunisia|Africa
167|Uganda|Africa
168|Western Sahara|Africa
169|Zambia|Africa
170|Zimbabwe|Africa

sqlite> SELECT SUM(population_years.population)
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE countries.continent = 'Oceania' AND population_years.year = 2005;
32.66417

sqlite> SELECT AVG(population_years.population)
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE countries.continent = 'South America' AND population_years.year = 2003;
25.8906514285714



sqlite> SELECT countries.name, population_years.population
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE year = 2007
   ...> ORDER BY population_years.population ASC
   ...> LIMIT 3;
Former Serbia and Montenegro|
Niue|0.00216
Falkland Islands (Islas Malvinas)|0.00297

sqlite> SELECT MIN(population), name
   ...> FROM population_years
   ...> INNER JOIN countries
   ...> ON countries.id = population_years.country_id
   ...> WHERE year = 2007;
0.00216|Niue



sqlite> SELECT AVG(population_years.population)
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE countries.name = 'Poland';
38.5606790909091
sqlite> SELECT population_years.population
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE countries.name = 'Poland';
38.65416
38.64364
38.62598
38.60285
38.58044
38.55798
38.53687
38.51824
38.5007
38.48292
38.46369


sqlite> SELECT *
   ...> FROM countries
   ...> WHERE name LIKE '%The%';
10|Bahamas, The|North America
35|Netherlands Antilles|North America
74|Netherlands|Europe
135|Gambia, The|Africa


sqlite> SELECT SUM(population_years.population), countries.continent
   ...> FROM countries
   ...> JOIN population_years
   ...> ON countries.id = population_years.country_id
   ...> WHERE population_years.year = 2010
   ...> GROUP BY countries.continent;
1015.47846|Africa
4133.09148|Asia
723.06044|Europe
539.79456|North America
34.95696|Oceania
396.58235|South America
