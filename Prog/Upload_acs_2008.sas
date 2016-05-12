/**************************************************************************
 Program:  Upload_acs_2008.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/22/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 Updated: 7/28/09 KF 

 Description: Upload IPUMS 2008 data files to Alpha & register with
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
  delete Acs_2008_dc Acs_2008_va Acs_2008_md Acs_2008_wv;
quit;*/

%let revisions = %str(New file.);
%let revisions = %str(Added health coverage vars. Added N/A recodes for costelec costgas costfuel costwatr eldch yngch yrnatur erscor50 erscor90 edscor50 edscor90 npboss50 npboss90.);

** Upload files to Alpha **;

proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select acs_2008_dc acs_2008_md acs_2008_va acs_2008_wv formats;

run;

** Purge older versions **;

x "purge [dcdata.ipums.data]acs_2008_*.*";

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2008_dc,
  creator_process=Acs_2008_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2008_md,
  creator_process=Acs_2008_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2008_va,
  creator_process=Acs_2008_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2008_wv,
  creator_process=Acs_2008_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
