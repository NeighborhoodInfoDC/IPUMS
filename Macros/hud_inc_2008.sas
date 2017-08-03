/**************************************************************************
 Program:  Hud_inc_2008.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/26/10
 Version:  SAS 9.1
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

 NB: This program must be copied to the Alpha dir. [dcdata.ipums.prog].

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2008 - Start Definition **/

%macro Hud_inc_2008(  );

  ** HUD income categories (2008) **;

  if hhincome in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 20650 then hud_inc = 1;
          else if 20650 < hhincome <= 34450 then hud_inc = 2;
          else if 34450 < hhincome <= 43050 then hud_inc = 3;
          else if 43050 < hhincome <= 82600 then hud_inc = 4;
          else if 82600 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 23600 then hud_inc = 1;
          else if 23600 < hhincome <= 39350 then hud_inc = 2;
          else if 39350 < hhincome <= 49200 then hud_inc = 3;
          else if 49200 < hhincome <= 94400 then hud_inc = 4;
          else if 94400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 26550 then hud_inc = 1;
          else if 26550 < hhincome <= 44300 then hud_inc = 2;
          else if 44300 < hhincome <= 55350 then hud_inc = 3;
          else if 55350 < hhincome <= 106200 then hud_inc = 4;
          else if 106200 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 29500 then hud_inc = 1;
          else if 29500 < hhincome <= 49200 then hud_inc = 2;
          else if 49200 < hhincome <= 61500 then hud_inc = 3;
          else if 61500 < hhincome <= 118000 then hud_inc = 4;
          else if 118000 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 31850 then hud_inc = 1;
          else if 31850 < hhincome <= 53150 then hud_inc = 2;
          else if 53150 < hhincome <= 66400 then hud_inc = 3;
          else if 66400 < hhincome <= 127400 then hud_inc = 4;
          else if 127400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 34200 then hud_inc = 1;
          else if 34200 < hhincome <= 57050 then hud_inc = 2;
          else if 57050 < hhincome <= 71350 then hud_inc = 3;
          else if 71350 < hhincome <= 136800 then hud_inc = 4;
          else if 136800 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 36600 then hud_inc = 1;
          else if 36600 < hhincome <= 61000 then hud_inc = 2;
          else if 61000 < hhincome <= 76250 then hud_inc = 3;
          else if 76250 < hhincome <= 146400 then hud_inc = 4;
          else if 146400 < hhincome < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 38950 then hud_inc = 1;
          else if 38950 < hhincome <= 64950 then hud_inc = 2;
          else if 64950 < hhincome <= 81200 then hud_inc = 3;
          else if 81200 < hhincome <= 155800 then hud_inc = 4;
          else if 155800 < hhincome < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2008;

/** End Macro Definition **/


