/**************************************************************************
 Program:  Ipums_2000_valueh.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/08/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Add updated VALUEH variable to Ipums_2000_?? data
sets.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

libname raw "L:\Libraries\IPUMS\Raw\PAT";

proc format;
  value valueh
    2-<9999999 = "(amount)";
run;    

/** Macro Update - Start Definition **/

%macro Update( statefip=, stab= );

  proc compare 
      base=Ipums_r.Ipums_2000_&stab. (where=(pernum=1 and ownershd in ( 12, 13 ))) 
      compare=raw.usa_00023 (where=(statefip=&statefip.)) 
      maxprint=(40,32000)
      listobs;
    id serial;
    var value statefip;
    with valueh statefip;
    title2 "State = %upcase(&stab)";
  run;

  data Ipums_l.Ipums_2000_&stab. (label="IPUMS 5% sample data, 2000, %upcase(&stab)");

    length valueh 8;

    merge
      Ipums_r.Ipums_2000_&stab. (in=in1)
      raw.usa_00023 (keep=serial statefip valueh where=(statefip=&statefip.) in=in2);
    by serial;
    
    if not in2 then valueh = .n;
    else if missing( valueh ) then valueh = .u;
    
    label value = "House value - DO NOT USE THIS VAR: use VALUEH instead";
    
  run;

  %File_info( data=Ipums_l.Ipums_2000_&stab., freqvars=statefip, printobs=0 )
  
  proc freq data=Ipums_l.Ipums_2000_&stab.;
    tables gq * ownershd * valueh / list missing nocum nopercent;
    format valueh valueh.;
    title2 "State = %upcase(&stab)";
  run;
  
  title2;

%mend Update;

/** End Macro Definition **/


%Update( statefip=11, stab=dc )
%Update( statefip=24, stab=md )
%Update( statefip=51, stab=va )
%Update( statefip=54, stab=wv )
