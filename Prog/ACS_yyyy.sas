/**************************************************************************
 Program:  ACS_<year>.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   
 Created:  
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Read raw IPUMS <year> ACS data and create data sets 
 for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

%let yr = <year>;

%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

** Define libraries **;
%DCData_lib( Ipums )

*options obs=100;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_path\ipums\raw\<file>.dat";

data 
  ipums.ACS_&yr._DC (label="IPUMS ACS sample, &yr_dash., DC")
  ipums.ACS_&yr._MD (label="IPUMS ACS sample, &yr_dash., MD")
  ipums.ACS_&yr._VA (label="IPUMS ACS sample, &yr_dash., VA")
  ipums.ACS_&yr._WV (label="IPUMS ACS sample, &yr_dash., WV")
  ;

/**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/


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

