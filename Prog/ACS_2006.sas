/**************************************************************************
 Program:  ACS_2006.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/31/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Read raw IPUMS 2004 & 2006 ACS data and create data sets 
 for DC, MD, VA, and WV.

 Modifications:
  09/21/07 PAT  Recoded n/a values in INC*, HHINCOME, and VALUEH vars.
  10/23/07 PAT  Added to list of extraneous format associations.
                Added formats for IND and OCC.
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\rrosso_ui_urban_org_001.dat";

data 
  ipums.ACS_2006_DC (label="IPUMS ACS sample, 2006, DC")
  ipums.ACS_2006_MD (label="IPUMS ACS sample, 2006, MD")
  ipums.ACS_2006_VA (label="IPUMS ACS sample, 2006, VA")
  ipums.ACS_2006_WV (label="IPUMS ACS sample, 2006, WV")
  ipums.ACS_2004_DC (label="IPUMS ACS sample, 2004, DC")
  ipums.ACS_2004_MD (label="IPUMS ACS sample, 2004, MD")
  ipums.ACS_2004_VA (label="IPUMS ACS sample, 2004, VA")
  ipums.ACS_2004_WV (label="IPUMS ACS sample, 2004, WV")
  ;

infile asciidat LRECL=1088 pad missover;
input
 year           1-2
 datanum        3-4
 serial         5-12
 numprec       13-14
 subsamp       15-16
 hhwt          17-20
 hhtype        21
 repwt         22
 region        23-24
 stateicp      25-26
 statefip      27-28
 metro         29
 metarea       30-32
 metaread      30-33
 city          34-37
 puma          38-42
 pumasupr      43-47
 conspuma      48-50
 gq            51
 farm          52
 ownershp      53
 ownershd      53-54
 mortgage      55
 mortgag2      56
 commuse       57
 farmprod      58
 acrehous      59
 mortamt1      60-64
 mortamt2      65-68
 taxincl       69
 insincl       70
 propinsr      71-74
 proptx99      75-76
 rent          77-80
 rentgrs       81-84
 rentmeal      85
 condofee      86-89
 moblhome      90-93
 costelec      94-97
 costgas       98-101
 costwatr     102-105
 costfuel     106-109
 ftotinc      110-115
 hhincome     116-121
 foodstmp     122
 fdstpamt     123-127
 valueh       128-133
 lingisol     134
 vacancy      135
 kitchen      136
 rooms        137
 plumbing     138-139
 builtyr2     140
 unitsstr     141-142
 bedrooms     143
 phone        144
 fuelheat     145
 vehicles     146
 nfams        147-148
 ncouples     149
 nmothers     150
 nfathers     151
 repwt1       152-155
 repwt2       156-159
 repwt3       160-163
 repwt4       164-167
 repwt5       168-171
 repwt6       172-175
 repwt7       176-179
 repwt8       180-183
 repwt9       184-187
 repwt10      188-191
 repwt11      192-195
 repwt12      196-199
 repwt13      200-203
 repwt14      204-207
 repwt15      208-211
 repwt16      212-215
 repwt17      216-219
 repwt18      220-223
 repwt19      224-227
 repwt20      228-231
 repwt21      232-235
 repwt22      236-239
 repwt23      240-243
 repwt24      244-247
 repwt25      248-251
 repwt26      252-255
 repwt27      256-259
 repwt28      260-263
 repwt29      264-267
 repwt30      268-271
 repwt31      272-275
 repwt32      276-279
 repwt33      280-283
 repwt34      284-287
 repwt35      288-291
 repwt36      292-295
 repwt37      296-299
 repwt38      300-303
 repwt39      304-307
 repwt40      308-311
 repwt41      312-315
 repwt42      316-319
 repwt43      320-323
 repwt44      324-327
 repwt45      328-331
 repwt46      332-335
 repwt47      336-339
 repwt48      340-343
 repwt49      344-347
 repwt50      348-351
 repwt51      352-355
 repwt52      356-359
 repwt53      360-363
 repwt54      364-367
 repwt55      368-371
 repwt56      372-375
 repwt57      376-379
 repwt58      380-383
 repwt59      384-387
 repwt60      388-391
 repwt61      392-395
 repwt62      396-399
 repwt63      400-403
 repwt64      404-407
 repwt65      408-411
 repwt66      412-415
 repwt67      416-419
 repwt68      420-423
 repwt69      424-427
 repwt70      428-431
 repwt71      432-435
 repwt72      436-439
 repwt73      440-443
 repwt74      444-447
 repwt75      448-451
 repwt76      452-455
 repwt77      456-459
 repwt78      460-463
 repwt79      464-467
 repwt80      468-471
 pernum       472-473
 perwt        474-477
 slwt         478-481
 respmode     482
 repwtp       483
 momloc       484-485
 stepmom      486
 momrule      487
 poploc       488-489
 steppop      490
 poprule      491
 sploc        492-493
 sprule       494
 famsize      495-496
 nchild       497
 nchlt5       498
 famunit      499-500
 eldch        501-502
 yngch        503-504
 nsibs        505
 relate       506-507
 related      506-509
 age          510-512
 sex          513
 marst        514
 birthqtr     515
 fertyr       516
 race         517
 raced        517-519
 bpl          520-522
 bpld         520-524
 ancestr1     525-527
 ancest1d     525-528
 ancestr2     529-531
 ancest2d     529-532
 citizen      533
 yrimmig      534-536
 yrsusa1      537-538
 yrsusa2      539
 language     540-541
 languagd     540-543
 speakeng     544
 hispan       545
 hispand      545-547
 tribe        548-551
 tribed       548-553
 racesing     554
 racesingd    554-555
 racamind     556
 racasian     557
 racblk       558
 racpacis     559
 racwht       560
 racother     561
 racnum       562
 school       563
 educrec      564
 educ99       565-566
 gradeatt     567
 schltype     568
 empstat      569
 empstatd     569-570
 labforce     571
 occ          572-574
 occ1950      575-577
 occ1990      578-580
 occscore     581-582
 sei          583-584
 ind          585-587
 ind1950      588-590
 ind1990      591-593
 classwkr     594
 classwkd     594-595
 occsoc $     596-601
 indnaics $   602-609
 wkswork1     610-611
 wkswork2     612
 uhrswork     613-614
 absent       615
 looking      616
 availble     617
 wrkrecal     618
 workedyr     619
 inctot       620-625
 incwage      626-631
 incbus00     632-637
 incss        638-642
 incwelfr     643-647
 incinvst     648-653
 incretir     654-659
 incsupp      660-664
 incother     665-669
 incearn      670-675
 poverty      676-678
 migrate1     679
 migrat1d     679-680
 migplac1     681-683
 migmet1      684-687
 migtype1     688
 migcity1     689-692
 migpums1     693-695
 migpuma1     696-698
 movedin      699
 disabwrk     700
 disabmob     701
 perscare     702
 diffphys     703
 diffrem      704
 diffeye      705
 vetstat      706
 vet01x03     707
 vet90x01     708
 vet80x90     709
 vet75x80     710
 vetvietn     711
 vet55x64     712
 vetkorea     713
 vet47x50     714
 vetwwii      715
 vetother     716
 vetyrs       717-718
 pwstate2     719-720
 pwmetro      721-724
 pwcity       725-728
 pwtype       729
 pwpuma00     730-733
 pwpumas      734-736
 tranwork     737-738
 carpool      739
 riders       740
 trantime     741-742
 departs      743-746
 arrives      747-750
 gchouse      751
 gcmonths     752
 gcrespon     753
 probai       754-756
 probapi      757-759
 probblk      760-762
 proboth      763-765
 probwht      766-768
 repwtp1      769-772
 repwtp2      773-776
 repwtp3      777-780
 repwtp4      781-784
 repwtp5      785-788
 repwtp6      789-792
 repwtp7      793-796
 repwtp8      797-800
 repwtp9      801-804
 repwtp10     805-808
 repwtp11     809-812
 repwtp12     813-816
 repwtp13     817-820
 repwtp14     821-824
 repwtp15     825-828
 repwtp16     829-832
 repwtp17     833-836
 repwtp18     837-840
 repwtp19     841-844
 repwtp20     845-848
 repwtp21     849-852
 repwtp22     853-856
 repwtp23     857-860
 repwtp24     861-864
 repwtp25     865-868
 repwtp26     869-872
 repwtp27     873-876
 repwtp28     877-880
 repwtp29     881-884
 repwtp30     885-888
 repwtp31     889-892
 repwtp32     893-896
 repwtp33     897-900
 repwtp34     901-904
 repwtp35     905-908
 repwtp36     909-912
 repwtp37     913-916
 repwtp38     917-920
 repwtp39     921-924
 repwtp40     925-928
 repwtp41     929-932
 repwtp42     933-936
 repwtp43     937-940
 repwtp44     941-944
 repwtp45     945-948
 repwtp46     949-952
 repwtp47     953-956
 repwtp48     957-960
 repwtp49     961-964
 repwtp50     965-968
 repwtp51     969-972
 repwtp52     973-976
 repwtp53     977-980
 repwtp54     981-984
 repwtp55     985-988
 repwtp56     989-992
 repwtp57     993-996
 repwtp58     997-1000
 repwtp59     1001-1004
 repwtp60     1005-1008
 repwtp61     1009-1012
 repwtp62     1013-1016
 repwtp63     1017-1020
 repwtp64     1021-1024
 repwtp65     1025-1028
 repwtp66     1029-1032
 repwtp67     1033-1036
 repwtp68     1037-1040
 repwtp69     1041-1044
 repwtp70     1045-1048
 repwtp71     1049-1052
 repwtp72     1053-1056
 repwtp73     1057-1060
 repwtp74     1061-1064
 repwtp75     1065-1068
 repwtp76     1069-1072
 repwtp77     1073-1076
 repwtp78     1077-1080
 repwtp79     1081-1084
 repwtp80     1085-1088
;

label
 year="Census year"
 datanum="Data set number"
 serial="Household serial number"
 numprec="Number of person records following"
 subsamp="Subsample number"
 hhwt="Household weight"
 hhtype="Household Type"
 repwt="Household replicate weights"
 region="Census region and division"
 stateicp="State (ICPSR code)"
 statefip="State (FIPS code)"
 metro="Metropolitan status"
 metarea="Metropolitan area [general version]"
 metaread="Metropolitan area [detailed version]"
 city="City"
 puma="Public Use Microdata Area"
 pumasupr="Super Public Use Microdata Area"
 conspuma="Consistent Public Use Microdata Area"
 gq="Group quarters status"
 farm="Farm status"
 ownershp="Ownership of dwelling [general version]"
 ownershd="Ownership of dwelling [detailed version]"
 mortgage="Mortgage status"
 mortgag2="Second mortgage status"
 commuse="Commercial use"
 farmprod="Sales of farm products"
 acrehous="House acreage"
 mortamt1="First mortgage monthly payment"
 mortamt2="Second mortgage monthly payment"
 taxincl="Mortgage payment includes property taxes"
 insincl="Mortgage payment includes property insurance"
 propinsr="Annual property insurance cost"
 proptx99="Annual property taxes, 1990"
 rent="Monthly contract rent"
 rentgrs="Monthly gross rent"
 rentmeal="Meals included in rent"
 condofee="Monthly condominium fee"
 moblhome="Annual mobile home costs"
 costelec="Annual electricity cost"
 costgas="Annual gas cost"
 costwatr="Annual water cost"
 costfuel="Annual home heating fuel cost"
 ftotinc="Total family income"
 hhincome="Total household income"
 foodstmp="Food stamp recipiency"
 fdstpamt="Food stamp amount"
 valueh="House value"
 lingisol="Linguistic isolation"
 vacancy="Vacancy status"
 kitchen="Kitchen or cooking facilities"
 rooms="Number of rooms"
 plumbing="Plumbing facilities"
 builtyr2="Age of structure, decade"
 unitsstr="Units in structure"
 bedrooms="Number of bedrooms"
 phone="Telephone availability"
 fuelheat="Home heating fuel"
 vehicles="Vehicles available"
 nfams="Number of families in household"
 ncouples="Number of married couples in household"
 nmothers="Number of mothers in household"
 nfathers="Number of fathers in household"
 repwt1="Household replicate weight 1"
 repwt2="Household replicate weight 2"
 repwt3="Household replicate weight 3"
 repwt4="Household replicate weight 4"
 repwt5="Household replicate weight 5"
 repwt6="Household replicate weight 6"
 repwt7="Household replicate weight 7"
 repwt8="Household replicate weight 8"
 repwt9="Household replicate weight 9"
 repwt10="Household replicate weight 10"
 repwt11="Household replicate weight 11"
 repwt12="Household replicate weight 12"
 repwt13="Household replicate weight 13"
 repwt14="Household replicate weight 14"
 repwt15="Household replicate weight 15"
 repwt16="Household replicate weight 16"
 repwt17="Household replicate weight 17"
 repwt18="Household replicate weight 18"
 repwt19="Household replicate weight 19"
 repwt20="Household replicate weight 20"
 repwt21="Household replicate weight 21"
 repwt22="Household replicate weight 22"
 repwt23="Household replicate weight 23"
 repwt24="Household replicate weight 24"
 repwt25="Household replicate weight 25"
 repwt26="Household replicate weight 26"
 repwt27="Household replicate weight 27"
 repwt28="Household replicate weight 28"
 repwt29="Household replicate weight 29"
 repwt30="Household replicate weight 30"
 repwt31="Household replicate weight 31"
 repwt32="Household replicate weight 32"
 repwt33="Household replicate weight 33"
 repwt34="Household replicate weight 34"
 repwt35="Household replicate weight 35"
 repwt36="Household replicate weight 36"
 repwt37="Household replicate weight 37"
 repwt38="Household replicate weight 38"
 repwt39="Household replicate weight 39"
 repwt40="Household replicate weight 40"
 repwt41="Household replicate weight 41"
 repwt42="Household replicate weight 42"
 repwt43="Household replicate weight 43"
 repwt44="Household replicate weight 44"
 repwt45="Household replicate weight 45"
 repwt46="Household replicate weight 46"
 repwt47="Household replicate weight 47"
 repwt48="Household replicate weight 48"
 repwt49="Household replicate weight 49"
 repwt50="Household replicate weight 50"
 repwt51="Household replicate weight 51"
 repwt52="Household replicate weight 52"
 repwt53="Household replicate weight 53"
 repwt54="Household replicate weight 54"
 repwt55="Household replicate weight 55"
 repwt56="Household replicate weight 56"
 repwt57="Household replicate weight 57"
 repwt58="Household replicate weight 58"
 repwt59="Household replicate weight 59"
 repwt60="Household replicate weight 60"
 repwt61="Household replicate weight 61"
 repwt62="Household replicate weight 62"
 repwt63="Household replicate weight 63"
 repwt64="Household replicate weight 64"
 repwt65="Household replicate weight 65"
 repwt66="Household replicate weight 66"
 repwt67="Household replicate weight 67"
 repwt68="Household replicate weight 68"
 repwt69="Household replicate weight 69"
 repwt70="Household replicate weight 70"
 repwt71="Household replicate weight 71"
 repwt72="Household replicate weight 72"
 repwt73="Household replicate weight 73"
 repwt74="Household replicate weight 74"
 repwt75="Household replicate weight 75"
 repwt76="Household replicate weight 76"
 repwt77="Household replicate weight 77"
 repwt78="Household replicate weight 78"
 repwt79="Household replicate weight 79"
 repwt80="Household replicate weight 80"
 pernum="Person number in sample unit"
 perwt="Person weight"
 slwt="Sample-line weight"
 respmode="Response mode"
 repwtp="Person replicate weights"
 momloc="Mother's location in the household"
 stepmom="Probable step/adopted mother"
 momrule="Rule for linking mother"
 poploc="Father's location in the household"
 steppop="Probable step/adopted father"
 poprule="Rule for linking father"
 sploc="Spouse's location in household"
 sprule="Rule for linking spouse"
 famsize="Number of own family members in household"
 nchild="Number of own children in the household"
 nchlt5="Number of own children under age 5 in household"
 famunit="Family unit membership"
 eldch="Age of eldest own child in household"
 yngch="Age of youngest own child in household"
 nsibs="Number of own siblings in household"
 relate="Relationship to household head [general version]"
 related="Relationship to household head [detailed version]"
 age="Age"
 sex="Sex"
 marst="Marital status"
 birthqtr="Quarter of birth"
 fertyr="Children born within the last year"
 race="Race [general version]"
 raced="Race [detailed version]"
 bpl="Birthplace [general version]"
 bpld="Birthplace [detailed version]"
 ancestr1="Ancestry, first response [general version]"
 ancest1d="Ancestry, first response [detailed version]"
 ancestr2="Ancestry, second response [general version]"
 ancest2d="Ancestry, second response [detailed version]"
 citizen="Citizenship status"
 yrimmig="Year of immigration"
 yrsusa1="Years in the United States"
 yrsusa2="Years in the United States, intervalled"
 language="Language spoken [general version]"
 languagd="Language spoken [detailed version]"
 speakeng="Speaks English"
 hispan="Hispanic origin [general version]"
 hispand="Hispanic origin [detailed version]"
 tribe="Tribe [general version]"
 tribed="Tribe [detailed version]"
 racesing="Race: Single race identification [general version]"
 racesingd="Race: Single race identification [detailed version]"
 racamind="Race: American Indian or Alaska Native"
 racasian="Race: Asian"
 racblk="Race: black or African American"
 racpacis="Race: Pacific Islander"
 racwht="Race: white"
 racother="Race: some other race"
 racnum="Number of major race groups"
 school="School attendance"
 educrec="Educational attainment recode"
 educ99="Educational attainment, 1990"
 gradeatt="Grade level attending"
 schltype="Public or private school"
 empstat="Employment status [general version]"
 empstatd="Employment status [detailed version]"
 labforce="Labor force status"
 occ="Occupation"
 occ1950="Occupation, 1950 basis"
 occ1990="Occupation, 1990 basis"
 occscore="Occupational income score"
 sei="Duncan Socioeconomic Index"
 ind="Industry"
 ind1950="Industry, 1950 basis"
 ind1990="Industry, 1990 basis"
 classwkr="Class of worker [general version]"
 classwkd="Class of worker [detailed version]"
 occsoc="Occupation, SOC"
 indnaics="Industry, NAICS"
 wkswork1="Weeks worked last year"
 wkswork2="Weeks worked last year, intervalled"
 uhrswork="Usual hours worked per week"
 absent="Absent from work last week"
 looking="Looking for work"
 availble="Available for work"
 wrkrecal="Informed of work recall"
 workedyr="Worked last year"
 inctot="Total personal income"
 incwage="Wage and salary income"
 incbus00="Business and farm income, 2000"
 incss="Social Security income"
 incwelfr="Welfare (public assistance) income"
 incinvst="Interest, dividend, and rental income"
 incretir="Retirement income"
 incsupp="Supplementary Security Income"
 incother="Other income"
 incearn="Total personal earned income"
 poverty="Poverty status"
 migrate1="Migration status, 1 year [general version]"
 migrat1d="Migration status, 1 year [detailed version]"
 migplac1="State or country of residence 1 year ago"
 migmet1="Metropolitan area of residence 1 year ago"
 migtype1="Metropolitan status 1 year ago"
 migcity1="City of residence 1 year ago"
 migpums1="Super-PUMA of residence 1 year ago"
 migpuma1="PUMA of residence 1 year ago"
 movedin="When occupant moved into residence"
 disabwrk="Work disability"
 disabmob="Disability limiting mobility"
 perscare="Personal care limitation"
 diffphys="Physical difficulty"
 diffrem="Difficulty remembering"
 diffeye="Vision or hearing difficulty"
 vetstat="Veteran status"
 vet01x03="Veteran, served 2001-2003"
 vet90x01="Veteran, served 1990-2001"
 vet80x90="Veteran, served 1980 to 1990"
 vet75x80="Veteran, served 1975 to 1980"
 vetvietn="Veteran, served during Vietnam era"
 vet55x64="Veteran, served 1955 to 1964"
 vetkorea="Veteran, served during Korean conflict era"
 vet47x50="Veteran, served 1947-1950"
 vetwwii="Veteran, served during WWII era"
 vetother="Veteran of other period"
 vetyrs="Years of active-duty military service"
 pwstate2="Place of work: state, 1980 to 2005"
 pwmetro="Place of work: metropolitan area"
 pwcity="Place of work: city"
 pwtype="Place of work: metropolitan status"
 pwpuma00="Place of work: PUMA, 2000 and 2005"
 pwpumas="Super-PUMA of work"
 tranwork="Means of transportation to work"
 carpool="Carpooling"
 riders="Vehicle occupancy"
 trantime="Travel time to work"
 departs="Time of departure for work"
 arrives="Time of arrival at work"
 gchouse="Own grandchildren living in household"
 gcmonths="Months responsible for grandchildren"
 gcrespon="Responsible for grandchildren"
 probai="Probability of American Indian race response"
 probapi="Probability of Asian/Pacific Islander race response"
 probblk="Probability of black race response"
 proboth="Probability of 'other race' race response"
 probwht="Probability of white race response"
 repwtp1="Person replicate weight 1"
 repwtp2="Person replicate weight 2"
 repwtp3="Person replicate weight 3"
 repwtp4="Person replicate weight 4"
 repwtp5="Person replicate weight 5"
 repwtp6="Person replicate weight 6"
 repwtp7="Person replicate weight 7"
 repwtp8="Person replicate weight 8"
 repwtp9="Person replicate weight 9"
 repwtp10="Person replicate weight 10"
 repwtp11="Person replicate weight 11"
 repwtp12="Person replicate weight 12"
 repwtp13="Person replicate weight 13"
 repwtp14="Person replicate weight 14"
 repwtp15="Person replicate weight 15"
 repwtp16="Person replicate weight 16"
 repwtp17="Person replicate weight 17"
 repwtp18="Person replicate weight 18"
 repwtp19="Person replicate weight 19"
 repwtp20="Person replicate weight 20"
 repwtp21="Person replicate weight 21"
 repwtp22="Person replicate weight 22"
 repwtp23="Person replicate weight 23"
 repwtp24="Person replicate weight 24"
 repwtp25="Person replicate weight 25"
 repwtp26="Person replicate weight 26"
 repwtp27="Person replicate weight 27"
 repwtp28="Person replicate weight 28"
 repwtp29="Person replicate weight 29"
 repwtp30="Person replicate weight 30"
 repwtp31="Person replicate weight 31"
 repwtp32="Person replicate weight 32"
 repwtp33="Person replicate weight 33"
 repwtp34="Person replicate weight 34"
 repwtp35="Person replicate weight 35"
 repwtp36="Person replicate weight 36"
 repwtp37="Person replicate weight 37"
 repwtp38="Person replicate weight 38"
 repwtp39="Person replicate weight 39"
 repwtp40="Person replicate weight 40"
 repwtp41="Person replicate weight 41"
 repwtp42="Person replicate weight 42"
 repwtp43="Person replicate weight 43"
 repwtp44="Person replicate weight 44"
 repwtp45="Person replicate weight 45"
 repwtp46="Person replicate weight 46"
 repwtp47="Person replicate weight 47"
 repwtp48="Person replicate weight 48"
 repwtp49="Person replicate weight 49"
 repwtp50="Person replicate weight 50"
 repwtp51="Person replicate weight 51"
 repwtp52="Person replicate weight 52"
 repwtp53="Person replicate weight 53"
 repwtp54="Person replicate weight 54"
 repwtp55="Person replicate weight 55"
 repwtp56="Person replicate weight 56"
 repwtp57="Person replicate weight 57"
 repwtp58="Person replicate weight 58"
 repwtp59="Person replicate weight 59"
 repwtp60="Person replicate weight 60"
 repwtp61="Person replicate weight 61"
 repwtp62="Person replicate weight 62"
 repwtp63="Person replicate weight 63"
 repwtp64="Person replicate weight 64"
 repwtp65="Person replicate weight 65"
 repwtp66="Person replicate weight 66"
 repwtp67="Person replicate weight 67"
 repwtp68="Person replicate weight 68"
 repwtp69="Person replicate weight 69"
 repwtp70="Person replicate weight 70"
 repwtp71="Person replicate weight 71"
 repwtp72="Person replicate weight 72"
 repwtp73="Person replicate weight 73"
 repwtp74="Person replicate weight 74"
 repwtp75="Person replicate weight 75"
 repwtp76="Person replicate weight 76"
 repwtp77="Person replicate weight 77"
 repwtp78="Person replicate weight 78"
 repwtp79="Person replicate weight 79"
 repwtp80="Person replicate weight 80"
;

format
 year yearx.
 numprec numprec.
 subsamp subsamp.
 hhtype hhtype.
 region region.
 stateicp stateicp.
 statefip statefip.
 metro metro.
 metarea metarea.
 metaread metaread.
 city city.
 gq gq.
 farm farm.
 ownershp ownershp.
 ownershd ownershd.
 mortgage mortgage.
 mortgag2 mortgagb.
 commuse commuse.
 acrehous acrehous.
 taxincl taxincl.
 insincl insincl.
 proptx99 proptxii.
 rentmeal rentmeal.
 foodstmp foodstmp.
 lingisol lingisol.
 vacancy vacancy.
 kitchen kitchen.
 rooms rooms.
 plumbing plumbing.
 builtyr2 builtyrb.
 unitsstr unitsstr.
 bedrooms bedrooms.
 phone phone.
 fuelheat fuelheat.
 vehicles vehicles.
 nfams nfams.
 ncouples ncouples.
 nmothers nmothers.
 nfathers nfathers.
 respmode respmode.
 stepmom stepmom.
 momrule momrule.
 steppop steppop.
 poprule poprule.
 sprule sprule.
 famsize famsize.
 nchild nchild.
 nchlt5 nchlte.
 famunit famunit.
 eldch eldch.
 yngch yngch.
 nsibs nsibs.
 relate relate.
 related related.
 age age.
 sex sex.
 marst marst.
 birthqtr birthqtr.
 fertyr fertyr.
 race race.
 raced raced.
 bpl bpl.
 bpld bpld.
 ancestr1 ancestra.
 ancest1d ancest1d.
 ancestr2 ancestrb.
 ancest2d ancest2d.
 citizen citizen.
 yrsusa2 yrsusab.
 language language.
 languagd languagd.
 speakeng speakeng.
 hispan hispan.
 hispand hispand.
 tribe tribe.
 tribed tribed.
 racesing racesing.
 /***LONG FORMAT NAME ***  racesingd racesingd. ***/
 racesingd racesind.
 school school.
 educrec educrec.
 educ99 educii.
 gradeatt gradeatt.
 schltype schltype.
 empstat empstat.
 empstatd empstatd.
 labforce labforce.
 occ1950 occaiej.
 occ1990 occaiij.
 ind1950 indaiej.
 ind1990 indaiij.
 classwkr classwkr.
 classwkd classwkd.
 wkswork2 wksworkb.
 absent absent.
 looking looking.
 availble availble.
 wrkrecal wrkrecal.
 workedyr workedyr.
 migrate1 migratea.
 migrat1d migrat1d.
 migplac1 migplaca.
 migtype1 migtypea.
 migcity1 migcitya.
 disabwrk disabwrk.
 disabmob disabmob.
 perscare perscare.
 diffphys diffphys.
 diffrem diffrem.
 diffeye diffeye.
 vetstat vetstat.
 vet01x03 vet01xjc.
 vet90x01 vet90xja.
 vet80x90 vet80xij.
 vet75x80 vet75xhj.
 vetvietn vetvietn.
 vet55x64 vet55xfd.
 vetkorea vetkorea.
 vet47x50 vet47xej.
 vetwwii vetwwii.
 vetother vetother.
 pwstate2 pwstateb.
 pwmetro pwmetro.
 pwcity pwcity.
 pwtype pwtype.
 tranwork tranwork.
 carpool carpool.
 riders riders.
 gchouse gchouse.
 gcmonths gcmonths.
 gcrespon gcrespon.
;
  ** Create unique PUMA ID **;

  %upuma() 
  
  ** Recode n/a values **;
  
  array inca{*} inctot incwage incbus00 incretir hhincome valueh;

  do i = 1 to dim( inca );
    if inca{i} = 999999 then inca{i} = .n;
  end;

  array incb{*} incss incwelfr incsupp incother;

  do i = 1 to dim( incb );
    if incb{i} = 99999 then incb{i} = .n;
  end;

  ** Output files by state **;
  
  if year=06 then do;
  select ( statefip );
    when( &FIPS_DC ) output Ipums.ACS_2006_DC;
    when( &FIPS_MD ) output Ipums.ACS_2006_MD;
    when( &FIPS_VA ) output Ipums.ACS_2006_VA;
    when( &FIPS_WV ) output Ipums.ACS_2006_WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
    end;
  end;
  end;
  else if year=04 then do;
  select ( statefip );
    when( &FIPS_DC ) output Ipums.ACS_2004_DC;
    when( &FIPS_MD ) output Ipums.ACS_2004_MD;
    when( &FIPS_VA ) output Ipums.ACS_2004_VA;
    when( &FIPS_WV ) output Ipums.ACS_2004_WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
    end;
  end;
  end;
  

  
  ** Remove extraneous format associations **;
  
  format 
    datanum serial rooms nfams ncouples nmothers nfathers pernum 
    hhwt perwt slwt momloc poploc sploc famsize nchild nchlt5 
    eldch yngch numprec nsibs age occ occscore ind indnaics occsoc sei
    puma pumasupr conspuma farmprod mortamt1 mortamt2 propinsr rent
    rentgrs condofee moblhome cost: ftotinc hhincome fdstpamt
    valueh pernum slwt q: wkswork1 uhrswork inc: poverty
    migmet1 migpums1 migpuma1 movedin vetyrs pwpuma00 pwpumas
    trantime departs arrives yrsusa1 yrimmig
  ;  
  
  format ind indac05f.;
  format occ occac05f.;
  
  drop i;

run;

%File_info( data=Ipums.ACS_2006_DC, printobs=5, freqvars=statefip acre: gq vacancy )
%File_info( data=Ipums.ACS_2004_DC, printobs=5, freqvars=statefip acre: gq vacancy )

