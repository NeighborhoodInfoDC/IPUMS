/**************************************************************************
 Program:  Hud_inc_2013_NC.sas
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

/** Macro Hud_inc_2013 - Start Definition **/

%macro Hud_inc_2013_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2013) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

        select ( &hhsize. );	
           when ( 1 )
        do;
          if hhincome <= 11800 then hud_inc = 1;
          else if 11800 < hhincome <= 19650 then hud_inc = 2;
          else if 19650 < hhincome <= 31450 then hud_inc = 3;
          else if 31450 < hhincome <= 47200 then hud_inc = 4;
          else if 47200 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 13500 then hud_inc = 1;
          else if 13500 < hhincome <= 22500 then hud_inc = 2;
          else if 22500 < hhincome <= 35950 then hud_inc = 3;
          else if 35950 < hhincome <= 54000 then hud_inc = 4;
          else if 54000 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 15150 then hud_inc = 1;
          else if 15150 < hhincome <= 25300 then hud_inc = 2;
          else if 25300 < hhincome <= 40450 then hud_inc = 3;
          else if 40450 < hhincome <= 60600 then hud_inc = 4;
          else if 60600 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 16850 then hud_inc = 1;
          else if 16850 < hhincome <= 28100 then hud_inc = 2;
          else if 28100 < hhincome <= 44950 then hud_inc = 3;
          else if 44950 < hhincome <= 67400 then hud_inc = 4;
          else if 67400 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 18200 then hud_inc = 1;
          else if 18200 < hhincome <= 30350 then hud_inc = 2;
          else if 30350 < hhincome <= 48550 then hud_inc = 3;
          else if 48550 < hhincome <= 72800 then hud_inc = 4;
          else if 72800 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 19550 then hud_inc = 1;
          else if 19550 < hhincome <= 32600 then hud_inc = 2;
          else if 32600 < hhincome <= 52150 then hud_inc = 3;
          else if 52150 < hhincome <= 78200 then hud_inc = 4;
          else if 78200 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 20900 then hud_inc = 1;
          else if 20900 < hhincome <= 34850 then hud_inc = 2;
          else if 34850 < hhincome <= 55750 then hud_inc = 3;
          else if 55750 < hhincome <= 83600 then hud_inc = 4;
          else if 83600 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 22250 then hud_inc = 1;
          else if 22250 < hhincome <= 37100 then hud_inc = 2;
          else if 37100 < hhincome <= 59350 then hud_inc = 3;
          else if 59350 < hhincome <= 89000 then hud_inc = 4;
          else if 89000 < hhincome then hud_inc = 5;
        end;
    end;
	

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2013_NC;

/** End Macro Definition **/


