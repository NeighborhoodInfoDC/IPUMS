/**************************************************************************
 Program:  Hud_inc_2016_NC.sas
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

/** Macro Hud_inc_2016 - Start Definition **/

%macro Hud_inc_2016_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
            when ( 1 )
        do;
          if hhincome <= 12100 then hud_inc = 1;
          else if 12100 < hhincome <= 20150 then hud_inc = 2;
          else if 20150 < hhincome <= 32250 then hud_inc = 3;
          else if 32250 < hhincome <= 48360 then hud_inc = 4;
          else if 48360 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 13800 then hud_inc = 1;
          else if 13800 < hhincome <= 23050 then hud_inc = 2;
          else if 23050 < hhincome <= 36850 then hud_inc = 3;
          else if 36850 < hhincome <= 55320 then hud_inc = 4;
          else if 55320 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 15550 then hud_inc = 1;
          else if 15550 < hhincome <= 25900 then hud_inc = 2;
          else if 25900 < hhincome <= 41450 then hud_inc = 3;
          else if 41450 < hhincome <= 62160 then hud_inc = 4;
          else if 62160 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 17300 then hud_inc = 1;
          else if 17300 < hhincome <= 28800 then hud_inc = 2;
          else if 28800 < hhincome <= 46100 then hud_inc = 3;
          else if 46100 < hhincome <= 69120 then hud_inc = 4;
          else if 69120 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 18650 then hud_inc = 1;
          else if 18650 < hhincome <= 31100 then hud_inc = 2;
          else if 31100 < hhincome <= 49750 then hud_inc = 3;
          else if 49750 < hhincome <= 74640 then hud_inc = 4;
          else if 74640 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 20050 then hud_inc = 1;
          else if 20050 < hhincome <= 33400 then hud_inc = 2;
          else if 33400 < hhincome <= 53450 then hud_inc = 3;
          else if 53450 < hhincome <= 80160 then hud_inc = 4;
          else if 80160 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 21450 then hud_inc = 1;
          else if 21450 < hhincome <= 35700 then hud_inc = 2;
          else if 35700 < hhincome <= 57150 then hud_inc = 3;
          else if 57150 < hhincome <= 85680 then hud_inc = 4;
          else if 85680 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 22800 then hud_inc = 1;
          else if 22800 < hhincome <= 38000 then hud_inc = 2;
          else if 38000 < hhincome <= 60850 then hud_inc = 3;
          else if 60850 < hhincome <= 91200 then hud_inc = 4;
          else if 91200 < hhincome then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2016_NC;

/** End Macro Definition **/


