/**************************************************************************
 Program:  Hud_inc_2023.sas
 Library:  IPUMS
 Project:  Urban-Greater DC
 Author:   Nina Veronica Russell
 Created:  4/22/2025
 Version:  SAS 9.4
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

%macro Hud_inc_2023( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;
    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 31650 then hud_inc = 1;
          else if 31650 < hhincome <= 52750 then hud_inc = 2;
          else if 52750 < hhincome <= 66750 then hud_inc = 3;
          else if 66750 < hhincome <= 126600 then hud_inc = 4;
          else if 126600 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 36200 then hud_inc = 1;
          else if 36200 < hhincome <= 60300 then hud_inc = 2;
          else if 60300 < hhincome <= 76250 then hud_inc = 3;
          else if 76250 < hhincome <= 144720 then hud_inc = 4;
          else if 144720 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 40700 then hud_inc = 1;
          else if 40700 < hhincome <= 67850 then hud_inc = 2;
          else if 67850 < hhincome <= 85800 then hud_inc = 3;
          else if 85800 < hhincome <= 162840 then hud_inc = 4;
          else if 162840 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 45200 then hud_inc = 1;
          else if 45200 < hhincome <= 75350 then hud_inc = 2;
          else if 75350 < hhincome <= 95300 then hud_inc = 3;
          else if 95300 < hhincome <= 180840 then hud_inc = 4;
          else if 180840 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 48850 then hud_inc = 1;
          else if 48850 < hhincome <= 81400 then hud_inc = 2;
          else if 81400 < hhincome <= 102950 then hud_inc = 3;
          else if 102950 < hhincome <= 195360 then hud_inc = 4;
          else if 195360 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 52450 then hud_inc = 1;
          else if 52450 < hhincome <= 87450 then hud_inc = 2;
          else if 87450 < hhincome <= 110550 then hud_inc = 3;
          else if 110550 < hhincome <= 209880 then hud_inc = 4;
          else if 209880 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 56050 then hud_inc = 1;
          else if 56050 < hhincome <= 93450 then hud_inc = 2;
          else if 93450 < hhincome <= 118200 then hud_inc = 3;
          else if 118200 < hhincome <= 224280 then hud_inc = 4;
          else if 224280 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 59700 then hud_inc = 1;
          else if 59700 < hhincome <= 99500 then hud_inc = 2;
          else if 99500 < hhincome <= 125800 then hud_inc = 3;
          else if 125800 < hhincome <= 238800 then hud_inc = 4;
          else if 238800 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2023;

/** End Macro Definition **/


