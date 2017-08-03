/**************************************************************************
 Program:  Hud_inc_2012.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Graham MacDonald
 Created:  1/24/2014
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

/** Macro Hud_inc_2012 - Start Definition **/

%macro Hud_inc_2012(  );

  ** HUD income categories (2012) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 22600 then hud_inc = 1;
          else if 22600 < hhincome <= 37650 then hud_inc = 2;
          else if 37650 < hhincome <= 49200 then hud_inc = 3;
          else if 49200 < hhincome <= 90400 then hud_inc = 4;
          else if 90400 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 25800 then hud_inc = 1;
          else if 25800 < hhincome <= 43000 then hud_inc = 2;
          else if 43000 < hhincome <= 56200 then hud_inc = 3;
          else if 56200 < hhincome <= 103200 then hud_inc = 4;
          else if 103200 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 29050 then hud_inc = 1;
          else if 29050 < hhincome <= 48400 then hud_inc = 2;
          else if 48400 < hhincome <= 63250 then hud_inc = 3;
          else if 63250 < hhincome <= 116200 then hud_inc = 4;
          else if 116200 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 32250 then hud_inc = 1;
          else if 32250 < hhincome <= 53750 then hud_inc = 2;
          else if 53750 < hhincome <= 70250 then hud_inc = 3;
          else if 70250 < hhincome <= 129000 then hud_inc = 4;
          else if 129000 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 34850 then hud_inc = 1;
          else if 34850 < hhincome <= 58050 then hud_inc = 2;
          else if 58050 < hhincome <= 75900 then hud_inc = 3;
          else if 75900 < hhincome <= 139400 then hud_inc = 4;
          else if 139400 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 37450 then hud_inc = 1;
          else if 37450 < hhincome <= 62350 then hud_inc = 2;
          else if 62350 < hhincome <= 81500 then hud_inc = 3;
          else if 81500 < hhincome <= 149800 then hud_inc = 4;
          else if 149800 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 40000 then hud_inc = 1;
          else if 40000 < hhincome <= 66650 then hud_inc = 2;
          else if 66650 < hhincome <= 87150 then hud_inc = 3;
          else if 87150 < hhincome <= 160000 then hud_inc = 4;
          else if 160000 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 42600 then hud_inc = 1;
          else if 42600 < hhincome <= 70950 then hud_inc = 2;
          else if 70950 < hhincome <= 92750 then hud_inc = 3;
          else if 92750 < hhincome <= 170400 then hud_inc = 4;
          else if 170400 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2012;

/** End Macro Definition **/


