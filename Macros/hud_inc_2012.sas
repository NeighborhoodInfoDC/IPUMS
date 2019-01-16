/**************************************************************************
 Program:  Hud_inc_2012.sas
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

%macro Hud_inc_2012( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2012) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 22600 then hud_inc = 1;
          else if 22600 < (&hhinc.) <= 37650 then hud_inc = 2;
          else if 37650 < (&hhinc.) <= 49200 then hud_inc = 3;
          else if 49200 < (&hhinc.) <= 90400 then hud_inc = 4;
          else if 90400 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 25800 then hud_inc = 1;
          else if 25800 < (&hhinc.) <= 43000 then hud_inc = 2;
          else if 43000 < (&hhinc.) <= 56200 then hud_inc = 3;
          else if 56200 < (&hhinc.) <= 103200 then hud_inc = 4;
          else if 103200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 29050 then hud_inc = 1;
          else if 29050 < (&hhinc.) <= 48400 then hud_inc = 2;
          else if 48400 < (&hhinc.) <= 63250 then hud_inc = 3;
          else if 63250 < (&hhinc.) <= 116200 then hud_inc = 4;
          else if 116200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 32250 then hud_inc = 1;
          else if 32250 < (&hhinc.) <= 53750 then hud_inc = 2;
          else if 53750 < (&hhinc.) <= 70250 then hud_inc = 3;
          else if 70250 < (&hhinc.) <= 129000 then hud_inc = 4;
          else if 129000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 34850 then hud_inc = 1;
          else if 34850 < (&hhinc.) <= 58050 then hud_inc = 2;
          else if 58050 < (&hhinc.) <= 75900 then hud_inc = 3;
          else if 75900 < (&hhinc.) <= 139400 then hud_inc = 4;
          else if 139400 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 37450 then hud_inc = 1;
          else if 37450 < (&hhinc.) <= 62350 then hud_inc = 2;
          else if 62350 < (&hhinc.) <= 81500 then hud_inc = 3;
          else if 81500 < (&hhinc.) <= 149800 then hud_inc = 4;
          else if 149800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 40000 then hud_inc = 1;
          else if 40000 < (&hhinc.) <= 66650 then hud_inc = 2;
          else if 66650 < (&hhinc.) <= 87150 then hud_inc = 3;
          else if 87150 < (&hhinc.) <= 160000 then hud_inc = 4;
          else if 160000 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 42600 then hud_inc = 1;
          else if 42600 < (&hhinc.) <= 70950 then hud_inc = 2;
          else if 70950 < (&hhinc.) <= 92750 then hud_inc = 3;
          else if 92750 < (&hhinc.) <= 170400 then hud_inc = 4;
          else if 170400 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2012;

/** End Macro Definition **/


