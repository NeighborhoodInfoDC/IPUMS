/**************************************************************************
 Program:  Register_ACS_2009_11_vacant.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/03/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Register IPUMS 2009-11 vacant housing unit data sets with
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
  ds_name=ACS_2009_11_vacant_dc,
  creator_process=ACS_2009_11_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2009_11_vacant_md,
  creator_process=ACS_2009_11_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2009_11_vacant_va,
  creator_process=ACS_2009_11_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2009_11_vacant_wv,
  creator_process=ACS_2009_11_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

run;

