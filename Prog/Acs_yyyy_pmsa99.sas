/**************************************************************************
 Program:  Acs_<year>_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   
 Created:  
 Version:  SAS 9.2
 Environment:  Windows with SAS/Connect
 
 Description: Create SAS view of IPUMS <year> data for Wash. region
 (PMSA 1999).

 Modifications: 
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

rsubmit;

%let revisions = %str(New file.);

data Ipums.Acs_<year>_pmsa99 
  (label="ACS microdata, <year>, Washington, D.C. PMSA (1999)") / view=Ipums.Acs_<year>_pmsa99;

  set 
    Ipums.Acs_<year>_dc
    Ipums.Acs_<year>_md
    Ipums.Acs_<year>_va
    Ipums.Acs_<year>_wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

run;

** Purge older versions **;

x "purge [dcdata.Ipums.data]Acs_<year>_pmsa99.*";

** File info **;

%File_info( data=Ipums.Acs_<year>_pmsa99, printobs=5, freqvars=statefip acre: )

run;

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Acs_<year>_pmsa99,
  creator_process=Acs_<year>_pmsa99.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

run;

endrsubmit;

run;

signoff;
