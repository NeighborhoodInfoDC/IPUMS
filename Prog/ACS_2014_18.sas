/**************************************************************************
 Program:  ACS_<year>.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Eleanor Noble
 Created:  04/07/2020
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Read IPUMS 2014-2018 ACS data and create data sets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 L:\Libraries\IPUMS\Raw\usa_data_00002.dat

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;  ** Uncomment for testing **;

** Location of input data sets **;

libname indat "L:\Libraries\IPUMS\Raw\usa_data_00002.dat>";

%let input_data_sets = usa_data_00002;

** File year **;

%let yr = 2018;

%let revisions = New file.;  ** Default is New file. Change if updating an existing data set. **;

%let yr_dash = %sysfunc( tranwrd( &yr, _, - ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

data ACS_&yr._DC ACS_&yr._MD ACS_&yr._VA ACS_&yr._WV;

  merge &input_data_sets;
  by serial pernum;
  
  format
    /**** COPY FORMAT STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/
  ;
  data IPUMS.usa_00002;
infile ASCIIDAT pad missover lrecl=1588;

input
  YEAR          1-4
  MULTYEAR      5-8
  SAMPLE        9-14
  SERIAL        15-22
  CBSERIAL      23-35
  NUMPREC       36-37
  SUBSAMP       38-39
  HHWT          40-49 .2
  HHTYPE        50-50
  REPWT         51-51
  CLUSTER       52-64
  ADJUST        65-71 .6
  CPI99         72-76 .3
  REGION        77-78
  STATEICP      79-80
  STATEFIP      81-82
  COUNTYICP     83-86
  COUNTYFIP     87-89
  DENSITY       90-96 .1
  METRO         97-97
  MET2013       98-102
  MET2013ERR    103-103
  METPOP10      104-111
  CITY          112-115
  CITYERR       116-116
  PUMA          117-121
  STRATA        122-133
  CPUMA0010     134-137
  HOMELAND      138-138
  CNTRY         139-141
  GQ            142-142
  GQTYPE        143-143
  GQTYPED       144-146
  FARM          147-147
  OWNERSHP      148-148
  OWNERSHPD     149-150
  MORTGAGE      151-151
  MORTGAG2      152-152
  COMMUSE       153-153
  FARMPROD      154-154
  ACREHOUS      155-155
  MORTAMT1      156-160
  MORTAMT2      161-164
  TAXINCL       165-165
  INSINCL       166-166
  PROPINSR      167-170
  PROPTX99      171-172
  OWNCOST       173-177
  RENT          178-181
  RENTGRS       182-185
  RENTMEAL      186-186
  CONDOFEE      187-190
  MOBLHOME      191-195
  COSTELEC      196-199
  COSTGAS       200-203
  COSTWATR      204-207
  COSTFUEL      208-211
  HHINCOME      212-218
  FOODSTMP      219-219
  VALUEH        220-226
  LINGISOL      227-227
  VACANCY       228-228
  KITCHEN       229-229
  FRIDGE        230-230
  SINK          231-231
  STOVE         232-232
  ROOMS         233-234
  PLUMBING      235-236
  HOTWATER      237-237
  SHOWER        238-238
  TOILET        239-239
  BUILTYR2      240-241
  UNITSSTR      242-243
  BEDROOMS      244-245
  PHONE         246-246
  FUELHEAT      247-247
  VEHICLES      248-248
  SSMC          249-249
  NFAMS         250-251
  NSUBFAM       252-252
  NCOUPLES      253-253
  NMOTHERS      254-254
  NFATHERS      255-255
  MULTGEN       256-256
  MULTGEND      257-258
  CBNSUBFAM     259-259
  REPWT1        260-265
  REPWT2        266-271
  REPWT3        272-277
  REPWT4        278-283
  REPWT5        284-289
  REPWT6        290-295
  REPWT7        296-301
  REPWT8        302-307
  REPWT9        308-313
  REPWT10       314-319
  REPWT11       320-325
  REPWT12       326-331
  REPWT13       332-337
  REPWT14       338-343
  REPWT15       344-349
  REPWT16       350-355
  REPWT17       356-361
  REPWT18       362-367
  REPWT19       368-373
  REPWT20       374-379
  REPWT21       380-385
  REPWT22       386-391
  REPWT23       392-397
  REPWT24       398-403
  REPWT25       404-409
  REPWT26       410-415
  REPWT27       416-421
  REPWT28       422-427
  REPWT29       428-433
  REPWT30       434-439
  REPWT31       440-445
  REPWT32       446-451
  REPWT33       452-457
  REPWT34       458-463
  REPWT35       464-469
  REPWT36       470-475
  REPWT37       476-481
  REPWT38       482-487
  REPWT39       488-493
  REPWT40       494-499
  REPWT41       500-505
  REPWT42       506-511
  REPWT43       512-517
  REPWT44       518-523
  REPWT45       524-529
  REPWT46       530-535
  REPWT47       536-541
  REPWT48       542-547
  REPWT49       548-553
  REPWT50       554-559
  REPWT51       560-565
  REPWT52       566-571
  REPWT53       572-577
  REPWT54       578-583
  REPWT55       584-589
  REPWT56       590-595
  REPWT57       596-601
  REPWT58       602-607
  REPWT59       608-613
  REPWT60       614-619
  REPWT61       620-625
  REPWT62       626-631
  REPWT63       632-637
  REPWT64       638-643
  REPWT65       644-649
  REPWT66       650-655
  REPWT67       656-661
  REPWT68       662-667
  REPWT69       668-673
  REPWT70       674-679
  REPWT71       680-685
  REPWT72       686-691
  REPWT73       692-697
  REPWT74       698-703
  REPWT75       704-709
  REPWT76       710-715
  REPWT77       716-721
  REPWT78       722-727
  REPWT79       728-733
  REPWT80       734-739
  RESPMODE      740-740
  PERNUM        741-744
  CBPERNUM      745-746
  PERWT         747-756 .2
  SLWT          757-766 .2
  REPWTP        767-767
  FAMUNIT       768-769
  FAMSIZE       770-771
  SUBFAM        772-772
  SFTYPE        773-773
  SFRELATE      774-774
  CBSUBFAM      775-775
  CBSFTYPE      776-776
  CBSFRELATE    777-777
  MOMLOC        778-779
  STEPMOM       780-780
  MOMRULE       781-782
  POPLOC        783-784
  STEPPOP       785-785
  POPRULE       786-787
  SPLOC         788-789
  SPRULE        790-791
  MOMLOC2       792-793
  MOM2RULE      794-795
  POPLOC2       796-797
  POP2RULE      798-799
  NCHILD        800-800
  NCHLT5        801-801
  NSIBS         802-802
  ELDCH         803-804
  YNGCH         805-806
  RELATE        807-808
  RELATED       809-812
  SEX           813-813
  AGE           814-816
  BIRTHQTR      817-817
  MARST         818-818
  BIRTHYR       819-822
  MARRNO        823-823
  MARRINYR      824-824
  YRMARR        825-828
  DIVINYR       829-829
  WIDINYR       830-830
  FERTYR        831-831
  RACE          832-832
  RACED         833-835
  HISPAN        836-836
  HISPAND       837-839
  BPL           840-842
  BPLD          843-847
  ANCESTR1      848-850
  ANCESTR1D     851-854
  ANCESTR2      855-857
  ANCESTR2D     858-861
  CITIZEN       862-862
  YRNATUR       863-866
  YRIMMIG       867-870
  YRSUSA1       871-872
  YRSUSA2       873-873
  LANGUAGE      874-875
  LANGUAGED     876-879
  SPEAKENG      880-880
  TRIBE         881-884
  TRIBED        885-890
  RACAMIND      891-891
  RACASIAN      892-892
  RACBLK        893-893
  RACPACIS      894-894
  RACWHT        895-895
  RACOTHER      896-896
  RACNUM        897-897
  HCOVANY       898-898
  HCOVPRIV      899-899
  HINSEMP       900-900
  HINSPUR       901-901
  HINSTRI       902-902
  HCOVPUB       903-903
  HINSCAID      904-904
  HINSCARE      905-905
  HINSVA        906-906
  HINSIHS       907-907
  HCOVANY2      908-908
  HCOVPRIV2     909-909
  HINSEMP2      910-910
  HINSPUR2      911-911
  HINSTRI2      912-912
  HCOVPUB2      913-913
  HINSCAID2     914-914
  HINSCARE2     915-915
  HINSVA2       916-916
  HINSIHS2      917-917
  SCHOOL        918-918
  EDUC          919-920
  EDUCD         921-923
  GRADEATT      924-924
  GRADEATTD     925-926
  SCHLTYPE      927-927
  DEGFIELD      928-929
  DEGFIELDD     930-933
  DEGFIELD2     934-935
  DEGFIELD2D    936-939
  EMPSTAT       940-940
  EMPSTATD      941-942
  LABFORCE      943-943
  OCC           944-947
  IND           948-951
  CLASSWKR      952-952
  CLASSWKRD     953-954
  WKSWORK2      955-955
  UHRSWORK      956-957
  WRKLSTWK      958-958
  ABSENT        959-959
  LOOKING       960-960
  AVAILBLE      961-961
  WRKRECAL      962-962
  WORKEDYR      963-963
  INCTOT        964-970
  FTOTINC       971-977
  INCWAGE       978-983
  INCBUS00      984-989
  INCSS         990-994
  INCWELFR      995-999
  INCINVST      1000-1005
  INCRETIR      1006-1011
  INCSUPP       1012-1016
  INCOTHER      1017-1021
  INCEARN       1022-1028
  POVERTY       1029-1031
  MIGRATE1      1032-1032
  MIGRATE1D     1033-1034
  MIGPLAC1      1035-1037
  MIGCOUNTY1    1038-1040
  MIGMET131     1041-1045
  MIGMET13ERR   1046-1046
  MIGTYPE1      1047-1047
  MIGPUMA1      1048-1052
  MOVEDIN       1053-1053
  VETDISAB      1054-1054
  DIFFREM       1055-1055
  DIFFPHYS      1056-1056
  DIFFMOB       1057-1057
  DIFFCARE      1058-1058
  DIFFSENS      1059-1059
  DIFFEYE       1060-1060
  DIFFHEAR      1061-1061
  VETSTAT       1062-1062
  VETSTATD      1063-1064
  VET01LTR      1065-1065
  VET90X01      1066-1066
  VET75X90      1067-1067
  VETVIETN      1068-1068
  VET55X64      1069-1069
  VETKOREA      1070-1070
  VET47X50      1071-1071
  VETWWII       1072-1072
  VETOTHER      1073-1073
  PWSTATE2      1074-1075
  PWCOUNTY      1076-1078
  PWMET13       1079-1083
  PWMET13ERR    1084-1084
  PWTYPE        1085-1085
  PWPUMA00      1086-1090
  TRANWORK      1091-1092
  CARPOOL       1093-1093
  RIDERS        1094-1094
  TRANTIME      1095-1097
  DEPARTS       1098-1101
  ARRIVES       1102-1105
  GCHOUSE       1106-1106
  GCMONTHS      1107-1107
  GCRESPON      1108-1108
  REPWTP1       1109-1114
  REPWTP2       1115-1120
  REPWTP3       1121-1126
  REPWTP4       1127-1132
  REPWTP5       1133-1138
  REPWTP6       1139-1144
  REPWTP7       1145-1150
  REPWTP8       1151-1156
  REPWTP9       1157-1162
  REPWTP10      1163-1168
  REPWTP11      1169-1174
  REPWTP12      1175-1180
  REPWTP13      1181-1186
  REPWTP14      1187-1192
  REPWTP15      1193-1198
  REPWTP16      1199-1204
  REPWTP17      1205-1210
  REPWTP18      1211-1216
  REPWTP19      1217-1222
  REPWTP20      1223-1228
  REPWTP21      1229-1234
  REPWTP22      1235-1240
  REPWTP23      1241-1246
  REPWTP24      1247-1252
  REPWTP25      1253-1258
  REPWTP26      1259-1264
  REPWTP27      1265-1270
  REPWTP28      1271-1276
  REPWTP29      1277-1282
  REPWTP30      1283-1288
  REPWTP31      1289-1294
  REPWTP32      1295-1300
  REPWTP33      1301-1306
  REPWTP34      1307-1312
  REPWTP35      1313-1318
  REPWTP36      1319-1324
  REPWTP37      1325-1330
  REPWTP38      1331-1336
  REPWTP39      1337-1342
  REPWTP40      1343-1348
  REPWTP41      1349-1354
  REPWTP42      1355-1360
  REPWTP43      1361-1366
  REPWTP44      1367-1372
  REPWTP45      1373-1378
  REPWTP46      1379-1384
  REPWTP47      1385-1390
  REPWTP48      1391-1396
  REPWTP49      1397-1402
  REPWTP50      1403-1408
  REPWTP51      1409-1414
  REPWTP52      1415-1420
  REPWTP53      1421-1426
  REPWTP54      1427-1432
  REPWTP55      1433-1438
  REPWTP56      1439-1444
  REPWTP57      1445-1450
  REPWTP58      1451-1456
  REPWTP59      1457-1462
  REPWTP60      1463-1468
  REPWTP61      1469-1474
  REPWTP62      1475-1480
  REPWTP63      1481-1486
  REPWTP64      1487-1492
  REPWTP65      1493-1498
  REPWTP66      1499-1504
  REPWTP67      1505-1510
  REPWTP68      1511-1516
  REPWTP69      1517-1522
  REPWTP70      1523-1528
  REPWTP71      1529-1534
  REPWTP72      1535-1540
  REPWTP73      1541-1546
  REPWTP74      1547-1552
  REPWTP75      1553-1558
  REPWTP76      1559-1564
  REPWTP77      1565-1570
  REPWTP78      1571-1576
  REPWTP79      1577-1582
  REPWTP80      1583-1588
;

label
  YEAR        = "Census year"
  MULTYEAR    = "Actual year of survey, multi-year ACS/PRCS"
  SAMPLE      = "IPUMS sample identifier"
  SERIAL      = "Household serial number"
  CBSERIAL    = "Original Census Bureau household serial number"
  NUMPREC     = "Number of person records following"
  SUBSAMP     = "Subsample number"
  HHWT        = "Household weight"
  HHTYPE      = "Household Type"
  REPWT       = "Household replicate weights [80 variables]"
  CLUSTER     = "Household cluster for variance estimation"
  ADJUST      = "Adjustment factor, ACS/PRCS"
  CPI99       = "CPI-U adjustment factor to 1999 dollars"
  REGION      = "Census region and division"
  STATEICP    = "State (ICPSR code)"
  STATEFIP    = "State (FIPS code)"
  COUNTYICP   = "County (ICPSR code)"
  COUNTYFIP   = "County (FIPS code)"
  DENSITY     = "Population-weighted density of PUMA"
  METRO       = "Metropolitan status"
  MET2013     = "Metropolitan area (2013 OMB delineations)"
  MET2013ERR  = "Coverage error in MET2013 variable"
  METPOP10    = "Average 2010 population of 2013 metro/micro areas in PUMA"
  CITY        = "City"
  CITYERR     = "Coverage error in CITY variable"
  PUMA        = "Public Use Microdata Area"
  STRATA      = "Household strata for variance estimation"
  CPUMA0010   = "Consistent PUMA, 2000-2010"
  HOMELAND    = "American Indian, Alaska Native, or Native Hawaiian homeland area"
  CNTRY       = "Country"
  GQ          = "Group quarters status"
  GQTYPE      = "Group quarters type [general version]"
  GQTYPED     = "Group quarters type [detailed version]"
  FARM        = "Farm status"
  OWNERSHP    = "Ownership of dwelling (tenure) [general version]"
  OWNERSHPD   = "Ownership of dwelling (tenure) [detailed version]"
  MORTGAGE    = "Mortgage status"
  MORTGAG2    = "Second mortgage status"
  COMMUSE     = "Commercial use"
  FARMPROD    = "Sales of farm products"
  ACREHOUS    = "House acreage"
  MORTAMT1    = "First mortgage monthly payment"
  MORTAMT2    = "Second mortgage monthly payment"
  TAXINCL     = "Mortgage payment includes property taxes"
  INSINCL     = "Mortgage payment includes property insurance"
  PROPINSR    = "Annual property insurance cost"
  PROPTX99    = "Annual property taxes, 1990"
  OWNCOST     = "Selected monthly owner costs"
  RENT        = "Monthly contract rent"
  RENTGRS     = "Monthly gross rent"
  RENTMEAL    = "Meals included in rent"
  CONDOFEE    = "Monthly condominium fee"
  MOBLHOME    = "Annual mobile home costs"
  COSTELEC    = "Annual electricity cost"
  COSTGAS     = "Annual gas cost"
  COSTWATR    = "Annual water cost"
  COSTFUEL    = "Annual home heating fuel cost"
  HHINCOME    = "Total household income"
  FOODSTMP    = "Food stamp recipiency"
  VALUEH      = "House value"
  LINGISOL    = "Linguistic isolation"
  VACANCY     = "Vacancy status"
  KITCHEN     = "Kitchen or cooking facilities"
  FRIDGE      = "Refrigerator"
  SINK        = "Sink with faucet"
  STOVE       = "Stove or range"
  ROOMS       = "Number of rooms"
  PLUMBING    = "Plumbing facilities"
  HOTWATER    = "Hot and cold piped water"
  SHOWER      = "Bathtub or shower"
  TOILET      = "Flush toilet"
  BUILTYR2    = "Age of structure, decade"
  UNITSSTR    = "Units in structure"
  BEDROOMS    = "Number of bedrooms"
  PHONE       = "Telephone availability"
  FUELHEAT    = "Home heating fuel"
  VEHICLES    = "Vehicles available"
  SSMC        = "Same-sex married couple"
  NFAMS       = "Number of families in household"
  NSUBFAM     = "Number of subfamilies in household"
  NCOUPLES    = "Number of couples in household"
  NMOTHERS    = "Number of mothers in household"
  NFATHERS    = "Number of fathers in household"
  MULTGEN     = "Multigenerational household [general version]"
  MULTGEND    = "Multigenerational household [detailed version]"
  CBNSUBFAM   = "Number of subfamilies in household (original Census Bureau classification)"
  REPWT1      = "Household replicate weight 1"
  REPWT2      = "Household replicate weight 2"
  REPWT3      = "Household replicate weight 3"
  REPWT4      = "Household replicate weight 4"
  REPWT5      = "Household replicate weight 5"
  REPWT6      = "Household replicate weight 6"
  REPWT7      = "Household replicate weight 7"
  REPWT8      = "Household replicate weight 8"
  REPWT9      = "Household replicate weight 9"
  REPWT10     = "Household replicate weight 10"
  REPWT11     = "Household replicate weight 11"
  REPWT12     = "Household replicate weight 12"
  REPWT13     = "Household replicate weight 13"
  REPWT14     = "Household replicate weight 14"
  REPWT15     = "Household replicate weight 15"
  REPWT16     = "Household replicate weight 16"
  REPWT17     = "Household replicate weight 17"
  REPWT18     = "Household replicate weight 18"
  REPWT19     = "Household replicate weight 19"
  REPWT20     = "Household replicate weight 20"
  REPWT21     = "Household replicate weight 21"
  REPWT22     = "Household replicate weight 22"
  REPWT23     = "Household replicate weight 23"
  REPWT24     = "Household replicate weight 24"
  REPWT25     = "Household replicate weight 25"
  REPWT26     = "Household replicate weight 26"
  REPWT27     = "Household replicate weight 27"
  REPWT28     = "Household replicate weight 28"
  REPWT29     = "Household replicate weight 29"
  REPWT30     = "Household replicate weight 30"
  REPWT31     = "Household replicate weight 31"
  REPWT32     = "Household replicate weight 32"
  REPWT33     = "Household replicate weight 33"
  REPWT34     = "Household replicate weight 34"
  REPWT35     = "Household replicate weight 35"
  REPWT36     = "Household replicate weight 36"
  REPWT37     = "Household replicate weight 37"
  REPWT38     = "Household replicate weight 38"
  REPWT39     = "Household replicate weight 39"
  REPWT40     = "Household replicate weight 40"
  REPWT41     = "Household replicate weight 41"
  REPWT42     = "Household replicate weight 42"
  REPWT43     = "Household replicate weight 43"
  REPWT44     = "Household replicate weight 44"
  REPWT45     = "Household replicate weight 45"
  REPWT46     = "Household replicate weight 46"
  REPWT47     = "Household replicate weight 47"
  REPWT48     = "Household replicate weight 48"
  REPWT49     = "Household replicate weight 49"
  REPWT50     = "Household replicate weight 50"
  REPWT51     = "Household replicate weight 51"
  REPWT52     = "Household replicate weight 52"
  REPWT53     = "Household replicate weight 53"
  REPWT54     = "Household replicate weight 54"
  REPWT55     = "Household replicate weight 55"
  REPWT56     = "Household replicate weight 56"
  REPWT57     = "Household replicate weight 57"
  REPWT58     = "Household replicate weight 58"
  REPWT59     = "Household replicate weight 59"
  REPWT60     = "Household replicate weight 60"
  REPWT61     = "Household replicate weight 61"
  REPWT62     = "Household replicate weight 62"
  REPWT63     = "Household replicate weight 63"
  REPWT64     = "Household replicate weight 64"
  REPWT65     = "Household replicate weight 65"
  REPWT66     = "Household replicate weight 66"
  REPWT67     = "Household replicate weight 67"
  REPWT68     = "Household replicate weight 68"
  REPWT69     = "Household replicate weight 69"
  REPWT70     = "Household replicate weight 70"
  REPWT71     = "Household replicate weight 71"
  REPWT72     = "Household replicate weight 72"
  REPWT73     = "Household replicate weight 73"
  REPWT74     = "Household replicate weight 74"
  REPWT75     = "Household replicate weight 75"
  REPWT76     = "Household replicate weight 76"
  REPWT77     = "Household replicate weight 77"
  REPWT78     = "Household replicate weight 78"
  REPWT79     = "Household replicate weight 79"
  REPWT80     = "Household replicate weight 80"
  RESPMODE    = "Response mode"
  PERNUM      = "Person number in sample unit"
  CBPERNUM    = "Original Census Bureau person number in sample unit"
  PERWT       = "Person weight"
  SLWT        = "Sample-line weight"
  REPWTP      = "Person replicate weights [80 variables]"
  FAMUNIT     = "Family unit membership"
  FAMSIZE     = "Number of own family members in household"
  SUBFAM      = "Subfamily membership"
  SFTYPE      = "Subfamily type"
  SFRELATE    = "Relationship within subfamily"
  CBSUBFAM    = "Subfamily number (original Census Bureau classification)"
  CBSFTYPE    = "Subfamily type (original Census Bureau classification)"
  CBSFRELATE  = "Subfamily relationship (original Census Bureau classification)"
  MOMLOC      = "Mother's location in the household"
  STEPMOM     = "Probable step/adopted mother"
  MOMRULE     = "Rule for linking mother (new)"
  POPLOC      = "Father's location in the household"
  STEPPOP     = "Probable step/adopted father"
  POPRULE     = "Rule for linking father (new)"
  SPLOC       = "Spouse's location in household"
  SPRULE      = "Rule for linking spouse or partner (new)"
  MOMLOC2     = "Second mother's location in the household"
  MOM2RULE    = "Rule for linking second mother (new)"
  POPLOC2     = "Second father's location in the household"
  POP2RULE    = "Rule for linking second father (new)"
  NCHILD      = "Number of own children in the household"
  NCHLT5      = "Number of own children under age 5 in household"
  NSIBS       = "Number of own siblings in household"
  ELDCH       = "Age of eldest own child in household"
  YNGCH       = "Age of youngest own child in household"
  RELATE      = "Relationship to household head [general version]"
  RELATED     = "Relationship to household head [detailed version]"
  SEX         = "Sex"
  AGE         = "Age"
  BIRTHQTR    = "Quarter of birth"
  MARST       = "Marital status"
  BIRTHYR     = "Year of birth"
  MARRNO      = "Times married"
  MARRINYR    = "Married within the past year"
  YRMARR      = "Year married"
  DIVINYR     = "Divorced in the past year"
  WIDINYR     = "Widowed in the past year"
  FERTYR      = "Children born within the last year"
  RACE        = "Race [general version]"
  RACED       = "Race [detailed version]"
  HISPAN      = "Hispanic origin [general version]"
  HISPAND     = "Hispanic origin [detailed version]"
  BPL         = "Birthplace [general version]"
  BPLD        = "Birthplace [detailed version]"
  ANCESTR1    = "Ancestry, first response [general version]"
  ANCESTR1D   = "Ancestry, first response [detailed version]"
  ANCESTR2    = "Ancestry, second response [general version]"
  ANCESTR2D   = "Ancestry, second response [detailed version]"
  CITIZEN     = "Citizenship status"
  YRNATUR     = "Year naturalized"
  YRIMMIG     = "Year of immigration"
  YRSUSA1     = "Years in the United States"
  YRSUSA2     = "Years in the United States, intervalled"
  LANGUAGE    = "Language spoken [general version]"
  LANGUAGED   = "Language spoken [detailed version]"
  SPEAKENG    = "Speaks English"
  TRIBE       = "Tribe [general version]"
  TRIBED      = "Tribe [detailed version]"
  RACAMIND    = "Race: American Indian or Alaska Native"
  RACASIAN    = "Race: Asian"
  RACBLK      = "Race: black or African American"
  RACPACIS    = "Race: Pacific Islander"
  RACWHT      = "Race: white"
  RACOTHER    = "Race: some other race"
  RACNUM      = "Number of major race groups"
  HCOVANY     = "Any health insurance coverage"
  HCOVPRIV    = "Private health insurance coverage"
  HINSEMP     = "Health insurance through employer/union"
  HINSPUR     = "Health insurance purchased directly"
  HINSTRI     = "Health insurance through TRICARE"
  HCOVPUB     = "Public health insurance coverage"
  HINSCAID    = "Health insurance through Medicaid"
  HINSCARE    = "Health insurance through Medicare"
  HINSVA      = "Health insurance through VA"
  HINSIHS     = "Health insurance through Indian Health Services"
  HCOVANY2    = "Any health insurance coverage (original)"
  HCOVPRIV2   = "Private health insurance coverage (original)"
  HINSEMP2    = "Health insurance through employer/union (original)"
  HINSPUR2    = "Health insurance purchased directly (original)"
  HINSTRI2    = "Health insurance through TRICARE (original)"
  HCOVPUB2    = "Public health insurance coverage (original)"
  HINSCAID2   = "Health insurance through Medicaid (original)"
  HINSCARE2   = "Health insurance through Medicare (original)"
  HINSVA2     = "Health insurance through VA (original)"
  HINSIHS2    = "Health insurance through Indian Health Services (original)"
  SCHOOL      = "School attendance"
  EDUC        = "Educational attainment [general version]"
  EDUCD       = "Educational attainment [detailed version]"
  GRADEATT    = "Grade level attending [general version]"
  GRADEATTD   = "Grade level attending [detailed version]"
  SCHLTYPE    = "Public or private school"
  DEGFIELD    = "Field of degree [general version]"
  DEGFIELDD   = "Field of degree [detailed version]"
  DEGFIELD2   = "Field of degree (2) [general version]"
  DEGFIELD2D  = "Field of degree (2) [detailed version]"
  EMPSTAT     = "Employment status [general version]"
  EMPSTATD    = "Employment status [detailed version]"
  LABFORCE    = "Labor force status"
  OCC         = "Occupation"
  IND         = "Industry"
  CLASSWKR    = "Class of worker [general version]"
  CLASSWKRD   = "Class of worker [detailed version]"
  WKSWORK2    = "Weeks worked last year, intervalled"
  UHRSWORK    = "Usual hours worked per week"
  WRKLSTWK    = "Worked last week"
  ABSENT      = "Absent from work last week"
  LOOKING     = "Looking for work"
  AVAILBLE    = "Available for work"
  WRKRECAL    = "Informed of work recall"
  WORKEDYR    = "Worked last year"
  INCTOT      = "Total personal income"
  FTOTINC     = "Total family income"
  INCWAGE     = "Wage and salary income"
  INCBUS00    = "Business and farm income, 2000"
  INCSS       = "Social Security income"
  INCWELFR    = "Welfare (public assistance) income"
  INCINVST    = "Interest, dividend, and rental income"
  INCRETIR    = "Retirement income"
  INCSUPP     = "Supplementary Security Income"
  INCOTHER    = "Other income"
  INCEARN     = "Total personal earned income"
  POVERTY     = "Poverty status"
  MIGRATE1    = "Migration status, 1 year [general version]"
  MIGRATE1D   = "Migration status, 1 year [detailed version]"
  MIGPLAC1    = "State or country of residence 1 year ago"
  MIGCOUNTY1  = "County of residence 1 year ago"
  MIGMET131   = "Metropolitan area of residence 1 year ago (2013 delineations)"
  MIGMET13ERR = "Coverage error in MIGMET13 variables"
  MIGTYPE1    = "Metropolitan status 1 year ago"
  MIGPUMA1    = "PUMA of residence 1 year ago"
  MOVEDIN     = "When occupant moved into residence"
  VETDISAB    = "VA service-connected disability rating"
  DIFFREM     = "Cognitive difficulty"
  DIFFPHYS    = "Ambulatory difficulty"
  DIFFMOB     = "Independent living difficulty"
  DIFFCARE    = "Self-care difficulty"
  DIFFSENS    = "Vision or hearing difficulty"
  DIFFEYE     = "Vision difficulty"
  DIFFHEAR    = "Hearing difficulty"
  VETSTAT     = "Veteran status [general version]"
  VETSTATD    = "Veteran status [detailed version]"
  VET01LTR    = "Veteran, served 2001 or later"
  VET90X01    = "Veteran, served 1990-2001"
  VET75X90    = "Veteran, served May 1975 to July 1990"
  VETVIETN    = "Veteran, served during Vietnam era"
  VET55X64    = "Veteran, served 1955 to 1964"
  VETKOREA    = "Veteran, served during Korean conflict era"
  VET47X50    = "Veteran, served 1947-1950"
  VETWWII     = "Veteran, served during WWII era"
  VETOTHER    = "Veteran of other period"
  PWSTATE2    = "Place of work: state"
  PWCOUNTY    = "Place of work: county"
  PWMET13     = "Place of work: metropolitan area (2013 delineations)"
  PWMET13ERR  = "Coverage error in PWMET13 variable"
  PWTYPE      = "Place of work: metropolitan status"
  PWPUMA00    = "Place of work: PUMA, 2000 onward"
  TRANWORK    = "Means of transportation to work"
  CARPOOL     = "Carpooling"
  RIDERS      = "Vehicle occupancy"
  TRANTIME    = "Travel time to work"
  DEPARTS     = "Time of departure for work"
  ARRIVES     = "Time of arrival at work"
  GCHOUSE     = "Own grandchildren living in household"
  GCMONTHS    = "Months responsible for grandchildren"
  GCRESPON    = "Responsible for grandchildren"
  REPWTP1     = "Person replicate weight 1"
  REPWTP2     = "Person replicate weight 2"
  REPWTP3     = "Person replicate weight 3"
  REPWTP4     = "Person replicate weight 4"
  REPWTP5     = "Person replicate weight 5"
  REPWTP6     = "Person replicate weight 6"
  REPWTP7     = "Person replicate weight 7"
  REPWTP8     = "Person replicate weight 8"
  REPWTP9     = "Person replicate weight 9"
  REPWTP10    = "Person replicate weight 10"
  REPWTP11    = "Person replicate weight 11"
  REPWTP12    = "Person replicate weight 12"
  REPWTP13    = "Person replicate weight 13"
  REPWTP14    = "Person replicate weight 14"
  REPWTP15    = "Person replicate weight 15"
  REPWTP16    = "Person replicate weight 16"
  REPWTP17    = "Person replicate weight 17"
  REPWTP18    = "Person replicate weight 18"
  REPWTP19    = "Person replicate weight 19"
  REPWTP20    = "Person replicate weight 20"
  REPWTP21    = "Person replicate weight 21"
  REPWTP22    = "Person replicate weight 22"
  REPWTP23    = "Person replicate weight 23"
  REPWTP24    = "Person replicate weight 24"
  REPWTP25    = "Person replicate weight 25"
  REPWTP26    = "Person replicate weight 26"
  REPWTP27    = "Person replicate weight 27"
  REPWTP28    = "Person replicate weight 28"
  REPWTP29    = "Person replicate weight 29"
  REPWTP30    = "Person replicate weight 30"
  REPWTP31    = "Person replicate weight 31"
  REPWTP32    = "Person replicate weight 32"
  REPWTP33    = "Person replicate weight 33"
  REPWTP34    = "Person replicate weight 34"
  REPWTP35    = "Person replicate weight 35"
  REPWTP36    = "Person replicate weight 36"
  REPWTP37    = "Person replicate weight 37"
  REPWTP38    = "Person replicate weight 38"
  REPWTP39    = "Person replicate weight 39"
  REPWTP40    = "Person replicate weight 40"
  REPWTP41    = "Person replicate weight 41"
  REPWTP42    = "Person replicate weight 42"
  REPWTP43    = "Person replicate weight 43"
  REPWTP44    = "Person replicate weight 44"
  REPWTP45    = "Person replicate weight 45"
  REPWTP46    = "Person replicate weight 46"
  REPWTP47    = "Person replicate weight 47"
  REPWTP48    = "Person replicate weight 48"
  REPWTP49    = "Person replicate weight 49"
  REPWTP50    = "Person replicate weight 50"
  REPWTP51    = "Person replicate weight 51"
  REPWTP52    = "Person replicate weight 52"
  REPWTP53    = "Person replicate weight 53"
  REPWTP54    = "Person replicate weight 54"
  REPWTP55    = "Person replicate weight 55"
  REPWTP56    = "Person replicate weight 56"
  REPWTP57    = "Person replicate weight 57"
  REPWTP58    = "Person replicate weight 58"
  REPWTP59    = "Person replicate weight 59"
  REPWTP60    = "Person replicate weight 60"
  REPWTP61    = "Person replicate weight 61"
  REPWTP62    = "Person replicate weight 62"
  REPWTP63    = "Person replicate weight 63"
  REPWTP64    = "Person replicate weight 64"
  REPWTP65    = "Person replicate weight 65"
  REPWTP66    = "Person replicate weight 66"
  REPWTP67    = "Person replicate weight 67"
  REPWTP68    = "Person replicate weight 68"
  REPWTP69    = "Person replicate weight 69"
  REPWTP70    = "Person replicate weight 70"
  REPWTP71    = "Person replicate weight 71"
  REPWTP72    = "Person replicate weight 72"
  REPWTP73    = "Person replicate weight 73"
  REPWTP74    = "Person replicate weight 74"
  REPWTP75    = "Person replicate weight 75"
  REPWTP76    = "Person replicate weight 76"
  REPWTP77    = "Person replicate weight 77"
  REPWTP78    = "Person replicate weight 78"
  REPWTP79    = "Person replicate weight 79"
  REPWTP80    = "Person replicate weight 80"
;
format
  YEAR         YEAR_f.
  SAMPLE       SAMPLE_f.
  NUMPREC      NUMPREC_f.
  SUBSAMP      SUBSAMP_f.
  HHTYPE       HHTYPE_f.
  REGION       REGION_f.
  STATEICP     STATEICP_f.
  STATEFIP     STATEFIP_f.
  METRO        METRO_f.
  MET2013      MET2013_f.
  MET2013ERR   MET2013ERR_f.
  CITY         CITY_f.
  CITYERR      CITYERR_f.
  HOMELAND     HOMELAND_f.
  CNTRY        CNTRY_f.
  GQ           GQ_f.
  GQTYPE       GQTYPE_f.
  GQTYPED      GQTYPED_f.
  FARM         FARM_f.
  OWNERSHP     OWNERSHP_f.
  OWNERSHPD    OWNERSHPD_f.
  MORTGAGE     MORTGAGE_f.
  MORTGAG2     MORTGAG2_f.
  COMMUSE      COMMUSE_f.
  ACREHOUS     ACREHOUS_f.
  TAXINCL      TAXINCL_f.
  INSINCL      INSINCL_f.
  PROPTX99     PROPTX99_f.
  RENTMEAL     RENTMEAL_f.
  FOODSTMP     FOODSTMP_f.
  LINGISOL     LINGISOL_f.
  VACANCY      VACANCY_f.
  KITCHEN      KITCHEN_f.
  FRIDGE       FRIDGE_f.
  SINK         SINK_f.
  STOVE        STOVE_f.
  ROOMS        ROOMS_f.
  PLUMBING     PLUMBING_f.
  HOTWATER     HOTWATER_f.
  SHOWER       SHOWER_f.
  TOILET       TOILET_f.
  BUILTYR2     BUILTYR2_f.
  UNITSSTR     UNITSSTR_f.
  BEDROOMS     BEDROOMS_f.
  PHONE        PHONE_f.
  FUELHEAT     FUELHEAT_f.
  VEHICLES     VEHICLES_f.
  SSMC         SSMC_f.
  NFAMS        NFAMS_f.
  NSUBFAM      NSUBFAM_f.
  NCOUPLES     NCOUPLES_f.
  NMOTHERS     NMOTHERS_f.
  NFATHERS     NFATHERS_f.
  MULTGEN      MULTGEN_f.
  MULTGEND     MULTGEND_f.
  CBNSUBFAM    CBNSUBFAM_f.
  RESPMODE     RESPMODE_f.
  FAMUNIT      FAMUNIT_f.
  FAMSIZE      FAMSIZE_f.
  SUBFAM       SUBFAM_f.
  SFTYPE       SFTYPE_f.
  SFRELATE     SFRELATE_f.
  CBSUBFAM     CBSUBFAM_f.
  CBSFTYPE     CBSFTYPE_f.
  CBSFRELATE   CBSFRELATE_f.
  STEPMOM      STEPMOM_f.
  MOMRULE      MOMRULE_f.
  STEPPOP      STEPPOP_f.
  POPRULE      POPRULE_f.
  SPRULE       SPRULE_f.
  MOM2RULE     MOM2RULE_f.
  POP2RULE     POP2RULE_f.
  NCHILD       NCHILD_f.
  NCHLT5       NCHLT5_f.
  NSIBS        NSIBS_f.
  ELDCH        ELDCH_f.
  YNGCH        YNGCH_f.
  RELATE       RELATE_f.
  RELATED      RELATED_f.
  SEX          SEX_f.
  AGE          AGE_f.
  BIRTHQTR     BIRTHQTR_f.
  MARST        MARST_f.
  MARRNO       MARRNO_f.
  MARRINYR     MARRINYR_f.
  DIVINYR      DIVINYR_f.
  WIDINYR      WIDINYR_f.
  FERTYR       FERTYR_f.
  RACE         RACE_f.
  RACED        RACED_f.
  HISPAN       HISPAN_f.
  HISPAND      HISPAND_f.
  BPL          BPL_f.
  BPLD         BPLD_f.
  ANCESTR1     ANCESTR1_f.
  ANCESTR1D    ANCESTR1D_f.
  ANCESTR2     ANCESTR2_f.
  ANCESTR2D    ANCESTR2D_f.
  CITIZEN      CITIZEN_f.
  YRNATUR      YRNATUR_f.
  YRIMMIG      YRIMMIG_f.
  YRSUSA1      YRSUSA1_f.
  YRSUSA2      YRSUSA2_f.
  LANGUAGE     LANGUAGE_f.
  LANGUAGED    LANGUAGED_f.
  SPEAKENG     SPEAKENG_f.
  TRIBE        TRIBE_f.
  TRIBED       TRIBED_f.
  RACAMIND     RACAMIND_f.
  RACASIAN     RACASIAN_f.
  RACBLK       RACBLK_f.
  RACPACIS     RACPACIS_f.
  RACWHT       RACWHT_f.
  RACOTHER     RACOTHER_f.
  RACNUM       RACNUM_f.
  HCOVANY      HCOVANY_f.
  HCOVPRIV     HCOVPRIV_f.
  HINSEMP      HINSEMP_f.
  HINSPUR      HINSPUR_f.
  HINSTRI      HINSTRI_f.
  HCOVPUB      HCOVPUB_f.
  HINSCAID     HINSCAID_f.
  HINSCARE     HINSCARE_f.
  HINSVA       HINSVA_f.
  HINSIHS      HINSIHS_f.
  HCOVANY2     HCOVANY2_f.
  HCOVPRIV2    HCOVPRIV2_f.
  HINSEMP2     HINSEMP2_f.
  HINSPUR2     HINSPUR2_f.
  HINSTRI2     HINSTRI2_f.
  HCOVPUB2     HCOVPUB2_f.
  HINSCAID2    HINSCAID2_f.
  HINSCARE2    HINSCARE2_f.
  HINSVA2      HINSVA2_f.
  HINSIHS2     HINSIHS2_f.
  SCHOOL       SCHOOL_f.
  EDUC         EDUC_f.
  EDUCD        EDUCD_f.
  GRADEATT     GRADEATT_f.
  GRADEATTD    GRADEATTD_f.
  SCHLTYPE     SCHLTYPE_f.
  DEGFIELD     DEGFIELD_f.
  DEGFIELDD    DEGFIELDD_f.
  DEGFIELD2    DEGFIELD2_f.
  DEGFIELD2D   DEGFIELD2D_f.
  EMPSTAT      EMPSTAT_f.
  EMPSTATD     EMPSTATD_f.
  LABFORCE     LABFORCE_f.
  CLASSWKR     CLASSWKR_f.
  CLASSWKRD    CLASSWKRD_f.
  WKSWORK2     WKSWORK2_f.
  UHRSWORK     UHRSWORK_f.
  WRKLSTWK     WRKLSTWK_f.
  ABSENT       ABSENT_f.
  LOOKING      LOOKING_f.
  AVAILBLE     AVAILBLE_f.
  WRKRECAL     WRKRECAL_f.
  WORKEDYR     WORKEDYR_f.
  MIGRATE1     MIGRATE1_f.
  MIGRATE1D    MIGRATE1D_f.
  MIGPLAC1     MIGPLAC1_f.
  MIGMET131    MIGMET131_f.
  MIGMET13ERR  MIGMET13ERR_f.
  MIGTYPE1     MIGTYPE1_f.
  VETDISAB     VETDISAB_f.
  DIFFREM      DIFFREM_f.
  DIFFPHYS     DIFFPHYS_f.
  DIFFMOB      DIFFMOB_f.
  DIFFCARE     DIFFCARE_f.
  DIFFSENS     DIFFSENS_f.
  DIFFEYE      DIFFEYE_f.
  DIFFHEAR     DIFFHEAR_f.
  VETSTAT      VETSTAT_f.
  VETSTATD     VETSTATD_f.
  VET01LTR     VET01LTR_f.
  VET90X01     VET90X01_f.
  VET75X90     VET75X90_f.
  VETVIETN     VETVIETN_f.
  VET55X64     VET55X64_f.
  VETKOREA     VETKOREA_f.
  VET47X50     VET47X50_f.
  VETWWII      VETWWII_f.
  VETOTHER     VETOTHER_f.
  PWSTATE2     PWSTATE2_f.
  PWMET13      PWMET13_f.
  PWMET13ERR   PWMET13ERR_f.
  PWTYPE       PWTYPE_f.
  TRANWORK     TRANWORK_f.
  CARPOOL      CARPOOL_f.
  RIDERS       RIDERS_f.
  GCHOUSE      GCHOUSE_f.
  GCMONTHS     GCMONTHS_f.
  GCRESPON     GCRESPON_f.
;

format
  CBSERIAL     13.
  HHWT         11.2
  CLUSTER      13.
  STRATA       12.
  PERWT        11.2
  SLWT         11.2
;

run;
  *** UI-created format for race Yes/No vars. ***;
  format racamind racasian racblk racother racpacis racwht uracyn.;

  ** Create unique PUMA ID **;

  %upuma() 
  
  ** Recode n/a values **;
  
  array inca{*}  incwage incbus00 incretir incinvst  ;

  do i = 1 to dim( inca );
    if inca{i} = 999999 then inca{i} = .n;
  end;

  array incb{*} incss incwelfr incsupp incother owncost;

  do i = 1 to dim( incb );
    if incb{i} = 99999 then incb{i} = .n;
  end;

  array incc{*} ftotinc hhincome inctot valueh;

  do i = 1 to dim( incc );
    if incc{i} = 9999999 then incc{i} = .n;
  end;

  ** Utility cost codes 9993-9998 indicate no charge, not used, or costs included in rent/condo fee **;

  array incd{*} costelec costgas costfuel costwatr;
  
  do i = 1 to dim( incd );
    if incd{i} >= 9992 then incd{i} = .n;
  end;
  
  ** 2-digit N/A codes **;
  
  array ince{*} eldch yngch;
  
  do i = 1 to dim( ince );
    if ince{i} = 99 then ince{i} = .n;
  end;
  
  ** yrnatur **;
  
  array incf{*} yrnatur;
  
  do i = 1 to dim( incf );
    if incf{i} >= 9997 then incf{i} = .n;
  end;
  
  ** Earnings, education, and occupational status scores **;
  
  array incg{*} erscor50 erscor90 edscor50 edscor90 npboss50 npboss90;
  
  do i = 1 to dim( incg );
    if incg{i} = 999.9 then incg{i} = .n;
  end;
  
  ** HUD income categories **;
  
  %hud_inc_all()

  ** Output files by state **;
  
  select ( statefip );
    when( &FIPS_DC ) output ACS_&yr._DC;
    when( &FIPS_MD ) output ACS_&yr._MD;
    when( &FIPS_VA ) output ACS_&yr._VA;
    when( &FIPS_WV ) output ACS_&yr._WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
    end;
  end;
  
  drop i;

run;


** Finalize data sets **;

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._DC,
  out=ACS_&yr._DC,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., DC",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._MD,
  out=ACS_&yr._MD,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., MD",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._VA,
  out=ACS_&yr._VA,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., VA",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._WV,
  out=ACS_&yr._WV,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., WV",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)


title2 '** Unrecoded special values check **';
title3 '** Check maximum value of each variable. Should not be 999...9. **';

proc means data=ACS_&yr._DC n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._MD n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._VA n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._WV n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

title2;

