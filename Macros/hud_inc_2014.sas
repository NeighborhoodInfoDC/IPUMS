/**************************************************************************
 Program:  Hud_inc_2014.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Maia Woluchem
 Created:  7/14/2016
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

/** Macro Hud_inc_2014 - Start Definition **/

%macro Hud_inc_2014(  );

  ** HUD income categories (2014) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 22500 then hud_inc = 1;
          else if 22500 < hhincome <= 37450 then hud_inc = 2;
          else if 37450 < hhincome <= 47950 then hud_inc = 3;
          else if 47950 < hhincome <= 90000 then hud_inc = 4;
          else if 90000 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 25700 then hud_inc = 1;
          else if 25700 < hhincome <= 42800 then hud_inc = 2;
          else if 42800 < hhincome <= 54800 then hud_inc = 3;
          else if 54800 < hhincome <= 102800 then hud_inc = 4;
          else if 102800 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 28900 then hud_inc = 1;
          else if 28900 < hhincome <= 48150 then hud_inc = 2;
          else if 48150 < hhincome <= 61650 then hud_inc = 3;
          else if 61650 < hhincome <= 115600 then hud_inc = 4;
          else if 115600 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 32100 then hud_inc = 1;
          else if 32100 < hhincome <= 53500 then hud_inc = 2;
          else if 53500 < hhincome <= 68500 then hud_inc = 3;
          else if 68500 < hhincome <= 128400 then hud_inc = 4;
          else if 128400 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 34700 then hud_inc = 1;
          else if 34700 < hhincome <= 57800 then hud_inc = 2;
          else if 57800 < hhincome <= 74000 then hud_inc = 3;
          else if 74000 < hhincome <= 138800 then hud_inc = 4;
          else if 138800 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 37250 then hud_inc = 1;
          else if 37250 < hhincome <= 62100 then hud_inc = 2;
          else if 62100 < hhincome <= 79500 then hud_inc = 3;
          else if 79500 < hhincome <= 149000 then hud_inc = 4;
          else if 149000 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 39850 then hud_inc = 1;
          else if 39850 < hhincome <= 66350 then hud_inc = 2;
          else if 66350 < hhincome <= 84950 then hud_inc = 3;
          else if 84950 < hhincome <= 159400 then hud_inc = 4;
          else if 159400 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 42400 then hud_inc = 1;
          else if 42400 < hhincome <= 70650 then hud_inc = 2;
          else if 70650 < hhincome <= 90450 then hud_inc = 3;
          else if 90450 < hhincome <= 169600 then hud_inc = 4;
          else if 169600 < hhincome then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2014;

/** End Macro Definition **/


