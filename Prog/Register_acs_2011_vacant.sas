/**************************************************************************
 Program:  Register_acs_2011_vacant.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/07/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Register IPUMS 2011 vacant housing unit data sets with
 metadata system.

 Modifications:
  11/03/14 PAT Corrected creator process. 
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums, local=n )

%let revisions = %str(Corrected formats.);

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2011_vacant_dc,
  creator_process=ACS_2011_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2011_vacant_md,
  creator_process=ACS_2011_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2011_vacant_va,
  creator_process=ACS_2011_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=ACS_2011_vacant_wv,
  creator_process=ACS_2011_vacant.sas,
  revisions=&revisions,
  restrictions=None
)

run;

