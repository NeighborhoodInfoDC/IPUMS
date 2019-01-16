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

 Modifications:
**************************************************************************/

/** Macro Hud_inc_2007 - Start Definition **/

%macro Hud_inc_2007( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2007) **;
  
  if (&hhinc.) in ( 999999, .n ) then hud_inc = .n;
  else do;

     select ( &hhsize. );							
      when ( 1 )							
        do;							
          if (&hhinc.) <= 19850 then hud_inc = 1;							
          else if 19850 < (&hhinc.) <= 33100 then hud_inc = 2;							
          else if 33100 < (&hhinc.) <= 42000 then hud_inc = 3;
          else if 42000 < (&hhinc.) <= 79400 then hud_inc = 4;
          else if 79400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 22700 then hud_inc = 1;
          else if 22700 < (&hhinc.) <= 37800 then hud_inc = 2;
          else if 37800 < (&hhinc.) <= 48000 then hud_inc = 3;
          else if 48000 < (&hhinc.) <= 90800 then hud_inc = 4;
          else if 90800 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 25500 then hud_inc = 1;
          else if 25500 < (&hhinc.) <= 42550 then hud_inc = 2;
          else if 42550 < (&hhinc.) <= 54000 then hud_inc = 3;
          else if 54000 < (&hhinc.) <= 102000 then hud_inc = 4;
          else if 102000 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 28350 then hud_inc = 1;
          else if 28350 < (&hhinc.) <= 47250 then hud_inc = 2;
          else if 47250 < (&hhinc.) <= 60000 then hud_inc = 3;
          else if 60000 < (&hhinc.) <= 113400 then hud_inc = 4;
          else if 113400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 30600 then hud_inc = 1;
          else if 30600 < (&hhinc.) <= 51050 then hud_inc = 2;
          else if 51050 < (&hhinc.) <= 64800 then hud_inc = 3;
          else if 64800 < (&hhinc.) <= 122400 then hud_inc = 4;
          else if 122400 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 32900 then hud_inc = 1;
          else if 32900 < (&hhinc.) <= 54800 then hud_inc = 2;
          else if 54800 < (&hhinc.) <= 69600 then hud_inc = 3;
          else if 69600 < (&hhinc.) <= 131600 then hud_inc = 4;
          else if 131600 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 35150 then hud_inc = 1;
          else if 35150 < (&hhinc.) <= 58600 then hud_inc = 2;
          else if 58600 < (&hhinc.) <= 74400 then hud_inc = 3;
          else if 74400 < (&hhinc.) <= 140600 then hud_inc = 4;
          else if 140600 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 37400 then hud_inc = 1;
          else if 37400 < (&hhinc.) <= 62350 then hud_inc = 2;
          else if 62350 < (&hhinc.) <= 79200 then hud_inc = 3;
          else if 79200 < (&hhinc.) <= 149600 then hud_inc = 4;
          else if 149600 < (&hhinc.) < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2007;

/** End Macro Definition **/


