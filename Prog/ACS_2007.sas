/**************************************************************************
 Program:  ACS_2007.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/15/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Read raw IPUMS 2005 ACS data and create data sets 
 for DC, MD, VA, and WV.

 Modifications:
  09/21/07 PAT  Recoded n/a values in INC*, HHINCOME, and VALUEH vars.
  10/23/07 PAT  Added to list of extraneous format associations.
                Added formats for IND and OCC.
  07/28/09 PAT  Added INCINVST to 999999->.n recodes.
                Added FTOTINC, HHINCOME to 9999999->.n recodes.
                Added OWNCOST to 99999->.n recodes.

 Updated: 7/21/09 KF for 2007
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\usa_00001.dat";

data 
  ipums.ACS_2007_DC (label="IPUMS ACS sample, 2007, DC")
  ipums.ACS_2007_MD (label="IPUMS ACS sample, 2007, MD")
  ipums.ACS_2007_VA (label="IPUMS ACS sample, 2007, VA")
  ipums.ACS_2007_WV (label="IPUMS ACS sample, 2007, WV")
  ;

infile asciidat LRECL=1262 pad missover;

input
 year              1-4
 datanum           5-6
 serial            7-14
 numprec          15-16
 subsamp          17-18
 hhwt             19-22
 hhtype           23
 repwt            24
 region           25-26
 stateicp         27-28
 statefip         29-30
 metro            31
 metarea          32-34
 metaread         35-38
 city             39-42
 citypop          43-47
 puma             48-52
 pumasupr         53-57
 conspuma         58-60
 cntry            61-63
 gq               64
 gqtype           65
 gqtyped          66-68
 farm             69
 ownershp         70
 ownershpd        71-72
 mortgage         73
 mortgag2         74
 commuse          75
 farmprod         76
 acrehous         77
 mortamt1         78-82
 mortamt2         83-86
 taxincl          87
 insincl          88
 propinsr         89-92
 proptx99         93-94
 owncost          95-99
 rent            100-103
 rentgrs         104-107
 rentmeal        108
 condofee        109-112
 moblhome        113-116
 costelec        117-120
 costgas         121-124
 costwatr        125-128
 costfuel        129-132
 hhincome        133-139
 foodstmp        140
 fdstpamt        141-145
 valueh          146-151
 lingisol        152
 vacancy         153
 kitchen         154
 rooms           155
 plumbing        156-157
 builtyr2        158-159
 unitsstr        160-161
 bedrooms        162
 phone           163
 fuelheat        164
 vehicles        165
 nfams           166-167
 nsubfam         168
 ncouples        169
 nmothers        170
 nfathers        171
 qacrehou        172
 qcommuse        173
 qcondofe        174
 qcostele        175
 qcostfue        176
 qcostgas        177
 qcostwat        178
 qfarmpro        179
 qfoodstm        180
 qinsincl        181
 qmoblhom        182
 qmortam1        183
 qmortam2        184
 qmortg2a        185
 qmortga2        186
 qmortgag        187
 qownersh        188
 qpropins        189
 qprotx99        190
 qrent           191
 qrentmea        192
 qtaxincl        193
 qvalueh         194
 qvacancy        195
 qbedroom        196
 qbuilty2        197
 qkitchen        198
 qplumbin        199
 qrooms          200
 qunitsst        201
 qfuelhea        202
 qphone          203
 qvehicle        204
 repwt1          205-208
 repwt2          209-212
 repwt3          213-216
 repwt4          217-220
 repwt5          221-224
 repwt6          225-228
 repwt7          229-232
 repwt8          233-236
 repwt9          237-240
 repwt10         241-244
 repwt11         245-248
 repwt12         249-252
 repwt13         253-256
 repwt14         257-260
 repwt15         261-264
 repwt16         265-268
 repwt17         269-272
 repwt18         273-276
 repwt19         277-280
 repwt20         281-284
 repwt21         285-288
 repwt22         289-292
 repwt23         293-296
 repwt24         297-300
 repwt25         301-304
 repwt26         305-308
 repwt27         309-312
 repwt28         313-316
 repwt29         317-320
 repwt30         321-324
 repwt31         325-328
 repwt32         329-332
 repwt33         333-336
 repwt34         337-340
 repwt35         341-344
 repwt36         345-348
 repwt37         349-352
 repwt38         353-356
 repwt39         357-360
 repwt40         361-364
 repwt41         365-368
 repwt42         369-372
 repwt43         373-376
 repwt44         377-380
 repwt45         381-384
 repwt46         385-388
 repwt47         389-392
 repwt48         393-396
 repwt49         397-400
 repwt50         401-404
 repwt51         405-408
 repwt52         409-412
 repwt53         413-416
 repwt54         417-420
 repwt55         421-424
 repwt56         425-428
 repwt57         429-432
 repwt58         433-436
 repwt59         437-440
 repwt60         441-444
 repwt61         445-448
 repwt62         449-452
 repwt63         453-456
 repwt64         457-460
 repwt65         461-464
 repwt66         465-468
 repwt67         469-472
 repwt68         473-476
 repwt69         477-480
 repwt70         481-484
 repwt71         485-488
 repwt72         489-492
 repwt73         493-496
 repwt74         497-500
 repwt75         501-504
 repwt76         505-508
 repwt77         509-512
 repwt78         513-516
 repwt79         517-520
 repwt80         521-524
 pernum          525-528
 perwt           529-532
 slwt            533-536
 respmode        537
 repwtp          538
 momloc          539-540
 stepmom         541
 momrule         542
 poploc          543-544
 steppop         545
 poprule         546
 sploc           547-548
 sprule          549
 famsize         550-551
 nchild          552
 nchlt5          553
 famunit         554-555
 eldch           556-557
 yngch           558-559
 nsibs           560
 subfam          561
 sftype          562
 sfrelate        563
 relate          564-565
 related         566-569
 age             570-572
 sex             573
 marst           574
 birthqtr        575
 fertyr          576
 race            577
 raced           578-580
 bpl             581-583
 bpld            584-588
 ancestr1        589-591
 ancestr1d       592-595
 ancestr2        596-598
 ancestr2d       599-602
 citizen         603
 yrimmig         604-606
 yrsusa1         607-608
 yrsusa2         609
 language        610-611
 languaged       612-615
 speakeng        616
 hispan          617
 hispand         618-620
 tribe           621-624
 tribed          625-630
 racesing        631
 racesingd       632-633
 racamind        634
 racasian        635
 racblk          636
 racpacis        637
 racwht          638
 racother        639
 racnum          640
 school          641
 educrec         642
 educ00          643-644
 educ99          645-646
 gradeatt        647
 schltype        648
 empstat         649
 empstatd        650-651
 labforce        652
 occ             653-655
 occ1950         656-658
 occ1990         659-661
 ind             662-664
 ind1950         665-667
 ind1990         668-670
 classwkr        671
 classwkrd       672-673
 occsoc $        674-679
 indnaics $      680-687
 wkswork1        688-689
 wkswork2        690
 uhrswork        691-692
 absent          693
 looking         694
 availble        695
 wrkrecal        696
 workedyr        697
 inctot          698-703
 ftotinc         704-710
 incwage         711-716
 incbus00        717-722
 incss           723-727
 incwelfr        728-732
 incinvst        733-738
 incretir        739-744
 incsupp         745-749
 incother        750-754
 incearn         755-760
 poverty         761-763
 occscore        764-765
 sei             766-767
 hwsei           768-771
 presgl          772-774
 prent           775-777
 erscor50        778-781
 erscor90        782-785
 edscor50        786-789
 edscor90        790-793
 npboss50        794-797
 npboss90        798-801
 migrate1        802
 migrate1d       803-804
 migplac1        805-807
 migmet1         808-811
 migtype1        812
 migcity1        813-816
 migpums1        817-819
 migpuma1        820-822
 movedin         823
 disabwrk        824
 disabmob        825
 perscare        826
 diffphys        827
 diffrem         828
 diffeye         829
 vetstat         830
 vet01ltr        831
 vet90x01        832
 vet80x90        833
 vet75x80        834
 vetvietn        835
 vet55x64        836
 vetkorea        837
 vet47x50        838
 vetwwii         839
 vetother        840
 vetyrs          841-842
 pwstate2        843-844
 pwmetro         845-848
 pwcity          849-852
 pwtype          853
 pwpuma00        854-857
 pwpumas         858-860
 tranwork        861-862
 carpool         863
 riders          864
 trantime        865-866
 departs         867-870
 arrives         871-874
 gchouse         875
 gcmonths        876
 gcrespon        877
 probai          878-880
 probapi         881-883
 probblk         884-886
 proboth         887-889
 probwht         890-892
 qage            893
 qfertyr         894
 qmarst          895
 qrelate         896
 qsex            897
 qbpl            898
 qcitizen        899
 qhispan         900
 qlanguag        901
 qrace           902
 qspeaken        903
 qyrimm          904
 qeduc           905
 qgradeat        906
 qschool         907
 qclasswk        908
 qempstat        909
 qind            910
 qocc            911
 quhrswor        912
 qwkswork        913
 qworkedy        914
 qincbus         915
 qincinvs        916
 qincothe        917
 qincreti        918
 qincss          919
 qincsupp        920
 qincwage        921
 qincwelf        922
 qmigplc1        923
 qmigrat1        924
 qmovedin        925
 qdiffeye        926
 qdiffphy        927
 qdiffrem        928
 qdisabmo        929
 qdisabwr        930
 qperscar        931
 qvetper         932
 qvetstat        933
 qvetyrs         934
 qcarpool        935
 qdeparts        936
 qpwstat2        937
 qriders         938
 qtrantim        939
 qtranwor        940
 qgcmonth        941
 qgcrespo        942
 repwtp1         943-946
 repwtp2         947-950
 repwtp3         951-954
 repwtp4         955-958
 repwtp5         959-962
 repwtp6         963-966
 repwtp7         967-970
 repwtp8         971-974
 repwtp9         975-978
 repwtp10        979-982
 repwtp11        983-986
 repwtp12        987-990
 repwtp13        991-994
 repwtp14        995-998
 repwtp15        999-1002
 repwtp16        1003-1006
 repwtp17        1007-1010
 repwtp18        1011-1014
 repwtp19        1015-1018
 repwtp20        1019-1022
 repwtp21        1023-1026
 repwtp22        1027-1030
 repwtp23        1031-1034
 repwtp24        1035-1038
 repwtp25        1039-1042
 repwtp26        1043-1046
 repwtp27        1047-1050
 repwtp28        1051-1054
 repwtp29        1055-1058
 repwtp30        1059-1062
 repwtp31        1063-1066
 repwtp32        1067-1070
 repwtp33        1071-1074
 repwtp34        1075-1078
 repwtp35        1079-1082
 repwtp36        1083-1086
 repwtp37        1087-1090
 repwtp38        1091-1094
 repwtp39        1095-1098
 repwtp40        1099-1102
 repwtp41        1103-1106
 repwtp42        1107-1110
 repwtp43        1111-1114
 repwtp44        1115-1118
 repwtp45        1119-1122
 repwtp46        1123-1126
 repwtp47        1127-1130
 repwtp48        1131-1134
 repwtp49        1135-1138
 repwtp50        1139-1142
 repwtp51        1143-1146
 repwtp52        1147-1150
 repwtp53        1151-1154
 repwtp54        1155-1158
 repwtp55        1159-1162
 repwtp56        1163-1166
 repwtp57        1167-1170
 repwtp58        1171-1174
 repwtp59        1175-1178
 repwtp60        1179-1182
 repwtp61        1183-1186
 repwtp62        1187-1190
 repwtp63        1191-1194
 repwtp64        1195-1198
 repwtp65        1199-1202
 repwtp66        1203-1206
 repwtp67        1207-1210
 repwtp68        1211-1214
 repwtp69        1215-1218
 repwtp70        1219-1222
 repwtp71        1223-1226
 repwtp72        1227-1230
 repwtp73        1231-1234
 repwtp74        1235-1238
 repwtp75        1239-1242
 repwtp76        1243-1246
 repwtp77        1247-1250
 repwtp78        1251-1254
 repwtp79        1255-1258
 repwtp80        1259-1262
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
 citypop="City population"
 puma="Public Use Microdata Area"
 pumasupr="Super Public Use Microdata Area"
 conspuma="Consistent Public Use Microdata Area"
 cntry="Country"
 gq="Group quarters status"
 gqtype="Group quarters type [general version]"
 gqtyped="Group quarters type [detailed version]"
 farm="Farm status"
 ownershp="Ownership of dwelling [general version]"
 ownershpd="Ownership of dwelling [detailed version]"
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
 owncost="Selected monthly owner costs"
 rent="Monthly contract rent"
 rentgrs="Monthly gross rent"
 rentmeal="Meals included in rent"
 condofee="Monthly condominium fee"
 moblhome="Annual mobile home costs"
 costelec="Annual electricity cost"
 costgas="Annual gas cost"
 costwatr="Annual water cost"
 costfuel="Annual home heating fuel cost"
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
 nsubfam="Number of subfamilies in household"
 ncouples="Number of married couples in household"
 nmothers="Number of mothers in household"
 nfathers="Number of fathers in household"
 qacrehou="Flag for Acrehous"
 qcommuse="Flag for Commuse"
 qcondofe="Flag for Condofee"
 qcostele="Flag for Costelec"
 qcostfue="Flag for Costfuel"
 qcostgas="Flag for Costgas"
 qcostwat="Flag for Costwatr"
 qfarmpro="Flag for Farmprod, Farm"
 qfoodstm="Flag for Foodstmp and Fdstpamt"
 qinsincl="Flag for Insrincl"
 qmoblhom="Flag for Moblhome, Moblhom2"
 qmortam1="Flag for Mortamt1"
 qmortam2="Flag for Mortamt2"
 qmortg2a="Flag for Mortgag2"
 qmortga2="Flag for Mortgag2"
 qmortgag="Flag for Mortgage"
 qownersh="Flag for Ownershp"
 qpropins="Flag for Propinsr"
 qprotx99="Flag for Proptx99"
 qrent="Flag for Rent, Rent30"
 qrentmea="Flag for Rentmeal"
 qtaxincl="Flag for Taxincl"
 qvalueh="Flag for Valueh"
 qvacancy="Flag for Vacancy"
 qbedroom="Flag for Bedrooms"
 qbuilty2="Flag for Builtyr2"
 qkitchen="Flag for Kitchen"
 qplumbin="Flag for Plumbing"
 qrooms="Flag for Rooms"
 qunitsst="Flag for Unitsstr"
 qfuelhea="Flag for Fuelheat"
 qphone="Flag for Phone"
 qvehicle="Data quality flag for VEHICLE"
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
 subfam="Subfamily membership"
 sftype="Subfamily type"
 sfrelate="Relationship within subfamily"
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
 ancestr1d="Ancestry, first response [detailed version]"
 ancestr2="Ancestry, second response [general version]"
 ancestr2d="Ancestry, second response [detailed version]"
 citizen="Citizenship status"
 yrimmig="Year of immigration"
 yrsusa1="Years in the United States"
 yrsusa2="Years in the United States, intervalled"
 language="Language spoken [general version]"
 languaged="Language spoken [detailed version]"
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
 educ00="Educational attainment, 2000 and ACS"
 educ99="Educational attainment, 1990"
 gradeatt="Grade level attending"
 schltype="Public or private school"
 empstat="Employment status [general version]"
 empstatd="Employment status [detailed version]"
 labforce="Labor force status"
 occ="Occupation"
 occ1950="Occupation, 1950 basis"
 occ1990="Occupation, 1990 basis"
 ind="Industry"
 ind1950="Industry, 1950 basis"
 ind1990="Industry, 1990 basis"
 classwkr="Class of worker [general version]"
 classwkrd="Class of worker [detailed version]"
 occsoc="Occupation, SOC classification"
 indnaics="Industry, NAICS classification"
 wkswork1="Weeks worked last year"
 wkswork2="Weeks worked last year, intervalled"
 uhrswork="Usual hours worked per week"
 absent="Absent from work last week"
 looking="Looking for work"
 availble="Available for work"
 wrkrecal="Informed of work recall"
 workedyr="Worked last year"
 inctot="Total personal income"
 ftotinc="Total family income"
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
 occscore="Occupational income score"
 sei="Duncan Socioeconomic Index"
 hwsei="Socioeconomic Index, Hauser and Warren"
 presgl="Occupational prestige score, Siegel"
 prent="Occupational prestige score, Nakao and Treas"
 erscor50="Occupational earnings score, 1950 basis"
 erscor90="Occupational earnings score, 1990 basis"
 edscor50="Occupational education score, 1950 basis"
 edscor90="Occupational education score, 1990 basis"
 npboss50="Nam-Powers-Boyd occupational status score, 1950 basis"
 npboss90="Nam-Powers-Boyd occupational status score, 1990 basis"
 migrate1="Migration status, 1 year [general version]"
 migrate1d="Migration status, 1 year [detailed version]"
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
 vet01ltr="Veteran, served 2001 or later"
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
 qage="Flag for Age"
 qfertyr="Flag for Fertyr"
 qmarst="Flag for Marst"
 qrelate="Flag for Relate"
 qsex="Flag for Sex"
 qbpl="Flag for Bpl, Nativity"
 qcitizen="Flag for Citizen"
 qhispan="Flag for Hispan"
 qlanguag="Flag for Language, Speakeng"
 qrace="Flag for Race, Racamind, Racasian, Racblk, Racpais, Racwht, Racoth, Racnum, Racesing, Probai, Probblk, Proboth, Probwht, Probapi"
 qspeaken="Flag for Speakeng"
 qyrimm="Flag for Yrimmig, Yrsusa1, Yrsusa2"
 qeduc="Flag for Educrec, Higrade, Educ99"
 qgradeat="Flag for Gradeatt"
 qschool="Flag for School, Schltype"
 qclasswk="Flag for Classwkr"
 qempstat="Flag for Empstat, Labforce"
 qind="Flag for Ind, Ind1950"
 qocc="Flag for Occ, Occ1950, SEI, Occscore, Occsoc, Labforce"
 quhrswor="Flag for Uhrswork"
 qwkswork="Flag for Wkswork1, Wkswork2"
 qworkedy="Flag for Workedyr"
 qincbus="Flag for Incbus, Inctot, Incearn"
 qincinvs="Flag for Incinvst, Inctot"
 qincothe="Flag for Incother, Inctot"
 qincreti="Flag for Incretir, Inctot"
 qincss="Flag for Incss, Inctot"
 qincsupp="Flag for Incsupp"
 qincwage="Flag for Incwage, Inctot, Incearn"
 qincwelf="Flag for Incwelfr, Inctot"
 qmigplc1="Flag for Migplac1"
 qmigrat1="Flag for Migrate1"
 qmovedin="Flag for Movedin"
 qdiffeye="Flag for Diffeye"
 qdiffphy="Flag for Diffphy"
 qdiffrem="Flag for Diffrem"
 qdisabmo="Flag for Disabmob"
 qdisabwr="Flag for Disabwrk"
 qperscar="Flag for Perscare"
 qvetper="Flag for Vetper, Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vet95x00, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01ltr, Vet47x50, Vet90x01"
 qvetstat="Flag for Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01ltr, Vet47x50, Vet90x01"
 qvetyrs="Flag for Vetyrs"
 qcarpool="Flag for Carpool"
 qdeparts="Flag for Departs"
 qpwstat2="Flag for Pwstate2"
 qriders="Flag for Riders"
 qtrantim="Flag for Trantime"
 qtranwor="Flag for Tranwork"
 qgcmonth="Flag for Gcmonths"
 qgcrespo="Flag for Gcrespon"
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
 year yearx_f.
 /***LONG FORMAT NAME ***  numprec numprec_f.***/
 numprec numprecf.
 /***LONG FORMAT NAME ***   subsamp subsamp_f.***/
 subsamp subsampf.
 hhtype hhtype_f.
 region region_f.
 /***LONG FORMAT NAME *** stateicp stateicp_f.***/
 stateicp stateicp.
 /***LONG FORMAT NAME ***  statefip statefip_f.***/
 statefip statefip.
 metro metro_f.
 /***LONG FORMAT NAME ***   metarea metarea_f.***/
 metarea metareaf.
  /***LONG FORMAT NAME ***   metaread metaread_f.***/
 metaread metaread.
 city city_f.
 cntry cntry_f.
 gq gq_f.
 gqtype gqtype_f.
 /***LONG FORMAT NAME ***   gqtyped gqtyped_f.***/
 gqtyped gqtypedf.
 farm farm_f.
 /***LONG FORMAT NAME ***   ownershp ownershp_f.***/
 ownershp ownershp.
 /***LONG FORMAT NAME ***   ownershpd ownershpd_f.***/
 ownershpd ownrshpd.
 /***LONG FORMAT NAME ***   mortgage mortgage_f.***/
 mortgage mortgage.
 /***LONG FORMAT NAME ***   mortgag2 mortgag2_f.***/
 mortgag2 mrtgag2f.
 /***LONG FORMAT NAME ***   commuse commuse_f.***/
 commuse commusef.
 /***LONG FORMAT NAME ***   acrehous acrehous_f.***/
 acrehous acrehous.
 /***LONG FORMAT NAME ***   taxincl taxincl_f.***/
 taxincl taxinclf.
 /***LONG FORMAT NAME ***   insincl insincl_f.***/
 insincl insinclf.
 /***LONG FORMAT NAME ***   proptx99 proptx99_f.***/
 proptx99 prptx99f.
 /***LONG FORMAT NAME ***   rentmeal rentmeal_f.***/
 rentmeal rentmeal.
 /***LONG FORMAT NAME ***   foodstmp foodstmp_f.***/
 foodstmp foodstmp.
 /***LONG FORMAT NAME ***   lingisol lingisol_f.***/
 lingisol lingisol.
 /***LONG FORMAT NAME ***   vacancy vacancy_f.***/
 vacancy vacancyf.
 /***LONG FORMAT NAME ***   kitchen kitchen_f.***/
 kitchen kitchenf.
 rooms rooms_f.
 /***LONG FORMAT NAME ***   plumbing plumbing_f.***/
 plumbing plumbing.
 /***LONG FORMAT NAME ***   builtyr2 builtyr2_f.***/
 builtyr2 builty2f.
 /***LONG FORMAT NAME ***   unitsstr unitsstr_f.***/
 unitsstr unitsstr.
 /***LONG FORMAT NAME ***   bedrooms bedrooms_f.***/
 bedrooms bedrooms.
 phone phone_f.
 /***LONG FORMAT NAME ***   fuelheat fuelheat_f.***/
 fuelheat fuelheat.
 /***LONG FORMAT NAME ***   vehicles vehicles_f.***/
 vehicles vehicles.
 nfams nfams_f.
 /***LONG FORMAT NAME ***   nsubfam nsubfam_f.***/
 nsubfam nsubfamf.
 /***LONG FORMAT NAME ***   ncouples ncouples_f.***/
 ncouples ncouples.
 /***LONG FORMAT NAME ***   nmothers nmothers_f.***/
 nmothers nmothers.
 /***LONG FORMAT NAME ***   nfathers nfathers_f.***/
 nfathers nfathers.
 /***LONG FORMAT NAME ***   respmode respmode_f.***/
 respmode respmode.
 /***LONG FORMAT NAME ***   stepmom stepmom_f.***/
 stepmom stepmomf.
 /***LONG FORMAT NAME ***   momrule momrule_f.***/
 momrule momrulef.
 /***LONG FORMAT NAME ***   steppop steppop_f.***/
 steppop steppopf.
 /***LONG FORMAT NAME ***   poprule poprule_f.***/
 poprule poprulef.
 sprule sprule_f.
 /***LONG FORMAT NAME ***   famsize famsize_f.***/
 famsize famsizef.
 nchild nchild_f.
 nchlt5 nchlt5_f.
 /***LONG FORMAT NAME ***   famunit famunit_f.***/
 famunit famunitf.
 eldch eldch_f.
 yngch yngch_f.
 nsibs nsibs_f.
 subfam subfam_f.
 sftype sftype_f.
 /***LONG FORMAT NAME ***   sfrelate sfrelate_f***/
 sfrelate sfrelate.
 relate relate_f.
 /***LONG FORMAT NAME ***   related related_f.***/
 related relatedf.
 age age_f.
 sex sex_f.
 marst marst_f.
 /***LONG FORMAT NAME ***   birthqtr birthqtr_f.***/
 birthqtr birthqtr.
 fertyr fertyr_f.
 race race_f.
 raced raced_f.
 bpl bpl_f.
 bpld bpld_f.
 /***LONG FORMAT NAME ***   ancestr1 ancestr1_f.***/
 ancestr1 ancstr1f.
 /***LONG FORMAT NAME ***   ancestr1d ancestr1d_f.***/
 ancestr1d ancstr1d.
 /***LONG FORMAT NAME ***   ancestr2 ancestr2_f.***/
 ancestr2 ancstr2f.
 /***LONG FORMAT NAME ***   ancestr2d ancestr2d_f.***/
 ancestr2d ancstr2d.
 /***LONG FORMAT NAME ***   citizen citizen_f.***/
 citizen citizenf.
 /***LONG FORMAT NAME ***   yrsusa2 yrsusa2_f.***/
 yrsusa2 yrsusa2f.
 /***LONG FORMAT NAME ***   language language_f.***/
 language language.
 /***LONG FORMAT NAME ***   languaged languaged_f.***/
 languaged lnguaged.
 /***LONG FORMAT NAME ***   speakeng speakeng_f.***/
 speakeng speakeng.
 hispan hispan_f.
 /***LONG FORMAT NAME ***   hispand hispand_f.***/
 hispand hispandf.
 tribe tribe_f.
 tribed tribed_f.
 /***LONG FORMAT NAME ***   racesing racesing_f.***/
 racesing racesing.
 /***LONG FORMAT NAME ***  racesingd racesingd. ***/
 racesingd racesind.
 school school_f.
 /***LONG FORMAT NAME ***   educrec educrec_f.***/
 educrec educrecf.
 educ00 educ00_f.
 educ99 educ99_f.
 /***LONG FORMAT NAME ***   gradeatt gradeatt_f.***/
 gradeatt gradeatt.
 /***LONG FORMAT NAME ***   schltype schltype_f.***/
 schltype schltype.
 /***LONG FORMAT NAME ***   empstat empstat_f.***/
 empstat empstatf.
 /***LONG FORMAT NAME ***   empstatd empstatd_f.***/
 empstatd empstatd.
 /***LONG FORMAT NAME ***   labforce labforce_f.***/
 labforce labforce.
 /***LONG FORMAT NAME ***   occ1950 occ1950_f.***/
 occ1950 occ1950f.
 /***LONG FORMAT NAME ***   occ1990 occ1990_f.***/
 occ1990 occ1990f.
 /***LONG FORMAT NAME ***   ind1950 ind1950_f.***/
 ind1950 ind1950f.
 /***LONG FORMAT NAME ***   ind1990 ind1990_f.***/
 ind1990 ind1990f.
 /***LONG FORMAT NAME ***   classwkr classwkr_f.***/
 classwkr classwkr.
 /***LONG FORMAT NAME ***   classwkrd classwkrd_f.***/
 classwkrd clsswkrd.
 /***LONG FORMAT NAME ***   wkswork2 wkswork2_f.***/
 wkswork2 wkswrk2f.
 absent absent_f.
 /***LONG FORMAT NAME ***   looking looking_f***/
 looking lookingf.
 /***LONG FORMAT NAME ***   availble availble_f.***/
 availble availble.
 /***LONG FORMAT NAME ***   wrkrecal wrkrecal_f.***/
 wrkrecal wrkrecal.
 /***LONG FORMAT NAME ***   workedyr workedyr_f.***/
 workedyr workedyr.
 /***LONG FORMAT NAME ***   migrate1 migrate1_f.***/
 migrate1 migrat1f.
 /***LONG FORMAT NAME ***   migrate1d migrate1d_f.***/
 migrate1d migrat1d.
 /***LONG FORMAT NAME ***   migplac1 migplac1_f.***/
 migplac1 migplc1f.
 /***LONG FORMAT NAME ***   migmet1 migmet1_f.***/
 migmet1 migmet1f.
 /***LONG FORMAT NAME ***   migtype1 migtype1_f.***/
 migtype1 migtyp1f.
 /***LONG FORMAT NAME ***   migcity1 migcity1_f.***/
 migcity1 migcty1f.
 /***LONG FORMAT NAME ***   disabwrk disabwrk_f.***/
 disabwrk disabwrk.
 /***LONG FORMAT NAME ***   disabmob disabmob_f.***/
 disabmob disabmob.
 /***LONG FORMAT NAME ***   perscare perscare_f.***/
 perscare perscare.
 /***LONG FORMAT NAME ***   diffphys diffphys_f.***/
 diffphys diffphys.
 /***LONG FORMAT NAME ***   diffrem diffrem_f.***/
 diffrem diffremf.
 /***LONG FORMAT NAME ***   diffeye diffeye_f.***/
 diffeye diffeyef.
 /***LONG FORMAT NAME ***   vetstat vetstat_f.***/
 vetstat vetstatf.
 /***LONG FORMAT NAME ***   vet01ltr vet01ltr_f.***/
 vet01ltr vet01ltr.
 /***LONG FORMAT NAME ***   vet90x01 vet90x01_f.***/
 vet90x01 vt90x01f.
 /***LONG FORMAT NAME ***   vet80x90 vet80x90_f.***/
 vet80x90 vt80x90f.
 /***LONG FORMAT NAME ***   vet75x80 vet75x80_f.***/
 vet75x80 vt75x80f.
 /***LONG FORMAT NAME ***   vetvietn vetvietn_f.***/
 vetvietn vetvietn.
 /***LONG FORMAT NAME ***   vet55x64 vet55x64_f.***/
 vet55x64 vt55x64f.
 /***LONG FORMAT NAME ***   vetkorea vetkorea_f.***/
 vetkorea vetkorea.
 /***LONG FORMAT NAME ***   vet47x50 vet47x50_f.***/
 vet47x50 vt47x50f.
 /***LONG FORMAT NAME ***   vetwwii vetwwii_f.***/
 vetwwii vetwwiif.
 /***LONG FORMAT NAME ***   vetother vetother_f.***/
 vetother vetother.
 /***LONG FORMAT NAME ***   pwstate2 pwstate2_f.***/
 pwstate2 pw_st2f.
 /***LONG FORMAT NAME ***   pwmetro pwmetro_f.***/
 pwmetro pwmetrof.
 pwcity pwcity_f.
 pwtype pwtype_f.
 /***LONG FORMAT NAME ***   tranwork tranwork_f.***/
 tranwork tranwork.
 /***LONG FORMAT NAME ***   carpool carpool_f.***/
 carpool carpoolf.
 riders riders_f.
 /***LONG FORMAT NAME ***   gchouse gchouse_f.***/
 gchouse gchousef.
 /***LONG FORMAT NAME ***   gcmonths gcmonths_f.***/
 gcmonths gcmonths.
 /***LONG FORMAT NAME ***   gcrespon gcrespon_f.***/
 gcrespon gcrespon.
;

  ** Create unique PUMA ID **;

  %upuma() 
  
  ** Recode n/a values **;
  
  array inca{*} inctot incwage incbus00 incretir incinvst valueh;

  do i = 1 to dim( inca );
    if inca{i} = 999999 then inca{i} = .n;
  end;

  array incb{*} incss incwelfr incsupp incother owncost;

  do i = 1 to dim( incb );
    if incb{i} = 99999 then incb{i} = .n;
  end;

  array incc{*} ftotinc hhincome;

  do i = 1 to dim( incc );
    if incc{i} = 9999999 then incc{i} = .n;
  end;

  ** Output files by state **;
  
  select ( statefip );
    when( &FIPS_DC ) output Ipums.ACS_2007_DC;
    when( &FIPS_MD ) output Ipums.ACS_2007_MD;
    when( &FIPS_VA ) output Ipums.ACS_2007_VA;
    when( &FIPS_WV ) output Ipums.ACS_2007_WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
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

%File_info( data=Ipums.ACS_2007_DC, printobs=5, freqvars=statefip acre: gq vacancy )

