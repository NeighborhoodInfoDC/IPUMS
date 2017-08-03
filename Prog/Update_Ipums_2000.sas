/**************************************************************************
 Program:  Update_Ipums_2000.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/08/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Update and re-register the Ipums_2000_?? data sets.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

/** Macro Update_register - Start Definition **/

%macro Update_register( stab );

  proc datasets library=Ipums_l memtype=(data);
    copy in=Ipums_l out=Ipums_r memtype=data;
    select Ipums_2000_&stab;
  quit;

  %Dc_update_meta_file(
    ds_lib=Ipums,
    ds_name=Ipums_2000_&stab,
    creator_process=Ipums_2000_valueh.sas,
    restrictions=None,
    revisions=%str(Added new VALUEH variable.)
  )

%mend Update_register;

/** End Macro Definition **/


/*%Update_register( dc )*/
%Update_register( md )
%Update_register( va )
%Update_register( wv )

run;
