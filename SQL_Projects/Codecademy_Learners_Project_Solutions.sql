/* db.sqlite contains the following tables: */

sqlite3 db.sqlite
  SQLite version 3.24.0 2018-06-04 14:10:15
  Enter ".help" for usage hints.
sqlite> .schema
  CREATE TABLE progress (

  user_id INTEGER,
  learn_cpp TEXT,
  learn_sql TEXT,
  learn_html TEXT,
  learn_javascript TEXT,
  learn_java TEXT
  );
  CREATE TABLE users (

  user_id INTEGER,
  email_domain TEXT,
  country TEXT,
  city TEXT,
  postal INTEGER,
  mobile_app TEXT,
  sign_up_at DATETIME

  );


/* Top 25 schools (.edu domains) */
SELECT email_domain, COUNT(*)
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY COUNT(*) DESC
LIMIT 25;

  ucsd.edu|193
  cps.edu|55
  ku.edu|50
  vt.edu|40
  oregonstate.edu|38
  msu.edu|33
  strathmore.edu|29
  u.northwestern.edu|25
  umich.edu|25
  nyu.edu|23
  asu.edu|22
  pace.edu|22
  berkeley.edu|18
  ucdavis.edu|17
  baylor.edu|16
  drexel.edu|16
  husky.neu.edu|16
  g.ucla.edu|15
  case.edu|13
  monmouth.edu|13
  ucsc.edu|13
  utexas.edu|13
  colorado.edu|12
  illinois.edu|12
  tamu.edu|12

/* How many .edu learners are located in New York? */
SELECT COUNT(*)
FROM users
WHERE city = 'New York';
  50

/* How many users are using the mobile_app */
/* Note the NULL functions do not seem to work with these data */
SELECT COUNT(*)
FROM users
WHERE city = 'New York' AND mobile_app = 'mobile-user';
  15

/* Use the strftime() function to query the sign up counts for each hour */
  /* For strftime(__, timestamp): %Y returns the year (YYYY), %m returns the month (01-12), %d returns the day of the month (1-31), */
  /* %H returns 24-hour clock (00-23), %M returns the minute (00-59), %S returns the seconds (00-59) */
  /* if sign_up_at format is YYYY-MM-DD HH:MM:SS */
SELECT COUNT(*), strftime('%H', sign_up_at)
FROM users
GROUP BY 2;
  100|00
  93|01
  73|02
  84|03
  74|04
  29|05
  30|06
  16|07
  18|08
  9|09
  10|10
  13|11
  27|12
  80|13
  101|14
  103|15
  183|16
  174|17
  185|18
  147|19
  138|20
  104|21
  105|22
  104|23

/* List the number of subscribers to each course sorted by school (.edu domain) */
  /* I tried doing it with IS NULL but it didn't work on the data. I then tried using */
  /* WITH and temporary tables but couldn't quite solve it. Got solution from another */
  /* codecademy user mrn00b0t */

WITH cpp_enrol AS (
SELECT u.email_domain, COUNT(*) AS cpp_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_cpp = 'started' OR p.learn_cpp = 'completed'
GROUP BY 1
ORDER BY 1
),
sql_enrol AS (
SELECT u.email_domain, COUNT(*) AS sql_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_sql = 'started' OR p.learn_sql = 'completed'
GROUP BY 1
ORDER BY 1
),
html_enrol AS (
SELECT u.email_domain, COUNT(*) AS html_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_html = 'started' OR p.learn_html = 'completed'
GROUP BY 1
ORDER BY 1
),
javascript_enrol AS (
SELECT u.email_domain, COUNT(*) AS javascript_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_javascript = 'started' OR p.learn_javascript = 'completed'
GROUP BY 1
ORDER BY 1
),
java_enrol AS (
SELECT u.email_domain, COUNT(*) AS java_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_java = 'started' OR p.learn_java = 'completed'
GROUP BY 1
ORDER BY 1
)
SELECT c.email_domain, c.cpp_enrol, s.sql_enrol, h.html_enrol, j.javascript_enrol, a.java_enrol
FROM cpp_enrol c
JOIN sql_enrol s
ON c.email_domain = s.email_domain
JOIN html_enrol h
ON c.email_domain = h.email_domain
JOIN javascript_enrol j
ON c.email_domain = j.email_domain
JOIN java_enrol a
ON c.email_domain = a.email_domain
ORDER BY c.cpp_enrol DESC
LIMIT 30;

  ucsd.edu|63|98|51|94|37
  cps.edu|23|28|16|25|13
  ku.edu|22|25|12|25|8
  vt.edu|22|16|14|22|6
  oregonstate.edu|19|19|14|23|6
  strathmore.edu|11|16|9|12|6
  ucdavis.edu|10|9|5|8|4
  colorado.edu|9|5|6|8|5
  nyu.edu|9|12|6|14|4
  u.northwestern.edu|9|9|7|9|5
  husky.neu.edu|8|6|7|11|8
  pace.edu|8|12|6|12|2
  umich.edu|8|11|6|13|5
  asu.edu|7|6|7|7|6
  berkeley.edu|7|10|8|10|5
  msu.edu|7|16|10|16|5
  utexas.edu|7|4|5|8|2
  drexel.edu|6|8|4|6|3
  g.ucla.edu|6|6|7|7|2
  tamu.edu|6|3|6|6|6
  ucsc.edu|6|4|4|4|3
  baylor.edu|5|13|5|8|2
  columbia.edu|5|3|3|5|2
  illinois.edu|5|4|4|8|2
  umass.edu|5|5|2|4|2
  wisc.edu|5|8|5|6|3
  bsu.edu|4|3|3|4|2
  email.arizona.edu|4|3|2|3|2
  eng.ucsd.edu|4|3|3|4|2
  fiu.edu|4|5|5|3|3


/* What courses are students in New York or Chicago taking */
  /* Again cannot use NULL with these data */
  /* Have done this myself rather than looking at the solution of mrn00b0t */
  /* Could add AND city = '...' to each WHERE statement to get numbers for only that city but seems neater to get all cities */

WITH cpp_enrol AS (
SELECT u.city, COUNT(*) AS cpp_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE (p.learn_cpp = 'started' OR p.learn_cpp = 'completed')
GROUP BY 1
ORDER BY 1
),
sql_enrol AS (
SELECT u.city, COUNT(*) AS sql_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE (p.learn_sql = 'started' OR p.learn_sql = 'completed')
GROUP BY 1
ORDER BY 1
),
html_enrol AS (
SELECT u.city, COUNT(*) AS html_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE (p.learn_html = 'started' OR p.learn_html = 'completed')
GROUP BY 1
ORDER BY 1
),
javascript_enrol AS (
SELECT u.city, COUNT(*) AS javascript_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE (p.learn_javascript = 'started' OR p.learn_javascript = 'completed')
GROUP BY 1
ORDER BY 1
),
java_enrol AS (
SELECT u.city, COUNT(*) AS java_enrol
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE (p.learn_java = 'started' OR p.learn_java = 'completed')
GROUP BY 1
ORDER BY 1
)
SELECT c.city, c.cpp_enrol, s.sql_enrol, h.html_enrol, j.javascript_enrol, a.java_enrol
FROM cpp_enrol c
JOIN sql_enrol s
ON c.city = s.city
JOIN html_enrol h
ON c.city = h.city
JOIN javascript_enrol j
ON c.city = j.city
JOIN java_enrol a
ON c.city = a.city
ORDER BY c.cpp_enrol DESC
LIMIT 30;

  La Jolla|38|58|31|52|23
  Chicago|37|42|29|46|16
  San Diego|30|42|23|48|15
  |23|31|12|27|11
  Corvallis|19|18|14|23|6
  Blacksburg|18|12|11|17|4
  Lawrence|17|19|9|18|6
  Los Angeles|17|17|12|20|7
  New York|16|25|14|29|8
  Boston|11|12|8|9|11
  Nairobi|11|14|9|11|5
  Seattle|10|13|8|17|6
  San Francisco|9|7|3|11|2
  Brooklyn|8|8|5|7|6
  Charlotte|8|9|8|9|2
  Briarcliff Manor|7|9|6|9|2
  Philadelphia|7|8|5|12|4
  Raleigh|7|6|1|9|1
  Boulder|6|3|5|5|4
  Davis|6|6|2|4|1
  Nashville|6|3|3|6|2
  Amherst|5|5|2|4|3
  Austin|5|4|3|4|2
  East Lansing|5|11|7|8|4
  Houston|5|4|5|4|4
  Minneapolis|5|6|3|6|2
  Pittsburgh|5|2|1|8|2
  Santa Cruz|5|2|2|3|2
  Tempe|5|4|4|3|4
  Albuquerque|4|5|4|5|1
