/**************************************************************************
 Program:  Upload_acs_2004.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description: Upload IPUMS 2004 data files to Alpha & register with
 metadata system.

 Modifications: 11/9/07 RRR to upload 2004 data
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

%let revisions = %str(New file.);

** Upload files to Alpha **;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select acs_2004_: formats;

run;

** Purge older versions **;

x "purge [dcdata.ipums.data]acs_2004_*.*";

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2004_dc,
  creator_process=Acs_2004_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2004_md,
  creator_process=Acs_2004_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2004_va,
  creator_process=Acs_2004_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2004_wv,
  creator_process=Acs_2004_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
