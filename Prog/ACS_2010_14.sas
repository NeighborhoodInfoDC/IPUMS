/**************************************************************************
 Program:  ACS_2010_14.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Maia Woluchem
 Created:  07/14/2016
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Read raw IPUMS 2010-14 ACS data and create data sets 
 for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

options mprint symbolgen mlogic;

%include "L:\SAS\Inc\StdLocal.sas";

%let yr = 2010_14;

%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

*filename asciidat "&_dcdata_path\ipums\raw\usa_00001.dat"; /**In order for the program to work, I rewrote the path to direct
to the D drive. Need to clarify with Peter where exactly the Raw data should sit, as this program writes to the D drive*/

filename hhdat "D:\DCData\Libraries\IPUMS\Raw\usa_00001.dat";

data ipums_hh;
infile hhdat pad missover lrecl=727;

input
  RECTYPE     $ 1-1
  YEAR          2-5
  MULTYEAR      6-9
  DATANUM       10-11
  SERIAL        12-19
  NUMPREC       20-21
  SUBSAMP       22-23
  HHWT          24-33 .2
  HHTYPE        34-34
  REPWT         35-35
  CLUSTER       36-48
  ADJUST        49-55 .6
  CPI99         56-60 .3
  REGION        61-62
  STATEICP      63-64
  STATEFIP      65-66
  COUNTY        67-70
  COUNTYFIPS    71-73
  METRO         74-74
  MET2013       75-79
  MET2013ERR    80-80
  CITY          81-84
  CITYERR       85-85
  PUMA          86-90
  PUMARES2MIG   91-95
  STRATA        96-107
  CPUMA0010     108-111
  HOMELAND      112-112
  CNTRY         113-115
  GQ            116-116
  GQTYPE        117-117
  GQTYPED       118-120
  FARM          121-121
  OWNERSHP      122-122
  OWNERSHPD     123-124
  MORTGAGE      125-125
  MORTGAG2      126-126
  COMMUSE       127-127
  FARMPROD      128-128
  ACREHOUS      129-129
  MORTAMT1      130-134
  MORTAMT2      135-138
  TAXINCL       139-139
  INSINCL       140-140
  PROPINSR      141-144
  PROPTX99      145-146
  OWNCOST       147-151
  RENT          152-155
  RENTGRS       156-159
  RENTMEAL      160-160
  CONDOFEE      161-164
  MOBLHOME      165-169
  COSTELEC      170-173
  COSTGAS       174-177
  COSTWATR      178-181
  COSTFUEL      182-185
  HHINCOME      186-192
  FOODSTMP      193-193
  VALUEH        194-200
  LINGISOL      201-201
  VACANCY       202-202
  KITCHEN       203-203
  FRIDGE        204-204
  SINK          205-205
  STOVE         206-206
  ROOMS         207-208
  PLUMBING      209-210
  HOTWATER      211-211
  SHOWER        212-212
  TOILET        213-213
  BUILTYR2      214-215
  UNITSSTR      216-217
  BEDROOMS      218-219
  PHONE         220-220
  FUELHEAT      221-221
  VEHICLES      222-222
  NFAMS         223-224
  NSUBFAM       225-225
  NCOUPLES      226-226
  NMOTHERS      227-227
  NFATHERS      228-228
  MULTGEN       229-229
  MULTGEND      230-231
  CBNSUBFAM     232-232
  REPWT1        233-238
  REPWT2        239-244
  REPWT3        245-250
  REPWT4        251-256
  REPWT5        257-262
  REPWT6        263-268
  REPWT7        269-274
  REPWT8        275-280
  REPWT9        281-286
  REPWT10       287-292
  REPWT11       293-298
  REPWT12       299-304
  REPWT13       305-310
  REPWT14       311-316
  REPWT15       317-322
  REPWT16       323-328
  REPWT17       329-334
  REPWT18       335-340
  REPWT19       341-346
  REPWT20       347-352
  REPWT21       353-358
  REPWT22       359-364
  REPWT23       365-370
  REPWT24       371-376
  REPWT25       377-382
  REPWT26       383-388
  REPWT27       389-394
  REPWT28       395-400
  REPWT29       401-406
  REPWT30       407-412
  REPWT31       413-418
  REPWT32       419-424
  REPWT33       425-430
  REPWT34       431-436
  REPWT35       437-442
  REPWT36       443-448
  REPWT37       449-454
  REPWT38       455-460
  REPWT39       461-466
  REPWT40       467-472
  REPWT41       473-478
  REPWT42       479-484
  REPWT43       485-490
  REPWT44       491-496
  REPWT45       497-502
  REPWT46       503-508
  REPWT47       509-514
  REPWT48       515-520
  REPWT49       521-526
  REPWT50       527-532
  REPWT51       533-538
  REPWT52       539-544
  REPWT53       545-550
  REPWT54       551-556
  REPWT55       557-562
  REPWT56       563-568
  REPWT57       569-574
  REPWT58       575-580
  REPWT59       581-586
  REPWT60       587-592
  REPWT61       593-598
  REPWT62       599-604
  REPWT63       605-610
  REPWT64       611-616
  REPWT65       617-622
  REPWT66       623-628
  REPWT67       629-634
  REPWT68       635-640
  REPWT69       641-646
  REPWT70       647-652
  REPWT71       653-658
  REPWT72       659-664
  REPWT73       665-670
  REPWT74       671-676
  REPWT75       677-682
  REPWT76       683-688
  REPWT77       689-694
  REPWT78       695-700
  REPWT79       701-706
  REPWT80       707-712
  RESPMODE      713-713
  PERNUM        714-717
  PERWT         718-727 .2
;

run;

filename persdat "D:\DCData\Libraries\IPUMS\Raw\usa_00002.dat";
data ipums_pers;
infile persdat pad missover lrecl=935;

input
  YEAR          1-4
  DATANUM       5-6
  SERIAL        7-14
  HHWT          15-24 .2
  REGION        25-26
  STATEICP      27-28
  STATEFIP      29-30
  COUNTY        31-34
  COUNTYFIPS    35-37
  METRO         38-38
  MET2013       39-43
  MET2013ERR    44-44
  CITY          45-48
  CITYERR       49-49
  PUMA          50-54
  PUMARES2MIG   55-59
  CPUMA0010     60-63
  HOMELAND      64-64
  CNTRY         65-67
  GQ            68-68
  PERNUM        69-72
  PERWT         73-82 .2
  SLWT          83-92 .2
  REPWTP        93-93
  FAMSIZE       94-95
  NCHILD        96-96
  NCHLT5        97-97
  FAMUNIT       98-99
  ELDCH         100-101
  YNGCH         102-103
  NSIBS         104-104
  MOMLOC        105-106
  STEPMOM       107-107
  MOMRULE       108-108
  POPLOC        109-110
  STEPPOP       111-111
  POPRULE       112-112
  SPLOC         113-114
  SPRULE        115-115
  SUBFAM        116-116
  SFTYPE        117-117
  SFRELATE      118-118
  CBSUBFAM      119-119
  CBSFTYPE      120-120
  CBSFRELATE    121-121
  RELATE        122-123
  RELATED       124-127
  SEX           128-128
  AGE           129-131
  BIRTHQTR      132-132
  MARST         133-133
  BIRTHYR       134-137
  MARRNO        138-138
  MARRINYR      139-139
  YRMARR        140-143
  DIVINYR       144-144
  WIDINYR       145-145
  FERTYR        146-146
  RACE          147-147
  RACED         148-150
  HISPAN        151-151
  HISPAND       152-154
  BPL           155-157
  BPLD          158-162
  ANCESTR1      163-165
  ANCESTR1D     166-169
  ANCESTR2      170-172
  ANCESTR2D     173-176
  CITIZEN       177-177
  YRNATUR       178-181
  YRIMMIG       182-185
  YRSUSA1       186-187
  YRSUSA2       188-188
  LANGUAGE      189-190
  LANGUAGED     191-194
  SPEAKENG      195-195
  TRIBE         196-199
  TRIBED        200-205
  RACAMIND      206-206
  RACASIAN      207-207
  RACBLK        208-208
  RACPACIS      209-209
  RACWHT        210-210
  RACOTHER      211-211
  RACNUM        212-212
  HCOVANY       213-213
  HCOVPRIV      214-214
  HINSEMP       215-215
  HINSPUR       216-216
  HINSTRI       217-217
  HCOVPUB       218-218
  HINSCAID      219-219
  HINSCARE      220-220
  HINSVA        221-221
  HINSIHS       222-222
  HCOVANY2      223-223
  HCOVPRIV2     224-224
  HINSEMP2      225-225
  HINSPUR2      226-226
  HINSTRI2      227-227
  HCOVPUB2      228-228
  HINSCAID2     229-229
  HINSCARE2     230-230
  HINSVA2       231-231
  HINSIHS2      232-232
  SCHOOL        233-233
  EDUC          234-235
  EDUCD         236-238
  GRADEATT      239-239
  GRADEATTD     240-241
  SCHLTYPE      242-242
  EMPSTAT       243-243
  EMPSTATD      244-245
  LABFORCE      246-246
  OCC           247-250
  OCC1950       251-253
  OCC1990       254-256
  OCC2010       257-260
  IND           261-264
  IND1950       265-267
  IND1990       268-270
  CLASSWKR      271-271
  CLASSWKRD     272-273
  OCCSOC      $ 274-279
  INDNAICS    $ 280-287
  WKSWORK2      288-288
  UHRSWORK      289-290
  WRKLSTWK      291-291
  ABSENT        292-292
  LOOKING       293-293
  AVAILBLE      294-294
  WRKRECAL      295-295
  WORKEDYR      296-296
  INCTOT        297-303
  FTOTINC       304-310
  INCWAGE       311-316
  INCBUS00      317-322
  INCSS         323-327
  INCWELFR      328-332
  INCINVST      333-338
  INCRETIR      339-344
  INCSUPP       345-349
  INCOTHER      350-354
  INCEARN       355-361
  POVERTY       362-364
  OCCSCORE      365-366
  SEI           367-368
  PRESGL        369-371 .1
  PRENT         372-374 .1
  ERSCOR50      375-378 .1
  ERSCOR90      379-382 .1
  EDSCOR50      383-386 .1
  EDSCOR90      387-390 .1
  NPBOSS50      391-394 .1
  NPBOSS90      395-398 .1
  MIGRATE1      399-399
  MIGRATE1D     400-401
  MIGPLAC1      402-404
  MIGPUMA1      405-409
  MOVEDIN       410-410
  VETDISAB      411-411
  DIFFREM       412-412
  DIFFPHYS      413-413
  DIFFMOB       414-414
  DIFFCARE      415-415
  DIFFSENS      416-416
  DIFFEYE       417-417
  DIFFHEAR      418-418
  VETSTAT       419-419
  VETSTATD      420-421
  VET01LTR      422-422
  VET90X01      423-423
  VET75X90      424-424
  VETVIETN      425-425
  VET55X64      426-426
  VETKOREA      427-427
  VET47X50      428-428
  VETWWII       429-429
  VETOTHER      430-430
  PWSTATE2      431-432
  PWPUMA00      433-437
  TRANWORK      438-439
  CARPOOL       440-440
  RIDERS        441-441
  TRANTIME      442-444
  DEPARTS       445-448
  ARRIVES       449-452
  GCHOUSE       453-453
  GCMONTHS      454-454
  GCRESPON      455-455
  REPWTP1       456-461
  REPWTP2       462-467
  REPWTP3       468-473
  REPWTP4       474-479
  REPWTP5       480-485
  REPWTP6       486-491
  REPWTP7       492-497
  REPWTP8       498-503
  REPWTP9       504-509
  REPWTP10      510-515
  REPWTP11      516-521
  REPWTP12      522-527
  REPWTP13      528-533
  REPWTP14      534-539
  REPWTP15      540-545
  REPWTP16      546-551
  REPWTP17      552-557
  REPWTP18      558-563
  REPWTP19      564-569
  REPWTP20      570-575
  REPWTP21      576-581
  REPWTP22      582-587
  REPWTP23      588-593
  REPWTP24      594-599
  REPWTP25      600-605
  REPWTP26      606-611
  REPWTP27      612-617
  REPWTP28      618-623
  REPWTP29      624-629
  REPWTP30      630-635
  REPWTP31      636-641
  REPWTP32      642-647
  REPWTP33      648-653
  REPWTP34      654-659
  REPWTP35      660-665
  REPWTP36      666-671
  REPWTP37      672-677
  REPWTP38      678-683
  REPWTP39      684-689
  REPWTP40      690-695
  REPWTP41      696-701
  REPWTP42      702-707
  REPWTP43      708-713
  REPWTP44      714-719
  REPWTP45      720-725
  REPWTP46      726-731
  REPWTP47      732-737
  REPWTP48      738-743
  REPWTP49      744-749
  REPWTP50      750-755
  REPWTP51      756-761
  REPWTP52      762-767
  REPWTP53      768-773
  REPWTP54      774-779
  REPWTP55      780-785
  REPWTP56      786-791
  REPWTP57      792-797
  REPWTP58      798-803
  REPWTP59      804-809
  REPWTP60      810-815
  REPWTP61      816-821
  REPWTP62      822-827
  REPWTP63      828-833
  REPWTP64      834-839
  REPWTP65      840-845
  REPWTP66      846-851
  REPWTP67      852-857
  REPWTP68      858-863
  REPWTP69      864-869
  REPWTP70      870-875
  REPWTP71      876-881
  REPWTP72      882-887
  REPWTP73      888-893
  REPWTP74      894-899
  REPWTP75      900-905
  REPWTP76      906-911
  REPWTP77      912-917
  REPWTP78      918-923
  REPWTP79      924-929
  REPWTP80      930-935
;
run;

/**Test Merge to confirm no duplicates**/
data test;
	merge ipums_hh ipums_pers;
	by serial;
	run;

data hh_first100;
	set ipums_hh(obs=100);
	run;

data pers_first100;
	set ipums_pers(obs=100);
	run;

data test_first100;
	set test(obs=100);
	run;

proc freq data=hh_first100;
	tables serial*pernum/list missing;
	run;

proc freq data=pers_first100;
	tables serial*pernum/list missing;
	run;

proc freq data=test_first100;
	tables serial*pernum/list missing;
	run;

data
  ipums.ACS_&yr._DC /*(label="IPUMS ACS sample, &yr_dash., DC")*/
  ipums.ACS_&yr._MD /*((label="IPUMS ACS sample, &yr_dash., MD")*/
  ipums.ACS_&yr._VA /*((label="IPUMS ACS sample, &yr_dash., VA")*/
  ipums.ACS_&yr._WV /*((label="IPUMS ACS sample, &yr_dash., WV")*/
  ;

/**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/
merge ipums_hh ipums_pers;
by serial;

label
 RECTYPE     = "Record type"
  YEAR        = "Census year"
  MULTYEAR    = "Actual year of survey, multi-year ACS/PRCS"
  DATANUM     = "Data set number"
  SERIAL      = "Household serial number"
  NUMPREC     = "Number of person records following"
  SUBSAMP     = "Subsample number"
  HHWT        = "Household weight"
  HHTYPE      = "Household Type"
  REPWT       = "Household replicate weights"
  CLUSTER     = "Household cluster for variance estimation"
  ADJUST      = "Adjustment factor, ACS/PRCS"
  CPI99       = "CPI-U adjustment factor to 1999 dollars"
  REGION      = "Census region and division"
  STATEICP    = "State (ICPSR code)"
  STATEFIP    = "State (FIPS code)"
  COUNTY      = "County"
  COUNTYFIPS  = "County (FIPS code)"
  METRO       = "Metropolitan status"
  MET2013     = "Metropolitan area, 2013 OMB delineations"
  MET2013ERR  = "Coverage error in MET2013 variable"
  CITY        = "City"
  CITYERR     = "Coverage error in CITY variable"
  PUMA        = "Public Use Microdata Area"
  PUMARES2MIG = "Public Use Microdata Area matching MIGPUMA"
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
  NFAMS       = "Number of families in household"
  NSUBFAM     = "Number of subfamilies in household"
  NCOUPLES    = "Number of married couples in household"
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
  PERWT       = "Person weight"
  YEAR        = "Census year"
  DATANUM     = "Data set number"
  SERIAL      = "Household serial number"
  HHWT        = "Household weight"
  REGION      = "Census region and division"
  STATEICP    = "State (ICPSR code)"
  STATEFIP    = "State (FIPS code)"
  COUNTY      = "County"
  COUNTYFIPS  = "County (FIPS code)"
  METRO       = "Metropolitan status"
  MET2013     = "Metropolitan area, 2013 OMB delineations"
  MET2013ERR  = "Coverage error in MET2013 variable"
  CITY        = "City"
  CITYERR     = "Coverage error in CITY variable"
  PUMA        = "Public Use Microdata Area"
  PUMARES2MIG = "Public Use Microdata Area matching MIGPUMA"
  CPUMA0010   = "Consistent PUMA, 2000-2010"
  HOMELAND    = "American Indian, Alaska Native, or Native Hawaiian homeland area"
  CNTRY       = "Country"
  GQ          = "Group quarters status"
  PERNUM      = "Person number in sample unit"
  PERWT       = "Person weight"
  SLWT        = "Sample-line weight"
  REPWTP      = "Person replicate weights"
  FAMSIZE     = "Number of own family members in household"
  NCHILD      = "Number of own children in the household"
  NCHLT5      = "Number of own children under age 5 in household"
  FAMUNIT     = "Family unit membership"
  ELDCH       = "Age of eldest own child in household"
  YNGCH       = "Age of youngest own child in household"
  NSIBS       = "Number of own siblings in household"
  MOMLOC      = "Mother's location in the household"
  STEPMOM     = "Probable step/adopted mother"
  MOMRULE     = "Rule for linking mother"
  POPLOC      = "Father's location in the household"
  STEPPOP     = "Probable step/adopted father"
  POPRULE     = "Rule for linking father"
  SPLOC       = "Spouse's location in household"
  SPRULE      = "Rule for linking spouse"
  SUBFAM      = "Subfamily membership"
  SFTYPE      = "Subfamily type"
  SFRELATE    = "Relationship within subfamily"
  CBSUBFAM    = "Subfamily number (original Census Bureau classification)"
  CBSFTYPE    = "Subfamily type (original Census Bureau classification)"
  CBSFRELATE  = "Subfamily relationship (original Census Bureau classification)"
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
  EMPSTAT     = "Employment status [general version]"
  EMPSTATD    = "Employment status [detailed version]"
  LABFORCE    = "Labor force status"
  OCC         = "Occupation"
  OCC1950     = "Occupation, 1950 basis"
  OCC1990     = "Occupation, 1990 basis"
  OCC2010     = "Occupation, 2010 basis"
  IND         = "Industry"
  IND1950     = "Industry, 1950 basis"
  IND1990     = "Industry, 1990 basis"
  CLASSWKR    = "Class of worker [general version]"
  CLASSWKRD   = "Class of worker [detailed version]"
  OCCSOC      = "Occupation, SOC classification"
  INDNAICS    = "Industry, NAICS classification"
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
  SEI         = "Duncan Socioeconomic Index"
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
 /*metarea metareaf.
  /***LONG FORMAT NAME ***   metaread metaread_f.***/
 /*metaread metaread.*/
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
 /*racesing racesing.
 /***LONG FORMAT NAME ***  racesingd racesingd. ***/
 /*racesingd racesind.*/
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
 /*MW absent absent_f.*/
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
 /*migmet1 migmet1f.
 /***LONG FORMAT NAME ***   migtype1 migtype1_f.***/
 /*migtype1 migtyp1f.
 /***LONG FORMAT NAME ***   migcity1 migcity1_f.***/
 /*migcity1 migcty1f.
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
 /*vet80x90 vt80x90f.
 /***LONG FORMAT NAME ***   vet75x80 vet75x80_f.***/
 /*vet75x80 vt75x80f.
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
 /*pwmetro pwmetrof.
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
    puma /*pumasupr conspuma*/ farmprod mortamt1 mortamt2 propinsr rent
    rentgrs condofee moblhome cost: ftotinc hhincome 
    valueh pernum slwt q: uhrswork inc: poverty
    migmet1 /*migpums1*/ migpuma1 movedin pwpuma00 /*pwpumas*/
    trantime departs arrives yrsusa1 yrimmig
  ;  
  
  format ind indac05f.;
  format occ occac05f.;
  
  drop i;

run;

%File_info( data=Ipums.ACS_&yr._DC, printobs=5, freqvars=statefip acre: gq vacancy hud_inc )

title2 'Observations with missing HUD_INC';

proc print data=Ipums.ACS_&yr._DC;
  where hud_inc = .;
  id serial;
  var year hud_inc hhincome numprec gq;
run;

title2; 

title2 'Unrecoded special values check';

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

title2;

