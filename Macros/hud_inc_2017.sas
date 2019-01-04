/**************************************************************************
 Program:  Hud_inc_<year>.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  1/4/2019
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

/** Macro Hud_inc_<year> - Start Definition **/

%macro Hud_inc_2017(  );

  ** HUD income categories (<year>) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 23200 then hud_inc = 1;
          else if 23200 < hhincome <= 38650 then hud_inc = 2;
          else if 38650 < hhincome <= 52550 then hud_inc = 3;
          else if 52550 < hhincome <= 92760 then hud_inc = 4;
          else if 92760 < hhincome then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 26500 then hud_inc = 1;
          else if 26500 < hhincome <= 44150 then hud_inc = 2;
          else if 44150 < hhincome <= 60050 then hud_inc = 3;
          else if 60050 < hhincome <= 105960 then hud_inc = 4;
          else if 105960 < hhincome then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 29800 then hud_inc = 1;
          else if 29800 < hhincome <= 49650 then hud_inc = 2;
          else if 49650 < hhincome <= 67550 then hud_inc = 3;
          else if 67550 < hhincome <= 119160 then hud_inc = 4;
          else if 119160 < hhincome then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 33100 then hud_inc = 1;
          else if 33100 < hhincome <= 55150 then hud_inc = 2;
          else if 55150 < hhincome <= 75050 then hud_inc = 3;
          else if 75050 < hhincome <= 132360 then hud_inc = 4;
          else if 132360 < hhincome then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 35750 then hud_inc = 1;
          else if 35750 < hhincome <= 59600 then hud_inc = 2;
          else if 59600 < hhincome <= 81100 then hud_inc = 3;
          else if 81100 < hhincome <= 143040 then hud_inc = 4;
          else if 143040 < hhincome then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 38400 then hud_inc = 1;
          else if 38400 < hhincome <= 64000 then hud_inc = 2;
          else if 64000 < hhincome <= 87100 then hud_inc = 3;
          else if 87100 < hhincome <= 153600 then hud_inc = 4;
          else if 153600 < hhincome then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 41050 then hud_inc = 1;
          else if 41050 < hhincome <= 68400 then hud_inc = 2;
          else if 68400 < hhincome <= 93100 then hud_inc = 3;
          else if 93100 < hhincome <= 164160 then hud_inc = 4;
          else if 164160 < hhincome then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 43700 then hud_inc = 1;
          else if 43700 < hhincome <= 72800 then hud_inc = 2;
          else if 72800 < hhincome <= 99100 then hud_inc = 3;
          else if 99100 < hhincome <= 174720 then hud_inc = 4;
          else if 174720 < hhincome then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2017;

/** End Macro Definition **/


