/**************************************************************************
 Program:  ACS_2019_23.sas
 Library:  Ipums
 Project:  Urban-Greater DC
 Author:   Nina Veronica Russell
 Created:  04/23/2025
 Version:  SAS 9.4
 Environment:  Windows
 
 Description:  Read IPUMS <year> ACS data and create data sets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 L:\Libraries\IPUMS\Raw\<list downloaded files here>

 Modifications:
**************************************************************************/

%include "\\sas1\DCdata\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS )

*options obs=100;  ** Uncomment for testing **;

** Location of input data sets **;

libname indat "\\sas1\DCDATA\Libraries\IPUMS\Raw\ACS 2019-23\5 year";

%let input_data_sets = usa_00001;

** File year **;

%let yr = 2019_23;

%let revisions = New file.;  ** Default is New file. Change if updating an existing data set. **;

%let yr_dash = %sysfunc( tranwrd( &yr, _, - ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

/* Added this code b/c otherwise formats wouldn't be found*/


data ACS_&yr._DC ACS_&yr._MD ACS_&yr._VA ACS_&yr._WV;

  set indat.usa_00001;



    /**** COPY FORMAT STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/
infile ASCIIDAT pad missover lrecl=1728;

input
  YEAR          1-4
  MULTYEAR      5-8
  SAMPLE        9-14
  SERIAL        15-22
  CBSERIAL      23-35
  NUMPREC       36-37
  SUBSAMP       38-39
  HHWT          40-49 .2
  EXPWTH        50-54
  HHTYPE        55-55
  CBHHTYPE      56-57
  REPWT         58-58
  CLUSTER       59-71
  ADJUST        72-78 .6
  CPI99         79-83 .3
  REGION        84-85
  STATEICP      86-87
  STATEFIP      88-89
  COUNTYICP     90-93
  COUNTYFIP     94-96
  PUMA          97-101
  DENSITY       102-108 .1
  METRO         109-109
  PCTMETRO      110-114 .2
  MET2013       115-119
  MET2013ERR    120-120
  MET2023       121-125
  MET2023ERR    126-126
  METPOP10      127-134
  CITY          135-138
  CITYERR       139-139
  CITYPOP       140-146
  HOMELAND      147-147
  STRATA        148-159
  CNTRY         160-162
  GQ            163-163
  GQTYPE        164-164
  GQTYPED       165-167
  FARM          168-168
  OWNERSHP      169-169
  OWNERSHPD     170-171
  MORTGAGE      172-172
  MORTGAG2      173-173
  FARMPROD      174-174
  ACREHOUS      175-175
  MORTAMT1      176-180
  MORTAMT2      181-184
  TAXINCL       185-185
  INSINCL       186-186
  PROPINSR      187-190
  PROPTX99      191-192
  OWNCOST       193-197
  RENT          198-201
  RENTGRS       202-206
  RENTMEAL      207-207
  CONDOFEE      208-211
  MOBLHOME      212-216
  COSTELEC      217-220
  COSTGAS       221-224
  COSTWATR      225-228
  COSTFUEL      229-232
  HHINCOME      233-239
  FOODSTMP      240-240
  VALUEH        241-247
  LINGISOL      248-248
  VACANCY       249-249
  VACDUR        250-250
  VACOTH        251-252
  KITCHEN       253-253
  FRIDGE        254-254
  SINK          255-255
  STOVE         256-256
  ROOMS         257-258
  PLUMBING      259-260
  HOTWATER      261-261
  SHOWER        262-262
  BUILTYR2      263-264
  UNITSSTR      265-266
  BEDROOMS      267-268
  PHONE         269-269
  CINETHH       270-270
  CILAPTOP      271-271
  CISMRTPHN     272-272
  CITABLET      273-273
  CIOTHCOMP     274-274
  CIDATAPLN     275-275
  CIHISPEED     276-277
  CISAT         278-278
  CIDIAL        279-279
  CIOTHSVC      280-280
  FUELHEAT      281-281
  VEHICLES      282-282
  COUPLETYPE    283-283
  SSMC          284-284
  NFAMS         285-286
  NSUBFAM       287-287
  NCOUPLES      288-288
  NMOTHERS      289-289
  NFATHERS      290-290
  MULTGEN       291-291
  MULTGEND      292-293
  CBNSUBFAM     294-294
  REPWT1        295-300
  REPWT2        301-306
  REPWT3        307-312
  REPWT4        313-318
  REPWT5        319-324
  REPWT6        325-330
  REPWT7        331-336
  REPWT8        337-342
  REPWT9        343-348
  REPWT10       349-354
  REPWT11       355-360
  REPWT12       361-366
  REPWT13       367-372
  REPWT14       373-378
  REPWT15       379-384
  REPWT16       385-390
  REPWT17       391-396
  REPWT18       397-402
  REPWT19       403-408
  REPWT20       409-414
  REPWT21       415-420
  REPWT22       421-426
  REPWT23       427-432
  REPWT24       433-438
  REPWT25       439-444
  REPWT26       445-450
  REPWT27       451-456
  REPWT28       457-462
  REPWT29       463-468
  REPWT30       469-474
  REPWT31       475-480
  REPWT32       481-486
  REPWT33       487-492
  REPWT34       493-498
  REPWT35       499-504
  REPWT36       505-510
  REPWT37       511-516
  REPWT38       517-522
  REPWT39       523-528
  REPWT40       529-534
  REPWT41       535-540
  REPWT42       541-546
  REPWT43       547-552
  REPWT44       553-558
  REPWT45       559-564
  REPWT46       565-570
  REPWT47       571-576
  REPWT48       577-582
  REPWT49       583-588
  REPWT50       589-594
  REPWT51       595-600
  REPWT52       601-606
  REPWT53       607-612
  REPWT54       613-618
  REPWT55       619-624
  REPWT56       625-630
  REPWT57       631-636
  REPWT58       637-642
  REPWT59       643-648
  REPWT60       649-654
  REPWT61       655-660
  REPWT62       661-666
  REPWT63       667-672
  REPWT64       673-678
  REPWT65       679-684
  REPWT66       685-690
  REPWT67       691-696
  REPWT68       697-702
  REPWT69       703-708
  REPWT70       709-714
  REPWT71       715-720
  REPWT72       721-726
  REPWT73       727-732
  REPWT74       733-738
  REPWT75       739-744
  REPWT76       745-750
  REPWT77       751-756
  REPWT78       757-762
  REPWT79       763-768
  REPWT80       769-774
  RESPMODE      775-775
  PERNUM        776-779
  CBPERNUM      780-781
  PERWT         782-791 .2
  EXPWTP        792-796
  SLWT          797-806 .2
  REPWTP        807-807
  FAMUNIT       808-809
  FAMSIZE       810-811
  SUBFAM        812-812
  SFTYPE        813-813
  SFRELATE      814-814
  CBSUBFAM      815-815
  CBSFTYPE      816-816
  CBSFRELATE    817-817
  MOMLOC        818-819
  MOMRULE       820-821
  POPLOC        822-823
  POPRULE       824-825
  SPLOC         826-827
  SPRULE        828-829
  MOMLOC2       830-831
  MOM2RULE      832-833
  POPLOC2       834-835
  POP2RULE      836-837
  NCHILD        838-838
  NCHLT5        839-839
  NSIBS         840-840
  ELDCH         841-842
  YNGCH         843-844
  RELATE        845-846
  RELATED       847-850
  SEX           851-851
  AGE           852-854
  BIRTHQTR      855-855
  MARST         856-856
  BIRTHYR       857-860
  MARRNO        861-861
  MARRINYR      862-862
  YRMARR        863-866
  DIVINYR       867-867
  WIDINYR       868-868
  FERTYR        869-869
  RACE          870-870
  RACED         871-873
  HISPAN        874-874
  HISPAND       875-877
  BPL           878-880
  BPLD          881-885
  ANCESTR1      886-888
  ANCESTR1D     889-892
  ANCESTR2      893-895
  ANCESTR2D     896-899
  CITIZEN       900-900
  YRNATUR       901-904
  YRIMMIG       905-908
  YRSUSA1       909-910
  YRSUSA2       911-911
  LANGUAGE      912-913
  LANGUAGED     914-917
  SPEAKENG      918-918
  TRIBE         919-922
  TRIBED        923-928
  RACAMIND      929-929
  RACASIAN      930-930
  RACBLK        931-931
  RACPACIS      932-932
  RACWHT        933-933
  RACOTHER      934-934
  RACNUM        935-935
  HCOVANY       936-936
  HCOVPRIV      937-937
  HINSEMP       938-938
  HINSPUR       939-939
  HINSTRI       940-940
  HCOVPUB       941-941
  HINSCAID      942-942
  HINSCARE      943-943
  HINSVA        944-944
  HINSIHS       945-945
  HCOVANY2      946-946
  HCOVPRIV2     947-947
  HINSEMP2      948-948
  HINSPUR2      949-949
  HINSTRI2      950-950
  HCOVPUB2      951-951
  HINSCAID2     952-952
  HINSCARE2     953-953
  HINSVA2       954-954
  HINSIHS2      955-955
  HCOVSUB2      956-956
  SCHOOL        957-957
  HIUFPGBASE    958-962
  HIUFPGINC     963-966
  HIURULE       967-968
  HIUPOVUNIV    969-969
  HIUHHSPOV     970-978 .4
  HIUID         979-987
  HIUNPERS      988-989
  EDUC          990-991
  EDUCD         992-994
  GRADEATT      995-995
  GRADEATTD     996-997
  SCHLTYPE      998-998
  DEGFIELD      999-1000
  DEGFIELDD     1001-1004
  DEGFIELD2     1005-1006
  DEGFIELD2D    1007-1010
  EMPSTAT       1011-1011
  EMPSTATD      1012-1013
  LABFORCE      1014-1014
  CLASSWKR      1015-1015
  CLASSWKRD     1016-1017
  OCC           1018-1021
  OCC1950       1022-1024
  OCC1990       1025-1027
  OCC2010       1028-1031
  OCCSOC      $ 1032-1037
  IND           1038-1041
  IND1950       1042-1044
  IND1990       1045-1047
  INDNAICS    $ 1048-1055
  WKSWORK1      1056-1057
  WKSWORK2      1058-1058
  UHRSWORK      1059-1060
  WRKLSTWK      1061-1061
  ABSENT        1062-1062
  LOOKING       1063-1063
  AVAILBLE      1064-1064
  WRKRECAL      1065-1065
  WORKEDYR      1066-1066
  INCTOT        1067-1073
  FTOTINC       1074-1080
  INCWAGE       1081-1086
  INCBUS00      1087-1092
  INCSS         1093-1097
  INCWELFR      1098-1102
  INCINVST      1103-1108
  INCRETIR      1109-1114
  INCSUPP       1115-1119
  INCOTHER      1120-1124
  INCEARN       1125-1131
  POVERTY       1132-1134
  OCCSCORE      1135-1136
  SEI           1137-1138
  HWSEI         1139-1142 .2
  PRESGL        1143-1145 .1
  PRENT         1146-1148 .1
  ERSCOR50      1149-1152 .1
  ERSCOR90      1153-1156 .1
  EDSCOR50      1157-1160 .1
  EDSCOR90      1161-1164 .1
  NPBOSS50      1165-1168 .1
  NPBOSS90      1169-1172 .1
  MIGRATE1      1173-1173
  MIGRATE1D     1174-1175
  MIGPLAC1      1176-1178
  MIGCOUNTY1    1179-1181
  MIGMET131     1182-1186
  MIGMET13ERR   1187-1187
  MIGPUMA1      1188-1192
  MOVEDIN       1193-1193
  VETDISAB      1194-1194
  DIFFREM       1195-1195
  DIFFPHYS      1196-1196
  DIFFMOB       1197-1197
  DIFFCARE      1198-1198
  DIFFSENS      1199-1199
  DIFFEYE       1200-1200
  DIFFHEAR      1201-1201
  VETSTAT       1202-1202
  VETSTATD      1203-1204
  VET01LTR      1205-1205
  VET90X01      1206-1206
  VET75X90      1207-1207
  VETVIETN      1208-1208
  VET55X64      1209-1209
  VETKOREA      1210-1210
  VETWWII       1211-1211
  VETOTHER      1212-1212
  VETOTHERD     1213-1214
  PWSTATE2      1215-1216
  PWCOUNTY      1217-1219
  PWMET13       1220-1224
  PWMET13ERR    1225-1225
  PWPUMA00      1226-1230
  TRANWORK      1231-1232
  CARPOOL       1233-1233
  RIDERS        1234-1234
  TRANTIME      1235-1237
  DEPARTS       1238-1241
  ARRIVES       1242-1245
  GCHOUSE       1246-1246
  GCMONTHS      1247-1247
  GCRESPON      1248-1248
  REPWTP1       1249-1254
  REPWTP2       1255-1260
  REPWTP3       1261-1266
  REPWTP4       1267-1272
  REPWTP5       1273-1278
  REPWTP6       1279-1284
  REPWTP7       1285-1290
  REPWTP8       1291-1296
  REPWTP9       1297-1302
  REPWTP10      1303-1308
  REPWTP11      1309-1314
  REPWTP12      1315-1320
  REPWTP13      1321-1326
  REPWTP14      1327-1332
  REPWTP15      1333-1338
  REPWTP16      1339-1344
  REPWTP17      1345-1350
  REPWTP18      1351-1356
  REPWTP19      1357-1362
  REPWTP20      1363-1368
  REPWTP21      1369-1374
  REPWTP22      1375-1380
  REPWTP23      1381-1386
  REPWTP24      1387-1392
  REPWTP25      1393-1398
  REPWTP26      1399-1404
  REPWTP27      1405-1410
  REPWTP28      1411-1416
  REPWTP29      1417-1422
  REPWTP30      1423-1428
  REPWTP31      1429-1434
  REPWTP32      1435-1440
  REPWTP33      1441-1446
  REPWTP34      1447-1452
  REPWTP35      1453-1458
  REPWTP36      1459-1464
  REPWTP37      1465-1470
  REPWTP38      1471-1476
  REPWTP39      1477-1482
  REPWTP40      1483-1488
  REPWTP41      1489-1494
  REPWTP42      1495-1500
  REPWTP43      1501-1506
  REPWTP44      1507-1512
  REPWTP45      1513-1518
  REPWTP46      1519-1524
  REPWTP47      1525-1530
  REPWTP48      1531-1536
  REPWTP49      1537-1542
  REPWTP50      1543-1548
  REPWTP51      1549-1554
  REPWTP52      1555-1560
  REPWTP53      1561-1566
  REPWTP54      1567-1572
  REPWTP55      1573-1578
  REPWTP56      1579-1584
  REPWTP57      1585-1590
  REPWTP58      1591-1596
  REPWTP59      1597-1602
  REPWTP60      1603-1608
  REPWTP61      1609-1614
  REPWTP62      1615-1620
  REPWTP63      1621-1626
  REPWTP64      1627-1632
  REPWTP65      1633-1638
  REPWTP66      1639-1644
  REPWTP67      1645-1650
  REPWTP68      1651-1656
  REPWTP69      1657-1662
  REPWTP70      1663-1668
  REPWTP71      1669-1674
  REPWTP72      1675-1680
  REPWTP73      1681-1686
  REPWTP74      1687-1692
  REPWTP75      1693-1698
  REPWTP76      1699-1704
  REPWTP77      1705-1710
  REPWTP78      1711-1716
  REPWTP79      1717-1722
  REPWTP80      1723-1728
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
  EXPWTH      = "Experimental housing unit weight"
  HHTYPE      = "Household Type"
  CBHHTYPE    = "Census bureau household type (with cohabiting)"
  REPWT       = "Household replicate weights [80 variables]"
  CLUSTER     = "Household cluster for variance estimation"
  ADJUST      = "Adjustment factor, ACS/PRCS"
  CPI99       = "CPI-U adjustment factor to 1999 dollars"
  REGION      = "Census region and division"
  STATEICP    = "State (ICPSR code)"
  STATEFIP    = "State (FIPS code)"
  COUNTYICP   = "County (ICPSR code, identifiable counties only)"
  COUNTYFIP   = "County (FIPS code, identifiable counties only)"
  PUMA        = "Public Use Microdata Area"
  DENSITY     = "Population-weighted density of PUMA"
  METRO       = "Metropolitan status (where determinable)"
  PCTMETRO    = "Percent of PUMA population living in metro area"
  MET2013     = "Metropolitan area (2013 delineations, identifiable areas only)"
  MET2013ERR  = "Coverage error in MET2013 variable"
  MET2023     = "Metropolitan area (2023 delineations, identifiable areas only)"
  MET2023ERR  = "Coverage error in MET2023 variable"
  METPOP10    = "Average 2010 population of 2013 metro/micro areas in PUMA"
  CITY        = "City (identifiable cities only)"
  CITYERR     = "Coverage error in CITY variable"
  CITYPOP     = "City population (identifiable cities only)"
  HOMELAND    = "American Indian, Alaska Native, or Native Hawaiian homeland area"
  STRATA      = "Household strata for variance estimation"
  CNTRY       = "Country"
  GQ          = "Group quarters status"
  GQTYPE      = "Group quarters type [general version]"
  GQTYPED     = "Group quarters type [detailed version]"
  FARM        = "Farm status"
  OWNERSHP    = "Ownership of dwelling (tenure) [general version]"
  OWNERSHPD   = "Ownership of dwelling (tenure) [detailed version]"
  MORTGAGE    = "Mortgage status"
  MORTGAG2    = "Second mortgage status"
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
  HHINCOME    = "Total household income "
  FOODSTMP    = "Food stamp recipiency"
  VALUEH      = "House value"
  LINGISOL    = "Linguistic isolation"
  VACANCY     = "Vacancy status"
  VACDUR      = "Duration of vacancy"
  VACOTH      = "Other vacancy status"
  KITCHEN     = "Kitchen or cooking facilities"
  FRIDGE      = "Refrigerator"
  SINK        = "Sink with faucet"
  STOVE       = "Stove or range"
  ROOMS       = "Number of rooms"
  PLUMBING    = "Plumbing facilities"
  HOTWATER    = "Hot and cold piped water"
  SHOWER      = "Bathtub or shower"
  BUILTYR2    = "Age of structure, decade"
  UNITSSTR    = "Units in structure"
  BEDROOMS    = "Number of bedrooms"
  PHONE       = "Telephone availability"
  CINETHH     = "Access to internet"
  CILAPTOP    = "Laptop, desktop, or notebook computer"
  CISMRTPHN   = "Smartphone"
  CITABLET    = "Tablet or other portable wireless computer"
  CIOTHCOMP   = "Other computer equipment"
  CIDATAPLN   = "Cellular data plan for a smartphone or other mobile device"
  CIHISPEED   = "Broadband (high speed) Internet service such as cable, fiber optic, or DSL service"
  CISAT       = "Satellite internet service"
  CIDIAL      = "Dial-up service"
  CIOTHSVC    = "Other internet service"
  FUELHEAT    = "Home heating fuel"
  VEHICLES    = "Vehicles available"
  COUPLETYPE  = "Householder couple type"
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
  EXPWTP      = "Experimental person weight"
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
  MOMRULE     = "Rule for linking mother (new)"
  POPLOC      = "Father's location in the household"
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
  HCOVSUB2    = "Subsidized marketplace insurance coverage (original)"
  SCHOOL      = "School attendance"
  HIUFPGBASE  = "Federal poverty guidelines (base)"
  HIUFPGINC   = "Federal poverty guidelines (increment)"
  HIURULE     = "HIU pointer rule"
  HIUPOVUNIV  = "Person in HIU poverty universe"
  HIUHHSPOV   = "Ratio of HIU income to households poverty guidelines"
  HIUID       = "HIU identification"
  HIUNPERS    = "HIU number of persons"
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
  CLASSWKR    = "Class of worker [general version]"
  CLASSWKRD   = "Class of worker [detailed version]"
  OCC         = "Occupation"
  OCC1950     = "Occupation, 1950 basis"
  OCC1990     = "Occupation, 1990 basis"
  OCC2010     = "Occupation, 2010 basis"
  OCCSOC      = "Occupation, SOC classification"
  IND         = "Industry"
  IND1950     = "Industry, 1950 basis"
  IND1990     = "Industry, 1990 basis"
  INDNAICS    = "Industry, NAICS classification"
  WKSWORK1    = "Weeks worked last year"
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
  OCCSCORE    = "Occupational income score"
  SEI         = "Duncan Socioeconomic Index "
  HWSEI       = "Socioeconomic Index, Hauser and Warren"
  PRESGL      = "Occupational prestige score, Siegel"
  PRENT       = "Occupational prestige score, Nakao and Treas"
  ERSCOR50    = "Occupational earnings score, 1950 basis"
  ERSCOR90    = "Occupational earnings score, 1990 basis"
  EDSCOR50    = "Occupational education score, 1950 basis"
  EDSCOR90    = "Occupational education score, 1990 basis"
  NPBOSS50    = "Nam-Powers-Boyd occupational status score, 1950 basis"
  NPBOSS90    = "Nam-Powers-Boyd occupational status score, 1990 basis"
  MIGRATE1    = "Migration status, 1 year [general version]"
  MIGRATE1D   = "Migration status, 1 year [detailed version]"
  MIGPLAC1    = "State or country of residence 1 year ago"
  MIGCOUNTY1  = "County of residence 1 year ago"
  MIGMET131   = "Metropolitan area of residence 1 year ago (2013 delineations)"
  MIGMET13ERR = "Coverage error in MIGMET13 variables"
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
  VETWWII     = "Veteran, served during WWII era"
  VETOTHER    = "Veteran of other period [general version]"
  VETOTHERD   = "Veteran of other period [detailed version]"
  PWSTATE2    = "Place of work: state"
  PWCOUNTY    = "Place of work: county"
  PWMET13     = "Place of work: metropolitan area (2013 delineations)"
  PWMET13ERR  = "Coverage error in PWMET13 variable"
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
  SUBSAMP      SUBSAMP_f.
  HHTYPE       HHTYPE_f.
  CBHHTYPE     CBHHTYPE_f.
  REPWT        REPWT_f.
  REGION       REGION_f.
  STATEICP     STATEICP_f.
  STATEFIP     STATEFIP_f.
  COUNTYICP    COUNTYICP_f.
  METRO        METRO_f.
  MET2013      MET2013_f.
  MET2013ERR   MET2013ERR_f.
  MET2023      MET2023_f.
  MET2023ERR   MET2023ERR_f.
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
  FARMPROD     FARMPROD_f.
  ACREHOUS     ACREHOUS_f.
  MORTAMT1     MORTAMT1_f.
  MORTAMT2     MORTAMT2_f.
  TAXINCL      TAXINCL_f.
  INSINCL      INSINCL_f.
  PROPINSR     PROPINSR_f.
  PROPTX99     PROPTX99_f.
  OWNCOST      OWNCOST_f.
  RENT         RENT_f.
  RENTGRS      RENTGRS_f.
  RENTMEAL     RENTMEAL_f.
  CONDOFEE     CONDOFEE_f.
  MOBLHOME     MOBLHOME_f.
  HHINCOME     HHINCOME_f.
  FOODSTMP     FOODSTMP_f.
  VALUEH       VALUEH_f.
  LINGISOL     LINGISOL_f.
  VACANCY      VACANCY_f.
  VACDUR       VACDUR_f.
  VACOTH       VACOTH_f.
  KITCHEN      KITCHEN_f.
  FRIDGE       FRIDGE_f.
  SINK         SINK_f.
  STOVE        STOVE_f.
  ROOMS        ROOMS_f.
  PLUMBING     PLUMBING_f.
  HOTWATER     HOTWATER_f.
  SHOWER       SHOWER_f.
  BUILTYR2     BUILTYR2_f.
  UNITSSTR     UNITSSTR_f.
  BEDROOMS     BEDROOMS_f.
  PHONE        PHONE_f.
  CINETHH      CINETHH_f.
  CILAPTOP     CILAPTOP_f.
  CISMRTPHN    CISMRTPHN_f.
  CITABLET     CITABLET_f.
  CIOTHCOMP    CIOTHCOMP_f.
  CIDATAPLN    CIDATAPLN_f.
  CIHISPEED    CIHISPEED_f.
  CISAT        CISAT_f.
  CIDIAL       CIDIAL_f.
  CIOTHSVC     CIOTHSVC_f.
  FUELHEAT     FUELHEAT_f.
  VEHICLES     VEHICLES_f.
  COUPLETYPE   COUPLETYPE_f.
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
  CBPERNUM     CBPERNUM_f.
  REPWTP       REPWTP_f.
  FAMUNIT      FAMUNIT_f.
  FAMSIZE      FAMSIZE_f.
  SUBFAM       SUBFAM_f.
  SFTYPE       SFTYPE_f.
  SFRELATE     SFRELATE_f.
  CBSUBFAM     CBSUBFAM_f.
  CBSFTYPE     CBSFTYPE_f.
  CBSFRELATE   CBSFRELATE_f.
  MOMRULE      MOMRULE_f.
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
  YRMARR       YRMARR_f.
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
  HCOVSUB2     HCOVSUB2_f.
  SCHOOL       SCHOOL_f.
  HIURULE      HIURULE_f.
  HIUPOVUNIV   HIUPOVUNIV_f.
  HIUNPERS     HIUNPERS_f.
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
  OCC          OCC_f.
  OCC1950      OCC1950_f.
  OCC1990      OCC1990_f.
  OCC2010      OCC2010_f.
  IND          IND_f.
  IND1950      IND1950_f.
  IND1990      IND1990_f.
  WKSWORK2     WKSWORK2_f.
  UHRSWORK     UHRSWORK_f.
  WRKLSTWK     WRKLSTWK_f.
  ABSENT       ABSENT_f.
  LOOKING      LOOKING_f.
  AVAILBLE     AVAILBLE_f.
  WRKRECAL     WRKRECAL_f.
  WORKEDYR     WORKEDYR_f.
  INCWAGE      INCWAGE_f.
  INCBUS00     INCBUS00_f.
  INCWELFR     INCWELFR_f.
  INCINVST     INCINVST_f.
  INCRETIR     INCRETIR_f.
  INCSUPP      INCSUPP_f.
  INCOTHER     INCOTHER_f.
  INCEARN      INCEARN_f.
  OCCSCORE     OCCSCORE_f.
  SEI          SEI_f.
  HWSEI        HWSEI_f.
  PRESGL       PRESGL_f.
  PRENT        PRENT_f.
  ERSCOR50     ERSCOR50_f.
  ERSCOR90     ERSCOR90_f.
  EDSCOR50     EDSCOR50_f.
  EDSCOR90     EDSCOR90_f.
  NPBOSS50     NPBOSS50_f.
  NPBOSS90     NPBOSS90_f.
  MIGRATE1     MIGRATE1_f.
  MIGRATE1D    MIGRATE1D_f.
  MIGPLAC1     MIGPLAC1_f.
  MIGMET131    MIGMET131_f.
  MIGMET13ERR  MIGMET13ERR_f.
  MOVEDIN      MOVEDIN_f.
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
  VETWWII      VETWWII_f.
  VETOTHER     VETOTHER_f.
  VETOTHERD    VETOTHERD_f.
  PWSTATE2     PWSTATE2_f.
  PWMET13      PWMET13_f.
  PWMET13ERR   PWMET13ERR_f.
  TRANWORK     TRANWORK_f.
  CARPOOL      CARPOOL_f.
  RIDERS       RIDERS_f.
  DEPARTS      DEPARTS_f.
  ARRIVES      ARRIVES_f.
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
  HIUHHSPOV    10.4
  HIUID        9.
;
  
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

