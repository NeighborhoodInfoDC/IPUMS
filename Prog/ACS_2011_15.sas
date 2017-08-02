/**************************************************************************
 Program:  ACS_2011_15.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P Tatian
 Created:  08/2/2017
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Read IPUMS 2010-15 ACS data and create data sets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 L:\Libraries\IPUMS\Raw\PAT\usa_00027.sas7bdat.gz
 L:\Libraries\IPUMS\Raw\PAT\usa_00028.sas7bdat.gz

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;  ** Uncomment for testing **;

** Location of input data sets **;

libname indat "L:\Libraries\IPUMS\Raw\PAT";

** File year **;

%let yr = 2011_15;

%let revisions = New file.;

%let yr_dash = %sysfunc( tranwrd( &yr, _, - ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

data ACS_&yr._DC ACS_&yr._MD ACS_&yr._VA ACS_&yr._WV;

  merge indat.usa_00027 indat.usa_00028;
  by serial pernum;
  
  /**** COPY FORMAT STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

format
  YEAR        YEAR_f.
  NUMPREC     NUMPREC_f.
  SUBSAMP     SUBSAMP_f.
  HHTYPE      HHTYPE_f.
  REGION      REGION_f.
  STATEICP    STATEICP_f.
  STATEFIP    STATEFIP_f.
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
  COMMUSE     COMMUSE_f.
  ACREHOUS    ACREHOUS_f.
  TAXINCL     TAXINCL_f.
  INSINCL     INSINCL_f.
  PROPTX99    PROPTX99_f.
  RENTMEAL    RENTMEAL_f.
  FOODSTMP    FOODSTMP_f.
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
  TOILET      TOILET_f.
  BUILTYR2    BUILTYR2_f.
  UNITSSTR    UNITSSTR_f.
  BEDROOMS    BEDROOMS_f.
  PHONE       PHONE_f.
  FUELHEAT    FUELHEAT_f.
  VEHICLES    VEHICLES_f.
  NFAMS       NFAMS_f.
  NSUBFAM     NSUBFAM_f.
  NCOUPLES    NCOUPLES_f.
  NMOTHERS    NMOTHERS_f.
  NFATHERS    NFATHERS_f.
  MULTGEN     MULTGEN_f.
  MULTGEND    MULTGEND_f.
  CBNSUBFAM   CBNSUBFAM_f.
  RESPMODE    RESPMODE_f.

  GQ          GQ_f.
  FAMSIZE     FAMSIZE_f.
  NCHILD      NCHILD_f.
  NCHLT5      NCHLT5_f.
  FAMUNIT     FAMUNIT_f.
  ELDCH       ELDCH_f.
  YNGCH       YNGCH_f.
  NSIBS       NSIBS_f.
  SUBFAM      SUBFAM_f.
  MOM2RULE    MOM2RULE_f.
  MOMRULE     MOMRULE_f.
  POP2RULE    POP2RULE_f.
  POPRULE     POPRULE_f.
  SPRULE      SPRULE_f.
  SFTYPE      SFTYPE_f.
  SFRELATE    SFRELATE_f.
  CBSUBFAM    CBSUBFAM_f.
  CBSFTYPE    CBSFTYPE_f.
  CBSFRELATE  CBSFRELATE_f.
  RELATE      RELATE_f.
  RELATED     RELATED_f.
  SEX         SEX_f.
  AGE         AGE_f.
  BIRTHQTR    BIRTHQTR_f.
  MARST       MARST_f.
  MARRNO      MARRNO_f.
  MARRINYR    MARRINYR_f.
  DIVINYR     DIVINYR_f.
  WIDINYR     WIDINYR_f.
  FERTYR      FERTYR_f.
  RACE        RACE_f.
  RACED       RACED_f.
  HISPAN      HISPAN_f.
  HISPAND     HISPAND_f.
  BPL         BPL_f.
  BPLD        BPLD_f.
  ANCESTR1    ANCESTR1_f.
  ANCESTR1D   ANCESTR1D_f.
  ANCESTR2    ANCESTR2_f.
  ANCESTR2D   ANCESTR2D_f.
  CITIZEN     CITIZEN_f.
  YRNATUR     YRNATUR_f.
  YRSUSA2     YRSUSA2_f.
  LANGUAGE    LANGUAGE_f.
  LANGUAGED   LANGUAGED_f.
  SPEAKENG    SPEAKENG_f.
  TRIBE       TRIBE_f.
  TRIBED      TRIBED_f.
  RACAMIND    RACAMIND_f.
  RACASIAN    RACASIAN_f.
  RACBLK      RACBLK_f.
  RACPACIS    RACPACIS_f.
  RACWHT      RACWHT_f.
  RACOTHER    RACOTHER_f.
  RACNUM      RACNUM_f.
  HCOVANY     HCOVANY_f.
  HCOVPRIV    HCOVPRIV_f.
  HINSEMP     HINSEMP_f.
  HINSPUR     HINSPUR_f.
  HINSTRI     HINSTRI_f.
  HCOVPUB     HCOVPUB_f.
  HINSCAID    HINSCAID_f.
  HINSCARE    HINSCARE_f.
  HINSVA      HINSVA_f.
  HINSIHS     HINSIHS_f.
  HCOVANY2    HCOVANY2_f.
  HCOVPRIV2   HCOVPRIV2_f.
  HINSEMP2    HINSEMP2_f.
  HINSPUR2    HINSPUR2_f.
  HINSTRI2    HINSTRI2_f.
  HCOVPUB2    HCOVPUB2_f.
  HINSCAID2   HINSCAID2_f.
  HINSCARE2   HINSCARE2_f.
  HINSVA2     HINSVA2_f.
  HINSIHS2    HINSIHS2_f.
  SCHOOL      SCHOOL_f.
  EDUC        EDUC_f.
  EDUCD       EDUCD_f.
  GRADEATT    GRADEATT_f.
  GRADEATTD   GRADEATTD_f.
  SCHLTYPE    SCHLTYPE_f.
  EMPSTAT     EMPSTAT_f.
  EMPSTATD    EMPSTATD_f.
  LABFORCE    LABFORCE_f.
  OCC1950     OCC1950_f.
  OCC1990     OCC1990_f.
  OCC2010     OCC2010_f.
  IND1950     IND1950_f.
  IND1990     IND1990_f.
  CLASSWKR    CLASSWKR_f.
  CLASSWKRD   CLASSWKRD_f.
  WKSWORK2    WKSWORK2_f.
  UHRSWORK    UHRSWORK_f.
  WRKLSTWK    WRKLSTWK_f.
  ABSENT      ABSENT_f.
  LOOKING     LOOKING_f.
  AVAILBLE    AVAILBLE_f.
  WRKRECAL    WRKRECAL_f.
  WORKEDYR    WORKEDYR_f.
  MIGRATE1    MIGRATE1_f.
  MIGRATE1D   MIGRATE1D_f.
  MIGPLAC1    MIGPLAC1_f.
  VETDISAB    VETDISAB_f.
  DIFFREM     DIFFREM_f.
  DIFFPHYS    DIFFPHYS_f.
  DIFFMOB     DIFFMOB_f.
  DIFFCARE    DIFFCARE_f.
  DIFFSENS    DIFFSENS_f.
  DIFFEYE     DIFFEYE_f.
  DIFFHEAR    DIFFHEAR_f.
  VETSTAT     VETSTAT_f.
  VETSTATD    VETSTATD_f.
  VET01LTR    VET01LTR_f.
  VET90X01    VET90X01_f.
  VET75X90    VET75X90_f.
  VETVIETN    VETVIETN_f.
  VET55X64    VET55X64_f.
  VETKOREA    VETKOREA_f.
  VET47X50    VET47X50_f.
  VETWWII     VETWWII_f.
  VETOTHER    VETOTHER_f.
  PWSTATE2    PWSTATE2_f.
  TRANWORK    TRANWORK_f.
  CARPOOL     CARPOOL_f.
  RIDERS      RIDERS_f.
  GCHOUSE     GCHOUSE_f.
  GCMONTHS    GCMONTHS_f.
  GCRESPON    GCRESPON_f.
  ;
  
  
  *** UI-created format for race Yes/No vars. ***;
  format racamind racasian racblk racother racpacis racwht uracyn.;

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
    when( &FIPS_DC ) output ACS_&yr._DC;
    when( &FIPS_MD ) output ACS_&yr._MD;
    when( &FIPS_VA ) output ACS_&yr._VA;
    when( &FIPS_WV ) output ACS_&yr._WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
    end;
  end;
  
  drop i;

run;


** Finalize data sets **;

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._DC,
  out=ACS_&yr._DC,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., DC",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._MD,
  out=ACS_&yr._MD,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., MD",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._VA,
  out=ACS_&yr._VA,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., VA",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._WV,
  out=ACS_&yr._WV,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., WV",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)


title2 '** Unrecoded special values check **';
title3 '** Check maximum value of each variable. Should not be 999...9. **';

proc means data=ACS_&yr._DC n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._MD n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._VA n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._WV n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

title2;

