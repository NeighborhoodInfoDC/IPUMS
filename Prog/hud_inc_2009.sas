/**************************************************************************
 Program:  Hud_inc_2009.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/09/11
 Version:  SAS 9.1
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

 NB: This program must be copied to the Alpha dir. [dcdata.ipums.prog].

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2008 - Start Definition **/

%macro Hud_inc_2009(  );

  ** HUD income categories (2009) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 21550 then hud_inc = 1;
          else if 21550 < hhincome <= 35950 then hud_inc = 2;
          else if 35950 < hhincome <= 44800 then hud_inc = 3;
          else if 44800 < hhincome <= 86200 then hud_inc = 4;
          else if 86200 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 24650 then hud_inc = 1;
          else if 24650 < hhincome <= 41100 then hud_inc = 2;
          else if 41100 < hhincome <= 51200 then hud_inc = 3;
          else if 51200 < hhincome <= 98600 then hud_inc = 4;
          else if 98600 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 27700 then hud_inc = 1;
          else if 27700 < hhincome <= 46200 then hud_inc = 2;
          else if 46200 < hhincome <= 57600 then hud_inc = 3;
          else if 57600 < hhincome <= 110800 then hud_inc = 4;
          else if 110800 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 30800 then hud_inc = 1;
          else if 30800 < hhincome <= 51350 then hud_inc = 2;
          else if 51350 < hhincome <= 64000 then hud_inc = 3;
          else if 64000 < hhincome <= 123200 then hud_inc = 4;
          else if 123200 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 33250 then hud_inc = 1;
          else if 33250 < hhincome <= 55450 then hud_inc = 2;
          else if 55450 < hhincome <= 69100 then hud_inc = 3;
          else if 69100 < hhincome <= 133000 then hud_inc = 4;
          else if 133000 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 35750 then hud_inc = 1;
          else if 35750 < hhincome <= 59550 then hud_inc = 2;
          else if 59550 < hhincome <= 74250 then hud_inc = 3;
          else if 74250 < hhincome <= 143000 then hud_inc = 4;
          else if 143000 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 38200 then hud_inc = 1;
          else if 38200 < hhincome <= 63650 then hud_inc = 2;
          else if 63650 < hhincome <= 79350 then hud_inc = 3;
          else if 79350 < hhincome <= 152800 then hud_inc = 4;
          else if 152800 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 40650 then hud_inc = 1;
          else if 40650 < hhincome <= 67800 then hud_inc = 2;
          else if 67800 < hhincome <= 84500 then hud_inc = 3;
          else if 84500 < hhincome <= 162600 then hud_inc = 4;
          else if 162600 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2009;

/** End Macro Definition **/


