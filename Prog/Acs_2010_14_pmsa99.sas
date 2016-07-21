/**************************************************************************
 Program:  Acs_2010_14_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   M. Woluchem	
 Created:  07/21/16
 Version:  SAS 9.2
 Environment:  Windows with SAS/Connect
 
 Description: Create SAS view of IPUMS 2010-14 data for Wash. region
 (PMSA 1999).

 Modifications: 
 07/21/16 MW Modified for SAS1 Server
**************************************************************************/

/*%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;*/

%include "L:\SAS\Inc\StdLocal.sas";


** Define libraries **;
%DCData_lib( Ipums )

*rsubmit;

%let revisions = %str(New file.);

data Ipums.Acs_2010_14_pmsa99 
  (label="ACS microdata, 2010-14, Washington, D.C. PMSA (1999)"); /*/ view=Ipums.Acs_2010_14_pmsa99;*/

  set 
    Ipums.Acs_2010_14_dc
    Ipums.Acs_2010_14_md
    Ipums.Acs_2010_14_va
    Ipums.Acs_2010_14_wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

run;

** Purge older versions **;

*x "purge [dcdata.Ipums.data]Acs_<year>_pmsa99.*";

** File info **;

%File_info( data=Ipums.Acs_2010_14_pmsa99, printobs=5, freqvars=statefip acre: )

run;

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Acs_2010_14_pmsa99,
  creator_process=Acs_2010_14_pmsa99.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

run;

*endrsubmit;

*run;

*signoff;
