
[Spas-MacBook-Pro:~] sgetov% cd Desktop
[Spas-MacBook-Pro:~/Desktop] sgetov% sqlite3 acs-1-year-2015.sqlite
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE states (
    year INTEGER , 
    name TEXT , 
    geo_id TEXT , 
    total_population INTEGER , 
    white INTEGER , 
    black INTEGER , 
    hispanic INTEGER , 
    asian INTEGER , 
    american_indian INTEGER , 
    pacific_islander INTEGER , 
    other_race INTEGER , 
    median_age FLOAT , 
    total_households INTEGER , 
    owner_occupied_homes_median_value INTEGER , 
    per_capita_income INTEGER , 
    median_household_income INTEGER , 
    below_poverty_line INTEGER, 
    foreign_born_population INTEGER, 
    state TEXT 
);
CREATE TABLE congressional_districts (
    year INTEGER , 
    name TEXT , 
    geo_id TEXT , 
    total_population INTEGER , 
    white INTEGER , 
    black INTEGER , 
    hispanic INTEGER , 
    asian INTEGER , 
    american_indian INTEGER , 
    pacific_islander INTEGER , 
    other_race INTEGER , 
    median_age FLOAT , 
    total_households INTEGER , 
    owner_occupied_homes_median_value INTEGER , 
    per_capita_income INTEGER , 
    median_household_income INTEGER , 
    below_poverty_line INTEGER, 
    foreign_born_population INTEGER, 
    state TEXT,
    congressional_district TEXT
);
CREATE TABLE places (
    year INTEGER , 
    name TEXT , 
    geo_id TEXT , 
    total_population INTEGER , 
    white INTEGER , 
    black INTEGER , 
    hispanic INTEGER , 
    asian INTEGER , 
    american_indian INTEGER , 
    pacific_islander INTEGER , 
    other_race INTEGER , 
    median_age FLOAT , 
    total_households INTEGER , 
    owner_occupied_homes_median_value INTEGER , 
    per_capita_income INTEGER , 
    median_household_income INTEGER , 
    below_poverty_line INTEGER, 
    foreign_born_population INTEGER, 
    state TEXT,
    place TEXT
);
CREATE INDEX "state_on_states" ON states(state);
CREATE INDEX "state_cd_on_cdistricts" ON congressional_districts(state, congressional_district);
CREATE INDEX "state_on_places" ON places(state);
CREATE INDEX "name_on_states" ON states(name);
CREATE INDEX "name_on_cdistricts" ON congressional_districts(name);
CREATE INDEX "name_on_places" ON places(name);
sqlite> SELECT name, per_capita_income
   ...> FROM states
   ...> ORDER BY per_capita_income ASC;
Puerto Rico|18626
Mississippi|40593
Arkansas|41995
West Virginia|42019
Alabama|44765
Kentucky|45215
New Mexico|45382
Louisiana|45727
South Carolina|47238
Tennessee|47275
North Carolina|47830
Idaho|48275
Oklahoma|48568
Florida|49426
Montana|49509
Missouri|50238
Indiana|50532
Ohio|51075
Michigan|51084
Georgia|51244
Arizona|51492
Maine|51494
Nevada|52431
South Dakota|53017
Kansas|53906
Oregon|54148
Iowa|54736
Nebraska|54996
Wisconsin|55638
Texas|55653
Pennsylvania|55702
Vermont|56990
Rhode Island|58073
Illinois|59588
Wyoming|60214
North Dakota|60557
New York|60850
Delaware|61255
Utah|62912
Minnesota|63488
Colorado|63909
Washington|64129
California|64500
Virginia|66262
New Hampshire|70303
Massachusetts|70628
Connecticut|71346
New Jersey|72222
Alaska|73355
Hawaii|73486
District of Columbia|75628
Maryland|75847
sqlite> SELECT name, median_age
   ...> FROM states
   ...> ORDER BY median_age ASC;
Utah|30.6
Alaska|33.3
District of Columbia|33.8
Texas|34.4
North Dakota|34.9
Idaho|35.8
Nebraska|36.1
California|36.2
Kansas|36.2
Oklahoma|36.3
Colorado|36.4
Georgia|36.4
Louisiana|36.4
Wyoming|36.5
South Dakota|36.9
Mississippi|37.0
Arizona|37.4
New Mexico|37.4
Indiana|37.5
Washington|37.5
Hawaii|37.7
Illinois|37.7
Nevada|37.8
Virginia|37.8
Arkansas|37.9
Minnesota|37.9
Iowa|38.1
Maryland|38.3
New York|38.3
Missouri|38.4
North Carolina|38.4
Alabama|38.7
Tennessee|38.7
Kentucky|38.8
South Carolina|39.0
Oregon|39.1
Ohio|39.3
Massachusetts|39.4
Wisconsin|39.4
New Jersey|39.6
Delaware|39.7
Michigan|39.7
Rhode Island|39.7
Montana|39.9
Puerto Rico|40.0
Connecticut|40.6
Pennsylvania|40.7
Florida|41.8
West Virginia|42.2
New Hampshire|42.8
Vermont|43.1
Maine|44.6
sqlite> SELECT name, below_poverty_line
   ...> FROM congressional_districts
   ...> ORDER BY below_poverty_line ASC;
Resident Commissioner District (at Large) (114th Congress), Puerto Rico|
Congressional District 11 (114th Congress), New Jersey|33529
Congressional District 7 (114th Congress), New Jersey|35552
Congressional District 3 (114th Congress), Minnesota|37507
Congressional District 2 (114th Congress), Missouri|38962
Congressional District 5 (114th Congress), New Jersey|39417
Congressional District 7 (114th Congress), Pennsylvania|39835
Congressional District 3 (114th Congress), New York|40121
Congressional District 10 (114th Congress), Virginia|41499
Congressional District 8 (114th Congress), Pennsylvania|41579
Congressional District 14 (114th Congress), Illinois|45467
Congressional District 6 (114th Congress), Illinois|46245
Congressional District 2 (114th Congress), New York|46415
Congressional District 11 (114th Congress), Michigan|46849
Congressional District 2 (114th Congress), Minnesota|46886
Congressional District 4 (114th Congress), New York|46901
Congressional District 6 (114th Congress), Pennsylvania|47218
Congressional District 5 (114th Congress), Maryland|49312
Congressional District 5 (114th Congress), Wisconsin|49444
Congressional District 1 (114th Congress), Virginia|49650
Congressional District 4 (114th Congress), Massachusetts|50328
Congressional District 16 (114th Congress), Ohio|50719
Congressional District 17 (114th Congress), California|50994
Congressional District 1 (114th Congress), New Hampshire|51094
Congressional District 18 (114th Congress), California|51389
Congressional District 6 (114th Congress), Minnesota|51432
Congressional District 7 (114th Congress), Virginia|52722
Congressional District 3 (114th Congress), Texas|53052
Congressional District 1 (114th Congress), Washington|54659
Congressional District 2 (114th Congress), New Hampshire|54952
Congressional District 15 (114th Congress), California|55861
Congressional District 14 (114th Congress), Ohio|56855
Congressional District 11 (114th Congress), Virginia|56940
Congressional District 3 (114th Congress), New Jersey|57415
Congressional District 5 (114th Congress), Massachusetts|57461
Congressional District 26 (114th Congress), Texas|57620
Congressional District 22 (114th Congress), Texas|57800
Congressional District 1 (114th Congress), Hawaii|57898
Congressional District 3 (114th Congress), Maryland|58359
Congressional District 1 (114th Congress), New York|58542
Congressional District 8 (114th Congress), Illinois|58783
Congressional District 8 (114th Congress), Maryland|59403
Congressional District 18 (114th Congress), Pennsylvania|59694
Congressional District 2 (114th Congress), Connecticut|60139
Congressional District 2 (114th Congress), Rhode Island|60182
Congressional District 8 (114th Congress), Virginia|60698
Congressional District (at Large) (114th Congress), Vermont|61314
Congressional District 8 (114th Congress), Washington|61921
Congressional District 6 (114th Congress), Georgia|62661
Congressional District 33 (114th Congress), California|62725
Congressional District 6 (114th Congress), Massachusetts|63016
Congressional District (at Large) (114th Congress), Wyoming|63425
Congressional District 27 (114th Congress), New York|63962
Congressional District 4 (114th Congress), New Jersey|64391
Congressional District 4 (114th Congress), Maryland|64785
Congressional District 4 (114th Congress), Utah|64936
Congressional District 4 (114th Congress), Connecticut|65315
Congressional District 6 (114th Congress), Colorado|65778
Congressional District 3 (114th Congress), Nevada|65929
Congressional District 3 (114th Congress), Kansas|66086
Congressional District 5 (114th Congress), Illinois|66379
Congressional District 18 (114th Congress), Illinois|66543
Congressional District 1 (114th Congress), Maryland|66806
Congressional District 9 (114th Congress), North Carolina|66975
Congressional District 6 (114th Congress), Wisconsin|67293
Congressional District 21 (114th Congress), Texas|67384
Congressional District 4 (114th Congress), California|67639
Congressional District 1 (114th Congress), Maine|67727
Congressional District 5 (114th Congress), Arizona|67870
Congressional District 6 (114th Congress), Maryland|67912
Congressional District 8 (114th Congress), Arizona|68273
Congressional District 5 (114th Congress), Indiana|68490
Congressional District 39 (114th Congress), California|68886
Congressional District 7 (114th Congress), Minnesota|69354
Congressional District 24 (114th Congress), Texas|69617
Congressional District 12 (114th Congress), Pennsylvania|69916
Congressional District 1 (114th Congress), Wisconsin|70012
Congressional District 18 (114th Congress), New York|70306
Congressional District 6 (114th Congress), New Jersey|70358
Congressional District 49 (114th Congress), California|70558
Congressional District 6 (114th Congress), Alabama|70679
Congressional District 14 (114th Congress), California|71013
Congressional District 10 (114th Congress), Illinois|71051
Congressional District 1 (114th Congress), Minnesota|71650
Congressional District 2 (114th Congress), Virginia|71679
Congressional District 7 (114th Congress), Wisconsin|71874
Congressional District 12 (114th Congress), Ohio|71924
Congressional District 4 (114th Congress), Pennsylvania|72004
Congressional District 13 (114th Congress), North Carolina|72113
Congressional District 10 (114th Congress), Michigan|72395
Congressional District 3 (114th Congress), Nebraska|72414
Congressional District 12 (114th Congress), New Jersey|72468
Congressional District 52 (114th Congress), California|72921
Congressional District 21 (114th Congress), Florida|73002
Congressional District 26 (114th Congress), California|73290
Congressional District 5 (114th Congress), Ohio|73466
Congressional District 8 (114th Congress), Minnesota|73488
Congressional District 19 (114th Congress), California|73782
Congressional District 4 (114th Congress), Colorado|74070
Congressional District 8 (114th Congress), Wisconsin|74471
Congressional District 1 (114th Congress), Connecticut|74486
Congressional District (at Large) (114th Congress), Alaska|74532
Congressional District 11 (114th Congress), Georgia|74550
Congressional District 4 (114th Congress), Florida|75198
Congressional District 15 (114th Congress), Pennsylvania|75976
Congressional District 1 (114th Congress), Nebraska|76099
Congressional District 48 (114th Congress), California|76228
Congressional District 2 (114th Congress), Texas|76679
Congressional District 17 (114th Congress), New York|77273
Congressional District 9 (114th Congress), Massachusetts|77517
Congressional District 6 (114th Congress), Washington|78305
Congressional District 4 (114th Congress), Virginia|78319
Congressional District 10 (114th Congress), Texas|78614
Congressional District 1 (114th Congress), Utah|78620
Congressional District 38 (114th Congress), California|78750
Congressional District 5 (114th Congress), Connecticut|78766
Congressional District 20 (114th Congress), New York|78837
Congressional District 3 (114th Congress), Illinois|78892
Congressional District 45 (114th Congress), California|79157
Congressional District 8 (114th Congress), Massachusetts|79416
Congressional District 7 (114th Congress), Washington|79431
Congressional District 5 (114th Congress), Colorado|79639
Congressional District 11 (114th Congress), Pennsylvania|79749
Congressional District (at Large) (114th Congress), North Dakota|80170
Congressional District 12 (114th Congress), New York|80654
Congressional District 25 (114th Congress), Texas|80686
Congressional District 1 (114th Congress), Rhode Island|80853
Congressional District 30 (114th Congress), California|81092
Congressional District 3 (114th Congress), Missouri|81247
Congressional District 2 (114th Congress), Colorado|81721
Congressional District 1 (114th Congress), South Carolina|81992
Congressional District 1 (114th Congress), Iowa|82315
Congressional District 2 (114th Congress), Nebraska|82808
Congressional District 11 (114th Congress), Illinois|83107
Congressional District 3 (114th Congress), Massachusetts|83115
Congressional District 15 (114th Congress), Ohio|83186
Congressional District 6 (114th Congress), Texas|83408
Congressional District 11 (114th Congress), California|83921
Congressional District 9 (114th Congress), Washington|83986
Congressional District 2 (114th Congress), Washington|84082
Congressional District 5 (114th Congress), California|84206
Congressional District 16 (114th Congress), Illinois|84353
Congressional District 7 (114th Congress), Georgia|84991
Congressional District 31 (114th Congress), Texas|85568
Congressional District 2 (114th Congress), New Jersey|85597
Congressional District 10 (114th Congress), Pennsylvania|85608
Congressional District 8 (114th Congress), Michigan|85666
Congressional District 7 (114th Congress), Michigan|85710
Congressional District 2 (114th Congress), Wisconsin|86009
Congressional District 1 (114th Congress), New Jersey|86029
Congressional District 2 (114th Congress), Maryland|86190
Congressional District 7 (114th Congress), Colorado|86710
Congressional District 3 (114th Congress), Washington|86853
Congressional District 8 (114th Congress), Texas|87053
Congressional District 25 (114th Congress), California|87089
Congressional District 23 (114th Congress), Florida|87091
Congressional District 2 (114th Congress), California|87532
Congressional District 4 (114th Congress), Indiana|87583
Congressional District 17 (114th Congress), Pennsylvania|87630
Congressional District 3 (114th Congress), Indiana|87850
Congressional District 4 (114th Congress), Minnesota|87911
Congressional District 3 (114th Congress), Connecticut|88203
Congressional District 12 (114th Congress), California|88207
Congressional District 7 (114th Congress), Florida|88486
Congressional District 12 (114th Congress), Texas|88886
Congressional District 3 (114th Congress), Utah|88898
Congressional District 1 (114th Congress), Oregon|88931
Congressional District 16 (114th Congress), Florida|89085
Congressional District 50 (114th Congress), California|89867
Congressional District 2 (114th Congress), Hawaii|90086
Congressional District 18 (114th Congress), Florida|90116
Congressional District 3 (114th Congress), Wisconsin|90376
Congressional District 3 (114th Congress), Iowa|90504
Congressional District 12 (114th Congress), Florida|90934
Congressional District 42 (114th Congress), California|91265
Congressional District 2 (114th Congress), Michigan|91516
Congressional District 15 (114th Congress), Illinois|91746
Congressional District 9 (114th Congress), Illinois|91759
Congressional District 6 (114th Congress), Missouri|91795
Congressional District 19 (114th Congress), New York|92150
Congressional District 1 (114th Congress), Florida|92170
Congressional District 7 (114th Congress), California|92224
Congressional District 4 (114th Congress), Iowa|92492
Congressional District 5 (114th Congress), New York|92757
Congressional District 2 (114th Congress), West Virginia|92767
Congressional District 7 (114th Congress), Ohio|93318
Congressional District 2 (114th Congress), Nevada|93321
Congressional District 7 (114th Congress), Texas|93348
Congressional District 1 (114th Congress), Michigan|93377
Congressional District 4 (114th Congress), Ohio|93424
Congressional District 9 (114th Congress), Michigan|93777
Congressional District 1 (114th Congress), Kansas|93868
Congressional District 21 (114th Congress), New York|93932
Congressional District 32 (114th Congress), California|93969
Congressional District 27 (114th Congress), California|93994
Congressional District 13 (114th Congress), Florida|94072
Congressional District 4 (114th Congress), Oklahoma|94457
Congressional District 8 (114th Congress), Florida|94476
Congressional District 2 (114th Congress), South Carolina|94476
Congressional District 5 (114th Congress), Pennsylvania|94530
Congressional District 36 (114th Congress), Texas|94899
Congressional District 11 (114th Congress), Texas|94962
Congressional District 32 (114th Congress), Texas|95128
Congressional District 4 (114th Congress), Nevada|95460
Congressional District 16 (114th Congress), Pennsylvania|96191
Congressional District 8 (114th Congress), Ohio|96225
Congressional District 22 (114th Congress), Florida|96487
Congressional District 9 (114th Congress), Indiana|96635
Congressional District 53 (114th Congress), California|96700
Congressional District 2 (114th Congress), Massachusetts|97084
Congressional District 8 (114th Congress), Tennessee|97694
Congressional District 6 (114th Congress), Arizona|97857
Congressional District 6 (114th Congress), New York|97946
Congressional District 4 (114th Congress), South Carolina|98102
Congressional District 6 (114th Congress), Indiana|98300
Congressional District 28 (114th Congress), California|98526
Congressional District 5 (114th Congress), Virginia|98763
Congressional District 4 (114th Congress), Kansas|98917
Congressional District 4 (114th Congress), Kentucky|98931
Congressional District 24 (114th Congress), New York|99153
Congressional District 2 (114th Congress), Utah|99400
Congressional District 6 (114th Congress), North Carolina|99598
Congressional District 2 (114th Congress), Ohio|99647
Congressional District 10 (114th Congress), Washington|99782
Congressional District 1 (114th Congress), West Virginia|99954
Congressional District 6 (114th Congress), Tennessee|100074
Congressional District 9 (114th Congress), Pennsylvania|100173
Congressional District 7 (114th Congress), Tennessee|100211
Congressional District 4 (114th Congress), Arizona|100361
Congressional District 16 (114th Congress), New York|100370
Congressional District 3 (114th Congress), Pennsylvania|100488
Congressional District 10 (114th Congress), Florida|101830
Congressional District 2 (114th Congress), Iowa|102103
Congressional District 6 (114th Congress), Louisiana|103373
Congressional District 14 (114th Congress), Texas|103715
Congressional District 15 (114th Congress), Florida|103737
Congressional District 3 (114th Congress), Michigan|103751
Congressional District 13 (114th Congress), Pennsylvania|103929
Congressional District 14 (114th Congress), Georgia|104122
Congressional District 2 (114th Congress), Indiana|104228
Congressional District 1 (114th Congress), Ohio|104669
Congressional District 2 (114th Congress), Maine|104893
Congressional District 5 (114th Congress), Alabama|104900
Congressional District 13 (114th Congress), Texas|105172
Congressional District 5 (114th Congress), Oregon|105396
Congressional District 25 (114th Congress), New York|105531
Congressional District 6 (114th Congress), Michigan|105559
Congressional District 23 (114th Congress), New York|105560
Congressional District 11 (114th Congress), New York|105701
Congressional District 3 (114th Congress), Georgia|105843
Congressional District 8 (114th Congress), Indiana|105880
Congressional District 1 (114th Congress), Massachusetts|106391
Congressional District 17 (114th Congress), Illinois|106780
Congressional District 22 (114th Congress), New York|107555
Congressional District 20 (114th Congress), California|107865
Congressional District 5 (114th Congress), Minnesota|108203
Congressional District 2 (114th Congress), Tennessee|108484
Congressional District 24 (114th Congress), California|108497
Congressional District 4 (114th Congress), Michigan|109496
Congressional District 2 (114th Congress), Kansas|110008
Congressional District 5 (114th Congress), Washington|110107
Congressional District 1 (114th Congress), Indiana|110145
Delegate District (at Large) (114th Congress), District of Columbia|110500
Congressional District 3 (114th Congress), Colorado|110554
Congressional District 2 (114th Congress), Arizona|110627
Congressional District 5 (114th Congress), South Carolina|111068
Congressional District 4 (114th Congress), Texas|111259
Congressional District 12 (114th Congress), Illinois|111504
Congressional District 6 (114th Congress), Ohio|111523
Congressional District 3 (114th Congress), Kentucky|111963
Congressional District 4 (114th Congress), Tennessee|112279
Congressional District 6 (114th Congress), Florida|113061
Congressional District 6 (114th Congress), Virginia|113115
Congressional District 11 (114th Congress), Florida|113130
Congressional District 2 (114th Congress), North Carolina|113843
Congressional District (at Large) (114th Congress), South Dakota|114071
Congressional District (at Large) (114th Congress), Delaware|114360
Congressional District 17 (114th Congress), Florida|114464
Congressional District 11 (114th Congress), North Carolina|114686
Congressional District 9 (114th Congress), Georgia|114745
Congressional District 19 (114th Congress), Florida|114797
Congressional District 1 (114th Congress), Colorado|115077
Congressional District 12 (114th Congress), Michigan|117612
Congressional District 9 (114th Congress), New Jersey|117655
Congressional District 26 (114th Congress), Florida|117865
Congressional District 10 (114th Congress), Ohio|117888
Congressional District 7 (114th Congress), Maryland|118009
Congressional District 2 (114th Congress), Kentucky|118097
Congressional District 19 (114th Congress), Texas|118173
Congressional District 4 (114th Congress), Washington|118675
Congressional District 3 (114th Congress), South Carolina|118769
Congressional District 3 (114th Congress), Oklahoma|118964
Congressional District 1 (114th Congress), Oklahoma|119789
Congressional District 7 (114th Congress), Missouri|120222
Congressional District 1 (114th Congress), Alabama|120340
Congressional District 47 (114th Congress), California|121110
Congressional District 14 (114th Congress), New York|121183
Congressional District 14 (114th Congress), Pennsylvania|121242
Congressional District 9 (114th Congress), California|121314
Congressional District 13 (114th Congress), California|121544
Congressional District 10 (114th Congress), North Carolina|121936
Congressional District 3 (114th Congress), California|121983
Congressional District 1 (114th Congress), Idaho|122380
Congressional District 2 (114th Congress), Idaho|123171
Congressional District 3 (114th Congress), North Carolina|123237
Congressional District 1 (114th Congress), Louisiana|123258
Congressional District 13 (114th Congress), Illinois|123413
Congressional District 10 (114th Congress), New York|123758
Congressional District 27 (114th Congress), Texas|123924
Congressional District 35 (114th Congress), California|124129
Congressional District 13 (114th Congress), Ohio|124170
Congressional District 3 (114th Congress), Oregon|124548
Congressional District 5 (114th Congress), Tennessee|124598
Congressional District 1 (114th Congress), Texas|125417
Congressional District 5 (114th Congress), Texas|126268
Congressional District 3 (114th Congress), Florida|126282
Congressional District 3 (114th Congress), Arkansas|126522
Congressional District 5 (114th Congress), North Carolina|126549
Congressional District 41 (114th Congress), California|126662
Congressional District 23 (114th Congress), Texas|126762
Congressional District 23 (114th Congress), California|126786
Congressional District 4 (114th Congress), Missouri|126947
Congressional District 13 (114th Congress), Georgia|127160
Congressional District 3 (114th Congress), New Mexico|127471
Congressional District 7 (114th Congress), North Carolina|127689
Congressional District 9 (114th Congress), Virginia|127965
Congressional District 10 (114th Congress), California|128416
Congressional District 3 (114th Congress), West Virginia|128862
Congressional District 10 (114th Congress), Georgia|129342
Congressional District 1 (114th Congress), Kentucky|129351
Congressional District 17 (114th Congress), Texas|129445
Congressional District 7 (114th Congress), South Carolina|130242
Congressional District 2 (114th Congress), Alabama|131410
Congressional District 1 (114th Congress), Tennessee|131414
Congressional District 5 (114th Congress), Missouri|131620
Congressional District 46 (114th Congress), California|131809
Congressional District 1 (114th Congress), Illinois|132020
Congressional District 1 (114th Congress), Mississippi|132471
Congressional District 1 (114th Congress), California|132763
Congressional District 3 (114th Congress), Tennessee|132806
Congressional District 2 (114th Congress), Arkansas|132826
Congressional District 4 (114th Congress), Alabama|133258
Congressional District 5 (114th Congress), Oklahoma|133519
Congressional District 3 (114th Congress), Alabama|134247
Congressional District 16 (114th Congress), Texas|134274
Congressional District 1 (114th Congress), Georgia|134365
Congressional District 4 (114th Congress), Georgia|134374
Congressional District 8 (114th Congress), North Carolina|134894
Congressional District 2 (114th Congress), Florida|135062
Congressional District 5 (114th Congress), Michigan|135274
Congressional District 20 (114th Congress), Texas|135966
Congressional District 1 (114th Congress), New Mexico|136342
Congressional District 3 (114th Congress), Mississippi|137464
Congressional District 7 (114th Congress), Massachusetts|137743
Congressional District 2 (114th Congress), Illinois|138488
Congressional District 8 (114th Congress), Missouri|138518
Congressional District 37 (114th Congress), California|138528
Congressional District 6 (114th Congress), Kentucky|138534
Congressional District 31 (114th Congress), California|139720
Congressional District 8 (114th Congress), New Jersey|140586
Congressional District 25 (114th Congress), Florida|141638
Congressional District 1 (114th Congress), Arkansas|141840
Congressional District 2 (114th Congress), Oregon|142645
Congressional District 9 (114th Congress), Florida|142852
Congressional District 10 (114th Congress), New Jersey|143117
Congressional District 27 (114th Congress), Florida|143378
Congressional District 3 (114th Congress), Louisiana|143661
Congressional District 9 (114th Congress), Ohio|143834
Congressional District 2 (114th Congress), Oklahoma|144099
Congressional District 9 (114th Congress), Arizona|144227
Congressional District 4 (114th Congress), Illinois|144479
Congressional District 26 (114th Congress), New York|144823
Congressional District 9 (114th Congress), New York|145048
Congressional District 4 (114th Congress), Oregon|145509
Congressional District 22 (114th Congress), California|146164
Congressional District 1 (114th Congress), Missouri|146184
Congressional District 8 (114th Congress), Georgia|146954
Congressional District 4 (114th Congress), North Carolina|146998
Congressional District (at Large) (114th Congress), Montana|147287
Congressional District 12 (114th Congress), Georgia|148012
Congressional District 5 (114th Congress), Georgia|148879
Congressional District 44 (114th Congress), California|149186
Congressional District 4 (114th Congress), Arkansas|149320
Congressional District 1 (114th Congress), Arizona|150843
Congressional District 29 (114th Congress), California|150982
Congressional District 8 (114th Congress), California|151851
Congressional District 43 (114th Congress), California|152651
Congressional District 36 (114th Congress), California|153152
Congressional District 14 (114th Congress), Florida|153447
Congressional District 2 (114th Congress), New Mexico|154021
Congressional District 6 (114th Congress), California|154807
Congressional District 9 (114th Congress), Texas|155661
Congressional District 6 (114th Congress), South Carolina|156066
Congressional District 3 (114th Congress), Virginia|157996
Congressional District 4 (114th Congress), Mississippi|158141
Congressional District 1 (114th Congress), Pennsylvania|161897
Congressional District 7 (114th Congress), Illinois|162249
Congressional District 4 (114th Congress), Louisiana|162672
Congressional District 1 (114th Congress), Nevada|163533
Congressional District 35 (114th Congress), Texas|167628
Congressional District 8 (114th Congress), New York|167726
Congressional District 4 (114th Congress), Wisconsin|168485
Congressional District 9 (114th Congress), Tennessee|170340
Congressional District 20 (114th Congress), Florida|170534
Congressional District 40 (114th Congress), California|171497
Congressional District 51 (114th Congress), California|171748
Congressional District 3 (114th Congress), Arizona|171955
Congressional District 5 (114th Congress), Louisiana|172390
Congressional District 14 (114th Congress), Michigan|172461
Congressional District 3 (114th Congress), Ohio|172817
Congressional District 7 (114th Congress), Indiana|174070
Congressional District 18 (114th Congress), Texas|175824
Congressional District 24 (114th Congress), Florida|176502
Congressional District 5 (114th Congress), Florida|177190
Congressional District 30 (114th Congress), Texas|177452
Congressional District 1 (114th Congress), North Carolina|178027
Congressional District 2 (114th Congress), Georgia|178990
Congressional District 11 (114th Congress), Ohio|180750
Congressional District 7 (114th Congress), Alabama|181182
Congressional District 12 (114th Congress), North Carolina|181290
Congressional District 33 (114th Congress), Texas|181573
Congressional District 28 (114th Congress), Texas|183885
Congressional District 2 (114th Congress), Louisiana|184592
Congressional District 34 (114th Congress), California|190707
Congressional District 2 (114th Congress), Pennsylvania|192336
Congressional District 29 (114th Congress), Texas|192699
Congressional District 5 (114th Congress), Kentucky|197179
Congressional District 7 (114th Congress), New York|202237
Congressional District 21 (114th Congress), California|204517
Congressional District 15 (114th Congress), Texas|206261
Congressional District 2 (114th Congress), Mississippi|209052
Congressional District 34 (114th Congress), Texas|209455
Congressional District 13 (114th Congress), New York|215695
Congressional District 13 (114th Congress), Michigan|216202
Congressional District 16 (114th Congress), California|221505
Congressional District 7 (114th Congress), Arizona|247030
Congressional District 15 (114th Congress), New York|285896
sqlite> SELECT name, foreign_born_population
   ...> FROM states
   ...> ORDER BY foreign_born_population DESC;
California|10688336
Texas|4671295
New York|4530087
Florida|4086240
New Jersey|1977325
Illinois|1826156
Massachusetts|1095953
Georgia|1023717
Virginia|1018626
Washington|980158
Arizona|914400
Maryland|911582
Pennsylvania|837159
North Carolina|794684
Michigan|652090
Nevada|558170
Colorado|537066
Connecticut|519648
Ohio|503911
Minnesota|457185
Oregon|397293
Tennessee|331570
Indiana|321308
Wisconsin|278981
Hawaii|253414
Utah|244467
Missouri|242761
Oklahoma|235350
South Carolina|232749
Kansas|205720
New Mexico|196955
Louisiana|186369
Alabama|169972
Kentucky|157336
Iowa|148721
Arkansas|142841
Rhode Island|142324
Nebraska|128390
District of Columbia|95117
Idaho|94364
Delaware|87509
New Hampshire|79959
Mississippi|72258
Alaska|58544
Maine|44694
West Virginia|29522
North Dakota|28649
Vermont|28247
South Dakota|27845
Wyoming|21999
Montana|21356
Puerto Rico|
sqlite> .exit