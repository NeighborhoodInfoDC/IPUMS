/**************************************************************************
 Program:  Upload_acs_2007.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 Updated: 7/28/09 KF 

 Description: Upload IPUMS 2007 data files to Alpha & register with
 metadata system.

 Modifications:
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
  select acs_2007_: formats;

run;

** Purge older versions **;

x "purge [dcdata.ipums.data]acs_2007_*.*";

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2007_dc,
  creator_process=Acs_2007_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2007_md,
  creator_process=Acs_2007_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2007_va,
  creator_process=Acs_2007_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2007_wv,
  creator_process=Acs_2007_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
