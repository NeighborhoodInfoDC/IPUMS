/**************************************************************************
 Program:  Acs_2018_22_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Alexa Kort
 Created:  05/20/24
 Version:  SAS 9.2
 Environment:  Windows
 
 Description: Create SAS view of IPUMS 2018-22 data for Wash. region
 (PMSA 1999).
 
 THIS PROGRAM MUST BE RUN AS A BATCH SUBMIT ON L:
 IT CANNOT BE RUN AS A LOCAL BATCH SUBMIT.

 INDIVIDUAL STATE ACS FILES MUST BE CREATED ON L: 
 BEFORE RUNNING THIS PROGRAM.

 Modifications: 
**************************************************************************/

%include "\\sas1\DCdata\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

** File year **;

%let yr = 2018_22;

%let revisions = New file.;  ** Default is New file. Change if updating an existing data set. **;

%let yr_dash = %sysfunc( tranwrd( &yr, _, - ) );

data Ipums.Acs_&yr._pmsa99 
  (label="ACS microdata, &yr_dash, Washington, D.C. PMSA (1999)") / view=Ipums.Acs_&yr._pmsa99;

  set 
    Ipums.Acs_&yr._dc
    Ipums.Acs_&yr._md
    Ipums.Acs_&yr._va
    Ipums.Acs_&yr._wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

run;

** File info **;

%File_info( data=Ipums.Acs_&yr._pmsa99, printobs=5, freqvars=statefip acre: )

run;

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Acs_&yr._pmsa99,
  creator_process=Acs_&yr._pmsa99.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

run;

