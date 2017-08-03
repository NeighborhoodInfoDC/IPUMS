/**************************************************************************
 Program:  Hud_inc_2007.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/11/09
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro to calculate HUD income categories for
 IPUMS data.

 NB: This program must be copied to the Alpha dir. [dcdata.ipums.prog].

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2007 - Start Definition **/

%macro Hud_inc_2007(  );

  ** HUD income categories (2007) **;
  
  if hhincome in ( 999999, .n ) then hud_inc = .n;
  else do;

     select ( numprec );							
      when ( 1 )							
        do;							
          if hhincome <= 19850 then hud_inc = 1;							
          else if 19850 < hhincome <= 33100 then hud_inc = 2;							
          else if 33100 < hhincome <= 42000 then hud_inc = 3;
          else if 42000 < hhincome <= 79400 then hud_inc = 4;
          else if 79400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 22700 then hud_inc = 1;
          else if 22700 < hhincome <= 37800 then hud_inc = 2;
          else if 37800 < hhincome <= 48000 then hud_inc = 3;
          else if 48000 < hhincome <= 90800 then hud_inc = 4;
          else if 90800 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 25500 then hud_inc = 1;
          else if 25500 < hhincome <= 42550 then hud_inc = 2;
          else if 42550 < hhincome <= 54000 then hud_inc = 3;
          else if 54000 < hhincome <= 102000 then hud_inc = 4;
          else if 102000 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 28350 then hud_inc = 1;
          else if 28350 < hhincome <= 47250 then hud_inc = 2;
          else if 47250 < hhincome <= 60000 then hud_inc = 3;
          else if 60000 < hhincome <= 113400 then hud_inc = 4;
          else if 113400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 30600 then hud_inc = 1;
          else if 30600 < hhincome <= 51050 then hud_inc = 2;
          else if 51050 < hhincome <= 64800 then hud_inc = 3;
          else if 64800 < hhincome <= 122400 then hud_inc = 4;
          else if 122400 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 32900 then hud_inc = 1;
          else if 32900 < hhincome <= 54800 then hud_inc = 2;
          else if 54800 < hhincome <= 69600 then hud_inc = 3;
          else if 69600 < hhincome <= 131600 then hud_inc = 4;
          else if 131600 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 35150 then hud_inc = 1;
          else if 35150 < hhincome <= 58600 then hud_inc = 2;
          else if 58600 < hhincome <= 74400 then hud_inc = 3;
          else if 74400 < hhincome <= 140600 then hud_inc = 4;
          else if 140600 < hhincome < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 37400 then hud_inc = 1;
          else if 37400 < hhincome <= 62350 then hud_inc = 2;
          else if 62350 < hhincome <= 79200 then hud_inc = 3;
          else if 79200 < hhincome <= 149600 then hud_inc = 4;
          else if 149600 < hhincome < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
%mend Hud_inc_2007;

/** End Macro Definition **/


