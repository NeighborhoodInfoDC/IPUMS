************************************************************************
* Program:  Ptx9900f_fmt.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  11/23/04
* Version:  SAS 8.2
* Environment:  Windows with SAS/Connect
* 
* Description:  Create format PTX9900F to convert Proptx99 codes to
* average dollar values for 2000.
*
* NB:  Excel file D:\DCData\Libraries\IPUMS\Doc\Proptx99.xls
*      must be open.
*
* Modifications:
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

filename ddein dde "excel|D:\DCData\Libraries\IPUMS\Doc\[Proptx99.xls]Sheet1!R4C9:R71C10" lrecl=256;

data Ptx9900f;

  infile ddein;
  
  input code avgamt $;

run;

%data_to_format( 
  fmtname=Ptx9900f,
  fmtlib=Ipums,
  data=Ptx9900f, 
  value=code, 
  label=avgamt, 
  otherlabel=" " )

rsubmit;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(catalog);
  select formats;

run;

endrsubmit;

signoff;
