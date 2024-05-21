/**************************************************************************
 Program:  Hud_inc_all.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Eleanor Noble
 Created:  04/07/2020
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro to calculate HUD income categories for
 ALL YEARS in IPUMS data. New variable: HUD_INC.

 Values:
 1  =  <=30% AMI (extremely low)
 2  =  31-50% AMI (very low)
 3  =  51-80% AMI (low)
 4  =  81-120% AMI (middle)
 5  =  >120% AMI (high)
 7  =  N/A (income not reported)

 Modifications:
  02/09/11 PAT Added 2009 macro.
               Added label and format association.
  01/24/14 GM  Added 2010, 2011, and 2012 macros.
**************************************************************************/

/** Macro Hud_inc_all - Start Definition **/

%macro Hud_inc_all( hhinc=hhincome, hhsize=numprec );

  select ( year );
  
    when ( 0, 2000 ) do;
      %hud_inc_1999( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 5, 2005 ) do;
      %hud_inc_2005( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 6, 2006 ) do;
      %hud_inc_2006( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 7, 2007 ) do;
      %hud_inc_2007( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 8, 2008 ) do;
      %hud_inc_2008( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 9, 2009 ) do;
      %hud_inc_2009( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 10, 2010 ) do;
      %hud_inc_2010( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 11, 2011 ) do;
      %hud_inc_2011( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 12, 2012 ) do;
      %hud_inc_2012( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 13, 2013 ) do;
      %hud_inc_2013( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 14, 2014 ) do;
      %hud_inc_2014( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 15, 2015 ) do;
      %hud_inc_2015( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 16, 2016 ) do;
      %hud_inc_2016( hhinc=&hhinc, hhsize=&hhsize );
    end;

    when ( 17, 2017 ) do;
      %hud_inc_2017( hhinc=&hhinc, hhsize=&hhsize );
    end;
	
	when ( 18, 2018 ) do;
      %hud_inc_2018( hhinc=&hhinc, hhsize=&hhsize );
    end;

	when ( 19, 2019 ) do;
      %hud_inc_2019( hhinc=&hhinc, hhsize=&hhsize );
    end;

	when ( 20, 2020 ) do;
      %hud_inc_2020( hhinc=&hhinc, hhsize=&hhsize );
    end;

	when ( 21, 2021 ) do;
      %hud_inc_2021( hhinc=&hhinc, hhsize=&hhsize );
    end;

	when ( 22, 2022 ) do;
      %hud_inc_2022( hhinc=&hhinc, hhsize=&hhsize );
    end;

    otherwise do;
      %err_put( macro=Hud_inc_all, msg=_n_= year= "not supported." );
    end;

  end;
  
  label Hud_inc = "HUD income categories";
  
  format Hud_inc hudinc.;

%mend Hud_inc_all;

/** End Macro Definition **/


/***** UNCOMMENT TO TEST MACRO ***************************************

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

options mprint symbolgen mlogic;

%macro all_years();

  year = 0;
  %Hud_inc_all()
  put (_all_) (/=);
  
  %do i = 2005 %to 2017;
      year = &i;
      %Hud_inc_all()
      put (_all_) (/=);
  %end;
  
%mend all_years;

data _null_;

  numprec = 4;
  hhincome = 40000;
  
  %all_years()  
  
run;

/************************************************************************/
