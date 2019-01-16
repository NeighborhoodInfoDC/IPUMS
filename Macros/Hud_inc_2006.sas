/**************************************************************************
 Program:  Hud_inc_2006.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  06/25/08
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro to calculate HUD income categories for
 IPUMS data.

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2006 - Start Definition **/

%macro Hud_inc_2006( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2006) **;
  
  if (&hhinc.) in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 18950 then hud_inc = 1;
          else if 18950 < (&hhinc.) <= 31600 then hud_inc = 2;
          else if 31600 < (&hhinc.) <= 41700 then hud_inc = 3;
          else if 41700 < (&hhinc.) <= 75800 then hud_inc = 4;
          else if 75800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 21700 then hud_inc = 1;
          else if 21700 < (&hhinc.) <= 36100 then hud_inc = 2;
          else if 36100 < (&hhinc.) <= 47700 then hud_inc = 3;
          else if 47700 < (&hhinc.) <= 86800 then hud_inc = 4;
          else if 86800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 24400 then hud_inc = 1;
          else if 24400 < (&hhinc.) <= 40650 then hud_inc = 2;
          else if 40650 < (&hhinc.) <= 53650 then hud_inc = 3;
          else if 53650 < (&hhinc.) <= 97600 then hud_inc = 4;
          else if 97600 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 27100 then hud_inc = 1;
          else if 27100 < (&hhinc.) <= 45150 then hud_inc = 2;
          else if 45150 < (&hhinc.) <= 59600 then hud_inc = 3;
          else if 59600 < (&hhinc.) <= 108400 then hud_inc = 4;
          else if 108400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 29250 then hud_inc = 1;
          else if 29250 < (&hhinc.) <= 48750 then hud_inc = 2;
          else if 48750 < (&hhinc.) <= 64350 then hud_inc = 3;
          else if 64350 < (&hhinc.) <= 117000 then hud_inc = 4;
          else if 117000 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 31450 then hud_inc = 1;
          else if 31450 < (&hhinc.) <= 52350 then hud_inc = 2;
          else if 52350 < (&hhinc.) <= 69150 then hud_inc = 3;
          else if 69150 < (&hhinc.) <= 125800 then hud_inc = 4;
          else if 125800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 33600 then hud_inc = 1;
          else if 33600 < (&hhinc.) <= 56000 then hud_inc = 2;
          else if 56000 < (&hhinc.) <= 73900 then hud_inc = 3;
          else if 73900 < (&hhinc.) <= 134400 then hud_inc = 4;
          else if 134400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 35750 then hud_inc = 1;
          else if 35750 < (&hhinc.) <= 59600 then hud_inc = 2;
          else if 59600 < (&hhinc.) <= 78650 then hud_inc = 3;
          else if 78650 < (&hhinc.) <= 143000 then hud_inc = 4;
          else if 143000 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2006;

/** End Macro Definition **/

