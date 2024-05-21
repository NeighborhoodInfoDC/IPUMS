/**************************************************************************
 Program:  Hud_inc_2021.sas
 Library:  IPUMS
 Project:  Urban Greater DC
 Author:   Alexa Kort
 Created:  5/17/24
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

%macro Hud_inc_2021( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

         select ( numprec );												
      when ( 1 )												
        do;												
          if hhincome <= 27100 then hud_inc = 1;												
          else if 27100 < hhincome <= 45150 then hud_inc = 2;												
          else if 45150 < hhincome <= 57650 then hud_inc = 3;												
          else if 57650 < hhincome <= 108360 then hud_inc = 4;												
          else if 108360 < hhincome then hud_inc = 5;												
        end;												
      when ( 2 )												
        do;												
          if hhincome <= 31000 then hud_inc = 1;												
          else if 31000 < hhincome <= 51600 then hud_inc = 2;												
          else if 51600 < hhincome <= 65850 then hud_inc = 3;												
          else if 65850 < hhincome <= 123840 then hud_inc = 4;												
          else if 123840 < hhincome then hud_inc = 5;												
        end;												
      when ( 3 )												
        do;												
          if hhincome <= 34850 then hud_inc = 1;												
          else if 34850 < hhincome <= 58050 then hud_inc = 2;												
          else if 58050 < hhincome <= 74100 then hud_inc = 3;												
          else if 74100 < hhincome <= 139320 then hud_inc = 4;												
          else if 139320 < hhincome then hud_inc = 5;												
        end;												
      when ( 4 )												
        do;												
          if hhincome <= 38700 then hud_inc = 1;												
          else if 38700 < hhincome <= 64500 then hud_inc = 2;												
          else if 64500 < hhincome <= 82300 then hud_inc = 3;												
          else if 82300 < hhincome <= 154800 then hud_inc = 4;												
          else if 154800 < hhincome then hud_inc = 5;												
        end;												
      when ( 5 )												
        do;												
          if hhincome <= 41800 then hud_inc = 1;												
          else if 41800 < hhincome <= 69700 then hud_inc = 2;												
          else if 69700 < hhincome <= 88900 then hud_inc = 3;												
          else if 88900 < hhincome <= 167280 then hud_inc = 4;												
          else if 167280 < hhincome then hud_inc = 5;												
        end;												
      when ( 6 )												
        do;												
          if hhincome <= 44900 then hud_inc = 1;												
          else if 44900 < hhincome <= 74850 then hud_inc = 2;												
          else if 74850 < hhincome <= 95500 then hud_inc = 3;												
          else if 95500 < hhincome <= 179640 then hud_inc = 4;												
          else if 179640 < hhincome then hud_inc = 5;												
        end;												
      when ( 7 )												
        do;												
          if hhincome <= 48000 then hud_inc = 1;												
          else if 48000 < hhincome <= 80000 then hud_inc = 2;												
          else if 80000 < hhincome <= 102100 then hud_inc = 3;												
          else if 102100 < hhincome <= 192000 then hud_inc = 4;												
          else if 192000 < hhincome then hud_inc = 5;												
        end;												
      otherwise												
        do;												
          if hhincome <= 51100 then hud_inc = 1;												
          else if 51100 < hhincome <= 85150 then hud_inc = 2;												
          else if 85150 < hhincome <= 108650 then hud_inc = 3;												
          else if 108650 < hhincome <= 204360 then hud_inc = 4;												
          else if 204360 < hhincome then hud_inc = 5;												
        end;												
    end;												

    end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2021;

/** End Macro Definition **/


