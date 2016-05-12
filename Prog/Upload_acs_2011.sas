/**************************************************************************
 Program:  Upload_acs_2011.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Graham MacDonald
 Created:  4/10/2013
 Version:  SAS 9.2
 Environment:  Windows with SAS/Connect

 Description: Upload IPUMS 2011 data files to Alpha & register with
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
  select acs_2011_dc acs_2011_md acs_2011_va acs_2011_wv formats;

run;

** Purge older versions **;

x "purge [dcdata.ipums.data]acs_2011_*.*";

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2011_dc,
  creator_process=Acs_2011_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2011_md,
  creator_process=Acs_2011_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2011_va,
  creator_process=Acs_2011_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2011_wv,
  creator_process=Acs_2011_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
