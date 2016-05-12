/**************************************************************************
 Program:  Upload_acs_2009.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 Updated: 7/28/09 KF 

 Description: Upload IPUMS 2009 data files to Alpha & register with
 metadata system.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

rsubmit;

**Deleting old data from Alpha;
/*proc datasets library=Ipums memtype=(data);
  delete Acs_2009_dc Acs_2009_va Acs_2009_md Acs_2009_wv;
quit;*/

%let revisions = %str(New file.);

** Upload files to Alpha **;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select acs_2009_dc acs_2009_md acs_2009_va acs_2009_wv formats;

run;

** Purge older versions **;

x "purge [dcdata.ipums.data]acs_2009_*.*";

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2009_dc,
  creator_process=Acs_2009_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2009_md,
  creator_process=Acs_2009_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2009_va,
  creator_process=Acs_2009_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2009_wv,
  creator_process=Acs_2009_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
