/**************************************************************************
 Program:  Download_ipums_lib.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  12/21/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Download contents of IPUMS library.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

proc download status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select acs_2008_: ;

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
