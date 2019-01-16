/**************************************************************************
 Program:  Hud_inc_2014.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Maia Woluchem
 Created:  7/14/2016
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

%macro Hud_inc_2014( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2014) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 22500 then hud_inc = 1;
          else if 22500 < (&hhinc.) <= 37450 then hud_inc = 2;
          else if 37450 < (&hhinc.) <= 47950 then hud_inc = 3;
          else if 47950 < (&hhinc.) <= 90000 then hud_inc = 4;
          else if 90000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 25700 then hud_inc = 1;
          else if 25700 < (&hhinc.) <= 42800 then hud_inc = 2;
          else if 42800 < (&hhinc.) <= 54800 then hud_inc = 3;
          else if 54800 < (&hhinc.) <= 102800 then hud_inc = 4;
          else if 102800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 28900 then hud_inc = 1;
          else if 28900 < (&hhinc.) <= 48150 then hud_inc = 2;
          else if 48150 < (&hhinc.) <= 61650 then hud_inc = 3;
          else if 61650 < (&hhinc.) <= 115600 then hud_inc = 4;
          else if 115600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 32100 then hud_inc = 1;
          else if 32100 < (&hhinc.) <= 53500 then hud_inc = 2;
          else if 53500 < (&hhinc.) <= 68500 then hud_inc = 3;
          else if 68500 < (&hhinc.) <= 128400 then hud_inc = 4;
          else if 128400 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 34700 then hud_inc = 1;
          else if 34700 < (&hhinc.) <= 57800 then hud_inc = 2;
          else if 57800 < (&hhinc.) <= 74000 then hud_inc = 3;
          else if 74000 < (&hhinc.) <= 138800 then hud_inc = 4;
          else if 138800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 37250 then hud_inc = 1;
          else if 37250 < (&hhinc.) <= 62100 then hud_inc = 2;
          else if 62100 < (&hhinc.) <= 79500 then hud_inc = 3;
          else if 79500 < (&hhinc.) <= 149000 then hud_inc = 4;
          else if 149000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 39850 then hud_inc = 1;
          else if 39850 < (&hhinc.) <= 66350 then hud_inc = 2;
          else if 66350 < (&hhinc.) <= 84950 then hud_inc = 3;
          else if 84950 < (&hhinc.) <= 159400 then hud_inc = 4;
          else if 159400 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 42400 then hud_inc = 1;
          else if 42400 < (&hhinc.) <= 70650 then hud_inc = 2;
          else if 70650 < (&hhinc.) <= 90450 then hud_inc = 3;
          else if 90450 < (&hhinc.) <= 169600 then hud_inc = 4;
          else if 169600 < (&hhinc.) then hud_inc = 5;
        end;
    end;


  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2014;

/** End Macro Definition **/


