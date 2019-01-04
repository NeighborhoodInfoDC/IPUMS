/**************************************************************************
 Program:  Hud_inc_2013.sas
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

%macro Hud_inc_2013(  );

  ** HUD income categories (2012) **;

  if hhincome in ( 9999999, .n ) then hud_inc = .n;
  else do;

        select ( numprec );	
      when ( 1 )	
        do;	
          if hhincome <= 22550 then hud_inc = 1;	
          else if 22550 < hhincome <= 37600 then hud_inc = 2;	
          else if 37600 < hhincome <= 46750 then hud_inc = 3;	
          else if 46750 < hhincome <= 90200 then hud_inc = 4;	
          else if 90200 < hhincome then hud_inc = 5;	
        end;	
      when ( 2 )	
        do;	
          if hhincome <= 25800 then hud_inc = 1;	
          else if 25800 < hhincome <= 42950 then hud_inc = 2;	
          else if 42950 < hhincome <= 53400 then hud_inc = 3;	
          else if 53400 < hhincome <= 103200 then hud_inc = 4;	
          else if 103200 < hhincome then hud_inc = 5;	
        end;	
      when ( 3 )	
        do;	
          if hhincome <= 29000 then hud_inc = 1;	
          else if 29000 < hhincome <= 48300 then hud_inc = 2;	
          else if 48300 < hhincome <= 60100 then hud_inc = 3;	
          else if 60100 < hhincome <= 116000 then hud_inc = 4;	
          else if 116000 < hhincome then hud_inc = 5;	
        end;	
      when ( 4 )	
        do;	
          if hhincome <= 32200 then hud_inc = 1;	
          else if 32200 < hhincome <= 53650 then hud_inc = 2;	
          else if 53650 < hhincome <= 66750 then hud_inc = 3;	
          else if 66750 < hhincome <= 128800 then hud_inc = 4;	
          else if 128800 < hhincome then hud_inc = 5;	
        end;	
      when ( 5 )	
        do;	
          if hhincome <= 34800 then hud_inc = 1;	
          else if 34800 < hhincome <= 57950 then hud_inc = 2;	
          else if 57950 < hhincome <= 72100 then hud_inc = 3;	
          else if 72100 < hhincome <= 139200 then hud_inc = 4;	
          else if 139200 < hhincome then hud_inc = 5;	
        end;	
      when ( 6 )	
        do;	
          if hhincome <= 37400 then hud_inc = 1;	
          else if 37400 < hhincome <= 62250 then hud_inc = 2;	
          else if 62250 < hhincome <= 77450 then hud_inc = 3;	
          else if 77450 < hhincome <= 149600 then hud_inc = 4;	
          else if 149600 < hhincome then hud_inc = 5;	
        end;	
      when ( 7 )	
        do;	
          if hhincome <= 39950 then hud_inc = 1;	
          else if 39950 < hhincome <= 66550 then hud_inc = 2;	
          else if 66550 < hhincome <= 82800 then hud_inc = 3;	
          else if 82800 < hhincome <= 159800 then hud_inc = 4;	
          else if 159800 < hhincome then hud_inc = 5;	
        end;	
      otherwise	
        do;	
          if hhincome <= 42500 then hud_inc = 1;	
          else if 42500 < hhincome <= 70850 then hud_inc = 2;	
          else if 70850 < hhincome <= 88150 then hud_inc = 3;	
          else if 88150 < hhincome <= 170000 then hud_inc = 4;	
          else if 170000 < hhincome then hud_inc = 5;	
        end;	
    end;	

  end;

  label Hud_inc = "HUD income categories";
  
%mend Hud_inc_2013;

/** End Macro Definition **/


