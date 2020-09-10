#This project uses aggregate measures in Pandas to determine which of two versions of an ad
#for shoes is more effective. The ads have been placed in emails or as banner ads on several
#websites. Performance on specific days of the week is compared.


#Below is all my working (I did this on the Codecademy platform)

import codecademylib
import pandas as pd

ad_clicks = pd.read_csv('ad_clicks.csv')
print(ad_clicks.head(10))

source_ranking = ad_clicks.groupby('utm_source').user_id.count().reset_index()
print(source_ranking)

ad_clicks['is_click'] = ~ad_clicks.ad_click_timestamp.isnull()
print(ad_clicks.head(10))

clicks_by_source = ad_clicks.groupby(['utm_source', 'is_click']).user_id.count().reset_index()
print(clicks_by_source)

clicks_pivot = clicks_by_source.pivot(
  columns='is_click',
  index='utm_source',
  values='user_id'
).reset_index()
print(clicks_pivot)

clicks_pivot['percent_clicked'] = (clicks_pivot[True]/(clicks_pivot[True] + clicks_pivot[False])) * 100
print(clicks_pivot)

exp_groups = ad_clicks.groupby('experimental_group').user_id.count().reset_index()
print(exp_groups)

clicks_by_expGp = ad_clicks.groupby(['experimental_group', 'is_click']).user_id.count().reset_index()
print(clicks_by_expGp)

clicks_by_expGp_pivot = clicks_by_expGp.pivot(
  index='experimental_group',
  columns='is_click',
  values='user_id'
).reset_index()
print(clicks_by_expGp_pivot)

a_clicks = ad_clicks[ad_clicks.experimental_group == 'A']
print(a_clicks.head(10))

b_clicks = ad_clicks[ad_clicks.experimental_group == 'B']
print(b_clicks.head(10))

a_day_perc = a_clicks.groupby(['day', 'is_click']).user_id.count().reset_index()
print(a_day_perc)
a_day_perc_pivot = a_day_perc.pivot(
  index='day',
  columns='is_click',
  values='user_id'
).reset_index()
print(a_day_perc_pivot)

b_day_perc = b_clicks.groupby(['day', 'is_click']).user_id.count().reset_index()
print(b_day_perc)
b_day_perc_pivot = b_day_perc.pivot(
  index='day',
  columns='is_click',
  values='user_id'
).reset_index()
print(b_day_perc_pivot)

a_day_perc_pivot['percentage_click'] = (a_day_perc_pivot[True]/(a_day_perc_pivot[True] + a_day_perc_pivot[False])) * 100
print(a_day_perc_pivot)

b_day_perc_pivot['percentage_click'] = (b_day_perc_pivot[True]/(b_day_perc_pivot[True] + b_day_perc_pivot[False])) * 100
print(b_day_perc_pivot)


#This is the output

user_id	utm_source	day	ad_click_timestamp	experimental_group
0	008b7c6c-7272-471e-b90e-930d548bd8d7	google	6 - Saturday	7:18	A
1	009abb94-5e14-4b6c-bb1c-4f4df7aa7557	facebook	7 - Sunday	nan	B
2	00f5d532-ed58-4570-b6d2-768df5f41aed	twitter	2 - Tuesday	nan	A
3	011adc64-0f44-4fd9-a0bb-f1506d2ad439	google	2 - Tuesday	nan	B
4	012137e6-7ae7-4649-af68-205b4702169c	facebook	7 - Sunday	nan	B
5	013b0072-7b72-40e7-b698-98b4d0c9967f	facebook	1 - Monday	nan	A
6	0153d85b-7660-4c39-92eb-1e1acd023280	google	4 - Thursday	nan	A
7	01555297-d6e6-49ae-aeba-1b196fdbb09f	google	3 - Wednesday	nan	A
8	018cea61-19ea-4119-895b-1a4309ccb148	email	1 - Monday	18:33	A
9	01a210c3-fde0-4e6f-8efd-4f0e38730ae6	email	2 - Tuesday	15:21	B
utm_source	user_id
0	email	255
1	facebook	504
2	google	680
3	twitter	215
user_id	utm_source	day	ad_click_timestamp	experimental_group	is_click
0	008b7c6c-7272-471e-b90e-930d548bd8d7	google	6 - Saturday	7:18	A	True
1	009abb94-5e14-4b6c-bb1c-4f4df7aa7557	facebook	7 - Sunday	nan	B	False
2	00f5d532-ed58-4570-b6d2-768df5f41aed	twitter	2 - Tuesday	nan	A	False
3	011adc64-0f44-4fd9-a0bb-f1506d2ad439	google	2 - Tuesday	nan	B	False
4	012137e6-7ae7-4649-af68-205b4702169c	facebook	7 - Sunday	nan	B	False
5	013b0072-7b72-40e7-b698-98b4d0c9967f	facebook	1 - Monday	nan	A	False
6	0153d85b-7660-4c39-92eb-1e1acd023280	google	4 - Thursday	nan	A	False
7	01555297-d6e6-49ae-aeba-1b196fdbb09f	google	3 - Wednesday	nan	A	False
8	018cea61-19ea-4119-895b-1a4309ccb148	email	1 - Monday	18:33	A	True
9	01a210c3-fde0-4e6f-8efd-4f0e38730ae6	email	2 - Tuesday	15:21	B	True
utm_source	is_click	user_id
0	email	False	175
1	email	True	80
2	facebook	False	324
3	facebook	True	180
4	google	False	441
5	google	True	239
6	twitter	False	149
7	twitter	True	66
utm_source	False	True
0	email	175	80
1	facebook	324	180
2	google	441	239
3	twitter	149	66
utm_source	False	True	percent_clicked
0	email	175	80	31.3725490196
1	facebook	324	180	35.7142857143
2	google	441	239	35.1470588235
3	twitter	149	66	30.6976744186
experimental_group	user_id
0	A	827
1	B	827
experimental_group	is_click	user_id
0	A	False	517
1	A	True	310
2	B	False	572
3	B	True	255
experimental_group	False	True
0	A	517	310
1	B	572	255
user_id	utm_source	day	ad_click_timestamp	experimental_group	is_click
0	008b7c6c-7272-471e-b90e-930d548bd8d7	google	6 - Saturday	7:18	A	True
2	00f5d532-ed58-4570-b6d2-768df5f41aed	twitter	2 - Tuesday	nan	A	False
5	013b0072-7b72-40e7-b698-98b4d0c9967f	facebook	1 - Monday	nan	A	False
6	0153d85b-7660-4c39-92eb-1e1acd023280	google	4 - Thursday	nan	A	False
7	01555297-d6e6-49ae-aeba-1b196fdbb09f	google	3 - Wednesday	nan	A	False
8	018cea61-19ea-4119-895b-1a4309ccb148	email	1 - Monday	18:33	A	True
12	01fb228a-9d28-4cde-932c-59b933fa763b	email	7 - Sunday	nan	A	False
14	02405d93-9c33-4034-894a-b9523956a3ad	twitter	2 - Tuesday	nan	A	False
15	0254b59f-082d-4a5a-913d-4f2bba267768	google	5 - Friday	nan	A	False
18	041deef8-b242-4114-afd0-e584784ec9f0	google	3 - Wednesday	10:54	A	True
user_id	utm_source	day	ad_click_timestamp	experimental_group	is_click
1	009abb94-5e14-4b6c-bb1c-4f4df7aa7557	facebook	7 - Sunday	nan	B	False
3	011adc64-0f44-4fd9-a0bb-f1506d2ad439	google	2 - Tuesday	nan	B	False
4	012137e6-7ae7-4649-af68-205b4702169c	facebook	7 - Sunday	nan	B	False
9	01a210c3-fde0-4e6f-8efd-4f0e38730ae6	email	2 - Tuesday	15:21	B	True
10	01adb2e7-f711-4ae4-a7c6-29f48457eea1	google	3 - Wednesday	nan	B	False
11	01ae0361-7d17-4760-a2c8-23977a46fb78	facebook	4 - Thursday	7:11	B	True
13	023598b8-09e2-40ed-9c90-34d607094ff9	google	2 - Tuesday	nan	B	False
16	02d8dba0-5d12-4983-a407-63fab9757d94	google	3 - Wednesday	nan	B	False
17	0378e9e1-0ad8-4a26-8190-ebb3370239d3	facebook	1 - Monday	nan	B	False
19	0429608e-61f3-4df0-ba45-3633029a14db	google	7 - Sunday	nan	B	False
day	is_click	user_id
0	1 - Monday	False	70
1	1 - Monday	True	43
2	2 - Tuesday	False	76
3	2 - Tuesday	True	43
4	3 - Wednesday	False	86
5	3 - Wednesday	True	38
6	4 - Thursday	False	69
7	4 - Thursday	True	47
8	5 - Friday	False	77
9	5 - Friday	True	51
10	6 - Saturday	False	73
11	6 - Saturday	True	45
12	7 - Sunday	False	66
13	7 - Sunday	True	43
day	False	True
0	1 - Monday	70	43
1	2 - Tuesday	76	43
2	3 - Wednesday	86	38
3	4 - Thursday	69	47
4	5 - Friday	77	51
5	6 - Saturday	73	45
6	7 - Sunday	66	43
day	is_click	user_id
0	1 - Monday	False	81
1	1 - Monday	True	32
2	2 - Tuesday	False	74
3	2 - Tuesday	True	45
4	3 - Wednesday	False	89
5	3 - Wednesday	True	35
6	4 - Thursday	False	87
7	4 - Thursday	True	29
8	5 - Friday	False	90
9	5 - Friday	True	38
10	6 - Saturday	False	76
11	6 - Saturday	True	42
12	7 - Sunday	False	75
13	7 - Sunday	True	34
day	False	True
0	1 - Monday	81	32
1	2 - Tuesday	74	45
2	3 - Wednesday	89	35
3	4 - Thursday	87	29
4	5 - Friday	90	38
5	6 - Saturday	76	42
6	7 - Sunday	75	34
day	False	True	percentage_click
0	1 - Monday	70	43	38.0530973451
1	2 - Tuesday	76	43	36.1344537815
2	3 - Wednesday	86	38	30.6451612903
3	4 - Thursday	69	47	40.5172413793
4	5 - Friday	77	51	39.84375
5	6 - Saturday	73	45	38.1355932203
6	7 - Sunday	66	43	39.4495412844
day	False	True	percentage_click
0	1 - Monday	81	32	28.3185840708
1	2 - Tuesday	74	45	37.8151260504
2	3 - Wednesday	89	35	28.2258064516
3	4 - Thursday	87	29	25.0
4	5 - Friday	90	38	29.6875
5	6 - Saturday	76	42	35.593220339
6	7 - Sunday	75	34	31.1926605505

#The final answer is that Group B is the better ad campaign
# as a higher percentage of users clicked on the ad on most weekdays
