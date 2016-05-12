/**************************************************************************
 Program:  Acs_2005_fam_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description: Create HH level family vars. for IPUMS data.
 Washington, D.C. PMSA (1999)

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

rsubmit;

%Ipums_fam_vars( 
  in_data=Acs_2005_pmsa99, 
  out_data=Acs_2005_fam_pmsa99, 
  label="ACS microdata, calculated family types (HH level), 2005, Washington, D.C. PMSA (1999)", 
  revisions=%str(New file.), 
  finalize=Y
)

run;

endrsubmit;

signoff;

