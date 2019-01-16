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

%macro Hud_inc_1999( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (1999) **;

  select ( &hhsize. );
    when ( 1 )
      do;
        if (&hhinc.) <= 16550 then hud_inc = 1;
        else if 16550 < (&hhinc.) <= 27550 then hud_inc = 2;
        else if 27550 < (&hhinc.) <= 33450 then hud_inc = 3;
        else if 33450 < (&hhinc.) <= 66120 then hud_inc = 4;
        else if 66120 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 2 )
      do;
        if (&hhinc.) <= 18900 then hud_inc = 1;
        else if 18900 < (&hhinc.) <= 31500 then hud_inc = 2;
        else if 31500 < (&hhinc.) <= 38250 then hud_inc = 3;
        else if 38250 < (&hhinc.) <= 75600 then hud_inc = 4;
        else if 75600 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 3 )
      do;
        if (&hhinc.) <= 21250 then hud_inc = 1;
        else if 21250 < (&hhinc.) <= 35400 then hud_inc = 2;
        else if 35400 < (&hhinc.) <= 43000 then hud_inc = 3;
        else if 43000 < (&hhinc.) <= 84960 then hud_inc = 4;
        else if 84960 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 4 )
      do;
        if (&hhinc.) <= 23600 then hud_inc = 1;
        else if 23600 < (&hhinc.) <= 39350 then hud_inc = 2;
        else if 39350 < (&hhinc.) <= 47800 then hud_inc = 3;
        else if 47800 < (&hhinc.) <= 94440 then hud_inc = 4;
        else if 94440 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 5 )
      do;
        if (&hhinc.) <= 25500 then hud_inc = 1;
        else if 25500 < (&hhinc.) <= 42500 then hud_inc = 2;
        else if 42500 < (&hhinc.) <= 51600 then hud_inc = 3;
        else if 51600 < (&hhinc.) <= 102000 then hud_inc = 4;
        else if 102000 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 6 )
      do;
        if (&hhinc.) <= 27400 then hud_inc = 1;
        else if 27400 < (&hhinc.) <= 45650 then hud_inc = 2;
        else if 45650 < (&hhinc.) <= 55450 then hud_inc = 3;
        else if 55450 < (&hhinc.) <= 109560 then hud_inc = 4;
        else if 109560 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    when ( 7 )
      do;
        if (&hhinc.) <= 29300 then hud_inc = 1;
        else if 29300 < (&hhinc.) <= 48800 then hud_inc = 2;
        else if 48800 < (&hhinc.) <= 59250 then hud_inc = 3;
        else if 59250 < (&hhinc.) <= 117120 then hud_inc = 4;
        else if 117120 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
    otherwise
      do;
        if (&hhinc.) <= 31150 then hud_inc = 1;
        else if 31150 < (&hhinc.) <= 51950 then hud_inc = 2;
        else if 51950 < (&hhinc.) <= 63100 then hud_inc = 3;
        else if 63100 < (&hhinc.) <= 124680 then hud_inc = 4;
        else if 124680 < (&hhinc.) < 999999 then hud_inc = 5;
        else if (&hhinc.) = 999999 then hud_inc = .n;
      end;
  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_1999;

/** End Macro Definition **/

