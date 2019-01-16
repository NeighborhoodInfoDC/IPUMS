/**************************************************************************
 Program:  Hud_inc_2017.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  1/4/2019
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

/** Macro Hud_inc_<year> - Start Definition **/

%macro Hud_inc_2017( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (<year>) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 23200 then hud_inc = 1;
          else if 23200 < (&hhinc.) <= 38650 then hud_inc = 2;
          else if 38650 < (&hhinc.) <= 52550 then hud_inc = 3;
          else if 52550 < (&hhinc.) <= 92760 then hud_inc = 4;
          else if 92760 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 26500 then hud_inc = 1;
          else if 26500 < (&hhinc.) <= 44150 then hud_inc = 2;
          else if 44150 < (&hhinc.) <= 60050 then hud_inc = 3;
          else if 60050 < (&hhinc.) <= 105960 then hud_inc = 4;
          else if 105960 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 29800 then hud_inc = 1;
          else if 29800 < (&hhinc.) <= 49650 then hud_inc = 2;
          else if 49650 < (&hhinc.) <= 67550 then hud_inc = 3;
          else if 67550 < (&hhinc.) <= 119160 then hud_inc = 4;
          else if 119160 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 33100 then hud_inc = 1;
          else if 33100 < (&hhinc.) <= 55150 then hud_inc = 2;
          else if 55150 < (&hhinc.) <= 75050 then hud_inc = 3;
          else if 75050 < (&hhinc.) <= 132360 then hud_inc = 4;
          else if 132360 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 35750 then hud_inc = 1;
          else if 35750 < (&hhinc.) <= 59600 then hud_inc = 2;
          else if 59600 < (&hhinc.) <= 81100 then hud_inc = 3;
          else if 81100 < (&hhinc.) <= 143040 then hud_inc = 4;
          else if 143040 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 38400 then hud_inc = 1;
          else if 38400 < (&hhinc.) <= 64000 then hud_inc = 2;
          else if 64000 < (&hhinc.) <= 87100 then hud_inc = 3;
          else if 87100 < (&hhinc.) <= 153600 then hud_inc = 4;
          else if 153600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 41050 then hud_inc = 1;
          else if 41050 < (&hhinc.) <= 68400 then hud_inc = 2;
          else if 68400 < (&hhinc.) <= 93100 then hud_inc = 3;
          else if 93100 < (&hhinc.) <= 164160 then hud_inc = 4;
          else if 164160 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 43700 then hud_inc = 1;
          else if 43700 < (&hhinc.) <= 72800 then hud_inc = 2;
          else if 72800 < (&hhinc.) <= 99100 then hud_inc = 3;
          else if 99100 < (&hhinc.) <= 174720 then hud_inc = 4;
          else if 174720 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2017;

/** End Macro Definition **/


