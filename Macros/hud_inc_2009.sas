/**************************************************************************
 Program:  Hud_inc_2009.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/09/11
 Version:  SAS 9.1
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

/** Macro Hud_inc_2008 - Start Definition **/

%macro Hud_inc_2009( hhinc=hhincome, hhsize=numprec );

  ** HUD income categories (2009) **;

  if (&hhinc.) in ( 9999999, .n ) then hud_inc = .n;
  else do;

    select ( &hhsize. );
      when ( 1 )
        do;
          if (&hhinc.) <= 21550 then hud_inc = 1;
          else if 21550 < (&hhinc.) <= 35950 then hud_inc = 2;
          else if 35950 < (&hhinc.) <= 44800 then hud_inc = 3;
          else if 44800 < (&hhinc.) <= 86200 then hud_inc = 4;
          else if 86200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 2 )
        do;
          if (&hhinc.) <= 24650 then hud_inc = 1;
          else if 24650 < (&hhinc.) <= 41100 then hud_inc = 2;
          else if 41100 < (&hhinc.) <= 51200 then hud_inc = 3;
          else if 51200 < (&hhinc.) <= 98600 then hud_inc = 4;
          else if 98600 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 3 )
        do;
          if (&hhinc.) <= 27700 then hud_inc = 1;
          else if 27700 < (&hhinc.) <= 46200 then hud_inc = 2;
          else if 46200 < (&hhinc.) <= 57600 then hud_inc = 3;
          else if 57600 < (&hhinc.) <= 110800 then hud_inc = 4;
          else if 110800 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 4 )
        do;
          if (&hhinc.) <= 30800 then hud_inc = 1;
          else if 30800 < (&hhinc.) <= 51350 then hud_inc = 2;
          else if 51350 < (&hhinc.) <= 64000 then hud_inc = 3;
          else if 64000 < (&hhinc.) <= 123200 then hud_inc = 4;
          else if 123200 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 5 )
        do;
          if (&hhinc.) <= 33250 then hud_inc = 1;
          else if 33250 < (&hhinc.) <= 55450 then hud_inc = 2;
          else if 55450 < (&hhinc.) <= 69100 then hud_inc = 3;
          else if 69100 < (&hhinc.) <= 133000 then hud_inc = 4;
          else if 133000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 6 )
        do;
          if (&hhinc.) <= 35750 then hud_inc = 1;
          else if 35750 < (&hhinc.) <= 59550 then hud_inc = 2;
          else if 59550 < (&hhinc.) <= 74250 then hud_inc = 3;
          else if 74250 < (&hhinc.) <= 143000 then hud_inc = 4;
          else if 143000 < (&hhinc.) then hud_inc = 5;
        end;
      when ( 7 )
        do;
          if (&hhinc.) <= 38200 then hud_inc = 1;
          else if 38200 < (&hhinc.) <= 63650 then hud_inc = 2;
          else if 63650 < (&hhinc.) <= 79350 then hud_inc = 3;
          else if 79350 < (&hhinc.) <= 152800 then hud_inc = 4;
          else if 152800 < (&hhinc.) then hud_inc = 5;
        end;
      otherwise
        do;
          if (&hhinc.) <= 40650 then hud_inc = 1;
          else if 40650 < (&hhinc.) <= 67800 then hud_inc = 2;
          else if 67800 < (&hhinc.) <= 84500 then hud_inc = 3;
          else if 84500 < (&hhinc.) <= 162600 then hud_inc = 4;
          else if 162600 < (&hhinc.) then hud_inc = 5;
        end;
    end;

  end;

  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_2009;

/** End Macro Definition **/


