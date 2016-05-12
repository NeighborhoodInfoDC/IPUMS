/**************************************************************************
 Program:  Hud_inc_<year>.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   
 Created:  
 Version:  SAS 9.2
 Environment:  Windows
 
 Description:  Autocall macro to calculate HUD income categories for
 IPUMS data, variable HUD_INC.
 
 Values:
 1  =  <=30% AMI (extremely low)
 2  =  31-50% AMI (very low)
 3  =  51-80% AMI (low)
 4  =  81-120% AMI (middle)
 5  =  >120% AMI (high)
 7  =  N/A (income not reported)

 Modifications:
**************************************************************************/

/** Macro Hud_inc_<year> - Start Definition **/

%macro Hud_inc_<year>(  );

  ** HUD income categories (<year>) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;


  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_<year>;

/** End Macro Definition **/


