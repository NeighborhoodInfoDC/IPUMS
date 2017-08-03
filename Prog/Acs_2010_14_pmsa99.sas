/**************************************************************************
 Program:  Acs_2010_14_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P Tatian
 Created:  08/02/2017
 Version:  SAS 9.2
 Environment:  Windows
 
 Description: Create SAS view of IPUMS 2010-14 data for Wash. region
 (PMSA 1999).

 Modifications: 
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

%let revisions = New file.;

data Ipums.Acs_2010_14_pmsa99 
  (label="ACS microdata, 2010-14, Washington, D.C. PMSA (1999)") / view=Ipums.Acs_2010_14_pmsa99;

  set 
    Ipums.Acs_2010_14_dc
    Ipums.Acs_2010_14_md
    Ipums.Acs_2010_14_va
    Ipums.Acs_2010_14_wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

run;

** File info **;

%File_info( data=Ipums.Acs_2010_14_pmsa99, printobs=5, freqvars=statefip acre: )

run;

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Acs_2010_14_pmsa99,
  creator_process=Acs_2010_14_pmsa99.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

run;

