/**************************************************************************
 Program:  Register_ipums_2000_vacant.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/07/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Register IPUMS 2000 vacant housing unit data sets with
 metadata system.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums, local=n )

%let revisions = %str(New file.);

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ipums_2000_vacant_dc,
  creator_process=ipums_2000_vacant_dc.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ipums_2000_vacant_md,
  creator_process=ipums_2000_vacant_md.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ipums_2000_vacant_va,
  creator_process=ipums_2000_vacant_va.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ipums_2000_vacant_wv,
  creator_process=ipums_2000_vacant_wv.sas,
  revisions=&revisions,
  restrictions=None
)

run;

