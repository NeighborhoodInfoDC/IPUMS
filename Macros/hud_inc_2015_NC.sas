/**************************************************************************
 Program:  Hud_inc_2015_NC.sas
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

/** Macro Hud_inc_2015 - Start Definition **/

%macro Hud_inc_2015_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2015) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
            when ( 1 )
        do;
          if hhincome <= 12150 then hud_inc = 1;
          else if 12150 < hhincome <= 20250 then hud_inc = 2;
          else if 20250 < hhincome <= 32400 then hud_inc = 3;
          else if 32400 < hhincome <= 48600 then hud_inc = 4;
          else if 48600 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 13900 then hud_inc = 1;
          else if 13900 < hhincome <= 23150 then hud_inc = 2;
          else if 23150 < hhincome <= 37050 then hud_inc = 3;
          else if 37050 < hhincome <= 55560 then hud_inc = 4;
          else if 55560 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 15650 then hud_inc = 1;
          else if 15650 < hhincome <= 26050 then hud_inc = 2;
          else if 26050 < hhincome <= 41700 then hud_inc = 3;
          else if 41700 < hhincome <= 62520 then hud_inc = 4;
          else if 62520 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 17350 then hud_inc = 1;
          else if 17350 < hhincome <= 28950 then hud_inc = 2;
          else if 28950 < hhincome <= 46300 then hud_inc = 3;
          else if 46300 < hhincome <= 69480 then hud_inc = 4;
          else if 69480 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 18750 then hud_inc = 1;
          else if 18750 < hhincome <= 31250 then hud_inc = 2;
          else if 31250 < hhincome <= 50050 then hud_inc = 3;
          else if 50050 < hhincome <= 75000 then hud_inc = 4;
          else if 75000 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 20150 then hud_inc = 1;
          else if 20150 < hhincome <= 33600 then hud_inc = 2;
          else if 33600 < hhincome <= 53750 then hud_inc = 3;
          else if 53750 < hhincome <= 80640 then hud_inc = 4;
          else if 80640 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 21550 then hud_inc = 1;
          else if 21550 < hhincome <= 35900 then hud_inc = 2;
          else if 35900 < hhincome <= 57450 then hud_inc = 3;
          else if 57450 < hhincome <= 86160 then hud_inc = 4;
          else if 86160 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 22950 then hud_inc = 1;
          else if 22950 < hhincome <= 38200 then hud_inc = 2;
          else if 38200 < hhincome <= 61150 then hud_inc = 3;
          else if 61150 < hhincome <= 91680 then hud_inc = 4;
          else if 91680 < hhincome then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2015_NC;

/** End Macro Definition **/

