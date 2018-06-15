/**************************************************************************
 Program:  ACS_2012_16_vacant.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Rob Pitingolo
 Created:  06/14/2018
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Read raw IPUMS 2009-11 ACS data for vacant housing units
 for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS, local=n )

%let yr = 2012_16;
%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

%let revisions = Update for 2012-16 data. ;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_r_path\ipums\raw\rp\usa_00103.dat";

data 
  ACS_&yr._vacant_DC (label="IPUMS ACS sample, &yr_dash., vacant housing units, DC")
  ACS_&yr._vacant_MD (label="IPUMS ACS sample, &yr_dash., vacant housing units, MD")
  ACS_&yr._vacant_VA (label="IPUMS ACS sample, &yr_dash., vacant housing units, VA")
  ACS_&yr._vacant_WV (label="IPUMS ACS sample, &yr_dash., vacant housing units, WV");

  /**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

  infile ASCIIDAT pad missover lrecl=114;

	 input
	  YEAR       1-4
	  DATANUM    5-6
	  SERIAL     7-14
	  HHWT       15-24 .2
	  REGION     25-26
	  STATEICP   27-28
	  STATEFIP   29-30
	  COUNTY     31-34
	  METRO      35-35
	  CITY       36-39
	  PUMA       40-44
	  HOMELAND   45-45
	  CNTRY      46-48
	  GQ         49-49
	  GQTYPE     50-50
	  GQTYPED    51-53
	  RENT       54-57
	  VALUEH     58-64
	  LINGISOL   65-65
	  VACANCY    66-66
	  KITCHEN    67-67
	  FRIDGE     68-68
	  SINK       69-69
	  STOVE      70-70
	  ROOMS      71-72
	  PLUMBING   73-74
	  HOTWATER   75-75
	  SHOWER     76-76
	  TOILET     77-77
	  BUILTYR2   78-79
	  UNITSSTR   80-81
	  BEDROOMS   82-83
	  PHONE      84-84
	  FUELHEAT   85-85
	  VEHICLES   86-86
	;

	label
	  YEAR     = "Census year"
	  DATANUM  = "Data set number"
	  SERIAL   = "Household serial number"
	  HHWT     = "Household weight"
	  REGION   = "Census region and division"
	  STATEICP = "State (ICPSR code)"
	  STATEFIP = "State (FIPS code)"
	  COUNTY   = "County"
	  METRO    = "Metropolitan status"
	  CITY     = "City"
	  PUMA     = "Public Use Microdata Area"
	  HOMELAND = "American Indian, Alaska Native, or Native Hawaiian homeland area"
	  CNTRY    = "Country"
	  GQ       = "Group quarters status"
	  GQTYPE   = "Group quarters type [general version]"
	  GQTYPED  = "Group quarters type [detailed version]"
	  RENT     = "Monthly contract rent"
	  VALUEH   = "House value"
	  LINGISOL = "Linguistic isolation"
	  VACANCY  = "Vacancy status"
	  KITCHEN  = "Kitchen or cooking facilities"
	  FRIDGE   = "Refrigerator"
	  SINK     = "Sink with faucet"
	  STOVE    = "Stove or range"
	  ROOMS    = "Number of rooms"
	  PLUMBING = "Plumbing facilities"
	  HOTWATER = "Hot and cold piped water"
	  SHOWER   = "Bathtub or shower"
	  TOILET   = "Flush toilet"
	  BUILTYR2 = "Age of structure, decade"
	  UNITSSTR = "Units in structure"
	  BEDROOMS = "Number of bedrooms"
	  PHONE    = "Telephone availability"
	  FUELHEAT = "Home heating fuel"
	  VEHICLES = "Vehicles available"
	;

	format
	  YEAR      YEAR_f.
	  REGION    REGION_f.
	  STATEICP  STATEICP_f.
	  STATEFIP  STATEFIP_f.
	  METRO     METRO_f.
	  CITY      CITY_f.
	  HOMELAND  HOMELAND_f.
	  CNTRY     CNTRY_f.
	  GQ        GQ_f.
	  GQTYPE    GQTYPE_f.
	  GQTYPED   GQTYPED_f.
	  LINGISOL  LINGISOL_f.
	  VACANCY   VACANCY_f.
	  KITCHEN   KITCHEN_f.
	  FRIDGE    FRIDGE_f.
	  SINK      SINK_f.
	  STOVE     STOVE_f.
	  ROOMS     ROOMS_f.
	  PLUMBING  PLUMBING_f.
	  HOTWATER  HOTWATER_f.
	  SHOWER    SHOWER_f.
	  TOILET    TOILET_f.
	  BUILTYR2  BUILTYR2_f.
	  UNITSSTR  UNITSSTR_f.
	  BEDROOMS  BEDROOMS_f.
	  PHONE     PHONE_f.
	  FUELHEAT  FUELHEAT_f.
	  VEHICLES  VEHICLES_f.
	;

	format
	  HHWT      11.2
	;
  
  /**** UI STANDARD CODE HERE ****/
  
  ** Create unique PUMA ID **;

  %upuma() 
  
  ** Recode n/a and missing values **;
  
  if valueh = 0 then valueh = .n;
  else if valueh = 9999999 then valueh = .u;
  
  if rent = 0 then rent = .n;
  else if rent = 1 then rent = .u;  /** No cash rent **/

  ** Output files by state **;
  
  select ( statefip );
    when( &FIPS_DC ) output ACS_&yr._vacant_DC;
    when( &FIPS_MD ) output ACS_&yr._vacant_MD;
    when( &FIPS_VA ) output ACS_&yr._vacant_VA;
    when( &FIPS_WV ) output ACS_&yr._vacant_WV;
    otherwise do;
      /** Nothing **/
    end;
  end;
  
  ** Remove extraneous format associations **;
  
  format 
    serial rooms hhwt puma pumasupr conspuma rent valueh county;
  
  ** Drop unneeded variables **;
  
  drop lingisol phone fuelheat vehicles;
  
run;


/* Save final datasets */

%macro final_state (st);

%Finalize_data_set( 
  data=ACS_&yr._vacant_&st.,
  out=ACS_&yr._vacant_&st.,
  outlib=ipums,
  label="IPUMS ACS sample, 2012-16, vacant housing units, &st.",
  sortby=serial,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions.),
  /** File info parameters **/
  printobs=5,
  freqvars=vacancy bedrooms
  );

%mend final_state;
%final_state (DC);
%final_state (MD);
%final_state (VA);
%final_state (WV);
