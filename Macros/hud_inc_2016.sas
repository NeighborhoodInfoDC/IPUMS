/**************************************************************************
 Program:  Hud_inc_2016.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  4/12/2018
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

/** Macro Hud_inc_2016 - Start Definition **/

%macro Hud_inc_2016(  );

  ** HUD income categories (<year>) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 22850 then hud_inc = 1;
          else if 22850 < hhincome <= 38050 then hud_inc = 2;
          else if 38050 < hhincome <= 49150 then hud_inc = 3;
          else if 49150 < hhincome <= 91320 then hud_inc = 4;
          else if 91320 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 26100 then hud_inc = 1;
          else if 26100 < hhincome <= 43450 then hud_inc = 2;
          else if 43450 < hhincome <= 56150 then hud_inc = 3;
          else if 56150 < hhincome <= 104280 then hud_inc = 4;
          else if 104280 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 29350 then hud_inc = 1;
          else if 29350 < hhincome <= 48900 then hud_inc = 2;
          else if 48900 < hhincome <= 63150 then hud_inc = 3;
          else if 63150 < hhincome <= 117360 then hud_inc = 4;
          else if 117360 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 32600 then hud_inc = 1;
          else if 32600 < hhincome <= 54300 then hud_inc = 2;
          else if 54300 < hhincome <= 70150 then hud_inc = 3;
          else if 70150 < hhincome <= 130320 then hud_inc = 4;
          else if 130320 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 35250 then hud_inc = 1;
          else if 35250 < hhincome <= 58650 then hud_inc = 2;
          else if 58650 < hhincome <= 75800 then hud_inc = 3;
          else if 75800 < hhincome <= 140760 then hud_inc = 4;
          else if 140760 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 37850 then hud_inc = 1;
          else if 37850 < hhincome <= 63000 then hud_inc = 2;
          else if 63000 < hhincome <= 81400 then hud_inc = 3;
          else if 81400 < hhincome <= 151200 then hud_inc = 4;
          else if 151200 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 40450 then hud_inc = 1;
          else if 40450 < hhincome <= 67350 then hud_inc = 2;
          else if 67350 < hhincome <= 87000 then hud_inc = 3;
          else if 87000 < hhincome <= 161640 then hud_inc = 4;
          else if 161640 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 43050 then hud_inc = 1;
          else if 43050 < hhincome <= 71700 then hud_inc = 2;
          else if 71700 < hhincome <= 92600 then hud_inc = 3;
          else if 92600 < hhincome <= 172080 then hud_inc = 4;
          else if 172080 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2016;

/** End Macro Definition **/


