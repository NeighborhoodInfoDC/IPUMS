/**************************************************************************
 Program:  Hud_inc_1999.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/10/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:

 Modifications:
**************************************************************************/

/** Macro Hud_inc_1999 - Start Definition **/

%macro Hud_inc_1999(  );

  ** HUD income categories (1999) **;

  select ( numprec );
    when ( 1 )
      do;
        if hhincome <= 16550 then hud_inc = 1;
        else if 16550 < hhincome <= 27550 then hud_inc = 2;
        else if 27550 < hhincome <= 33450 then hud_inc = 3;
        else if 33450 < hhincome <= 66120 then hud_inc = 4;
        else if 66120 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 2 )
      do;
        if hhincome <= 18900 then hud_inc = 1;
        else if 18900 < hhincome <= 31500 then hud_inc = 2;
        else if 31500 < hhincome <= 38250 then hud_inc = 3;
        else if 38250 < hhincome <= 75600 then hud_inc = 4;
        else if 75600 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 3 )
      do;
        if hhincome <= 21250 then hud_inc = 1;
        else if 21250 < hhincome <= 35400 then hud_inc = 2;
        else if 35400 < hhincome <= 43000 then hud_inc = 3;
        else if 43000 < hhincome <= 84960 then hud_inc = 4;
        else if 84960 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 4 )
      do;
        if hhincome <= 23600 then hud_inc = 1;
        else if 23600 < hhincome <= 39350 then hud_inc = 2;
        else if 39350 < hhincome <= 47800 then hud_inc = 3;
        else if 47800 < hhincome <= 94440 then hud_inc = 4;
        else if 94440 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 5 )
      do;
        if hhincome <= 25500 then hud_inc = 1;
        else if 25500 < hhincome <= 42500 then hud_inc = 2;
        else if 42500 < hhincome <= 51600 then hud_inc = 3;
        else if 51600 < hhincome <= 102000 then hud_inc = 4;
        else if 102000 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 6 )
      do;
        if hhincome <= 27400 then hud_inc = 1;
        else if 27400 < hhincome <= 45650 then hud_inc = 2;
        else if 45650 < hhincome <= 55450 then hud_inc = 3;
        else if 55450 < hhincome <= 109560 then hud_inc = 4;
        else if 109560 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    when ( 7 )
      do;
        if hhincome <= 29300 then hud_inc = 1;
        else if 29300 < hhincome <= 48800 then hud_inc = 2;
        else if 48800 < hhincome <= 59250 then hud_inc = 3;
        else if 59250 < hhincome <= 117120 then hud_inc = 4;
        else if 117120 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
    otherwise
      do;
        if hhincome <= 31150 then hud_inc = 1;
        else if 31150 < hhincome <= 51950 then hud_inc = 2;
        else if 51950 < hhincome <= 63100 then hud_inc = 3;
        else if 63100 < hhincome <= 124680 then hud_inc = 4;
        else if 124680 < hhincome < 999999 then hud_inc = 5;
        else if hhincome = 999999 then hud_inc = .n;
      end;
  end;

%mend Hud_inc_1999;

/** End Macro Definition **/

