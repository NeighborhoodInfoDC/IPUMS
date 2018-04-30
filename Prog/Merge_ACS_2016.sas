/**************************************************************************
 Program:  Merge Household and Personal Level IPUMS data
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  4/16/2018
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Merge HH and Personal ACS 2016 Ipums datasets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 D:\DCData\Libraries\IPUMS\Raw 

 Modifications:
**************************************************************************/

libname Ipums2 "D:\DCData\Libraries\IPUMS\Raw\usa_00002";
libname Ipums4 "D:\DCData\Libraries\IPUMS\Raw\usa_00004";
libname Raw_2016 "D:\DCData\Libraries\IPUMS\Raw";

proc sort data=Ipums2.usa_00002
out=Ipum2;by serial pernum; run;

proc sort data=Ipums4.usa_00004
out=Ipum4;by serial pernum; run;

data Raw_2016.all_2016; merge Ipum2 Ipum4; by serial pernum; run;

