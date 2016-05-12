/**************************************************************************
 Program:  Acs_2006_08_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description: Create SAS view of IPUMS 2000 data for Wash. region
 (PMSA 1999).

 Modifications: 3/5/10 KEF for 2006-08 ACS data
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

rsubmit;

**Deleting old data from Alpha;
/*proc datasets library=Ipums memtype=(data);
  delete Acs_2006_08_pmsa99;
quit;*/

%let revisions = New file.;

data Ipums.Acs_2006_08_pmsa99 
  (label="ACS microdata, 2006-08, Washington, D.C. PMSA (1999)") / view=Ipums.Acs_2006_08_pmsa99;

  set 
    Ipums.Acs_2006_08_dc
    Ipums.Acs_2006_08_md
    Ipums.Acs_2006_08_va
    Ipums.Acs_2006_08_wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

run;

** Purge older versions **;

x "purge [dcdata.Ipums.data]Acs_2006_08_pmsa99.*";

** File info **;

%File_info( data=Ipums.Acs_2006_08_pmsa99, printobs=5, freqvars=statefip acre: )

run;

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Acs_2006_08_pmsa99,
  creator_process=Acs_2006_08_pmsa99.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

run;

endrsubmit;

run;

signoff;
