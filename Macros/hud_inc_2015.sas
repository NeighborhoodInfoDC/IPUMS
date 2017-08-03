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

%macro Hud_inc_2015(  );

  ** HUD income categories (2015) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 22950 then hud_inc = 1;
          else if 22950 < hhincome <= 38250 then hud_inc = 2;
          else if 38250 < hhincome <= 47600 then hud_inc = 3;
          else if 47600 < hhincome <= 91800 then hud_inc = 4;
          else if 91800 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 26200 then hud_inc = 1;
          else if 26200 < hhincome <= 43700 then hud_inc = 2;
          else if 43700 < hhincome <= 54400 then hud_inc = 3;
          else if 54400 < hhincome <= 104880 then hud_inc = 4;
          else if 104880 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 29500 then hud_inc = 1;
          else if 29500 < hhincome <= 49150 then hud_inc = 2;
          else if 49150 < hhincome <= 61200 then hud_inc = 3;
          else if 61200 < hhincome <= 117960 then hud_inc = 4;
          else if 117960 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 32750 then hud_inc = 1;
          else if 32750 < hhincome <= 54600 then hud_inc = 2;
          else if 54600 < hhincome <= 68000 then hud_inc = 3;
          else if 68000 < hhincome <= 131040 then hud_inc = 4;
          else if 131040 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 35400 then hud_inc = 1;
          else if 35400 < hhincome <= 59000 then hud_inc = 2;
          else if 59000 < hhincome <= 73450 then hud_inc = 3;
          else if 73450 < hhincome <= 141600 then hud_inc = 4;
          else if 141600 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 38000 then hud_inc = 1;
          else if 38000 < hhincome <= 63350 then hud_inc = 2;
          else if 63350 < hhincome <= 78900 then hud_inc = 3;
          else if 78900 < hhincome <= 152040 then hud_inc = 4;
          else if 152040 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 40650 then hud_inc = 1;
          else if 40650 < hhincome <= 67750 then hud_inc = 2;
          else if 67750 < hhincome <= 84350 then hud_inc = 3;
          else if 84350 < hhincome <= 162600 then hud_inc = 4;
          else if 162600 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 43250 then hud_inc = 1;
          else if 43250 < hhincome <= 72100 then hud_inc = 2;
          else if 72100 < hhincome <= 89800 then hud_inc = 3;
          else if 89800 < hhincome <= 173040 then hud_inc = 4;
          else if 173040 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2015;

/** End Macro Definition **/

