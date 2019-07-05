/**************************************************************************
 Program:  Hud_inc_2014_NC.sas
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

/** Macro Hud_inc_2014 - Start Definition **/

%macro Hud_inc_2014_NC( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2014) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
            when ( 1 )
        do;
          if hhincome <= 11800 then hud_inc = 1;
          else if 11800 < hhincome <= 19700 then hud_inc = 2;
          else if 19700 < hhincome <= 31550 then hud_inc = 3;
          else if 31550 < hhincome <= 47200 then hud_inc = 4;
          else if 47200 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 13500 then hud_inc = 1;
          else if 13500 < hhincome <= 22500 then hud_inc = 2;
          else if 22500 < hhincome <= 36050 then hud_inc = 3;
          else if 36050 < hhincome <= 54000 then hud_inc = 4;
          else if 54000 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 15200 then hud_inc = 1;
          else if 15200 < hhincome <= 25350 then hud_inc = 2;
          else if 25350 < hhincome <= 40550 then hud_inc = 3;
          else if 40550 < hhincome <= 60800 then hud_inc = 4;
          else if 60800 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 16900 then hud_inc = 1;
          else if 16900 < hhincome <= 28150 then hud_inc = 2;
          else if 28150 < hhincome <= 45050 then hud_inc = 3;
          else if 45050 < hhincome <= 67600 then hud_inc = 4;
          else if 67600 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 18250 then hud_inc = 1;
          else if 18250 < hhincome <= 30400 then hud_inc = 2;
          else if 30400 < hhincome <= 48650 then hud_inc = 3;
          else if 48650 < hhincome <= 73000 then hud_inc = 4;
          else if 73000 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 19600 then hud_inc = 1;
          else if 19600 < hhincome <= 32650 then hud_inc = 2;
          else if 32650 < hhincome <= 52250 then hud_inc = 3;
          else if 52250 < hhincome <= 78400 then hud_inc = 4;
          else if 78400 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 20950 then hud_inc = 1;
          else if 20950 < hhincome <= 34900 then hud_inc = 2;
          else if 34900 < hhincome <= 55850 then hud_inc = 3;
          else if 55850 < hhincome <= 83800 then hud_inc = 4;
          else if 83800 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 22300 then hud_inc = 1;
          else if 22300 < hhincome <= 37150 then hud_inc = 2;
          else if 37150 < hhincome <= 59450 then hud_inc = 3;
          else if 59450 < hhincome <= 89200 then hud_inc = 4;
          else if 89200 < hhincome then hud_inc = 5;
        end;
    end;



  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2014_NC;

/** End Macro Definition **/


