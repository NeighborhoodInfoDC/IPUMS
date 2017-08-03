/**************************************************************************
 Program:  Register_acs_2010_14.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/02/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Special program to register the ACS_2010_14 data sets.
 (Wasn't done when the files were originally created.)

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS )

%Dc_update_meta_file(
  ds_lib=IPUMS,
  ds_name=ACS_2010_14_dc,
  creator_process=ACS_2010_14.sas,
  restrictions=None,
  revisions=%str(New file.)
)

%Dc_update_meta_file(
  ds_lib=IPUMS,
  ds_name=ACS_2010_14_md,
  creator_process=ACS_2010_14.sas,
  restrictions=None,
  revisions=%str(New file.)
)

%Dc_update_meta_file(
  ds_lib=IPUMS,
  ds_name=ACS_2010_14_va,
  creator_process=ACS_2010_14.sas,
  restrictions=None,
  revisions=%str(New file.)
)

%Dc_update_meta_file(
  ds_lib=IPUMS,
  ds_name=ACS_2010_14_wv,
  creator_process=ACS_2010_14.sas,
  restrictions=None,
  revisions=%str(New file.)
)

run;
