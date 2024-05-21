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

/** Macro Hud_inc_2013 - Start Definition **/

%macro Hud_inc_2013( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2013) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

        select ( &hhsize. );	
      when ( 1 )	
        do;	
          if (&hhinc.) <= 22550 then hud_inc = 1;	
          else if 22550 < (&hhinc.) <= 37600 then hud_inc = 2;	
          else if 37600 < (&hhinc.) <= 46750 then hud_inc = 3;	
          else if 46750 < (&hhinc.) <= 90200 then hud_inc = 4;	
          else if 90200 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 2 )	
        do;	
          if (&hhinc.) <= 25800 then hud_inc = 1;	
          else if 25800 < (&hhinc.) <= 42950 then hud_inc = 2;	
          else if 42950 < (&hhinc.) <= 53400 then hud_inc = 3;	
          else if 53400 < (&hhinc.) <= 103200 then hud_inc = 4;	
          else if 103200 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 3 )	
        do;	
          if (&hhinc.) <= 29000 then hud_inc = 1;	
          else if 29000 < (&hhinc.) <= 48300 then hud_inc = 2;	
          else if 48300 < (&hhinc.) <= 60100 then hud_inc = 3;	
          else if 60100 < (&hhinc.) <= 116000 then hud_inc = 4;	
          else if 116000 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 4 )	
        do;	
          if (&hhinc.) <= 32200 then hud_inc = 1;	
          else if 32200 < (&hhinc.) <= 53650 then hud_inc = 2;	
          else if 53650 < (&hhinc.) <= 66750 then hud_inc = 3;	
          else if 66750 < (&hhinc.) <= 128800 then hud_inc = 4;	
          else if 128800 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 5 )	
        do;	
          if (&hhinc.) <= 34800 then hud_inc = 1;	
          else if 34800 < (&hhinc.) <= 57950 then hud_inc = 2;	
          else if 57950 < (&hhinc.) <= 72100 then hud_inc = 3;	
          else if 72100 < (&hhinc.) <= 139200 then hud_inc = 4;	
          else if 139200 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 6 )	
        do;	
          if (&hhinc.) <= 37400 then hud_inc = 1;	
          else if 37400 < (&hhinc.) <= 62250 then hud_inc = 2;	
          else if 62250 < (&hhinc.) <= 77450 then hud_inc = 3;	
          else if 77450 < (&hhinc.) <= 149600 then hud_inc = 4;	
          else if 149600 < (&hhinc.) then hud_inc = 5;	
        end;	
      when ( 7 )	
        do;	
          if (&hhinc.) <= 39950 then hud_inc = 1;	
          else if 39950 < (&hhinc.) <= 66550 then hud_inc = 2;	
          else if 66550 < (&hhinc.) <= 82800 then hud_inc = 3;	
          else if 82800 < (&hhinc.) <= 159800 then hud_inc = 4;	
          else if 159800 < (&hhinc.) then hud_inc = 5;	
        end;	
      otherwise	
        do;	
          if (&hhinc.) <= 42500 then hud_inc = 1;	
          else if 42500 < (&hhinc.) <= 70850 then hud_inc = 2;	
          else if 70850 < (&hhinc.) <= 88150 then hud_inc = 3;	
          else if 88150 < (&hhinc.) <= 170000 then hud_inc = 4;	
          else if 170000 < (&hhinc.) then hud_inc = 5;	
        end;	
    end;	

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2013;

/** End Macro Definition **/


