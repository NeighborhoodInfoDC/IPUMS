/**************************************************************************
 Program:  Upload_acs_2010_14.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   M. Woluchem
 Created:  07/21/2016
 Version:  SAS 9.2
 Environment:  Windows with SAS/Connect

 Description: Upload IPUMS <year> data files to Alpha & register with
 metadata system.

 Modifications:
**************************************************************************/

/*%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;*/

%include "L:\SAS\Inc\StdLocal.sas"; 

** Define libraries **;
%DCData_lib( Ipums )

** Start submitting commands to remote server **;

/*rsubmit;*/

%let revisions = %str(New file.);

** Upload files to Alpha **;

/*proc upload status=no
  inlib=Ipums 
  outlib=Ipums memtype=(all);
  select acs_<year>_dc acs_<year>_md acs_<year>_va acs_<year>_wv formats;

run;*/

** Purge older versions **;

/*x "purge [dcdata.ipums.data]acs_<year>_*.*";*/

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2010_14_dc,
  creator_process=Acs_2010_14_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2010_14_md,
  creator_process=Acs_2010_14_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2010_14_va,
  creator_process=Acs_2010_14_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=acs_2010_14_wv,
  creator_process=Acs_2010_14_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

*endrsubmit;

** End submitting commands to remote server **;

*run;

*signoff;
