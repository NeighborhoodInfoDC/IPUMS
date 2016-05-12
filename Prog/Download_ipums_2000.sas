/**************************************************************************
 Program:  Download_ipums_2000.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/10/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Download IPUMS 2000 files.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

proc download status=no
  data=Ipums.Ipums_2000_dc 
  out=Ipums.Ipums_2000_dc;

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
