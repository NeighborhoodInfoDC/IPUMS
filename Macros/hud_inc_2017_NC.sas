/**************************************************************************
 Program:  Hud_inc_2017_NC.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  7/5/2019
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

%macro Hud_inc_2017_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
            when ( 1 )
        do;
          if hhincome <= 16550 then hud_inc = 1;
          else if 16550 < hhincome <= 27600 then hud_inc = 2;
          else if 27600 < hhincome <= 44150 then hud_inc = 3;
          else if 44150 < hhincome <= 66240 then hud_inc = 4;
          else if 66240 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 18900 then hud_inc = 1;
          else if 18900 < hhincome <= 31500 then hud_inc = 2;
          else if 31500 < hhincome <= 50450 then hud_inc = 3;
          else if 50450 < hhincome <= 75600 then hud_inc = 4;
          else if 75600 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 21300 then hud_inc = 1;
          else if 21300 < hhincome <= 35450 then hud_inc = 2;
          else if 35450 < hhincome <= 56750 then hud_inc = 3;
          else if 56750 < hhincome <= 85080 then hud_inc = 4;
          else if 85080 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 23650 then hud_inc = 1;
          else if 23650 < hhincome <= 39400 then hud_inc = 2;
          else if 39400 < hhincome <= 63050 then hud_inc = 3;
          else if 63050 < hhincome <= 94560 then hud_inc = 4;
          else if 94560 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 25550 then hud_inc = 1;
          else if 25550 < hhincome <= 42550 then hud_inc = 2;
          else if 42550 < hhincome <= 68100 then hud_inc = 3;
          else if 68100 < hhincome <= 102120 then hud_inc = 4;
          else if 102120 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 27400 then hud_inc = 1;
          else if 27400 < hhincome <= 45700 then hud_inc = 2;
          else if 45700 < hhincome <= 73150 then hud_inc = 3;
          else if 73150 < hhincome <= 109680 then hud_inc = 4;
          else if 109680 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 29300 then hud_inc = 1;
          else if 29300 < hhincome <= 48850 then hud_inc = 2;
          else if 48850 < hhincome <= 78150 then hud_inc = 3;
          else if 78150 < hhincome <= 117240 then hud_inc = 4;
          else if 117240 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 31200 then hud_inc = 1;
          else if 31200 < hhincome <= 52000 then hud_inc = 2;
          else if 52000 < hhincome <= 83200 then hud_inc = 3;
          else if 83200 < hhincome <= 124800 then hud_inc = 4;
          else if 124800 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2017_NC;

/** End Macro Definition **/


