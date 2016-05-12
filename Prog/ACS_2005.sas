/**************************************************************************
 Program:  ACS_2005.sas
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
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\ptatian_ui_urban_org_012.dat";

data 
  ipums.ACS_2005_DC (label="IPUMS ACS sample, 2005, DC")
  ipums.ACS_2005_MD (label="IPUMS ACS sample, 2005, MD")
  ipums.ACS_2005_VA (label="IPUMS ACS sample, 2005, VA")
  ipums.ACS_2005_WV (label="IPUMS ACS sample, 2005, WV")
  ;

infile asciidat LRECL=517 pad stopover;

input
 year           1-2
 datanum        3-4
 serial         5-12
 numprec       13-14
 subsamp       15-16
 hhwt          17-20
 region        21-22
 stateicp      23-24
 statefip      25-26
 metro         27
 metarea       28-30
 metaread      28-31
 city          32-34
 cityd         32-35
 puma          36-40
 pumasupr      41-45
 conspuma      46-48
 gq            49
 farm          50
 ownershp      51
 ownershd      51-52
 mortgage      53
 mortgag2      54
 commuse       55
 farmprod      56
 acrehous      57
 mortamt1      58-62
 mortamt2      63-66
 taxincl       67
 insincl       68
 propinsr      69-72
 proptx99      73-74
 rent          75-78
 rentgrs       79-82
 rentmeal      83
 condofee      84-87
 moblhome      88-91
 secres        92
 secresmo      93-94
 secresre      95
 costelec      96-99
 costgas      100-103
 costwatr     104-107
 costfuel     108-111
 ftotinc      112-117
 hhincome     118-123
 foodstmp     124
 fdstpamt     125-129
 valueh       130-135
 lingisol     136
 vacancy      137
 kitchen      138
 rooms        139
 plumbing     140-141
 builtyr2     142
 unitsstr     143-144
 bedrooms     145
 phone        146
 fuelheat     147
 vehicles     148
 nfams        149-150
 ncouples     151
 nmothers     152
 nfathers     153
 qacrehou     154
 qcommuse     155
 qcondofe     156
 qcostele     157
 qcostfue     158
 qcostgas     159
 qcostwat     160
 qfarmpro     161
 qfoodstm     162
 qinsincl     163
 qmoblhom     164
 qmortam1     165
 qmortam2     166
 qmortg2a     167
 qmortga2     168
 qmortgag     169
 qownersh     170
 qpropins     171
 qprotx99     172
 qrent        173
 qrentmea     174
 qtaxincl     175
 qvalueh      176
 qvacancy     177
 qbedroom     178
 qbuilty2     179
 qkitchen     180
 qplumbin     181
 qrooms       182
 qunitsst     183
 qfuelhea     184
 qphone       185
 qvehicle     186
 pernum       187-188
 perwt        189-192
 slwt         193-196
 respmode     197
 momloc       198-199
 stepmom      200
 momrule      201
 poploc       202-203
 steppop      204
 poprule      205
 sploc        206-207
 sprule       208
 famsize      209-210
 nchild       211
 nchlt5       212
 famunit      213-214
 eldch        215-216
 yngch        217-218
 nsibs        219
 relate       220-221
 related      220-223
 age          224-226
 sex          227
 marst        228
 birthqtr     229
 fertyr       230
 race         231
 raced        231-233
 bpl          234-236
 bpld         234-238
 ancestr1     239-241
 ancest1d     239-242
 ancestr2     243-245
 ancest2d     243-246
 citizen      247
 yrimmig      248-250
 yrsusa1      251-252
 yrsusa2      253
 language     254-255
 languagd     254-257
 speakeng     258
 hispan       259
 hispand      259-261
 tribe        262-265
 tribed       262-267
 racesing     268
 racesingd    268-269
 racamind     270
 racasian     271
 racblk       272
 racpacis     273
 racwht       274
 racother     275
 racnum       276
 school       277
 educrec      278
 educ99       279-280
 gradeatt     281
 schltype     282
 empstat      283
 empstatd     283-284
 labforce     285
 occ          286-288
 occ1950      289-291
 occ1990      292-294
 occscore     295-296
 sei          297-298
 ind          299-301
 ind1950      302-304
 ind1990      305-307
 classwkr     308
 classwkd     308-309
 occsoc $     310-315
 indnaics $   316-323
 wkswork1     324-325
 wkswork2     326
 uhrswork     327-328
 absent       329
 looking      330
 availble     331
 wrkrecal     332
 workedyr     333
 inctot       334-339
 incwage      340-345
 incbus00     346-351
 incss        352-356
 incwelfr     357-361
 incinvst     362-367
 incretir     368-373
 incsupp      374-378
 incother     379-383
 incearn      384-389
 poverty      390-392
 migrate1     393
 migrat1d     393-394
 migplac1     395-397
 migmet1      398-401
 migtype1     402
 migcity1     403-406
 migpums1     407-409
 migpuma1     410-412
 movedin      413
 disabwrk     414
 disabmob     415
 perscare     416
 diffphys     417
 diffrem      418
 diffeye      419
 vetstat      420
 vet01x03     421
 vet90x01     422
 vet80x90     423
 vet75x80     424
 vetvietn     425
 vet55x64     426
 vetkorea     427
 vet47x50     428
 vetwwii      429
 vetother     430
 vetyrs       431-432
 pwstate2     433-434
 pwmetro      435-438
 pwcity       439-442
 pwtype       443
 pwpuma00     444-447
 pwpumas      448-450
 tranwork     451-452
 carpool      453
 riders       454
 trantime     455-456
 departs      457-460
 arrives      461-464
 gchouse      465
 gcmonths     466
 gcrespon     467
 qage         468
 qfertyr      469
 qmarst       470
 qrelate      471
 qsex         472
 qbpl         473
 qcitizen     474
 qhispan      475
 qlanguag     476
 qrace        477
 qspeaken     478
 qyrimm       479
 qeduc        480
 qgradeat     481
 qschool      482
 qclasswk     483
 qempstat     484
 qind         485
 qocc         486
 quhrswor     487
 qwkswork     488
 qworkedy     489
 qincbus      490
 qincinvs     491
 qincothe     492
 qincreti     493
 qincss       494
 qincsupp     495
 qincwage     496
 qincwelf     497
 qmigplc1     498
 qmigrat1     499
 qmovedin     500
 qdiffeye     501
 qdiffphy     502
 qdiffrem     503
 qdisabmo     504
 qdisabwr     505
 qperscar     506
 qvetper      507
 qvetstat     508
 qvetyrs      509
 qcarpool     510
 qdeparts     511
 qpwstat2     512
 qriders      513
 qtrantim     514
 qtranwor     515
 qgcmonth     516
 qgcrespo     517
;

label
 year="Census year"
 datanum="Data set number"
 serial="Household serial number"
 numprec="Number of person records following"
 subsamp="Subsample number"
 hhwt="Household weight"
 region="Census region and division"
 stateicp="State (ICPSR code)"
 statefip="State (FIPS code)"
 metro="Metropolitan status"
 metarea="Metropolitan area [general version]"
 metaread="Metropolitan area [detailed version]"
 city="City [general version]"
 cityd="City [detailed version]"
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
 secres="Second residence status"
 secresmo="Months living in second residence"
 secresre="Reason for second residence"
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
 qacrehou="Flag for Acrehous"
 qcommuse="Flag for Commuse"
 qcondofe="Flag for Condofee"
 qcostele="Flag for Costelec"
 qcostfue="Flag for Costfuel"
 qcostgas="Flag for Costgas"
 qcostwat="Flag for Costwatr"
 qfarmpro="Flag for Farmprod, Farm"
 qfoodstm="Flag for Foodstmp"
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
 qvehicle="Flag for Vehicles"
 pernum="Person number in sample unit"
 perwt="Person weight"
 slwt="Sample-line weight"
 respmode="Response mode"
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
 qvetper="Flag for Vetper, Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vet95x00, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01x03, Vet47x50, Vet90x01"
 qvetstat="Flag for Vetstat, Vet55x64, Vet75x80, Vet80x90, Vet90x95, Vetkorea, Vetother, Vetvietn, Vetwwi, Vetwwii, Vet01x03, Vet47x50, Vet90x01"
 qvetyrs="Flag for Vetyrs"
 qcarpool="Flag for Carpool"
 qdeparts="Flag for Departs"
 qpwstat2="Flag for Pwstate2"
 qriders="Flag for Riders"
 qtrantim="Flag for Trantime"
 qtranwor="Flag for Tranwork"
 qgcmonth="Flag for Gcmonths"
 qgcrespo="Flag for Gcrespon"
;

format
 year yearx.
 datanum datanum.
 serial serial.
 numprec numprec.
 subsamp subsamp.
 hhwt hhwt.
 region region.
 stateicp stateicp.
 statefip statefip.
 metro metro.
 metarea metarea.
 metaread metaread.
 city city.
 cityd cityd.
 puma puma.
 pumasupr pumasupr.
 conspuma conspuma.
 gq gq.
 farm farm.
 ownershp ownershp.
 ownershd ownershd.
 mortgage mortgage.
 mortgag2 mortgagb.
 commuse commuse.
 farmprod farmprod.
 acrehous acrehous.
 mortamt1 mortamta.
 mortamt2 mortamtb.
 taxincl taxincl.
 insincl insincl.
 propinsr propinsr.
 proptx99 proptxii.
 rent rent.
 rentgrs rentgrs.
 rentmeal rentmeal.
 condofee condofee.
 moblhome moblhome.
 secres secres.
 secresmo secresmo.
 secresre secresre.
 costelec costelec.
 costgas costgas.
 costwatr costwatr.
 costfuel costfuel.
 ftotinc ftotinc.
 hhincome hhincome.
 foodstmp foodstmp.
 fdstpamt fdstpamt.
 valueh valueh.
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
 qacrehou qacrehou.
 qcommuse qcommuse.
 qcondofe qcondofe.
 qcostele qcostele.
 qcostfue qcostfue.
 qcostgas qcostgas.
 qcostwat qcostwat.
 qfarmpro qfarmpro.
 qfoodstm qfoodstm.
 qinsincl qinsincl.
 qmoblhom qmoblhom.
 qmortam1 qmortama.
 qmortam2 qmortamb.
 qmortg2a qmortg2a.
 qmortga2 qmortgab.
 qmortgag qmortgag.
 qownersh qownersh.
 qpropins qpropins.
 qprotx99 qprotxii.
 qrent qrent.
 qrentmea qrentmea.
 qtaxincl qtaxincl.
 qvalueh qvalueh.
 qvacancy qvacancy.
 qbedroom qbedroom.
 qbuilty2 qbuiltyb.
 qkitchen qkitchen.
 qplumbin qplumbin.
 qrooms qrooms.
 qunitsst qunitsst.
 qfuelhea qfuelhea.
 qphone qphone.
 qvehicle qvehicle.
 pernum pernum.
 perwt perwt.
 slwt slwt.
 respmode respmode.
 momloc momloc.
 stepmom stepmom.
 momrule momrule.
 poploc poploc.
 steppop steppop.
 poprule poprule.
 sploc sploc.
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
 yrimmig yrimmig.
 yrsusa1 yrsusaa.
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
 racamind racamind.
 racasian racasian.
 racblk racblk.
 racpacis racpacis.
 racwht racwht.
 racother racother.
 racnum racnum.
 school school.
 educrec educrec.
 educ99 educii.
 gradeatt gradeatt.
 schltype schltype.
 empstat empstat.
 empstatd empstatd.
 labforce labforce.
 occ occ.
 occ1950 occaiej.
 occ1990 occaiij.
 occscore occscore.
 sei sei.
 ind ind.
 ind1950 indaiej.
 ind1990 indaiij.
 classwkr classwkr.
 classwkd classwkd.
 occsoc $occsoc.
/***LONG FORMAT NAME ***  indnaics $indnaics. ***/
 indnaics $indnaic.
 wkswork1 wksworka.
 wkswork2 wksworkb.
 uhrswork uhrswork.
 absent absent.
 looking looking.
 availble availble.
 wrkrecal wrkrecal.
 workedyr workedyr.
 inctot inctot.
 incwage incwage.
 incbus00 incbusjj.
 incss incss.
 incwelfr incwelfr.
 incinvst incinvst.
 incretir incretir.
 incsupp incsupp.
 incother incother.
 incearn incearn.
 poverty poverty.
 migrate1 migratea.
 migrat1d migrat1d.
 migplac1 migplaca.
 migmet1 migmeta.
 migtype1 migtypea.
 migcity1 migcitya.
 migpums1 migpumsa.
 migpuma1 migpumaa.
 movedin movedin.
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
 vetyrs vetyrs.
 pwstate2 pwstateb.
 pwmetro pwmetro.
 pwcity pwcity.
 pwtype pwtype.
 pwpuma00 pwpumajj.
 pwpumas pwpumas.
 tranwork tranwork.
 carpool carpool.
 riders riders.
 trantime trantime.
 departs departs.
 arrives arrives.
 gchouse gchouse.
 gcmonths gcmonths.
 gcrespon gcrespon.
 qage qage.
 qfertyr qfertyr.
 qmarst qmarst.
 qrelate qrelate.
 qsex qsex.
 qbpl qbpl.
 qcitizen qcitizen.
 qhispan qhispan.
 qlanguag qlanguag.
 qrace qrace.
 qspeaken qspeaken.
 qyrimm qyrimm.
 qeduc qeduc.
 qgradeat qgradeat.
 qschool qschool.
 qclasswk qclasswk.
 qempstat qempstat.
 qind qind.
 qocc qocc.
 quhrswor quhrswor.
 qwkswork qwkswork.
 qworkedy qworkedy.
 qincbus qincbus.
 qincinvs qincinvs.
 qincothe qincothe.
 qincreti qincreti.
 qincss qincss.
 qincsupp qincsupp.
 qincwage qincwage.
 qincwelf qincwelf.
 qmigplc1 qmigplca.
 qmigrat1 qmigrata.
 qmovedin qmovedin.
 qdiffeye qdiffeye.
 qdiffphy qdiffphy.
 qdiffrem qdiffrem.
 qdisabmo qdisabmo.
 qdisabwr qdisabwr.
 qperscar qperscar.
 qvetper qvetper.
 qvetstat qvetstat.
 qvetyrs qvetyrs.
 qcarpool qcarpool.
 qdeparts qdeparts.
 qpwstat2 qpwstatb.
 qriders qriders.
 qtrantim qtrantim.
 qtranwor qtranwor.
 qgcmonth qgcmonth.
 qgcrespo qgcrespo.
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
  
  select ( statefip );
    when( &FIPS_DC ) output Ipums.ACS_2005_DC;
    when( &FIPS_MD ) output Ipums.ACS_2005_MD;
    when( &FIPS_VA ) output Ipums.ACS_2005_VA;
    when( &FIPS_WV ) output Ipums.ACS_2005_WV;
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

%File_info( data=Ipums.ACS_2005_DC, printobs=5, freqvars=statefip acre: gq vacancy )

