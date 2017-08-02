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
  9/21/07 PAT Added test for n/a HHINCOME = 999999, .n.
**************************************************************************/

/** Macro Hud_inc_2005 - Start Definition **/

%macro Hud_inc_2005(  );

  ** HUD income categories (2005) **;
  
  if hhincome in ( 999999, .n ) then hud_inc = .n;
  else do;

    select ( numprec );
      when ( 1 )
        do;
          if hhincome <= 18750 then hud_inc = 1;
          else if 18750 < hhincome <= 31250 then hud_inc = 2;
          else if 31250 < hhincome <= 40600 then hud_inc = 3;
          else if 40600 < hhincome <= 75000 then hud_inc = 4;
          else if 75000 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if hhincome <= 21450 then hud_inc = 1;
          else if 21450 < hhincome <= 35700 then hud_inc = 2;
          else if 35700 < hhincome <= 46400 then hud_inc = 3;
          else if 46400 < hhincome <= 85680 then hud_inc = 4;
          else if 85680 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if hhincome <= 24100 then hud_inc = 1;
          else if 24100 < hhincome <= 40200 then hud_inc = 2;
          else if 40200 < hhincome <= 52200 then hud_inc = 3;
          else if 52200 < hhincome <= 96480 then hud_inc = 4;
          else if 96480 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if hhincome <= 26800 then hud_inc = 1;
          else if 26800 < hhincome <= 44650 then hud_inc = 2;
          else if 44650 < hhincome <= 58000 then hud_inc = 3;
          else if 58000 < hhincome <= 107160 then hud_inc = 4;
          else if 107160 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if hhincome <= 28950 then hud_inc = 1;
          else if 28950 < hhincome <= 48200 then hud_inc = 2;
          else if 48200 < hhincome <= 62650 then hud_inc = 3;
          else if 62650 < hhincome <= 115680 then hud_inc = 4;
          else if 115680 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if hhincome <= 31100 then hud_inc = 1;
          else if 31100 < hhincome <= 51800 then hud_inc = 2;
          else if 51800 < hhincome <= 67300 then hud_inc = 3;
          else if 67300 < hhincome <= 124320 then hud_inc = 4;
          else if 124320 < hhincome < 999999 then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if hhincome <= 33200 then hud_inc = 1;
          else if 33200 < hhincome <= 55350 then hud_inc = 2;
          else if 55350 < hhincome <= 71900 then hud_inc = 3;
          else if 71900 < hhincome <= 132840 then hud_inc = 4;
          else if 132840 < hhincome < 999999 then hud_inc = 5;
        end;
      otherwise
        do;
          if hhincome <= 35350 then hud_inc = 1;
          else if 35350 < hhincome <= 58950 then hud_inc = 2;
          else if 58950 < hhincome <= 76550 then hud_inc = 3;
          else if 76550 < hhincome <= 141480 then hud_inc = 4;
          else if 141480 < hhincome < 999999 then hud_inc = 5;
        end;
    end;
    
  end;
  
%mend Hud_inc_2005;

/** End Macro Definition **/

