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

libname Ipums2 "L:\Libraries\IPUMS\Raw\usa_00009";
libname raw_2016 "L:\Libraries\IPUMS\Raw";

proc sort data=Ipums2.usa_00009
out=laguageD;by serial pernum; run;

proc sort data=Raw_2016.all_2016
out=all;by serial pernum; run;

data Raw_2016.ACS_2016_language; merge laguageD all; by serial pernum; run;

