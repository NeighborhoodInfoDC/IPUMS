/**************************************************************************
 Program:  ACS_2009.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/15/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Read raw IPUMS 2009 ACS data and create data sets 
 for DC, MD, VA, and WV.

 Modifications:
  09/21/07 PAT  Recoded n/a values in INC*, HHINCOME, and VALUEH vars.
  10/23/07 PAT  Added to list of extraneous format associations.
                Added formats for IND and OCC.
  07/28/09 PAT  Added INCINVST to 999999->.n recodes.
                Added FTOTINC, HHINCOME to 9999999->.n recodes.
                Added OWNCOST to 99999->.n recodes.
  03/03/10 KEF  Changed INCTOT and VALUEH to 9999999-> .n recodes.
  06/25/10 PAT  Redownloaded data to add health coverage vars.
                Added missing format refs.
                Added N/A value recodes for costelec costgas costfuel 
                costwatr eldch yngch yrnatur erscor50 erscor90 edscor50 
                edscor90 npboss50 npboss90.                
  02/09/11 PAT  Updated for 2009 data.

**************************************************************************/

%let yr = 2009;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\usa_00018.dat";

data 
  ipums.ACS_&yr._DC (label="IPUMS ACS sample, &yr., DC")
  ipums.ACS_&yr._MD (label="IPUMS ACS sample, &yr., MD")
  ipums.ACS_&yr._VA (label="IPUMS ACS sample, &yr., VA")
  ipums.ACS_&yr._WV (label="IPUMS ACS sample, &yr., WV")
  ;

infile asciidat LRECL=1370 pad missover;
input
 year              1-4
 datanum           5-6
 serial            7-14
 numprec          15-16
 subsamp          17-18
 hhwt             19-24 .2
 hhtype           25
 repwt            26
 adjust           27-33 .6
 cpi99            34-38 .3
 region           39-40
 stateicp         41-42
 statefip         43-44
 county           45-48
 metro            49
 metarea          50-52
 metaread         53-56
 city             57-60
 citypop          61-65
 puma             66-70
 pumasupr         71-75
 conspuma         76-78
 appal            79
 appald           80-81
 homeland         82
 cntry            83-85
 gq               86
 gqtype           87
 gqtyped          88-90
 farm             91
 ownershp         92
 ownershpd        93-94
 mortgage         95
 mortgag2         96
 commuse          97
 farmprod         98
 acrehous         99
 mortamt1        100-104
 mortamt2        105-108
 taxincl         109
 insincl         110
 propinsr        111-114
 proptx99        115-116
 owncost         117-121
 rent            122-125
 rentgrs         126-129
 rentmeal        130
 condofee        131-134
 moblhome        135-138
 costelec        139-142
 costgas         143-146
 costwatr        147-150
 costfuel        151-154
 hhincome        155-161
 foodstmp        162
 valueh          163-169
 lingisol        170
 vacancy         171
 kitchen         172
 fridge          173
 sink            174
 stove           175
 rooms           176-177
 plumbing        178-179
 hotwater        180
 shower          181
 toilet          182
 builtyr2        183-184
 unitsstr        185-186
 bedrooms        187-188
 phone           189
 fuelheat        190
 vehicles        191
 nfams           192-193
 nsubfam         194
 ncouples        195
 nmothers        196
 nfathers        197
 multgen         198
 multgend        199-200
 qacrehou        201
 qcommuse        202
 qcondofe        203
 qcostele        204
 qcostfue        205
 qcostgas        206
 qcostwat        207
 qfarmpro        208
 qfoodstm        209
 qinsincl        210
 qmoblhom        211
 qmortam1        212
 qmortam2        213
 qmortg2a        214
 qmortga2        215
 qmortgag        216
 qownersh        217
 qpropins        218
 qprotx99        219
 qrent           220
 qrentmea        221
 qtaxincl        222
 qvalueh         223
 qvacancy        224
 qbedroom        225
 qbuilty2        226
 qkitchen        227
 qfridge         228
 qsink           229
 qstove          230
 qplumbin        231
 qrooms          232
 qshower         233
 qunitsst        234
 qfuelhea        235
 qphone          236
 qvehicle        237
 repwt1          238-241
 repwt2          242-245
 repwt3          246-249
 repwt4          250-253
 repwt5          254-257
 repwt6          258-261
 repwt7          262-265
 repwt8          266-269
 repwt9          270-273
 repwt10         274-277
 repwt11         278-281
 repwt12         282-285
 repwt13         286-289
 repwt14         290-293
 repwt15         294-297
 repwt16         298-301
 repwt17         302-305
 repwt18         306-309
 repwt19         310-313
 repwt20         314-317
 repwt21         318-321
 repwt22         322-325
 repwt23         326-329
 repwt24         330-333
 repwt25         334-337
 repwt26         338-341
 repwt27         342-345
 repwt28         346-349
 repwt29         350-353
 repwt30         354-357
 repwt31         358-361
 repwt32         362-365
 repwt33         366-369
 repwt34         370-373
 repwt35         374-377
 repwt36         378-381
 repwt37         382-385
 repwt38         386-389
 repwt39         390-393
 repwt40         394-397
 repwt41         398-401
 repwt42         402-405
 repwt43         406-409
 repwt44         410-413
 repwt45         414-417
 repwt46         418-421
 repwt47         422-425
 repwt48         426-429
 repwt49         430-433
 repwt50         434-437
 repwt51         438-441
 repwt52         442-445
 repwt53         446-449
 repwt54         450-453
 repwt55         454-457
 repwt56         458-461
 repwt57         462-465
 repwt58         466-469
 repwt59         470-473
 repwt60         474-477
 repwt61         478-481
 repwt62         482-485
 repwt63         486-489
 repwt64         490-493
 repwt65         494-497
 repwt66         498-501
 repwt67         502-505
 repwt68         506-509
 repwt69         510-513
 repwt70         514-517
 repwt71         518-521
 repwt72         522-525
 repwt73         526-529
 repwt74         530-533
 repwt75         534-537
 repwt76         538-541
 repwt77         542-545
 repwt78         546-549
 repwt79         550-553
 repwt80         554-557
 respmode        558
 pernum          559-562
 perwt           563-568 .2
 slwt            569-574 .2
 repwtp          575
 momloc          576-577
 stepmom         578
 momrule         579
 poploc          580-581
 steppop         582
 poprule         583
 sploc           584-585
 sprule          586
 famsize         587-588
 nchild          589
 nchlt5          590
 famunit         591-592
 eldch           593-594
 yngch           595-596
 nsibs           597
 subfam          598
 sftype          599
 sfrelate        600
 relate          601-602
 related         603-606
 age             607-609
 sex             610
 marst           611
 birthqtr        612
 marrno          613
 marrinyr        614
 yrmarr          615-618
 widinyr         619
 divinyr         620
 fertyr          621
 race            622
 raced           623-625
 bpl             626-628
 bpld            629-633
 ancestr1        634-636
 ancestr1d       637-640
 ancestr2        641-643
 ancestr2d       644-647
 citizen         648
 yrnatur         649-652
 yrimmig         653-656
 yrsusa1         657-658
 yrsusa2         659
 language        660-661
 languaged       662-665
 speakeng        666
 hispan          667
 hispand         668-670
 tribe           671-674
 tribed          675-680
 racesing        681
 racesingd       682-683
 racamind        684
 racasian        685
 racblk          686
 racpacis        687
 racwht          688
 racother        689
 racnum          690
 hcovany         691
 hcovpriv        692
 hinsemp         693
 hinspur         694
 hinstri         695
 hcovpub         696
 hinscaid        697
 hinscare        698
 hinsva          699
 hinsihs         700
 hcovany2        701
 hcovpriv2       702
 hinsemp2        703
 hinspur2        704
 hinstri2        705
 hcovpub2        706
 hinscaid2       707
 hinscare2       708
 hinsva2         709
 hinsihs2        710
 school          711
 educ            712-713
 educd           714-716
 gradeatt        717
 gradeattd       718-719
 schltype        720
 degfield        721-722
 degfieldd       723-726
 degfield2       727-728
 degfield2d      729-732
 empstat         733
 empstatd        734-735
 labforce        736
 occ             737-739
 occ1950         740-742
 occ1990         743-745
 ind             746-749
 ind1950         750-752
 ind1990         753-755
 classwkr        756
 classwkrd       757-758
 occsoc $        759-764
 indnaics $      765-772
 wkswork2        773
 uhrswork        774-775
 absent          776
 looking         777
 availble        778
 wrkrecal        779
 workedyr        780
 inctot          781-787
 ftotinc         788-794
 incwage         795-800
 incbus00        801-806
 incss           807-811
 incwelfr        812-816
 incinvst        817-822
 incretir        823-828
 incsupp         829-833
 incother        834-838
 incearn         839-845
 poverty         846-848
 occscore        849-850
 sei             851-852
 hwsei           853-856 .2
 presgl          857-859 .1
 prent           860-862 .1
 erscor50        863-866 .1
 erscor90        867-870 .1
 edscor50        871-874 .1
 edscor90        875-878 .1
 npboss50        879-882 .1
 npboss90        883-886 .1
 migrate1        887
 migrate1d       888-889
 migplac1        890-892
 migmet1         893-896
 migtype1        897
 migcity1        898-901
 migpums1        902-904
 migpuma1        905-907
 movedin         908
 vetdisab        909
 diffrem         910
 diffphys        911
 diffmob         912
 diffcare        913
 diffsens        914
 diffeye         915
 diffhear        916
 vetstat         917
 vetstatd        918-919
 vet01ltr        920
 vet90x01        921
 vet80x90        922
 vet75x80        923
 vetvietn        924
 vet55x64        925
 vetkorea        926
 vet47x50        927
 vetwwii         928
 vetother        929
 pwstate2        930-931
 pwmetro         932-935
 pwcity          936-939
 pwtype          940
 pwpuma00        941-944
 pwpumas         945-947
 tranwork        948-949
 carpool         950
 riders          951
 trantime        952-954
 departs         955-958
 arrives         959-962
 gchouse         963
 gcmonths        964
 gcrespon        965
 probai          966-968
 probapi         969-971
 probblk         972-974
 proboth         975-977
 probwht         978-980
 qage            981
 qfertyr         982
 qmarst          983
 qrelate         984
 qsex            985
 qyrmarr         986
 qwidinyr        987
 qdivinyr        988
 qbpl            989
 qcitizen        990
 qhispan         991
 qlanguag        992
 qrace           993
 qspeaken        994
 qyrimm          995
 qhinsemp        996
 qhinspur        997
 qhinstri        998
 qhinscai        999
 qhinscar        1000
 qhinsva         1001
 qhinsihs        1002
 qhinsemp2       1003
 qhinspur2       1004
 qhinstri2       1005
 qhinscai2       1006
 qhinscar2       1007
 qhinsva2        1008
 qhinsihs2       1009
 qeduc           1010
 qgradeat        1011
 qdegfield       1012
 qschool         1013
 qclasswk        1014
 qempstat        1015
 qind            1016
 qocc            1017
 quhrswor        1018
 qwkswork        1019
 qworkedy        1020
 qincbus         1021
 qincinvs        1022
 qincothe        1023
 qincreti        1024
 qincss          1025
 qincsupp        1026
 qincwage        1027
 qincwelf        1028
 qmigplc1        1029
 qmigrat1        1030
 qmovedin        1031
 qdifsens        1032
 qdifphys        1033
 qdifrem         1034
 qdifmob         1035
 qdifcare        1036
 qdifeye         1037
 qdifhear        1038
 qvetdisb        1039
 qvetper         1040
 qvetstat        1041
 qcarpool        1042
 qdeparts        1043
 qpwstat2        1044
 qriders         1045
 qtrantim        1046
 qtranwor        1047
 qgchouse        1048
 qgcmonth        1049
 qgcrespo        1050
 repwtp1         1051-1054
 repwtp2         1055-1058
 repwtp3         1059-1062
 repwtp4         1063-1066
 repwtp5         1067-1070
 repwtp6         1071-1074
 repwtp7         1075-1078
 repwtp8         1079-1082
 repwtp9         1083-1086
 repwtp10        1087-1090
 repwtp11        1091-1094
 repwtp12        1095-1098
 repwtp13        1099-1102
 repwtp14        1103-1106
 repwtp15        1107-1110
 repwtp16        1111-1114
 repwtp17        1115-1118
 repwtp18        1119-1122
 repwtp19        1123-1126
 repwtp20        1127-1130
 repwtp21        1131-1134
 repwtp22        1135-1138
 repwtp23        1139-1142
 repwtp24        1143-1146
 repwtp25        1147-1150
 repwtp26        1151-1154
 repwtp27        1155-1158
 repwtp28        1159-1162
 repwtp29        1163-1166
 repwtp30        1167-1170
 repwtp31        1171-1174
 repwtp32        1175-1178
 repwtp33        1179-1182
 repwtp34        1183-1186
 repwtp35        1187-1190
 repwtp36        1191-1194
 repwtp37        1195-1198
 repwtp38        1199-1202
 repwtp39        1203-1206
 repwtp40        1207-1210
 repwtp41        1211-1214
 repwtp42        1215-1218
 repwtp43        1219-1222
 repwtp44        1223-1226
 repwtp45        1227-1230
 repwtp46        1231-1234
 repwtp47        1235-1238
 repwtp48        1239-1242
 repwtp49        1243-1246
 repwtp50        1247-1250
 repwtp51        1251-1254
 repwtp52        1255-1258
 repwtp53        1259-1262
 repwtp54        1263-1266
 repwtp55        1267-1270
 repwtp56        1271-1274
 repwtp57        1275-1278
 repwtp58        1279-1282
 repwtp59        1283-1286
 repwtp60        1287-1290
 repwtp61        1291-1294
 repwtp62        1295-1298
 repwtp63        1299-1302
 repwtp64        1303-1306
 repwtp65        1307-1310
 repwtp66        1311-1314
 repwtp67        1315-1318
 repwtp68        1319-1322
 repwtp69        1323-1326
 repwtp70        1327-1330
 repwtp71        1331-1334
 repwtp72        1335-1338
 repwtp73        1339-1342
 repwtp74        1343-1346
 repwtp75        1347-1350
 repwtp76        1351-1354
 repwtp77        1355-1358
 repwtp78        1359-1362
 repwtp79        1363-1366
 repwtp80        1367-1370
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
 adjust="Adjustment factor, ACS/PRCS"
 cpi99="CPI-U adjustment factor to 1999 dollars"
 region="Census region and division"
 stateicp="State (ICPSR code)"
 statefip="State (FIPS code)"
 county="County"
 metro="Metropolitan status"
 metarea="Metropolitan area [general version]"
 metaread="Metropolitan area [detailed version]"
 city="City"
 citypop="City population"
 puma="Public Use Microdata Area"
 pumasupr="Super Public Use Microdata Area"
 conspuma="Consistent Public Use Microdata Area"
 appal="Appalachian region [general version]"
 appald="Appalachian region [detailed version]"
 homeland="American Indian, Alaska Native, or Native Hawaiian homeland area"
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
 valueh="House value"
 lingisol="Linguistic isolation"
 vacancy="Vacancy status"
 kitchen="Kitchen or cooking facilities"
 fridge="Refrigerator"
 sink="Sink with faucet"
 stove="Stove or range"
 rooms="Number of rooms"
 plumbing="Plumbing facilities"
 hotwater="Hot and cold piped water"
 shower="Bathtub or shower"
 toilet="Flush toilet"
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
 multgen="Multigenerational household [general version]"
 multgend="Multigenerational household [detailed version]"
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
 qfridge="Data quality flag for FRIDGE"
 qsink="Data quality flag for SINK"
 qstove="Data quality flag for STOVE"
 qplumbin="Flag for Plumbing"
 qrooms="Flag for Rooms"
 qshower="Flag for Shower"
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
 respmode="Response mode"
 pernum="Person number in sample unit"
 perwt="Person weight"
 slwt="Sample-line weight"
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
 marrno="Times married"
 marrinyr="Married within the past year"
 yrmarr="Year married"
 widinyr="Widowed in the past year"
 divinyr="Divorced in the past year"
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
 yrnatur="Year naturalized"
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
 hcovany="Any health insurance coverage"
 hcovpriv="Private health insurance coverage"
 hinsemp="Health insurance through employer/union"
 hinspur="Health insurance purchased directly"
 hinstri="Health insurance through TRICARE"
 hcovpub="Public health insurance coverage"
 hinscaid="Health insurance through Medicaid"
 hinscare="Health insurance through Medicare"
 hinsva="Health insurance through VA"
 hinsihs="Health insurance through Indian Health Services"
 hcovany2="Any health insurance coverage (original)"
 hcovpriv2="Private health insurance coverage (original)"
 hinsemp2="Health insurance through employer/union (original)"
 hinspur2="Health insurance purchased directly (original)"
 hinstri2="Health insurance through TRICARE (original)"
 hcovpub2="Public health insurance coverage (original)"
 hinscaid2="Health insurance through Medicaid (original)"
 hinscare2="Health insurance through Medicare (original)"
 hinsva2="Health insurance through VA (original)"
 hinsihs2="Health insurance through Indian Health Services (original)"
 school="School attendance"
 educ="Educational attainment [general version]"
 educd="Educational attainment [detailed version]"
 gradeatt="Grade level attending [general version]"
 gradeattd="Grade level attending [detailed version]"
 schltype="Public or private school"
 degfield="Field of degree [general version]"
 degfieldd="Field of degree [detailed version]"
 degfield2="Field of degree (2) [general version]"
 degfield2d="Field of degree (2) [detailed version]"
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
 vetdisab="VA service-connected disability rating"
 diffrem="Cognitive difficulty"
 diffphys="Ambulatory difficulty"
 diffmob="Independent living difficulty"
 diffcare="Self-care difficulty"
 diffsens="Vision or hearing difficulty"
 diffeye="Vision difficulty"
 diffhear="Hearing difficulty"
 vetstat="Veteran status [general version]"
 vetstatd="Veteran status [detailed version]"
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
 qyrmarr="Data quality flag for YRLSTMAR"
 qwidinyr="Data quality flag for WIDINYR"
 qdivinyr="Data quality flag for DIVINYR"
 qbpl="Flag for Bpl, Nativity"
 qcitizen="Flag for Citizen"
 qhispan="Flag for Hispan"
 qlanguag="Flag for Language, Speakeng"
 qrace="Flag for Race, Racamind, Racasian, Racblk, Racpais, Racwht, Racoth, Racnum, Racesing, Probai, Probblk, Proboth, Probwht, Probapi"
 qspeaken="Flag for Speakeng"
 qyrimm="Flag for Yrimmig, Yrsusa1, Yrsusa2"
 qhinsemp="Data quality flag for HINSEMP"
 qhinspur="Data quality flag for HINSPUR"
 qhinstri="Data quality flag for HINSTRI"
 qhinscai="Data quality flag for HINSCAID"
 qhinscar="Data quality flag for HINSCARE"
 qhinsva="Data quality flag for HINSVA"
 qhinsihs="Data quality flag for HINSIHS"
 qhinsemp2="Data quality flag for HINSEMP (original)"
 qhinspur2="Data quality flag for HINSPUR (original)"
 qhinstri2="Data quality flag for HINSTRI (original)"
 qhinscai2="Data quality flag for HINSCAID (original)"
 qhinscar2="Data quality flag for HINSCARE (original)"
 qhinsva2="Data quality flag for HINSVA (original)"
 qhinsihs2="Data quality flag for HINSIHS (original)"
 qeduc="Flag for Educrec, Higrade, Educ99"
 qgradeat="Flag for Gradeatt"
 qdegfield="Data quality flag for DEGFIELD and DEGFIELD2"
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
 qdifsens="Flag for Diffsens"
 qdifphys="Flag for Diffphys"
 qdifrem="Flag for Diffrem"
 qdifmob="Flag for Diffmob"
 qdifcare="Flag for Diffcare"
 qdifeye="Data quality flag for DIFFEYE"
 qdifhear="Data quality flag for DIFFHEAR"
 qvetdisb="Data quality flag for VETDISAB"
 qvetper="Flag for Vetper, Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vet95x00, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01ltr, Vet47x50, Vet90x01"
 qvetstat="Flag for Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01ltr, Vet47x50, Vet90x01"
 qcarpool="Flag for Carpool"
 qdeparts="Flag for Departs"
 qpwstat2="Flag for Pwstate2"
 qriders="Flag for Riders"
 qtrantim="Flag for Trantime"
 qtranwor="Flag for Tranwork"
 qgchouse="Flag for Gchouse"
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
  /***LONG FORMAT NAME ***  homeland homeland_f.***/
 homeland homeland.
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
 /***LONG FORMAT NAME ***   multgen multgen_f.***/
 multgen multgenf.
 /***LONG FORMAT NAME ***   multgend multgend_f.***/
 multgend multgend.
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
 educ educ_f.
 educd educd_f.
 /***LONG FORMAT NAME ***   gradeatt gradeatt_f.***/
 gradeatt gradeatt.
 /***LONG FORMAT NAME ***   gradeatt gradeatt_f.***/
 gradeattd grdeattd.
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
 /***LONG FORMAT NAME ***   diffrem diffrem_f.***/
 diffrem diffremf.
 /***LONG FORMAT NAME ***   diffphys diffphys_f.***/
 diffphys diffphys.
 /***LONG FORMAT NAME ***   diffmob diffmob_f.***/
 diffmob diffmobf.
 /***LONG FORMAT NAME ***   diffcare diffcare_f.***/
 diffcare diffcare.
 /***LONG FORMAT NAME ***   diffsens diffsens_f.***/
 diffsens diffsens.
 /***LONG FORMAT NAME ***   vetstat vetstat_f.***/
 vetstat vetstatf.
 /***LONG FORMAT NAME ***   vetstatd vetstatd_f.***/
 vetstatd vetstatd.
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
 
 /******** Formats added 6/25/10 ****************/
 /***LONG FORMAT NAME *** removed _f from all ***/
 hcovany hcovany.
 hcovpriv hcovpriv.
 hinsemp hinsemp.
 hinspur hinspur.
 hinstri hinstri.
 hcovpub hcovpub.
 hinscaid hinscaid.
 hinscare hinscare.
 hinsva hinsva.
 hinsihs hinsihs.
 diffeye diffeye.
 diffhear diffhear.
 divinyr divinyr.
 fridge fridge.
 hotwater hotwater.
 marrinyr marrinyr.
 marrno marrno.
 shower shower.
 sink sink.
 stove stove.
 toilet toilet.
 vetdisab vetdisab.
 widinyr widinyr.

 /*** UI-created format for race Yes/No vars. ***/
 racamind racasian racblk racother racpacis racwht uracyn.
;

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
    when( &FIPS_DC ) output Ipums.ACS_&yr._DC;
    when( &FIPS_MD ) output Ipums.ACS_&yr._MD;
    when( &FIPS_VA ) output Ipums.ACS_&yr._VA;
    when( &FIPS_WV ) output Ipums.ACS_&yr._WV;
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
    rentgrs condofee moblhome cost: ftotinc hhincome 
    valueh pernum slwt q: uhrswork inc: poverty
    migmet1 migpums1 migpuma1 movedin pwpuma00 pwpumas
    trantime departs arrives yrsusa1 yrimmig
  ;  
  
  format ind indac05f.;
  format occ occac05f.;
  
  drop i;

run;

%File_info( data=Ipums.ACS_&yr._DC, printobs=5, freqvars=statefip acre: gq vacancy hud_inc )

proc print data=Ipums.ACS_&yr._DC;
  where hud_inc = .;
  id serial;
  var year hud_inc hhincome numprec gq;
run;

proc means data=Ipums.ACS_&yr._DC n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._MD n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._VA n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._WV n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
