/**************************************************************************
 Program:  ACS_2008.sas
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
  03/03/10 KEF  Changed INCTOT and VALUEH to 9999999-> .n recodes.
  06/25/10 PAT  Redownloaded data to add health coverage vars.
                Added missing format refs.
                Added N/A value recodes for costelec costgas costfuel 
                costwatr eldch yngch yrnatur erscor50 erscor90 edscor50 
                edscor90 npboss50 npboss90.                

 Updated: 2/12/10 KF for 2008
**************************************************************************/

%let yr = 2008;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\usa_00017.dat";

data 
  ipums.ACS_&yr._DC (label="IPUMS ACS sample, &yr., DC")
  ipums.ACS_&yr._MD (label="IPUMS ACS sample, &yr., MD")
  ipums.ACS_&yr._VA (label="IPUMS ACS sample, &yr., VA")
  ipums.ACS_&yr._WV (label="IPUMS ACS sample, &yr., WV")
  ;

infile asciidat LRECL=1335 pad missover;

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
 metro            45
 metarea          46-48
 metaread         49-52
 city             53-56
 citypop          57-61
 puma             62-66
 pumasupr         67-71
 conspuma         72-74
 homeland         75
 cntry            76-78
 gq               79
 gqtype           80
 gqtyped          81-83
 farm             84
 ownershp         85
 ownershpd        86-87
 mortgage         88
 mortgag2         89
 commuse          90
 farmprod         91
 acrehous         92
 mortamt1         93-97
 mortamt2         98-101
 taxincl         102
 insincl         103
 propinsr        104-107
 proptx99        108-109
 owncost         110-114
 rent            115-118
 rentgrs         119-122
 rentmeal        123
 condofee        124-127
 moblhome        128-131
 costelec        132-135
 costgas         136-139
 costwatr        140-143
 costfuel        144-147
 hhincome        148-154
 foodstmp        155
 valueh          156-162
 lingisol        163
 vacancy         164
 kitchen         165
 fridge          166
 sink            167
 stove           168
 rooms           169-170
 plumbing        171-172
 hotwater        173
 shower          174
 toilet          175
 builtyr2        176-177
 unitsstr        178-179
 bedrooms        180-181
 phone           182
 fuelheat        183
 vehicles        184
 nfams           185-186
 nsubfam         187
 ncouples        188
 nmothers        189
 nfathers        190
 multgen         191
 multgend        192-193
 headloc         194-195
 qacrehou        196
 qcommuse        197
 qcondofe        198
 qcostele        199
 qcostfue        200
 qcostgas        201
 qcostwat        202
 qfarmpro        203
 qfoodstm        204
 qinsincl        205
 qmoblhom        206
 qmortam1        207
 qmortam2        208
 qmortg2a        209
 qmortga2        210
 qmortgag        211
 qownersh        212
 qpropins        213
 qprotx99        214
 qrent           215
 qrentmea        216
 qtaxincl        217
 qvalueh         218
 qvacancy        219
 qbedroom        220
 qbuilty2        221
 qkitchen        222
 qfridge         223
 qsink           224
 qstove          225
 qplumbin        226
 qrooms          227
 qshower         228
 qunitsst        229
 qfuelhea        230
 qphone          231
 qvehicle        232
 repwt1          233-236
 repwt2          237-240
 repwt3          241-244
 repwt4          245-248
 repwt5          249-252
 repwt6          253-256
 repwt7          257-260
 repwt8          261-264
 repwt9          265-268
 repwt10         269-272
 repwt11         273-276
 repwt12         277-280
 repwt13         281-284
 repwt14         285-288
 repwt15         289-292
 repwt16         293-296
 repwt17         297-300
 repwt18         301-304
 repwt19         305-308
 repwt20         309-312
 repwt21         313-316
 repwt22         317-320
 repwt23         321-324
 repwt24         325-328
 repwt25         329-332
 repwt26         333-336
 repwt27         337-340
 repwt28         341-344
 repwt29         345-348
 repwt30         349-352
 repwt31         353-356
 repwt32         357-360
 repwt33         361-364
 repwt34         365-368
 repwt35         369-372
 repwt36         373-376
 repwt37         377-380
 repwt38         381-384
 repwt39         385-388
 repwt40         389-392
 repwt41         393-396
 repwt42         397-400
 repwt43         401-404
 repwt44         405-408
 repwt45         409-412
 repwt46         413-416
 repwt47         417-420
 repwt48         421-424
 repwt49         425-428
 repwt50         429-432
 repwt51         433-436
 repwt52         437-440
 repwt53         441-444
 repwt54         445-448
 repwt55         449-452
 repwt56         453-456
 repwt57         457-460
 repwt58         461-464
 repwt59         465-468
 repwt60         469-472
 repwt61         473-476
 repwt62         477-480
 repwt63         481-484
 repwt64         485-488
 repwt65         489-492
 repwt66         493-496
 repwt67         497-500
 repwt68         501-504
 repwt69         505-508
 repwt70         509-512
 repwt71         513-516
 repwt72         517-520
 repwt73         521-524
 repwt74         525-528
 repwt75         529-532
 repwt76         533-536
 repwt77         537-540
 repwt78         541-544
 repwt79         545-548
 repwt80         549-552
 respmode        553
 pernum          554-557
 perwt           558-563 .2
 slwt            564-569 .2
 repwtp          570
 momloc          571-572
 stepmom         573
 momrule         574
 poploc          575-576
 steppop         577
 poprule         578
 sploc           579-580
 sprule          581
 famsize         582-583
 nchild          584
 nchlt5          585
 famunit         586-587
 eldch           588-589
 yngch           590-591
 nsibs           592
 subfam          593
 sftype          594
 sfrelate        595
 relate          596-597
 related         598-601
 age             602-604
 sex             605
 marst           606
 birthqtr        607
 marrno          608
 marrinyr        609
 yrmarr          610-613
 widinyr         614
 divinyr         615
 fertyr          616
 race            617
 raced           618-620
 bpl             621-623
 bpld            624-628
 ancestr1        629-631
 ancestr1d       632-635
 ancestr2        636-638
 ancestr2d       639-642
 citizen         643
 yrnatur         644-647
 yrimmig         648-651
 yrsusa1         652-653
 yrsusa2         654
 language        655-656
 languaged       657-660
 speakeng        661
 hispan          662
 hispand         663-665
 tribe           666-669
 tribed          670-675
 racesing        676
 racesingd       677-678
 racamind        679
 racasian        680
 racblk          681
 racpacis        682
 racwht          683
 racother        684
 racnum          685
 hcovany         686
 hcovpriv        687
 hinsemp         688
 hinspur         689
 hinstri         690
 hcovpub         691
 hinscaid        692
 hinscare        693
 hinsva          694
 hinsihs         695
 school          696
 educ            697-698
 educd           699-701
 gradeatt        702
 gradeattd       703-704
 schltype        705
 empstat         706
 empstatd        707-708
 labforce        709
 occ             710-712
 occ1950         713-715
 occ1990         716-718
 ind             719-722
 ind1950         723-725
 ind1990         726-728
 classwkr        729
 classwkrd       730-731
 occsoc $        732-737
 indnaics $      738-745
 wkswork2        746
 uhrswork        747-748
 absent          749
 looking         750
 availble        751
 wrkrecal        752
 workedyr        753
 inctot          754-760
 ftotinc         761-767
 incwage         768-773
 incbus00        774-779
 incss           780-784
 incwelfr        785-789
 incinvst        790-795
 incretir        796-801
 incsupp         802-806
 incother        807-811
 incearn         812-818
 poverty         819-821
 occscore        822-823
 sei             824-825
 hwsei           826-829 .2
 presgl          830-832 .1
 prent           833-835 .1
 erscor50        836-839 .1
 erscor90        840-843 .1
 edscor50        844-847 .1
 edscor90        848-851 .1
 npboss50        852-855 .1
 npboss90        856-859 .1
 migrate1        860
 migrate1d       861-862
 migplac1        863-865
 migmet1         866-869
 migtype1        870
 migcity1        871-874
 migpums1        875-877
 migpuma1        878-880
 movedin         881
 vetdisab        882
 diffrem         883
 diffphys        884
 diffmob         885
 diffcare        886
 diffsens        887
 diffeye         888
 diffhear        889
 vetstat         890
 vetstatd        891-892
 vet01ltr        893
 vet90x01        894
 vet80x90        895
 vet75x80        896
 vetvietn        897
 vet55x64        898
 vetkorea        899
 vet47x50        900
 vetwwii         901
 vetother        902
 pwstate2        903-904
 pwmetro         905-908
 pwcity          909-912
 pwtype          913
 pwpuma00        914-917
 pwpumas         918-920
 tranwork        921-922
 carpool         923
 riders          924
 trantime        925-927
 departs         928-931
 arrives         932-935
 gchouse         936
 gcmonths        937
 gcrespon        938
 probai          939-941
 probapi         942-944
 probblk         945-947
 proboth         948-950
 probwht         951-953
 qage            954
 qfertyr         955
 qmarst          956
 qrelate         957
 qsex            958
 qyrmarr         959
 qwidinyr        960
 qdivinyr        961
 qbpl            962
 qcitizen        963
 qhispan         964
 qlanguag        965
 qrace           966
 qspeaken        967
 qyrimm          968
 qhinsemp        969
 qhinspur        970
 qhinstri        971
 qhinscai        972
 qhinscar        973
 qhinsva         974
 qhinsihs        975
 qeduc           976
 qgradeat        977
 qschool         978
 qclasswk        979
 qempstat        980
 qind            981
 qocc            982
 quhrswor        983
 qwkswork        984
 qworkedy        985
 qincbus         986
 qincinvs        987
 qincothe        988
 qincreti        989
 qincss          990
 qincsupp        991
 qincwage        992
 qincwelf        993
 qmigplc1        994
 qmigrat1        995
 qmovedin        996
 qdifsens        997
 qdifphys        998
 qdifrem         999
 qdifmob         1000
 qdifcare        1001
 qdifeye         1002
 qdifhear        1003
 qvetdisb        1004
 qvetper         1005
 qvetstat        1006
 qcarpool        1007
 qdeparts        1008
 qpwstat2        1009
 qriders         1010
 qtrantim        1011
 qtranwor        1012
 qgchouse        1013
 qgcmonth        1014
 qgcrespo        1015
 repwtp1         1016-1019
 repwtp2         1020-1023
 repwtp3         1024-1027
 repwtp4         1028-1031
 repwtp5         1032-1035
 repwtp6         1036-1039
 repwtp7         1040-1043
 repwtp8         1044-1047
 repwtp9         1048-1051
 repwtp10        1052-1055
 repwtp11        1056-1059
 repwtp12        1060-1063
 repwtp13        1064-1067
 repwtp14        1068-1071
 repwtp15        1072-1075
 repwtp16        1076-1079
 repwtp17        1080-1083
 repwtp18        1084-1087
 repwtp19        1088-1091
 repwtp20        1092-1095
 repwtp21        1096-1099
 repwtp22        1100-1103
 repwtp23        1104-1107
 repwtp24        1108-1111
 repwtp25        1112-1115
 repwtp26        1116-1119
 repwtp27        1120-1123
 repwtp28        1124-1127
 repwtp29        1128-1131
 repwtp30        1132-1135
 repwtp31        1136-1139
 repwtp32        1140-1143
 repwtp33        1144-1147
 repwtp34        1148-1151
 repwtp35        1152-1155
 repwtp36        1156-1159
 repwtp37        1160-1163
 repwtp38        1164-1167
 repwtp39        1168-1171
 repwtp40        1172-1175
 repwtp41        1176-1179
 repwtp42        1180-1183
 repwtp43        1184-1187
 repwtp44        1188-1191
 repwtp45        1192-1195
 repwtp46        1196-1199
 repwtp47        1200-1203
 repwtp48        1204-1207
 repwtp49        1208-1211
 repwtp50        1212-1215
 repwtp51        1216-1219
 repwtp52        1220-1223
 repwtp53        1224-1227
 repwtp54        1228-1231
 repwtp55        1232-1235
 repwtp56        1236-1239
 repwtp57        1240-1243
 repwtp58        1244-1247
 repwtp59        1248-1251
 repwtp60        1252-1255
 repwtp61        1256-1259
 repwtp62        1260-1263
 repwtp63        1264-1267
 repwtp64        1268-1271
 repwtp65        1272-1275
 repwtp66        1276-1279
 repwtp67        1280-1283
 repwtp68        1284-1287
 repwtp69        1288-1291
 repwtp70        1292-1295
 repwtp71        1296-1299
 repwtp72        1300-1303
 repwtp73        1304-1307
 repwtp74        1308-1311
 repwtp75        1312-1315
 repwtp76        1316-1319
 repwtp77        1320-1323
 repwtp78        1324-1327
 repwtp79        1328-1331
 repwtp80        1332-1335
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
 metro="Metropolitan status"
 metarea="Metropolitan area [general version]"
 metaread="Metropolitan area [detailed version]"
 city="City"
 citypop="City population"
 puma="Public Use Microdata Area"
 pumasupr="Super Public Use Microdata Area"
 conspuma="Consistent Public Use Microdata Area"
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
 headloc="Location of household head"
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
 school="School attendance"
 educ="Educational attainment [general version]"
 educd="Educational attainment [detailed version]"
 gradeatt="Grade level attending [general version]"
 gradeattd="Grade level attending [detailed version]"
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

%File_info( data=Ipums.ACS_&yr._DC, printobs=5, freqvars=statefip acre: gq vacancy )



proc means data=Ipums.ACS_&yr._DC;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._MD;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._VA;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
proc means data=Ipums.ACS_&yr._WV;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;
