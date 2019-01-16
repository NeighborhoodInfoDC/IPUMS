/**************************************************************************
 Program:  Hud_inc_2005.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/10/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro to calculate HUD income categories for
IPUMS data.

 Modifications:
  9/21/07 PAT Added test for n/a (&hhinc.) = 999999, .n.
**************************************************************************/

/** Macro Hud_inc_2005 - Start Definition **/

%macro Hud_inc_2005( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2005) **;
  
  if (&hhinc.) in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 18750 then hud_inc = 1;
          else if 18750 < (&hhinc.) <= 31250 then hud_inc = 2;
          else if 31250 < (&hhinc.) <= 40600 then hud_inc = 3;
          else if 40600 < (&hhinc.) <= 75000 then hud_inc = 4;
          else if 75000 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 21450 then hud_inc = 1;
          else if 21450 < (&hhinc.) <= 35700 then hud_inc = 2;
          else if 35700 < (&hhinc.) <= 46400 then hud_inc = 3;
          else if 46400 < (&hhinc.) <= 85680 then hud_inc = 4;
          else if 85680 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 24100 then hud_inc = 1;
          else if 24100 < (&hhinc.) <= 40200 then hud_inc = 2;
          else if 40200 < (&hhinc.) <= 52200 then hud_inc = 3;
          else if 52200 < (&hhinc.) <= 96480 then hud_inc = 4;
          else if 96480 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 26800 then hud_inc = 1;
          else if 26800 < (&hhinc.) <= 44650 then hud_inc = 2;
          else if 44650 < (&hhinc.) <= 58000 then hud_inc = 3;
          else if 58000 < (&hhinc.) <= 107160 then hud_inc = 4;
          else if 107160 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 28950 then hud_inc = 1;
          else if 28950 < (&hhinc.) <= 48200 then hud_inc = 2;
          else if 48200 < (&hhinc.) <= 62650 then hud_inc = 3;
          else if 62650 < (&hhinc.) <= 115680 then hud_inc = 4;
          else if 115680 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 31100 then hud_inc = 1;
          else if 31100 < (&hhinc.) <= 51800 then hud_inc = 2;
          else if 51800 < (&hhinc.) <= 67300 then hud_inc = 3;
          else if 67300 < (&hhinc.) <= 124320 then hud_inc = 4;
          else if 124320 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 33200 then hud_inc = 1;
          else if 33200 < (&hhinc.) <= 55350 then hud_inc = 2;
          else if 55350 < (&hhinc.) <= 71900 then hud_inc = 3;
          else if 71900 < (&hhinc.) <= 132840 then hud_inc = 4;
          else if 132840 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 35350 then hud_inc = 1;
          else if 35350 < (&hhinc.) <= 58950 then hud_inc = 2;
          else if 58950 < (&hhinc.) <= 76550 then hud_inc = 3;
          else if 76550 < (&hhinc.) <= 141480 then hud_inc = 4;
          else if 141480 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2005;

/** End Macro Definition **/

