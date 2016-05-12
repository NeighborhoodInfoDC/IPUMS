/**************************************************************************
 Program:  Register_acs_2004_2006_dc.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/28/08
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Register Ipums.Acs_2004_2006_dc with metadata system.

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
  ds_name=Acs_2004_2006_dc,
  creator_process=Acs_2004_2006_dc.sas,
  restrictions=None,
  revisions=%str(New file.)
)

run;

endrsubmit;

** End submitting commands to remote server **;


signoff;
