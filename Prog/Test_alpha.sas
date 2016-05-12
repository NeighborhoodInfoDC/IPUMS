************************************************************************
* Program:  Test_alpha.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  09/17/04
* Version:  SAS 8.12
* Environment:  Windows with SAS/Connect
* 
* Description:  Test program of Alpha template.
*
* Modifications:
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

%put LOCAL; 
%put _user_;

run;

rsubmit;

%put REMOTE;
%put _user_;

data Ipums.Test;

input X;

cards;
1
2
3
4
5
;

run;

%File_info( data=Ipums.Test )

run;

endrsubmit;

signoff;
