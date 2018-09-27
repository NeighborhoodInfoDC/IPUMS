/**************************************************************************
 Program:  ACS_2012_16_languageD
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

proc sort data=Ipums2.usa_00010 out=laguageD (keep = serial pernum language languaged);
	by serial pernum; 
run;


%macro lang (state);

proc sort data=Ipums.acs_2012_16_&state. out=all_&state.; 
	by serial pernum; 
run;

data ACS_2016_language_&state.; 
	merge all_&state. (in=a) laguageD; 
	by serial pernum; 
	if a;
run;

%mend lang;
%lang (DC);
%lang (MD);
%lang (VA);
%lang (WV);
