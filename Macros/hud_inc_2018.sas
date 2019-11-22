/**************************************************************************
 Program:  Hud_inc_2018.sas
 Library:  IPUMS
 Project:  Urban Greater DC
 Author:   Rob Pitingolo
 Created:  11/6/2019
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

%macro Hud_inc_2018( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 24650 then hud_inc = 1;
          else if 24650 < (&hhinc.) <= 41050 then hud_inc = 2;
          else if 41050 < (&hhinc.) <= 54250 then hud_inc = 3;
          else if 54250 < (&hhinc.) <= 97650 then hud_inc = 4;
          else if 97650 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 28150 then hud_inc = 1;
          else if 28150 < (&hhinc.) <= 46900 then hud_inc = 2;
          else if 46900 < (&hhinc.) <= 62000 then hud_inc = 3;
          else if 62000 < (&hhinc.) <= 111600 then hud_inc = 4;
          else if 111600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 31650 then hud_inc = 1;
          else if 31650 < (&hhinc.) <= 52750 then hud_inc = 2;
          else if 52750 < (&hhinc.) <= 69750 then hud_inc = 3;
          else if 69750 < (&hhinc.) <= 125550 then hud_inc = 4;
          else if 125550 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 35150 then hud_inc = 1;
          else if 35150 < (&hhinc.) <= 58600 then hud_inc = 2;
          else if 58600 < (&hhinc.) <= 77450 then hud_inc = 3;
          else if 77450 < (&hhinc.) <= 140640 then hud_inc = 4;
          else if 140640 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 38000 then hud_inc = 1;
          else if 38000 < (&hhinc.) <= 63300 then hud_inc = 2;
          else if 63300 < (&hhinc.) <= 83650 then hud_inc = 3;
          else if 83650 < (&hhinc.) <= 150570 then hud_inc = 4;
          else if 150570 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 40800 then hud_inc = 1;
          else if 40800 < (&hhinc.) <= 68000 then hud_inc = 2;
          else if 68000 < (&hhinc.) <= 89850 then hud_inc = 3;
          else if 89850 < (&hhinc.) <= 161730 then hud_inc = 4;
          else if 161730 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 43600 then hud_inc = 1;
          else if 43600 < (&hhinc.) <= 72700 then hud_inc = 2;
          else if 72700 < (&hhinc.) <= 96050 then hud_inc = 3;
          else if 96050 < (&hhinc.) <= 172890 then hud_inc = 4;
          else if 172890 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 46400 then hud_inc = 1;
          else if 46400 < (&hhinc.) <= 77400 then hud_inc = 2;
          else if 77400 < (&hhinc.) <= 102250 then hud_inc = 3;
          else if 102250 < (&hhinc.) <= 184050 then hud_inc = 4;
          else if 184050 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2018;

/** End Macro Definition **/


