/**************************************************************************
 Program:  Hud_inc_2008.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/26/10
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

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2008 - Start Definition **/

%macro Hud_inc_2008( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2008) **;

  if (&hhinc.) in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 20650 then hud_inc = 1;
          else if 20650 < (&hhinc.) <= 34450 then hud_inc = 2;
          else if 34450 < (&hhinc.) <= 43050 then hud_inc = 3;
          else if 43050 < (&hhinc.) <= 82600 then hud_inc = 4;
          else if 82600 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 23600 then hud_inc = 1;
          else if 23600 < (&hhinc.) <= 39350 then hud_inc = 2;
          else if 39350 < (&hhinc.) <= 49200 then hud_inc = 3;
          else if 49200 < (&hhinc.) <= 94400 then hud_inc = 4;
          else if 94400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 26550 then hud_inc = 1;
          else if 26550 < (&hhinc.) <= 44300 then hud_inc = 2;
          else if 44300 < (&hhinc.) <= 55350 then hud_inc = 3;
          else if 55350 < (&hhinc.) <= 106200 then hud_inc = 4;
          else if 106200 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 29500 then hud_inc = 1;
          else if 29500 < (&hhinc.) <= 49200 then hud_inc = 2;
          else if 49200 < (&hhinc.) <= 61500 then hud_inc = 3;
          else if 61500 < (&hhinc.) <= 118000 then hud_inc = 4;
          else if 118000 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 31850 then hud_inc = 1;
          else if 31850 < (&hhinc.) <= 53150 then hud_inc = 2;
          else if 53150 < (&hhinc.) <= 66400 then hud_inc = 3;
          else if 66400 < (&hhinc.) <= 127400 then hud_inc = 4;
          else if 127400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 34200 then hud_inc = 1;
          else if 34200 < (&hhinc.) <= 57050 then hud_inc = 2;
          else if 57050 < (&hhinc.) <= 71350 then hud_inc = 3;
          else if 71350 < (&hhinc.) <= 136800 then hud_inc = 4;
          else if 136800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 36600 then hud_inc = 1;
          else if 36600 < (&hhinc.) <= 61000 then hud_inc = 2;
          else if 61000 < (&hhinc.) <= 76250 then hud_inc = 3;
          else if 76250 < (&hhinc.) <= 146400 then hud_inc = 4;
          else if 146400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 38950 then hud_inc = 1;
          else if 38950 < (&hhinc.) <= 64950 then hud_inc = 2;
          else if 64950 < (&hhinc.) <= 81200 then hud_inc = 3;
          else if 81200 < (&hhinc.) <= 155800 then hud_inc = 4;
          else if 155800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2008;

/** End Macro Definition **/


