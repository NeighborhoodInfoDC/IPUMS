/**************************************************************************
 Program:  Hud_inc_2012_NC.sas
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

/** Macro Hud_inc_2012 - Start Definition **/

%macro Hud_inc_2012_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2012) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
            when ( 1 )
        do;
          if hhincome <= 12150 then hud_inc = 1;
          else if 12150 < hhincome <= 20250 then hud_inc = 2;
          else if 20250 < hhincome <= 32350 then hud_inc = 3;
          else if 32350 < hhincome <= 48600 then hud_inc = 4;
          else if 48600 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 13850 then hud_inc = 1;
          else if 13850 < hhincome <= 23100 then hud_inc = 2;
          else if 23100 < hhincome <= 37000 then hud_inc = 3;
          else if 37000 < hhincome <= 55400 then hud_inc = 4;
          else if 55400 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 15600 then hud_inc = 1;
          else if 15600 < hhincome <= 26000 then hud_inc = 2;
          else if 26000 < hhincome <= 41600 then hud_inc = 3;
          else if 41600 < hhincome <= 62400 then hud_inc = 4;
          else if 62400 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 17350 then hud_inc = 1;
          else if 17350 < hhincome <= 28900 then hud_inc = 2;
          else if 28900 < hhincome <= 46250 then hud_inc = 3;
          else if 46250 < hhincome <= 69400 then hud_inc = 4;
          else if 69400 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 18750 then hud_inc = 1;
          else if 18750 < hhincome <= 31200 then hud_inc = 2;
          else if 31200 < hhincome <= 49950 then hud_inc = 3;
          else if 49950 < hhincome <= 75000 then hud_inc = 4;
          else if 75000 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 20100 then hud_inc = 1;
          else if 20100 < hhincome <= 33500 then hud_inc = 2;
          else if 33500 < hhincome <= 53650 then hud_inc = 3;
          else if 53650 < hhincome <= 80400 then hud_inc = 4;
          else if 80400 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 21500 then hud_inc = 1;
          else if 21500 < hhincome <= 35850 then hud_inc = 2;
          else if 35850 < hhincome <= 57350 then hud_inc = 3;
          else if 57350 < hhincome <= 86000 then hud_inc = 4;
          else if 86000 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 22900 then hud_inc = 1;
          else if 22900 < hhincome <= 38150 then hud_inc = 2;
          else if 38150 < hhincome <= 61050 then hud_inc = 3;
          else if 61050 < hhincome <= 91600 then hud_inc = 4;
          else if 91600 < hhincome then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2012_NC;

/** End Macro Definition **/


