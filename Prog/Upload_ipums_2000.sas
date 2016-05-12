************************************************************************
* Program:  Upload_ipums_2000.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  10/13/04
* Version:  SAS 8.2
* Environment:  Windows with SAS/Connect
* 
* Description:  Upload IPUMS 2000 data files to Alpha & register with
* metadata system.
*
* Modifications:
*  11/11/04  Added metadata registration
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

** Delete current files from Alpha **;

proc datasets library=ipums nolist;
  delete ipums_2000_: /memtype=data;
  delete formats /memtype=catalog;

run;

** Upload files to Alpha **;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select Ipums_2000_: formats;

run;

** Register with metadata system **;

%let revision_msg = 
  Initial file creation;

%Dc_update_md_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_dc,
  creator_process=Ipums_2000_dc.sas,
  revisions=&revision_msg,
  restrictions=None
)

%Dc_update_md_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_md,
  creator_process=Ipums_2000_md.sas,
  revisions=&revision_msg,
  restrictions=None
)

%Dc_update_md_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_va,
  creator_process=Ipums_2000_va.sas,
  revisions=&revision_msg,
  restrictions=None
)

%Dc_update_md_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_wv,
  creator_process=Ipums_2000_wv.sas,
  revisions=&revision_msg,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;
