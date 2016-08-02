/**************************************************************************
 Program:  Download_ipums_formats.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/25/10
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Download IPUMS format catalog.

 Modifications:

07/17/16 MW Updated for SAS1 Server
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

/*rsubmit;*/

/*proc download status=no
  inlib=Ipums 
  outlib=Ipums memtype=(catalog);
  select formats;
run;*/

/*run;*/

/*endrsubmit;*/

** End submitting commands to remote server **;

proc catalog catalog=Ipums.formats;
  contents;
quit;

run;

/*signoff;*/
