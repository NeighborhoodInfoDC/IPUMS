/**************************************************************************
 Program:  Hud_inc_2010.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Graham MacDonald
 Created:  4/10/2013
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

/** Macro Hud_inc_2010 - Start Definition **/

%macro Hud_inc_2010( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2010) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

	select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 21750 then hud_inc = 1;
          else if 21750 < (&hhinc.) <= 36250 then hud_inc = 2;
          else if 36250 < (&hhinc.) <= 45100 then hud_inc = 3;
          else if 45100 < (&hhinc.) <= 87000 then hud_inc = 4;
          else if 87000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 24850 then hud_inc = 1;
          else if 24850 < (&hhinc.) <= 41400 then hud_inc = 2;
          else if 41400 < (&hhinc.) <= 51550 then hud_inc = 3;
          else if 51550 < (&hhinc.) <= 99400 then hud_inc = 4;
          else if 99400 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 27950 then hud_inc = 1;
          else if 27950 < (&hhinc.) <= 46600 then hud_inc = 2;
          else if 46600 < (&hhinc.) <= 58000 then hud_inc = 3;
          else if 58000 < (&hhinc.) <= 111800 then hud_inc = 4;
          else if 111800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 31050 then hud_inc = 1;
          else if 31050 < (&hhinc.) <= 51750 then hud_inc = 2;
          else if 51750 < (&hhinc.) <= 64400 then hud_inc = 3;
          else if 64400 < (&hhinc.) <= 124200 then hud_inc = 4;
          else if 124200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 33550 then hud_inc = 1;
          else if 33550 < (&hhinc.) <= 55900 then hud_inc = 2;
          else if 55900 < (&hhinc.) <= 69600 then hud_inc = 3;
          else if 69600 < (&hhinc.) <= 134200 then hud_inc = 4;
          else if 134200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 36050 then hud_inc = 1;
          else if 36050 < (&hhinc.) <= 60050 then hud_inc = 2;
          else if 60050 < (&hhinc.) <= 74750 then hud_inc = 3;
          else if 74750 < (&hhinc.) <= 144200 then hud_inc = 4;
          else if 144200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 38550 then hud_inc = 1;
          else if 38550 < (&hhinc.) <= 64200 then hud_inc = 2;
          else if 64200 < (&hhinc.) <= 79900 then hud_inc = 3;
          else if 79900 < (&hhinc.) <= 154200 then hud_inc = 4;
          else if 154200 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 41000 then hud_inc = 1;
          else if 41000 < (&hhinc.) <= 68350 then hud_inc = 2;
          else if 68350 < (&hhinc.) <= 85050 then hud_inc = 3;
          else if 85050 < (&hhinc.) <= 164000 then hud_inc = 4;
          else if 164000 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2010;

/** End Macro Definition **/


