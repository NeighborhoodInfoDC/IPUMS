/**************************************************************************
 Program:  Merge Detailed language data with IPUMS data 2012-2016
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  9/26/2018
 Version:  SAS 9.4
 Environment:  Windows
 
 Description:  Merge detailed language spoken variabel with ACS 2016 Ipums datasets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 D:\DCData\Libraries\IPUMS\Raw 

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

libname Ipums2 "L:\Libraries\IPUMS\Raw\usa_00010";

proc sort data=Ipums2.usa_00010
out=laguageD;by serial pernum; run;

proc sort data=Ipums.acs_2012_16_dc
out=all;by serial pernum; run;

data ACS_2016_language; merge laguageD all; by serial pernum; run;

