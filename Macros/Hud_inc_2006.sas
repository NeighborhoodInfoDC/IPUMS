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

 NB: This program must be copied to the Alpha dir. [dcdata.ipums.prog].

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2006 - Start Definition **/

%macro Hud_inc_2006(  );

  ** HUD income categories (2006) **;
  
  if hhincome in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 18950 then hud_inc = 1;
          else if 18950 < hhincome <= 31600 then hud_inc = 2;
          else if 31600 < hhincome <= 41700 then hud_inc = 3;
          else if 41700 < hhincome <= 75800 then hud_inc = 4;
          else if 75800 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 21700 then hud_inc = 1;
          else if 21700 < hhincome <= 36100 then hud_inc = 2;
          else if 36100 < hhincome <= 47700 then hud_inc = 3;
          else if 47700 < hhincome <= 86800 then hud_inc = 4;
          else if 86800 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 24400 then hud_inc = 1;
          else if 24400 < hhincome <= 40650 then hud_inc = 2;
          else if 40650 < hhincome <= 53650 then hud_inc = 3;
          else if 53650 < hhincome <= 97600 then hud_inc = 4;
          else if 97600 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 27100 then hud_inc = 1;
          else if 27100 < hhincome <= 45150 then hud_inc = 2;
          else if 45150 < hhincome <= 59600 then hud_inc = 3;
          else if 59600 < hhincome <= 108400 then hud_inc = 4;
          else if 108400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 29250 then hud_inc = 1;
          else if 29250 < hhincome <= 48750 then hud_inc = 2;
          else if 48750 < hhincome <= 64350 then hud_inc = 3;
          else if 64350 < hhincome <= 117000 then hud_inc = 4;
          else if 117000 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 31450 then hud_inc = 1;
          else if 31450 < hhincome <= 52350 then hud_inc = 2;
          else if 52350 < hhincome <= 69150 then hud_inc = 3;
          else if 69150 < hhincome <= 125800 then hud_inc = 4;
          else if 125800 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 33600 then hud_inc = 1;
          else if 33600 < hhincome <= 56000 then hud_inc = 2;
          else if 56000 < hhincome <= 73900 then hud_inc = 3;
          else if 73900 < hhincome <= 134400 then hud_inc = 4;
          else if 134400 < hhincome < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 35750 then hud_inc = 1;
          else if 35750 < hhincome <= 59600 then hud_inc = 2;
          else if 59600 < hhincome <= 78650 then hud_inc = 3;
          else if 78650 < hhincome <= 143000 then hud_inc = 4;
          else if 143000 < hhincome < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
%mend Hud_inc_2006;

/** End Macro Definition **/

