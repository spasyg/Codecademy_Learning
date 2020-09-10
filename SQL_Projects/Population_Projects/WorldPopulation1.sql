[Spas-MacBook-Pro:Code Academy Data Science/Learn SQL/SQL population projects] sgetov% sqlite3 db.sqlite
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE population_years (
      country STRING NOT NULL,
      population NUMBER,
      year NUMBER
    );
sqlite> SELECT DISTINCT year FROM population_years;
2000
2001
2002
2003
2004
2005
2006
2007
2008
2009
2010
sqlite> SELECT MAX(population), year FROM population_years WHERE country = 'Gabon';
1.54526|2010
sqlite> SELECT population, country FROM population_years
   ...> WHERE population IS NOT NULL AND year = 2005
   ...> ORDER BY population ASC LIMIT 10;
0.00216|Niue
0.00297|Falkland Islands (Islas Malvinas)
0.00453|Montserrat
0.0062|Saint Pierre and Miquelon
0.00748|Saint Helena
0.01001|Nauru
0.0136|Cook Islands
0.02057|Turks and Caicos Islands
0.02268|Virgin Islands, British
0.02846|Gibraltar
sqlite> SELECT DISTINCT country FROM population_years
   ...> WHERE population > 100 AND year = 2010;
Mexico
United States
Brazil
Russia
Nigeria
Bangladesh
China
India
Indonesia
Japan
Pakistan
sqlite> SELECT DISTINCT country FROM population_years
   ...> WHERE country LIKE '%Islands%';
Cayman Islands
Falkland Islands (Islas Malvinas)
Turks and Caicos Islands
Virgin Islands,  U.S.
Virgin Islands, British
Faroe Islands
Cook Islands
Solomon Islands
U.S. Pacific Islands
sqlite> SELECT population FROM population_years
   ...> WHERE country = 'Indonesia' AND year = 2000;
214.67661
sqlite> SELECT population FROM population_years
   ...> WHERE country = 'Indonesia' AND year = 2010;
242.96834
sqlite> .exit