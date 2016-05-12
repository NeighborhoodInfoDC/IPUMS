/**************************************************************************
 Program:  Register_Ipums_2000_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/26/08
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Register Ipums_2000_pmsa99 data view with metadata
 system.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_pmsa99,
  creator_process=Ipums_2000_pmsa99.sas,
  restrictions=None,
  revisions=%str(New file.)
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
