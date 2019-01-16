/**************************************************************************
 Program:  Hud_inc_2011.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Graham MacDonald
 Created:  4/10/2013
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

/** Macro Hud_inc_2011 - Start Definition **/

%macro Hud_inc_2011( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2011) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

	select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 22300 then hud_inc = 1;
          else if 22300 < (&hhinc.) <= 37150 then hud_inc = 2;
          else if 37150 < (&hhinc.) <= 47350 then hud_inc = 3;
          else if 47350 < (&hhinc.) <= 89200 then hud_inc = 4;
          else if 89200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 25500 then hud_inc = 1;
          else if 25500 < (&hhinc.) <= 42450 then hud_inc = 2;
          else if 42450 < (&hhinc.) <= 54100 then hud_inc = 3;
          else if 54100 < (&hhinc.) <= 102000 then hud_inc = 4;
          else if 102000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 28700 then hud_inc = 1;
          else if 28700 < (&hhinc.) <= 47750 then hud_inc = 2;
          else if 47750 < (&hhinc.) <= 60850 then hud_inc = 3;
          else if 60850 < (&hhinc.) <= 114800 then hud_inc = 4;
          else if 114800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 31850 then hud_inc = 1;
          else if 31850 < (&hhinc.) <= 53050 then hud_inc = 2;
          else if 53050 < (&hhinc.) <= 67600 then hud_inc = 3;
          else if 67600 < (&hhinc.) <= 127400 then hud_inc = 4;
          else if 127400 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 34400 then hud_inc = 1;
          else if 34400 < (&hhinc.) <= 57300 then hud_inc = 2;
          else if 57300 < (&hhinc.) <= 73050 then hud_inc = 3;
          else if 73050 < (&hhinc.) <= 137600 then hud_inc = 4;
          else if 137600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 36950 then hud_inc = 1;
          else if 36950 < (&hhinc.) <= 61550 then hud_inc = 2;
          else if 61550 < (&hhinc.) <= 78450 then hud_inc = 3;
          else if 78450 < (&hhinc.) <= 147800 then hud_inc = 4;
          else if 147800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 39500 then hud_inc = 1;
          else if 39500 < (&hhinc.) <= 65800 then hud_inc = 2;
          else if 65800 < (&hhinc.) <= 83850 then hud_inc = 3;
          else if 83850 < (&hhinc.) <= 158000 then hud_inc = 4;
          else if 158000 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 42050 then hud_inc = 1;
          else if 42050 < (&hhinc.) <= 70050 then hud_inc = 2;
          else if 70050 < (&hhinc.) <= 89250 then hud_inc = 3;
          else if 89250 < (&hhinc.) <= 168200 then hud_inc = 4;
          else if 168200 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2011;

/** End Macro Definition **/


