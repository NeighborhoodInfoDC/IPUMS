/**************************************************************************
 Program:  Hud_inc_2015.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P Tatian
 Created:  8/2/2017
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

/** Macro Hud_inc_2015 - Start Definition **/

%macro Hud_inc_2015( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2015) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 22950 then hud_inc = 1;
          else if 22950 < (&hhinc.) <= 38250 then hud_inc = 2;
          else if 38250 < (&hhinc.) <= 47600 then hud_inc = 3;
          else if 47600 < (&hhinc.) <= 91800 then hud_inc = 4;
          else if 91800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 26200 then hud_inc = 1;
          else if 26200 < (&hhinc.) <= 43700 then hud_inc = 2;
          else if 43700 < (&hhinc.) <= 54400 then hud_inc = 3;
          else if 54400 < (&hhinc.) <= 104880 then hud_inc = 4;
          else if 104880 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 29500 then hud_inc = 1;
          else if 29500 < (&hhinc.) <= 49150 then hud_inc = 2;
          else if 49150 < (&hhinc.) <= 61200 then hud_inc = 3;
          else if 61200 < (&hhinc.) <= 117960 then hud_inc = 4;
          else if 117960 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 32750 then hud_inc = 1;
          else if 32750 < (&hhinc.) <= 54600 then hud_inc = 2;
          else if 54600 < (&hhinc.) <= 68000 then hud_inc = 3;
          else if 68000 < (&hhinc.) <= 131040 then hud_inc = 4;
          else if 131040 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 35400 then hud_inc = 1;
          else if 35400 < (&hhinc.) <= 59000 then hud_inc = 2;
          else if 59000 < (&hhinc.) <= 73450 then hud_inc = 3;
          else if 73450 < (&hhinc.) <= 141600 then hud_inc = 4;
          else if 141600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 38000 then hud_inc = 1;
          else if 38000 < (&hhinc.) <= 63350 then hud_inc = 2;
          else if 63350 < (&hhinc.) <= 78900 then hud_inc = 3;
          else if 78900 < (&hhinc.) <= 152040 then hud_inc = 4;
          else if 152040 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 40650 then hud_inc = 1;
          else if 40650 < (&hhinc.) <= 67750 then hud_inc = 2;
          else if 67750 < (&hhinc.) <= 84350 then hud_inc = 3;
          else if 84350 < (&hhinc.) <= 162600 then hud_inc = 4;
          else if 162600 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 43250 then hud_inc = 1;
          else if 43250 < (&hhinc.) <= 72100 then hud_inc = 2;
          else if 72100 < (&hhinc.) <= 89800 then hud_inc = 3;
          else if 89800 < (&hhinc.) <= 173040 then hud_inc = 4;
          else if 173040 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2015;

/** End Macro Definition **/

