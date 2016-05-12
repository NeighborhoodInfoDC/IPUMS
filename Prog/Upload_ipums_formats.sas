/**************************************************************************
 Program:  Upload_ipums_formats.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/25/10
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Upload IPUMS format catalog.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(catalog);
  select formats;
run;

proc catalog catalog=Ipums.formats;
  contents;
quit;

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
