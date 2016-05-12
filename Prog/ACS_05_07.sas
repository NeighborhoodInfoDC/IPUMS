/**************************************************************************
 Program:  ACS_05_07.sas
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

  Updated 7/21/09 KF
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\usa_00002.dat";

data 
  ipums.ACS_05_07_DC (label="IPUMS ACS sample, 2005-2007, DC")
  ipums.ACS_05_07_MD (label="IPUMS ACS sample, 2005-2007, MD")
  ipums.ACS_05_07_VA (label="IPUMS ACS sample, 2005-2007, VA")
  ipums.ACS_05_07_WV (label="IPUMS ACS sample, 2005-2007, WV")
  ;

infile asciidat LRECL=1174 pad missover;
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
 rent             95-98
 rentgrs          99-102
 rentmeal        103
 condofee        104-107
 moblhome        108-111
 costelec        112-115
 costgas         116-119
 costwatr        120-123
 costfuel        124-127
 hhincome        128-134
 foodstmp        135
 fdstpamt        136-140
 valueh          141-146
 lingisol        147
 vacancy         148
 kitchen         149
 rooms           150
 plumbing        151-152
 builtyr2        153-154
 unitsstr        155-156
 bedrooms        157
 phone           158
 fuelheat        159
 vehicles        160
 nfams           161-162
 nsubfam         163
 ncouples        164
 nmothers        165
 nfathers        166
 repwt1          167-170
 repwt2          171-174
 repwt3          175-178
 repwt4          179-182
 repwt5          183-186
 repwt6          187-190
 repwt7          191-194
 repwt8          195-198
 repwt9          199-202
 repwt10         203-206
 repwt11         207-210
 repwt12         211-214
 repwt13         215-218
 repwt14         219-222
 repwt15         223-226
 repwt16         227-230
 repwt17         231-234
 repwt18         235-238
 repwt19         239-242
 repwt20         243-246
 repwt21         247-250
 repwt22         251-254
 repwt23         255-258
 repwt24         259-262
 repwt25         263-266
 repwt26         267-270
 repwt27         271-274
 repwt28         275-278
 repwt29         279-282
 repwt30         283-286
 repwt31         287-290
 repwt32         291-294
 repwt33         295-298
 repwt34         299-302
 repwt35         303-306
 repwt36         307-310
 repwt37         311-314
 repwt38         315-318
 repwt39         319-322
 repwt40         323-326
 repwt41         327-330
 repwt42         331-334
 repwt43         335-338
 repwt44         339-342
 repwt45         343-346
 repwt46         347-350
 repwt47         351-354
 repwt48         355-358
 repwt49         359-362
 repwt50         363-366
 repwt51         367-370
 repwt52         371-374
 repwt53         375-378
 repwt54         379-382
 repwt55         383-386
 repwt56         387-390
 repwt57         391-394
 repwt58         395-398
 repwt59         399-402
 repwt60         403-406
 repwt61         407-410
 repwt62         411-414
 repwt63         415-418
 repwt64         419-422
 repwt65         423-426
 repwt66         427-430
 repwt67         431-434
 repwt68         435-438
 repwt69         439-442
 repwt70         443-446
 repwt71         447-450
 repwt72         451-454
 repwt73         455-458
 repwt74         459-462
 repwt75         463-466
 repwt76         467-470
 repwt77         471-474
 repwt78         475-478
 repwt79         479-482
 repwt80         483-486
 pernum          487-490
 perwt           491-494
 slwt            495-498
 respmode        499
 repwtp          500
 momloc          501-502
 stepmom         503
 momrule         504
 poploc          505-506
 steppop         507
 poprule         508
 sploc           509-510
 sprule          511
 famsize         512-513
 nchild          514
 nchlt5          515
 famunit         516-517
 eldch           518-519
 yngch           520-521
 nsibs           522
 subfam          523
 sftype          524
 sfrelate        525
 relate          526-527
 related         528-531
 age             532-534
 sex             535
 marst           536
 birthqtr        537
 fertyr          538
 race            539
 raced           540-542
 bpl             543-545
 bpld            546-550
 ancestr1        551-553
 ancestr1d       554-557
 ancestr2        558-560
 ancestr2d       561-564
 citizen         565
 yrimmig         566-568
 yrsusa1         569-570
 yrsusa2         571
 language        572-573
 languaged       574-577
 speakeng        578
 hispan          579
 hispand         580-582
 tribe           583-586
 tribed          587-592
 racesing        593
 racesingd       594-595
 racamind        596
 racasian        597
 racblk          598
 racpacis        599
 racwht          600
 racother        601
 racnum          602
 school          603
 educrec         604
 educ00          605-606
 educ99          607-608
 gradeatt        609
 schltype        610
 empstat         611
 empstatd        612-613
 labforce        614
 occ             615-617
 occ1950         618-620
 occ1990         621-623
 ind             624-626
 ind1950         627-629
 ind1990         630-632
 classwkr        633
 classwkrd       634-635
 occsoc $        636-641
 indnaics $      642-649
 wkswork1        650-651
 wkswork2        652
 uhrswork        653-654
 absent          655
 looking         656
 availble        657
 wrkrecal        658
 workedyr        659
 inctot          660-665
 ftotinc         666-672
 incwage         673-678
 incbus00        679-684
 incss           685-689
 incwelfr        690-694
 incinvst        695-700
 incretir        701-706
 incsupp         707-711
 incother        712-716
 incearn         717-722
 poverty         723-725
 occscore        726-727
 sei             728-729
 hwsei           730-733
 presgl          734-736
 prent           737-739
 erscor50        740-743
 erscor90        744-747
 edscor50        748-751
 edscor90        752-755
 npboss50        756-759
 npboss90        760-763
 migrate1        764
 migrate1d       765-766
 migplac1        767-769
 migmet1         770-773
 migtype1        774
 migcity1        775-778
 migpums1        779-781
 migpuma1        782-784
 movedin         785
 disabwrk        786
 disabmob        787
 perscare        788
 diffphys        789
 diffrem         790
 diffeye         791
 vetstat         792
 vet01ltr        793
 vet90x01        794
 vet80x90        795
 vet75x80        796
 vetvietn        797
 vet55x64        798
 vetkorea        799
 vet47x50        800
 vetwwii         801
 vetother        802
 vetyrs          803-804
 pwstate2        805-806
 pwmetro         807-810
 pwcity          811-814
 pwtype          815
 pwpuma00        816-819
 pwpumas         820-822
 tranwork        823-824
 carpool         825
 riders          826
 trantime        827-828
 departs         829-832
 arrives         833-836
 gchouse         837
 gcmonths        838
 gcrespon        839
 probai          840-842
 probapi         843-845
 probblk         846-848
 proboth         849-851
 probwht         852-854
 repwtp1         855-858
 repwtp2         859-862
 repwtp3         863-866
 repwtp4         867-870
 repwtp5         871-874
 repwtp6         875-878
 repwtp7         879-882
 repwtp8         883-886
 repwtp9         887-890
 repwtp10        891-894
 repwtp11        895-898
 repwtp12        899-902
 repwtp13        903-906
 repwtp14        907-910
 repwtp15        911-914
 repwtp16        915-918
 repwtp17        919-922
 repwtp18        923-926
 repwtp19        927-930
 repwtp20        931-934
 repwtp21        935-938
 repwtp22        939-942
 repwtp23        943-946
 repwtp24        947-950
 repwtp25        951-954
 repwtp26        955-958
 repwtp27        959-962
 repwtp28        963-966
 repwtp29        967-970
 repwtp30        971-974
 repwtp31        975-978
 repwtp32        979-982
 repwtp33        983-986
 repwtp34        987-990
 repwtp35        991-994
 repwtp36        995-998
 repwtp37        999-1002
 repwtp38        1003-1006
 repwtp39        1007-1010
 repwtp40        1011-1014
 repwtp41        1015-1018
 repwtp42        1019-1022
 repwtp43        1023-1026
 repwtp44        1027-1030
 repwtp45        1031-1034
 repwtp46        1035-1038
 repwtp47        1039-1042
 repwtp48        1043-1046
 repwtp49        1047-1050
 repwtp50        1051-1054
 repwtp51        1055-1058
 repwtp52        1059-1062
 repwtp53        1063-1066
 repwtp54        1067-1070
 repwtp55        1071-1074
 repwtp56        1075-1078
 repwtp57        1079-1082
 repwtp58        1083-1086
 repwtp59        1087-1090
 repwtp60        1091-1094
 repwtp61        1095-1098
 repwtp62        1099-1102
 repwtp63        1103-1106
 repwtp64        1107-1110
 repwtp65        1111-1114
 repwtp66        1115-1118
 repwtp67        1119-1122
 repwtp68        1123-1126
 repwtp69        1127-1130
 repwtp70        1131-1134
 repwtp71        1135-1138
 repwtp72        1139-1142
 repwtp73        1143-1146
 repwtp74        1147-1150
 repwtp75        1151-1154
 repwtp76        1155-1158
 repwtp77        1159-1162
 repwtp78        1163-1166
 repwtp79        1167-1170
 repwtp80        1171-1174
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
 /***LONG FORMAT NAME ***   numprec numprec_f.***/
 numprec numprecf.
 /***LONG FORMAT NAME ***   subsamp subsamp_f.***/
 subsamp subsampf.
 hhtype hhtype_f.
 region region_f.
 /***LONG FORMAT NAME ***   stateicp stateicp_f.***/
 stateicp stateicp.
 /***LONG FORMAT NAME ***   statefip statefip_f.***/
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
 /***LONG FORMAT NAME ***   sfrelate sfrelate_f.***/
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
 /***LONG FORMAT NAME ***   racesingd racesingd_f.***/
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
 /***LONG FORMAT NAME ***   looking looking_f.***/
 looking lookingf.
 /***LONG FORMAT NAME ***   navailble availble_f.***/
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
    when( &FIPS_DC ) output Ipums.ACS_05_07_DC;
    when( &FIPS_MD ) output Ipums.ACS_05_07_MD;
    when( &FIPS_VA ) output Ipums.ACS_05_07_VA;
    when( &FIPS_WV ) output Ipums.ACS_05_07_WV;
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

%File_info( data=Ipums.ACS_05_07_DC, printobs=5, freqvars=statefip acre: gq vacancy )

