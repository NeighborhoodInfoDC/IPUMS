/**************************************************************************
 Program:  Hud_inc_2020.sas
 Library:  IPUMS
 Project:  Urban Greater DC
 Author:  	Alexa Kort
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

%macro Hud_inc_2020( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

       select ( numprec );												
      when ( 1 )												
        do;												
          if hhincome <= 26500 then hud_inc = 1;												
          else if 26500 < hhincome <= 44100 then hud_inc = 2;												
          else if 44100 < hhincome <= 55750 then hud_inc = 3;												
          else if 55750 < hhincome <= 105840 then hud_inc = 4;												
          else if 105840 < hhincome then hud_inc = 5;												
        end;												
      when ( 2 )												
        do;												
          if hhincome <= 30250 then hud_inc = 1;												
          else if 30250 < hhincome <= 50400 then hud_inc = 2;												
          else if 50400 < hhincome <= 63700 then hud_inc = 3;												
          else if 63700 < hhincome <= 120960 then hud_inc = 4;												
          else if 120960 < hhincome then hud_inc = 5;												
        end;												
      when ( 3 )												
        do;												
          if hhincome <= 34050 then hud_inc = 1;												
          else if 34050 < hhincome <= 56700 then hud_inc = 2;												
          else if 56700 < hhincome <= 71650 then hud_inc = 3;												
          else if 71650 < hhincome <= 136080 then hud_inc = 4;												
          else if 136080 < hhincome then hud_inc = 5;												
        end;												
      when ( 4 )												
        do;												
          if hhincome <= 37800 then hud_inc = 1;												
          else if 37800 < hhincome <= 63000 then hud_inc = 2;												
          else if 63000 < hhincome <= 79600 then hud_inc = 3;												
          else if 79600 < hhincome <= 151200 then hud_inc = 4;												
          else if 151200 < hhincome then hud_inc = 5;												
        end;												
      when ( 5 )												
        do;												
          if hhincome <= 40850 then hud_inc = 1;												
          else if 40850 < hhincome <= 68050 then hud_inc = 2;												
          else if 68050 < hhincome <= 86000 then hud_inc = 3;												
          else if 86000 < hhincome <= 163320 then hud_inc = 4;												
          else if 163320 < hhincome then hud_inc = 5;												
        end;												
      when ( 6 )												
        do;												
          if hhincome <= 43850 then hud_inc = 1;												
          else if 43850 < hhincome <= 73100 then hud_inc = 2;												
          else if 73100 < hhincome <= 92350 then hud_inc = 3;												
          else if 92350 < hhincome <= 175440 then hud_inc = 4;												
          else if 175440 < hhincome then hud_inc = 5;												
        end;												
      when ( 7 )												
        do;												
          if hhincome <= 46900 then hud_inc = 1;												
          else if 46900 < hhincome <= 78150 then hud_inc = 2;												
          else if 78150 < hhincome <= 98750 then hud_inc = 3;												
          else if 98750 < hhincome <= 187560 then hud_inc = 4;												
          else if 187560 < hhincome then hud_inc = 5;												
        end;												
      otherwise												
        do;												
          if hhincome <= 49900 then hud_inc = 1;												
          else if 49900 < hhincome <= 83200 then hud_inc = 2;												
          else if 83200 < hhincome <= 105100 then hud_inc = 3;												
          else if 105100 < hhincome <= 199680 then hud_inc = 4;												
          else if 199680 < hhincome then hud_inc = 5;												
        end;												
    end;												

    end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2020;

/** End Macro Definition **/


