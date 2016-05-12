/**************************************************************************
 Program:  Acs_2007_pmsa99_full.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/18/10
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Create and download full ACS 2007 file for region,
 with household and family variables.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

data Acs_2007_pmsa99_full;

  merge Ipums.Acs_2007_pmsa99 Ipums.Acs_2007_fam_pmsa99;
  by serial;
  
run;

proc download status=no
  inlib=work 
  outlib=ipums memtype=(data);
  select Acs_2007_pmsa99_full;

run;

endrsubmit;

** End submitting commands to remote server **;

%File_info( data=Ipums.Acs_2007_pmsa99_full, printobs=0 )

run;

signoff;
