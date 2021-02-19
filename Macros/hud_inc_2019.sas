/**************************************************************************
 Program:  Hud_inc_2019.sas
 Library:  IPUMS
 Project:  Urban Greater DC
 Author:   Ananya Hariharan
 Created:  2/18/21
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

%macro Hud_inc_2019( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

        select ( &hhsize. );
      when ( 1 )
        do;
          if hhincome <= 25500 then hud_inc = 1;
          else if 25500 < hhincome <= 42500 then hud_inc = 2;
          else if 42500 < hhincome <= 54350 then hud_inc = 3;
          else if 54350 < hhincome <= 102000 then hud_inc = 4;
          else if 102000 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 29150 then hud_inc = 1;
          else if 29150 < hhincome <= 48550 then hud_inc = 2;
          else if 48550 < hhincome <= 62100 then hud_inc = 3;
          else if 62100 < hhincome <= 116520 then hud_inc = 4;
          else if 116520 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 32800 then hud_inc = 1;
          else if 32800 < hhincome <= 54600 then hud_inc = 2;
          else if 54600 < hhincome <= 69850 then hud_inc = 3;
          else if 69850 < hhincome <= 131040 then hud_inc = 4;
          else if 131040 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 36400 then hud_inc = 1;
          else if 36400 < hhincome <= 60650 then hud_inc = 2;
          else if 60650 < hhincome <= 77600 then hud_inc = 3;
          else if 77600 < hhincome <= 145560 then hud_inc = 4;
          else if 145560 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 39350 then hud_inc = 1;
          else if 39350 < hhincome <= 65550 then hud_inc = 2;
          else if 65550 < hhincome <= 83850 then hud_inc = 3;
          else if 83850 < hhincome <= 157320 then hud_inc = 4;
          else if 157320 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 42250 then hud_inc = 1;
          else if 42250 < hhincome <= 70400 then hud_inc = 2;
          else if 70400 < hhincome <= 90050 then hud_inc = 3;
          else if 90050 < hhincome <= 168960 then hud_inc = 4;
          else if 168960 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 45150 then hud_inc = 1;
          else if 45150 < hhincome <= 75250 then hud_inc = 2;
          else if 75250 < hhincome <= 96250 then hud_inc = 3;
          else if 96250 < hhincome <= 180600 then hud_inc = 4;
          else if 180600 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 48050 then hud_inc = 1;
          else if 48050 < hhincome <= 80100 then hud_inc = 2;
          else if 80100 < hhincome <= 102450 then hud_inc = 3;
          else if 102450 < hhincome <= 192240 then hud_inc = 4;
          else if 192240 < hhincome then hud_inc = 5;
        end;
    end;

    end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2019;

/** End Macro Definition **/


