/**************************************************************************
 Program:  Hud_inc_2011.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Graham MacDonald
 Created:  4/10/2013
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

/** Macro Hud_inc_2011 - Start Definition **/

%macro Hud_inc_2011(  );

  ** HUD income categories (2011) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

	select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 22300 then hud_inc = 1;
          else if 22300 < hhincome <= 37150 then hud_inc = 2;
          else if 37150 < hhincome <= 47350 then hud_inc = 3;
          else if 47350 < hhincome <= 89200 then hud_inc = 4;
          else if 89200 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 25500 then hud_inc = 1;
          else if 25500 < hhincome <= 42450 then hud_inc = 2;
          else if 42450 < hhincome <= 54100 then hud_inc = 3;
          else if 54100 < hhincome <= 102000 then hud_inc = 4;
          else if 102000 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 28700 then hud_inc = 1;
          else if 28700 < hhincome <= 47750 then hud_inc = 2;
          else if 47750 < hhincome <= 60850 then hud_inc = 3;
          else if 60850 < hhincome <= 114800 then hud_inc = 4;
          else if 114800 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 31850 then hud_inc = 1;
          else if 31850 < hhincome <= 53050 then hud_inc = 2;
          else if 53050 < hhincome <= 67600 then hud_inc = 3;
          else if 67600 < hhincome <= 127400 then hud_inc = 4;
          else if 127400 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 34400 then hud_inc = 1;
          else if 34400 < hhincome <= 57300 then hud_inc = 2;
          else if 57300 < hhincome <= 73050 then hud_inc = 3;
          else if 73050 < hhincome <= 137600 then hud_inc = 4;
          else if 137600 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 36950 then hud_inc = 1;
          else if 36950 < hhincome <= 61550 then hud_inc = 2;
          else if 61550 < hhincome <= 78450 then hud_inc = 3;
          else if 78450 < hhincome <= 147800 then hud_inc = 4;
          else if 147800 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 39500 then hud_inc = 1;
          else if 39500 < hhincome <= 65800 then hud_inc = 2;
          else if 65800 < hhincome <= 83850 then hud_inc = 3;
          else if 83850 < hhincome <= 158000 then hud_inc = 4;
          else if 158000 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 42050 then hud_inc = 1;
          else if 42050 < hhincome <= 70050 then hud_inc = 2;
          else if 70050 < hhincome <= 89250 then hud_inc = 3;
          else if 89250 < hhincome <= 168200 then hud_inc = 4;
          else if 168200 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2011;

/** End Macro Definition **/


