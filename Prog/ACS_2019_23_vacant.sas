/**************************************************************************
 Program:  ACS_2019_23_vacant.sas
 Library:  IPUMS
 Project:  Urban Greater DC
 Author:   Rob Pitingolo
 Created:  08/05/2025
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Read raw IPUMS 2019-23 ACS data for vacant housing units
 for DC, MD, VA, and WV.

 Modifications: 
**************************************************************************/

%include "\\sas1\DCdata\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS)

** Define libraries **;
/* %DCData_lib( IPUMS, local=n )*/

%let yr = 2019_23;
%let yr_dash = %sysfunc(tranwrd(&yr, %str(_), -));

%let revisions = Update for &yr. data. ;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';


filename asciidat "&_dcdata_r_path\ipums\Raw\RP\usa_00204.dat";


data 
  ACS_&yr._vacant_DC (label="IPUMS ACS sample, &yr_dash., vacant housing units, DC")
  ACS_&yr._vacant_MD (label="IPUMS ACS sample, &yr_dash., vacant housing units, MD")
  ACS_&yr._vacant_VA (label="IPUMS ACS sample, &yr_dash., vacant housing units, VA")
  ACS_&yr._vacant_WV (label="IPUMS ACS sample, &yr_dash., vacant housing units, WV");

  /**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

infile ASCIIDAT pad missover lrecl=759;

input
  YEAR         1-4
  MULTYEAR     5-8
  SAMPLE       9-14
  SERIAL       15-22
  CBSERIAL     23-35
  NUMPREC      36-37
  SUBSAMP      38-39
  HHWT         40-49 .2
  EXPWTH       50-54
  HHTYPE       55-55
  CBHHTYPE     56-57
  REPWT        58-58
  CLUSTER      59-71
  ADJUST       72-78 .6
  CPI99        79-83 .3
  REGION       84-85
  STATEICP     86-87
  STATEFIP     88-89
  COUNTYICP    90-93
  COUNTYFIP    94-96
  PUMA         97-101
  DENSITY      102-108 .1
  METRO        109-109
  PCTMETRO     110-114 .2
  MET2013      115-119
  MET2013ERR   120-120
  METPOP10     121-128
  CITY         129-132
  CITYERR      133-133
  HOMELAND     134-134
  STRATA       135-146
  CNTRY        147-149
  GQ           150-150
  GQTYPE       151-151
  GQTYPED      152-154
  FARM         155-155
  OWNERSHP     156-156
  OWNERSHPD    157-158
  MORTGAGE     159-159
  MORTGAG2     160-160
  FARMPROD     161-161
  ACREHOUS     162-162
  MORTAMT1     163-167
  MORTAMT2     168-171
  TAXINCL      172-172
  INSINCL      173-173
  PROPINSR     174-177
  PROPTX99     178-179
  OWNCOST      180-184
  RENT         185-188
  RENTGRS      189-193
  RENTMEAL     194-194
  CONDOFEE     195-198
  MOBLHOME     199-203
  COSTELEC     204-207
  COSTGAS      208-211
  COSTWATR     212-215
  COSTFUEL     216-219
  HHINCOME     220-226
  FOODSTMP     227-227
  VALUEH       228-234
  LINGISOL     235-235
  VACANCY      236-236
  KITCHEN      237-237
  FRIDGE       238-238
  SINK         239-239
  STOVE        240-240
  ROOMS        241-242
  PLUMBING     243-244
  HOTWATER     245-245
  SHOWER       246-246
  BUILTYR2     247-248
  UNITSSTR     249-250
  BEDROOMS     251-252
  PHONE        253-253
  CINETHH      254-254
  CILAPTOP     255-255
  CISMRTPHN    256-256
  CITABLET     257-257
  CIOTHCOMP    258-258
  CIDATAPLN    259-259
  CIHISPEED    260-261
  CISAT        262-262
  CIDIAL       263-263
  CIOTHSVC     264-264
  FUELHEAT     265-265
  VEHICLES     266-266
  COUPLETYPE   267-267
  SSMC         268-268
  NFAMS        269-270
  NSUBFAM      271-271
  NCOUPLES     272-272
  NMOTHERS     273-273
  NFATHERS     274-274
  MULTGEN      275-275
  MULTGEND     276-277
  CBNSUBFAM    278-278
  REPWT1       279-284
  REPWT2       285-290
  REPWT3       291-296
  REPWT4       297-302
  REPWT5       303-308
  REPWT6       309-314
  REPWT7       315-320
  REPWT8       321-326
  REPWT9       327-332
  REPWT10      333-338
  REPWT11      339-344
  REPWT12      345-350
  REPWT13      351-356
  REPWT14      357-362
  REPWT15      363-368
  REPWT16      369-374
  REPWT17      375-380
  REPWT18      381-386
  REPWT19      387-392
  REPWT20      393-398
  REPWT21      399-404
  REPWT22      405-410
  REPWT23      411-416
  REPWT24      417-422
  REPWT25      423-428
  REPWT26      429-434
  REPWT27      435-440
  REPWT28      441-446
  REPWT29      447-452
  REPWT30      453-458
  REPWT31      459-464
  REPWT32      465-470
  REPWT33      471-476
  REPWT34      477-482
  REPWT35      483-488
  REPWT36      489-494
  REPWT37      495-500
  REPWT38      501-506
  REPWT39      507-512
  REPWT40      513-518
  REPWT41      519-524
  REPWT42      525-530
  REPWT43      531-536
  REPWT44      537-542
  REPWT45      543-548
  REPWT46      549-554
  REPWT47      555-560
  REPWT48      561-566
  REPWT49      567-572
  REPWT50      573-578
  REPWT51      579-584
  REPWT52      585-590
  REPWT53      591-596
  REPWT54      597-602
  REPWT55      603-608
  REPWT56      609-614
  REPWT57      615-620
  REPWT58      621-626
  REPWT59      627-632
  REPWT60      633-638
  REPWT61      639-644
  REPWT62      645-650
  REPWT63      651-656
  REPWT64      657-662
  REPWT65      663-668
  REPWT66      669-674
  REPWT67      675-680
  REPWT68      681-686
  REPWT69      687-692
  REPWT70      693-698
  REPWT71      699-704
  REPWT72      705-710
  REPWT73      711-716
  REPWT74      717-722
  REPWT75      723-728
  REPWT76      729-734
  REPWT77      735-740
  REPWT78      741-746
  REPWT79      747-752
  REPWT80      753-758
  RESPMODE     759-759
;

label
  YEAR       = "Census year"
  MULTYEAR   = "Actual year of survey, multi-year ACS/PRCS"
  SAMPLE     = "IPUMS sample identifier"
  SERIAL     = "Household serial number"
  CBSERIAL   = "Original Census Bureau household serial number"
  NUMPREC    = "Number of person records following"
  SUBSAMP    = "Subsample number"
  HHWT       = "Household weight"
  EXPWTH     = "Experimental housing unit weight"
  HHTYPE     = "Household Type"
  CBHHTYPE   = "Census bureau household type (with cohabiting)"
  REPWT      = "Household replicate weights [80 variables]"
  CLUSTER    = "Household cluster for variance estimation"
  ADJUST     = "Adjustment factor, ACS/PRCS"
  CPI99      = "CPI-U adjustment factor to 1999 dollars"
  REGION     = "Census region and division"
  STATEICP   = "State (ICPSR code)"
  STATEFIP   = "State (FIPS code)"
  COUNTYICP  = "County (ICPSR code, identifiable counties only)"
  COUNTYFIP  = "County (FIPS code, identifiable counties only)"
  PUMA       = "Public Use Microdata Area"
  DENSITY    = "Population-weighted density of PUMA"
  METRO      = "Metropolitan status (where determinable)"
  PCTMETRO   = "Percent of PUMA population living in metro area"
  MET2013    = "Metropolitan area (2013 delineations, identifiable areas only)"
  MET2013ERR = "Coverage error in MET2013 variable"
  METPOP10   = "Average 2010 population of 2013 metro/micro areas in PUMA"
  CITY       = "City (identifiable cities only)"
  CITYERR    = "Coverage error in CITY variable"
  HOMELAND   = "American Indian, Alaska Native, or Native Hawaiian homeland area"
  STRATA     = "Household strata for variance estimation"
  CNTRY      = "Country"
  GQ         = "Group quarters status"
  GQTYPE     = "Group quarters type [general version]"
  GQTYPED    = "Group quarters type [detailed version]"
  FARM       = "Farm status"
  OWNERSHP   = "Ownership of dwelling (tenure) [general version]"
  OWNERSHPD  = "Ownership of dwelling (tenure) [detailed version]"
  MORTGAGE   = "Mortgage status"
  MORTGAG2   = "Second mortgage status"
  FARMPROD   = "Sales of farm products"
  ACREHOUS   = "House acreage"
  MORTAMT1   = "First mortgage monthly payment"
  MORTAMT2   = "Second mortgage monthly payment"
  TAXINCL    = "Mortgage payment includes property taxes"
  INSINCL    = "Mortgage payment includes property insurance"
  PROPINSR   = "Annual property insurance cost"
  PROPTX99   = "Annual property taxes, 1990"
  OWNCOST    = "Selected monthly owner costs"
  RENT       = "Monthly contract rent"
  RENTGRS    = "Monthly gross rent"
  RENTMEAL   = "Meals included in rent"
  CONDOFEE   = "Monthly condominium fee"
  MOBLHOME   = "Annual mobile home costs"
  COSTELEC   = "Annual electricity cost"
  COSTGAS    = "Annual gas cost"
  COSTWATR   = "Annual water cost"
  COSTFUEL   = "Annual home heating fuel cost"
  HHINCOME   = "Total household income "
  FOODSTMP   = "Food stamp recipiency"
  VALUEH     = "House value"
  LINGISOL   = "Linguistic isolation"
  VACANCY    = "Vacancy status"
  KITCHEN    = "Kitchen or cooking facilities"
  FRIDGE     = "Refrigerator"
  SINK       = "Sink with faucet"
  STOVE      = "Stove or range"
  ROOMS      = "Number of rooms"
  PLUMBING   = "Plumbing facilities"
  HOTWATER   = "Hot and cold piped water"
  SHOWER     = "Bathtub or shower"
  BUILTYR2   = "Age of structure, decade"
  UNITSSTR   = "Units in structure"
  BEDROOMS   = "Number of bedrooms"
  PHONE      = "Telephone availability"
  CINETHH    = "Access to internet"
  CILAPTOP   = "Laptop, desktop, or notebook computer"
  CISMRTPHN  = "Smartphone"
  CITABLET   = "Tablet or other portable wireless computer"
  CIOTHCOMP  = "Other computer equipment"
  CIDATAPLN  = "Cellular data plan for a smartphone or other mobile device"
  CIHISPEED  = "Broadband (high speed) Internet service such as cable, fiber optic, or DSL service"
  CISAT      = "Satellite internet service"
  CIDIAL     = "Dial-up service"
  CIOTHSVC   = "Other internet service"
  FUELHEAT   = "Home heating fuel"
  VEHICLES   = "Vehicles available"
  COUPLETYPE = "Householder couple type"
  SSMC       = "Same-sex married couple"
  NFAMS      = "Number of families in household"
  NSUBFAM    = "Number of subfamilies in household"
  NCOUPLES   = "Number of couples in household"
  NMOTHERS   = "Number of mothers in household"
  NFATHERS   = "Number of fathers in household"
  MULTGEN    = "Multigenerational household [general version]"
  MULTGEND   = "Multigenerational household [detailed version]"
  CBNSUBFAM  = "Number of subfamilies in household (original Census Bureau classification)"
  REPWT1     = "Household replicate weight 1"
  REPWT2     = "Household replicate weight 2"
  REPWT3     = "Household replicate weight 3"
  REPWT4     = "Household replicate weight 4"
  REPWT5     = "Household replicate weight 5"
  REPWT6     = "Household replicate weight 6"
  REPWT7     = "Household replicate weight 7"
  REPWT8     = "Household replicate weight 8"
  REPWT9     = "Household replicate weight 9"
  REPWT10    = "Household replicate weight 10"
  REPWT11    = "Household replicate weight 11"
  REPWT12    = "Household replicate weight 12"
  REPWT13    = "Household replicate weight 13"
  REPWT14    = "Household replicate weight 14"
  REPWT15    = "Household replicate weight 15"
  REPWT16    = "Household replicate weight 16"
  REPWT17    = "Household replicate weight 17"
  REPWT18    = "Household replicate weight 18"
  REPWT19    = "Household replicate weight 19"
  REPWT20    = "Household replicate weight 20"
  REPWT21    = "Household replicate weight 21"
  REPWT22    = "Household replicate weight 22"
  REPWT23    = "Household replicate weight 23"
  REPWT24    = "Household replicate weight 24"
  REPWT25    = "Household replicate weight 25"
  REPWT26    = "Household replicate weight 26"
  REPWT27    = "Household replicate weight 27"
  REPWT28    = "Household replicate weight 28"
  REPWT29    = "Household replicate weight 29"
  REPWT30    = "Household replicate weight 30"
  REPWT31    = "Household replicate weight 31"
  REPWT32    = "Household replicate weight 32"
  REPWT33    = "Household replicate weight 33"
  REPWT34    = "Household replicate weight 34"
  REPWT35    = "Household replicate weight 35"
  REPWT36    = "Household replicate weight 36"
  REPWT37    = "Household replicate weight 37"
  REPWT38    = "Household replicate weight 38"
  REPWT39    = "Household replicate weight 39"
  REPWT40    = "Household replicate weight 40"
  REPWT41    = "Household replicate weight 41"
  REPWT42    = "Household replicate weight 42"
  REPWT43    = "Household replicate weight 43"
  REPWT44    = "Household replicate weight 44"
  REPWT45    = "Household replicate weight 45"
  REPWT46    = "Household replicate weight 46"
  REPWT47    = "Household replicate weight 47"
  REPWT48    = "Household replicate weight 48"
  REPWT49    = "Household replicate weight 49"
  REPWT50    = "Household replicate weight 50"
  REPWT51    = "Household replicate weight 51"
  REPWT52    = "Household replicate weight 52"
  REPWT53    = "Household replicate weight 53"
  REPWT54    = "Household replicate weight 54"
  REPWT55    = "Household replicate weight 55"
  REPWT56    = "Household replicate weight 56"
  REPWT57    = "Household replicate weight 57"
  REPWT58    = "Household replicate weight 58"
  REPWT59    = "Household replicate weight 59"
  REPWT60    = "Household replicate weight 60"
  REPWT61    = "Household replicate weight 61"
  REPWT62    = "Household replicate weight 62"
  REPWT63    = "Household replicate weight 63"
  REPWT64    = "Household replicate weight 64"
  REPWT65    = "Household replicate weight 65"
  REPWT66    = "Household replicate weight 66"
  REPWT67    = "Household replicate weight 67"
  REPWT68    = "Household replicate weight 68"
  REPWT69    = "Household replicate weight 69"
  REPWT70    = "Household replicate weight 70"
  REPWT71    = "Household replicate weight 71"
  REPWT72    = "Household replicate weight 72"
  REPWT73    = "Household replicate weight 73"
  REPWT74    = "Household replicate weight 74"
  REPWT75    = "Household replicate weight 75"
  REPWT76    = "Household replicate weight 76"
  REPWT77    = "Household replicate weight 77"
  REPWT78    = "Household replicate weight 78"
  REPWT79    = "Household replicate weight 79"
  REPWT80    = "Household replicate weight 80"
  RESPMODE   = "Response mode"
;

format
  YEAR        YEAR_f.
  SAMPLE      SAMPLE_f.
  SUBSAMP     SUBSAMP_f.
  HHTYPE      HHTYPE_f.
  CBHHTYPE    CBHHTYPE_f.
  REPWT       REPWT_f.
  REGION      REGION_f.
  STATEICP    STATEICP_f.
  STATEFIP    STATEFIP_f.
  COUNTYICP   COUNTYICP_f.
  METRO       METRO_f.
  MET2013     MET2013_f.
  MET2013ERR  MET2013ERR_f.
  CITY        CITY_f.
  CITYERR     CITYERR_f.
  HOMELAND    HOMELAND_f.
  CNTRY       CNTRY_f.
  GQ          GQ_f.
  GQTYPE      GQTYPE_f.
  GQTYPED     GQTYPED_f.
  FARM        FARM_f.
  OWNERSHP    OWNERSHP_f.
  OWNERSHPD   OWNERSHPD_f.
  MORTGAGE    MORTGAGE_f.
  MORTGAG2    MORTGAG2_f.
  FARMPROD    FARMPROD_f.
  ACREHOUS    ACREHOUS_f.
  MORTAMT1    MORTAMT1_f.
  MORTAMT2    MORTAMT2_f.
  TAXINCL     TAXINCL_f.
  INSINCL     INSINCL_f.
  PROPINSR    PROPINSR_f.
  PROPTX99    PROPTX99_f.
  OWNCOST     OWNCOST_f.
  RENT        RENT_f.
  RENTGRS     RENTGRS_f.
  RENTMEAL    RENTMEAL_f.
  CONDOFEE    CONDOFEE_f.
  MOBLHOME    MOBLHOME_f.
  HHINCOME    HHINCOME_f.
  FOODSTMP    FOODSTMP_f.
  VALUEH      VALUEH_f.
  LINGISOL    LINGISOL_f.
  VACANCY     VACANCY_f.
  KITCHEN     KITCHEN_f.
  FRIDGE      FRIDGE_f.
  SINK        SINK_f.
  STOVE       STOVE_f.
  ROOMS       ROOMS_f.
  PLUMBING    PLUMBING_f.
  HOTWATER    HOTWATER_f.
  SHOWER      SHOWER_f.
  BUILTYR2    BUILTYR2_f.
  UNITSSTR    UNITSSTR_f.
  BEDROOMS    BEDROOMS_f.
  PHONE       PHONE_f.
  CINETHH     CINETHH_f.
  CILAPTOP    CILAPTOP_f.
  CISMRTPHN   CISMRTPHN_f.
  CITABLET    CITABLET_f.
  CIOTHCOMP   CIOTHCOMP_f.
  CIDATAPLN   CIDATAPLN_f.
  CIHISPEED   CIHISPEED_f.
  CISAT       CISAT_f.
  CIDIAL      CIDIAL_f.
  CIOTHSVC    CIOTHSVC_f.
  FUELHEAT    FUELHEAT_f.
  VEHICLES    VEHICLES_f.
  COUPLETYPE  COUPLETYPE_f.
  SSMC        SSMC_f.
  NFAMS       NFAMS_f.
  NSUBFAM     NSUBFAM_f.
  NCOUPLES    NCOUPLES_f.
  NMOTHERS    NMOTHERS_f.
  NFATHERS    NFATHERS_f.
  MULTGEN     MULTGEN_f.
  MULTGEND    MULTGEND_f.
  CBNSUBFAM   CBNSUBFAM_f.
  RESPMODE    RESPMODE_f.
;

format
  CBSERIAL    13.
  HHWT        11.2
  CLUSTER     13.
  STRATA      12.
;

  
  /**** UI STANDARD CODE HERE ****/
  
  ** Create unique PUMA ID **;

  %upuma() 


  ** Keep only vacant units **;
  if vacancy ^= 0 ;
 
  ** Recode n/a and missing values **;
  
  if valueh = 0 then valueh = .n;
  else if valueh = 9999999 then valueh = .u;
  
  if rent = 0 then rent = .n;
  else if rent = 1 then rent = .u;  /** No cash rent **/

  /** Output files by state **/
  
  select ( statefip );
    when( &FIPS_DC ) output ACS_&yr._vacant_DC;
    when( &FIPS_MD ) output ACS_&yr._vacant_MD;
    when( &FIPS_VA ) output ACS_&yr._vacant_VA;
    when( &FIPS_WV ) output ACS_&yr._vacant_WV;
    otherwise do;
      ** Nothing **;
    end;
  end;
  
  ** Remove extraneous format associations **;
  
  format 
    serial rooms hhwt puma rent valueh ;
  
  ** Drop unneeded variables **;
  
  drop lingisol phone fuelheat vehicles;
  
run;


/* Save final datasets */

%macro final_state (st);

%Finalize_data_set( 
  data=ACS_&yr._vacant_&st.,
  out=ACS_&yr._vacant_&st.,
  outlib=ipums,
  label="IPUMS ACS sample, 2018-22, vacant housing units, &st.",
  sortby=serial,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions.),
  /** File info parameters **/
  printobs=5,
  freqvars=vacancy bedrooms
  );

%mend final_state;
%final_state (DC);
%final_state (MD);
%final_state (VA);
%final_state (WV);
