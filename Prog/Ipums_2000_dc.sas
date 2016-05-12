************************************************************************
* Program:  Ipums_2000_dc.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  08/20/04
* Version:  SAS 8.12
* Environment:  Windows
* 
* Description:  Read in IPUMS 2000 data for DC.
*
* Modifications:
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

*options fmterr obs=0;

** Define libraries **;
%DCData_lib( Ipums )

data ipums.Ipums_2000_dc (label="IPUMS 5% sample data, 2000, DC");
infile 'D:\DCData\Libraries\IPUMS\Raw\ptati001.dat' LRECL=536;
input
 year         1-  2
 datanum      3-  4
 serial       5- 12
 numprec     13- 14
 subsamp     15- 16
 hhwt        17- 20
 region      21- 22
 stateicp    23- 24
 statefip    25- 26
 metro       27- 27
 metaread    28- 31
 cityd       32- 35
 citypop     36- 40
 puma        41- 45
 pumasupr    46- 50
 pumaty00    51- 52
 pumaland    53- 66
 pumaarea    67- 80
 gq          81- 81
 gqtyped     82- 84
 farm        85- 85
 ownershd    86- 87
 mortgage    88- 88
 mortgag2    89- 89
 value       90- 95
 commuse     96- 96
 farmprod    97- 97
 acreprop    98- 98
 acrehous    99- 99
 mortamt1   100-104
 mortamt2   105-108
 taxincl    109-109
 insincl    110-110
 propinsr   111-114
 proptx99   115-116
 rent       117-120
 rentgrs    121-124
 rentmeal   125-125
 condo      126-126
 condofee   127-130
 moblhome   131-134
 mobloan    135-135
 costelec   136-139
 costgas    140-143
 costwatr   144-147
 costfuel   148-151
 ftotinc    152-157
 hhincome   158-163
 vacancy    164-164
 kitchen    165-165
 rooms      166-166
 plumbing   167-168
 builtyr    169-169
 unitsstr   170-171
 bedrooms   172-172
 phone      173-173
 fuelheat   174-174
 vehicles   175-175
 lingisol   176-176
 nfams      177-178
 ncouples   179-179
 nmothers   180-180
 nfathers   181-181
 qacrehou   182-182
 qaugmenh   183-183
 qbedroom   184-184
 qbuiltyr   185-185
 qcommuse   186-186
 qcondo     187-187
 qcondofe   188-188
 qcostele   189-189
 qcostfue   190-190
 qcostgas   191-191
 qcostwat   192-192
 qfarmpro   193-193
 qfuelhea   194-194
 qkitchen   195-195
 qmoblhom   196-196
 qmobloan   197-197
 qmortam1   198-198
 qmortam2   199-199
 qmortga2   200-200
 qmortg2a   201-201
 qmortgag   202-202
 qownersh   203-203
 qphone     204-204
 qplumbin   205-205
 qpropins   206-206
 qprotx99   207-207
 qrent      208-208
 qrentmea   209-209
 qrooms     210-210
 qtaxincl   211-211
 qunitsst   212-212
 qvalueh    213-213
 pernum     214-215
 slwt       216-219
 perwt      220-223
 momloc     224-225
 stepmom    226-226
 momrule    227-227
 poploc     228-229
 steppop    230-230
 poprule    231-231
 sploc      232-233
 sprule     234-234
 famsize    235-236
 nchild     237-237
 nchlt5     238-238
 famunit    239-240
 eldch      241-242
 yngch      243-244
 nsibs      245-245
 related    246-249
 age        250-252
 sex        253-253
 raced      254-256
 marst      257-257
 racgen00   258-258
 racdet00   259-260
 racamind   261-261
 racasian   262-262
 racblk     263-263
 racpacis   264-264
 racwht     265-265
 racother   266-266
 racnum     267-267
 bpld       268-272
 ancest1d   273-276
 ancest2d   277-280
 citizen    281-281
 yrimmig    282-284
 yrsusa1    285-286
 yrsusa2    287-287
 languagd   288-291
 speakeng   292-292
 hispand    293-295
 school     296-296
 educrec    297-297
 educ99     298-299
 gradeatt   300-300
 schltype   301-301
 empstatd   302-303
 labforce   304-304
 occ        305-307
 occ1950    308-310
 occscore   311-312
 sei        313-314
 ind        315-317
 ind1950    318-320
 classwkd   321-322
 occsoc   $ 323-328
 indnaics $ 329-336
 wkswork1   337-338
 wkswork2   339-339
 uhrswork   340-341
 yrlstw00   342-342
 absent     343-343
 availble   344-344
 wrkrecal   345-345
 workedyr   346-346
 inctot     347-352
 incwage    353-358
 incbus00   359-364
 incss      365-369
 incwelfr   370-374
 incinvst   375-380
 incretir   381-386
 incsupp    387-391
 incother   392-396
 incearn    397-402
 poverty    403-405
 pov2000    406-408
 migrat5d   409-410
 migplac5   411-413
 migmet5    414-417
 migtype5   418-418
 migtyp00   419-420
 migcity5   421-424
 migpuma    425-427
 migpumas   428-430
 movedin    431-431
 disabwrk   432-432
 disabmob   433-433
 perscare   434-434
 diffphys   435-435
 diffrem    436-436
 diffeye    437-437
 vetstat    438-438
 vet95x00   439-439
 vet90x95   440-440
 vet80x90   441-441
 vet75x80   442-442
 vetvietn   443-443
 vet55x64   444-444
 vetkorea   445-445
 vetwwii    446-446
 vetother   447-447
 vetper00   448-449
 vetyrs     450-451
 pwstate2   452-453
 pwmetro    454-457
 pwcity     458-461
 pwtype     462-462
 pwtype00   463-464
 pwpuma00   465-468
 pwpumas    469-471
 tranwork   472-473
 carpool    474-474
 riders     475-475
 trantime   476-477
 departs    478-481
 gchouse    482-482
 gcmonths   483-483
 gcrespon   484-484
 qage       485-485
 qancest1   486-486
 qbpl       487-487
 qcarpool   488-488
 qcitizen   489-489
 qclasswk   490-490
 qdeparts   491-491
 qdiffeye   492-492
 qdiffphy   493-493
 qdiffrem   494-494
 qdisabmo   495-495
 qeduc      496-496
 qempstat   497-497
 qgradeat   498-498
 qgchouse   499-499
 qgcmonth   500-500
 qgcrespo   501-501
 qhispan    502-502
 qincbus    503-503
 qincinvs   504-504
 qincothe   505-505
 qincreti   506-506
 qincss     507-507
 qincsupp   508-508
 qinctot    509-509
 qincwage   510-510
 qincwelf   511-511
 qind       512-512
 qlanguag   513-513
 qmarst     514-514
 qmigplc5   515-515
 qmigrat5   516-516
 qmovedin   517-517
 qocc       518-518
 qperscar   519-519
 qpwstat2   520-520
 qrace      521-521
 qrelate    522-522
 qriders    523-523
 qschltyp   524-524
 qschool    525-525
 qsex       526-526
 qspeaken   527-527
 qtrantim   528-528
 qtranwor   529-529
 quhrswor   530-530
 qvetper    531-531
 qvetstat   532-532
 qvetyrs    533-533
 qwkswork   534-534
 qworkedy   535-535
 qyrimm     536-536
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
 metaread="Metropolitan area -- Detailed"
 cityd="City -- Detailed"
 citypop="City population"
 puma="Public Use Microdata Area"
 pumasupr="Super Public Use Microdata Area"
 pumaty00="PUMA type, 2000"
 pumaland="PUMA land area"
 pumaarea="PUMA total area"
 gq="Group quarters status"
 gqtyped="Group quarters type -- Detailed"
 farm="Farm status"
 ownershd="Ownership of dwelling -- Detailed"
 mortgage="Mortgage status"
 mortgag2="Second mortgage status"
 value="House value"
 commuse="Commercial use"
 farmprod="Sales of farm products"
 acreprop="Acreage of property"
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
 condo="Condominium status"
 condofee="Monthly condominium fee"
 moblhome="Annual mobile home costs"
 mobloan="Mobile home loan"
 costelec="Annual electricity cost"
 costgas="Annual gas cost"
 costwatr="Annual water cost"
 costfuel="Annual home heating fuel cost"
 ftotinc="Total family income"
 hhincome="Total household income"
 vacancy="Vacancy status"
 kitchen="Kitchen or cooking facilities"
 rooms="Number of rooms"
 plumbing="Plumbing facilities"
 builtyr="Age of structure"
 unitsstr="Units in structure"
 bedrooms="Number of bedrooms"
 phone="Telephone availability"
 fuelheat="Home heating fuel"
 vehicles="Vehicles available"
 lingisol="Linquistic isolation"
 nfams="Number of families in household"
 ncouples="Number of married couples in household"
 nmothers="Number of mothers in household"
 nfathers="Number of fathers in household"
 pernum="Person number in sample unit"
 slwt="Sample-line weight"
 perwt="Person weight"
 momloc="Location of mother in household"
 stepmom="Probable step/adopted mother"
 momrule="Rule for linking mother"
 poploc="Location of father in household"
 steppop="Probable step/adopted father"
 poprule="Rule for linking father"
 sploc="Location of spouse in household"
 sprule="Rule for linking spouse"
 famsize="Number of own family members in household"
 nchild="Number of own children in household"
 nchlt5="Number of own children under age 5 in household"
 famunit="Family unit membership"
 eldch="Age of eldest own child in household"
 yngch="Age of youngest own child in household"
 nsibs="Number of own siblings in household"
 related="Relationship to household head -- Detailed"
 age="Age"
 sex="Sex"
 raced="Race -- Detailed"
 marst="Marital status"
 racgen00="Race, general recode, 2000"
 racdet00="Race, detailed recode, 2000"
 racamind="Race, American Indian and Alaska Native recode"
 racasian="Race, Asian recode"
 racblk="Race, black or African American recode"
 racpacis="Race, Hawaiian and Other Pacific Islander recode"
 racwht="Race, white recode"
 racother="Race, other race recode"
 racnum="Number of major race groups"
 bpld="Birthplace -- Detailed"
 ancest1d="Ancestry, first response -- Detailed"
 ancest2d="Ancestry, second response -- Detailed"
 citizen="Citizenship status"
 yrimmig="Year of immigration"
 yrsusa1="Years in the United States"
 yrsusa2="Years in the United States, intervalled"
 languagd="Language spoken -- Detailed"
 speakeng="Speaks English"
 hispand="Hispanic origin -- Detailed"
 school="School attendance"
 educrec="Educational attainment recode"
 educ99="Educational attainment, 1990"
 gradeatt="Grade level attending"
 schltype="Public or private school"
 empstatd="Employment status -- Detailed"
 labforce="Labor force status"
 occ="Occupation"
 occ1950="Occupation, 1950 basis"
 occscore="Occupational income score"
 sei="Duncan Socioeconomic Index"
 ind="Industry"
 ind1950="Industry, 1950 basis"
 classwkd="Class of worker -- Detailed"
 occsoc="Occupation, SOC"
 indnaics="Industry, NAICS"
 wkswork1="Weeks worked last year"
 wkswork2="Weeks worked last year, intervalled"
 uhrswork="Usual hours worked per week"
 yrlstw00="Year last worked, 2000"
 absent="Absent from work last week"
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
 pov2000="Poverty status, 2000 criteria"
 migrat5d="Migration status, 5 years -- Detailed"
 migplac5="State or country of residence 5 years ago"
 migmet5="Metropolitan area of residence 5 years ago"
 migtype5="Metropolitan status 5 years ago"
 migtyp00="Metropolitan status 5 years ago, 2000"
 migcity5="City of residence 5 years ago"
 migpuma="PUMA of residence 5 years ago"
 migpumas="Super-PUMA of residence 5 years ago"
 movedin="When occupant moved into residence"
 disabwrk="Work disability"
 disabmob="Disability limiting mobility"
 perscare="Personal care limitation"
 diffphys="Physical difficulty"
 diffrem="Difficulty remembering"
 diffeye="Vision or hearing difficulty"
 vetstat="Veteran status"
 vet95x00="Veteran, served 1995 to 2000"
 vet90x95="Veteran, served 1990 to 1995"
 vet80x90="Veteran, served 1980 to 1990"
 vet75x80="Veteran, served 1975 to 1980"
 vetvietn="Veteran, served Vietnam era"
 vet55x64="Veteran, served 1955 to 1964"
 vetkorea="Veteran, served Korean conflict era"
 vetwwii="Veteran, served WWII era"
 vetother="Veteran of other period"
 vetper00="Veteran period of service, 2000"
 vetyrs="Years of active-duty military service"
 pwstate2="Place of work: state, 1980 to 2000"
 pwmetro="Place of work: metropolitan area"
 pwcity="Place of work: city"
 pwtype="Place of work: metropolitan status"
 pwtype00="Place of work: metropolitan status, 2000"
 pwpuma00="Place of work: PUMA, 2000"
 pwpumas="Place of work: Super-PUMA, 2000"
 tranwork="Means of transportation to work"
 carpool="Carpooling"
 riders="Vehicle occupancy"
 trantime="Travel time to work"
 departs="Time of departure for work"
 gchouse="Grandchildren living in this house"
 gcmonths="Months responsible for grandchildren"
 gcrespon="Responsible for grandchildren"
 qacrehou="for acrehous"
 qaugmenh="for all variables in record"
 qbedroom="for bedrooms"
 qbuiltyr="for builtyr"
 qcommuse="for commuse"
 qcondo="for condo"
 qcondofe="for condofee"
 qcostele="for costelec"
 qcostfue="for costfuel"
 qcostgas="for costgas"
 qcostwat="for costwatr"
 qfarmpro="for farmprod farm"
 qfuelhea="for fuelheat"
 qkitchen="for kitchen"
 qmoblhom="for moblhome"
 qmobloan="for mobloan"
 qmortam1="for mortamt1"
 qmortam2="for mortamt2"
 qmortga2="for mortgag2"
 qmortg2a="for mortgag2"
 qmortgag="for mortgage"
 qownersh="for ownershp"
 qphone="for phone"
 qplumbin="for plumbing"
 qpropins="for propinsr"
 qprotx99="for proptx99"
 qrent="for rent"
 qrentmea="for rentmeal"
 qrooms="for rooms"
 qtaxincl="for taxincl"
 qunitsst="for unitsstr"
 qvalueh="for value"
 qage="for age"
 qancest1="for ancestr1"
 qbpl="for bpl nativity"
 qcarpool="for carpool"
 qcitizen="for citizen"
 qclasswk="for classwkr"
 qdeparts="for departs"
 qdiffeye="for diffeye"
 qdiffphy="for diffphys"
 qdiffrem="for diffrem"
 qdisabmo="for disabmob"
 qeduc="for educrec higrade educ99"
 qempstat="for empstat labforce"
 qgradeat="for gradeatt"
 qgchouse="for gchouse"
 qgcmonth="for gcmonths"
 qgcrespo="for gcrespon"
 qhispan="for hispan"
 qincbus="for incbus inctot incearn incbus00"
 qincinvs="for incinvst inctot"
 qincothe="for incother inctot"
 qincreti="for incretir inctot"
 qincss="for incss inctot"
 qincsupp="for incsupp"
 qinctot="for inctot"
 qincwage="for incwage inctot incearn"
 qincwelf="for incwelfr inctot"
 qind="for ind ind1950 indnaics"
 qlanguag="for language speakeng"
 qmarst="for marst"
 qmigplc5="for migplac5 migmet5 migcity5 migtype migtyp00"
 qmigrat5="for migrate5"
 qmovedin="for movedin"
 qocc="for occ occ1950 sei occscore labforce occsoc"
 qperscar="for perscare"
 qpwstat2="for pwstate2"
 qrace="for race racgen00 racdet00 racamind racasian racblk racnum racother racpacis"
 qrelate="for relate"
 qriders="for riders"
 qschltyp="for schltype"
 qschool="for school schltype"
 qsex="for sex"
 qspeaken="for speakeng"
 qtrantim="for trantime"
 qtranwor="for tranwork"
 quhrswor="for uhrswork"
 qvetper="for vetper vet55x64 vet75x80 vet80x90 vet90x95 vet95x00 vetkorea vetother vetvietn"
 qvetstat="for vetstat vet55x64 vet75x80 vet80x90 vetkorea vetother vetvietn vetwwi vetwwii"
 qvetyrs="for vetyrs"
 qwkswork="for wkswork1 wkswork2"
 qworkedy="for workedyr yrlstw00"
 qyrimm="for yrimmig yrsusa1 yrsusa2"
;

format
 year yearx.
 region region.
 stateicp stateicp.
 statefip statefip.
 metro metro.
 metaread metaread.
 cityd cityd.
 pumaty00 pumatyaa.
 gq gq.
 gqtyped gqtyped.
 farm farm.
 ownershd ownershd.
 mortgage mortgage.
 mortgag2 mortgagc.
 commuse commuse.
 acreprop acreprop.
 acrehous acrehous.
 taxincl taxincl.
 insincl insincl.
 proptx99 proptxjj.
 rentmeal rentmeal.
 condo condo.
 mobloan mobloan.
 vacancy vacancy.
 kitchen kitchen.
 rooms rooms.
 plumbing plumbing.
 builtyr builtyr.
 unitsstr unitsstr.
 bedrooms bedrooms.
 phone phone.
 fuelheat fuelheat.
 vehicles vehicles.
 lingisol lingisol.
 related related.
 sex sex.
 raced raced.
 marst marst.
 racgen00 racgenaa.
 racdet00 racdetaa.
 racamind racamind.
 racasian racasian.
 racblk racblk.
 racpacis racpacis.
 racwht racwht.
 racother racother.
 bpld bpld.
 ancest1d ancestbd.
 ancest2d ancestcd.
 citizen citizen.
 yrimmig yrimmig.
 yrsusa2 yrsusac.
 languagd languagd.
 speakeng speakeng.
 hispand hispand.
 school school.
 educrec educrec.
 educ99 educjj.
 gradeatt gradeatt.
 schltype schltype.
 empstatd empstatd.
 labforce labforce.
 occ1950 occbjfa.
 ind1950 indbjfa.
 classwkd classwkd.
 wkswork2 wksworkc.
 yrlstw00 yrlstwaa.
 absent absent.
 availble availble.
 wrkrecal wrkrecal.
 workedyr workedyr.
 migrat5d migratfd.
 migplac5 migplacf.
 migmet5 migmetf.
 migtype5 migtypef.
 migtyp00 migtypaa.
 migcity5 migcityf.
 disabwrk disabwrk.
 disabmob disabmob.
 perscare perscare.
 diffphys diffphys.
 diffrem diffrem.
 diffeye diffeye.
 vetstat vetstat.
 vet95x00 vetjfxaa.
 vet90x95 vetjaxjf.
 vet80x90 vetiaxja.
 vet75x80 vethfxia.
 vetvietn vetvietn.
 vet55x64 vetffxge.
 vetkorea vetkorea.
 vetwwii vetwwii.
 vetother vetother.
 vetper00 vetperaa.
 vetyrs vetyrs.
 pwstate2 pwstatec.
 pwmetro pwmetro.
 pwcity pwcity.
 pwtype pwtype.
 pwtype00 pwtypeaa.
 tranwork tranwork.
 carpool carpool.
 riders riders.
 gchouse gchouse.
 gcmonths gcmonths.
 gcrespon gcrespon.
;

  %upuma() 

run;

%File_info( data=Ipums.Ipums_2000_DC, printobs=5, freqvars=statefip acre: )

