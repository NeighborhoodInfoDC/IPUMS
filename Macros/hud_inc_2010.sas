/**************************************************************************
 Program:  Hud_inc_2010.sas
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

/** Macro Hud_inc_2010 - Start Definition **/

%macro Hud_inc_2010(  );

  ** HUD income categories (2010) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

	select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 21750 then hud_inc = 1;
          else if 21750 < hhincome <= 36250 then hud_inc = 2;
          else if 36250 < hhincome <= 45100 then hud_inc = 3;
          else if 45100 < hhincome <= 87000 then hud_inc = 4;
          else if 87000 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 24850 then hud_inc = 1;
          else if 24850 < hhincome <= 41400 then hud_inc = 2;
          else if 41400 < hhincome <= 51550 then hud_inc = 3;
          else if 51550 < hhincome <= 99400 then hud_inc = 4;
          else if 99400 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 27950 then hud_inc = 1;
          else if 27950 < hhincome <= 46600 then hud_inc = 2;
          else if 46600 < hhincome <= 58000 then hud_inc = 3;
          else if 58000 < hhincome <= 111800 then hud_inc = 4;
          else if 111800 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 31050 then hud_inc = 1;
          else if 31050 < hhincome <= 51750 then hud_inc = 2;
          else if 51750 < hhincome <= 64400 then hud_inc = 3;
          else if 64400 < hhincome <= 124200 then hud_inc = 4;
          else if 124200 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 33550 then hud_inc = 1;
          else if 33550 < hhincome <= 55900 then hud_inc = 2;
          else if 55900 < hhincome <= 69600 then hud_inc = 3;
          else if 69600 < hhincome <= 134200 then hud_inc = 4;
          else if 134200 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 36050 then hud_inc = 1;
          else if 36050 < hhincome <= 60050 then hud_inc = 2;
          else if 60050 < hhincome <= 74750 then hud_inc = 3;
          else if 74750 < hhincome <= 144200 then hud_inc = 4;
          else if 144200 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 38550 then hud_inc = 1;
          else if 38550 < hhincome <= 64200 then hud_inc = 2;
          else if 64200 < hhincome <= 79900 then hud_inc = 3;
          else if 79900 < hhincome <= 154200 then hud_inc = 4;
          else if 154200 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 41000 then hud_inc = 1;
          else if 41000 < hhincome <= 68350 then hud_inc = 2;
          else if 68350 < hhincome <= 85050 then hud_inc = 3;
          else if 85050 < hhincome <= 164000 then hud_inc = 4;
          else if 164000 < hhincome then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2010;

/** End Macro Definition **/


