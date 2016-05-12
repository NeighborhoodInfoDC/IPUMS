/**************************************************************************
 Program:  HHType_2009.sas
 Library:  IPums
 Project:  NeighborhoodInfo DC
 Author:   Rob Pitingolo
 Created:  09/21/11
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Create Summary HH Type indicators using IPums data.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
	options nofmterr ;

** Define libraries **;
%DCData_lib( ipums )

%Create_HHType( year= 2009 )

run;

