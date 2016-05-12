/**************************************************************************
 Program:  Read_ptatian_ui_urban_org_016.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  01/07/08
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

/***************************************************
IPUMS USER: note that you'll need to enter the
path to the folder containing your data file on
the first and second lines below these comments.

For instance, if your file is in the 'C:' drive in
a folder called IPUMS, the first line below these
comments would read:
	libname ipumsdat 'C:\IPUMS\';
And the second line below these comments would read:
	filename asciidat 'C:\IPUMS\ptatian_ui_urban_org_016.dat';
Please alter the following lines accordingly. 
****************************************************/

libname ipumsdat 'D:\DCData\Libraries\IPUMS\Data';
filename asciidat 'D:\DCData\Libraries\IPUMS\Raw\ptatian_ui_urban_org_016.dat';

data ipumsdat.ptatian_ui_urban_org_016;
infile asciidat LRECL=514 pad missover;
input
 rectype  $   1-  1 @;

if rectype='H' then do;
input
 rectype $      1
 year           2-3
 datanum        4-5
 serial         6-13
 numprec       14-15
 subsamp       16-17
 hhwt          18-21
 hhtype        22
 repwt         23
 region        24-25
 stateicp      26-27
 statefip      28-29
 metro         30
 metarea       31-33
 metaread      31-34
 city          35-38
 citypop       39-43
 puma          44-48
 pumasupr      49-53
 conspuma      54-56
 gq            57
 farm          58
 ownershp      59
 ownershd      59-60
 mortgage      61
 mortgag2      62
 commuse       63
 farmprod      64
 acrehous      65
 mortamt1      66-70
 mortamt2      71-74
 taxincl       75
 insincl       76
 propinsr      77-80
 proptx99      81-82
 rent          83-86
 rentgrs       87-90
 rentmeal      91
 condofee      92-95
 moblhome      96-99
 secres       100
 secresmo     101-102
 secresre     103
 costelec     104-107
 costgas      108-111
 costwatr     112-115
 costfuel     116-119
 ftotinc      120-125
 hhincome     126-131
 foodstmp     132
 fdstpamt     133-137
 valueh       138-143
 vacancy      144
 kitchen      145
 rooms        146
 plumbing     147-148
 builtyr2     149-150
 unitsstr     151-152
 bedrooms     153
 phone        154
 fuelheat     155
 vehicles     156
 nfams        157-158
 ncouples     159
 nmothers     160
 nfathers     161
 qacrehou     162
 qcommuse     163
 qcondofe     164
 qcostele     165
 qcostfue     166
 qcostgas     167
 qcostwat     168
 qfarmpro     169
 qfoodstm     170
 qinsincl     171
 qmoblhom     172
 qmortam1     173
 qmortam2     174
 qmortg2a     175
 qmortga2     176
 qmortgag     177
 qownersh     178
 qpropins     179
 qprotx99     180
 qrent        181
 qrentmea     182
 qtaxincl     183
 qvalueh      184
 qvacancy     185
 qbedroom     186
 qbuilty2     187
 qkitchen     188
 qplumbin     189
 qrooms       190
 qunitsst     191
 qfuelhea     192
 qphone       193
 qvehicle     194
 repwt1       195-198
 repwt2       199-202
 repwt3       203-206
 repwt4       207-210
 repwt5       211-214
 repwt6       215-218
 repwt7       219-222
 repwt8       223-226
 repwt9       227-230
 repwt10      231-234
 repwt11      235-238
 repwt12      239-242
 repwt13      243-246
 repwt14      247-250
 repwt15      251-254
 repwt16      255-258
 repwt17      259-262
 repwt18      263-266
 repwt19      267-270
 repwt20      271-274
 repwt21      275-278
 repwt22      279-282
 repwt23      283-286
 repwt24      287-290
 repwt25      291-294
 repwt26      295-298
 repwt27      299-302
 repwt28      303-306
 repwt29      307-310
 repwt30      311-314
 repwt31      315-318
 repwt32      319-322
 repwt33      323-326
 repwt34      327-330
 repwt35      331-334
 repwt36      335-338
 repwt37      339-342
 repwt38      343-346
 repwt39      347-350
 repwt40      351-354
 repwt41      355-358
 repwt42      359-362
 repwt43      363-366
 repwt44      367-370
 repwt45      371-374
 repwt46      375-378
 repwt47      379-382
 repwt48      383-386
 repwt49      387-390
 repwt50      391-394
 repwt51      395-398
 repwt52      399-402
 repwt53      403-406
 repwt54      407-410
 repwt55      411-414
 repwt56      415-418
 repwt57      419-422
 repwt58      423-426
 repwt59      427-430
 repwt60      431-434
 repwt61      435-438
 repwt62      439-442
 repwt63      443-446
 repwt64      447-450
 repwt65      451-454
 repwt66      455-458
 repwt67      459-462
 repwt68      463-466
 repwt69      467-470
 repwt70      471-474
 repwt71      475-478
 repwt72      479-482
 repwt73      483-486
 repwt74      487-490
 repwt75      491-494
 repwt76      495-498
 repwt77      499-502
 repwt78      503-506
 repwt79      507-510
 repwt80      511-514
;
output;
end;

else if rectype='P' then do;
/********** SKIP ******
input
 rectype $      1
;
output;
*********************/
end;

label
 rectype="Record type"
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
 qvehicle="Flag for Vehicles"
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
;

format
 rectype $rectype.
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
 secres secres.
 secresmo secresmo.
 secresre secresre.
 foodstmp foodstmp.
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
;

run;

%File_info( data=ipumsdat.ptatian_ui_urban_org_016, freqvars=rectype statefip vacancy )

run;

