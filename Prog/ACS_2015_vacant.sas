/**************************************************************************
 Program:  ACS_2015_vacant.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   Rob Pitingolo
 Created:  01/22/2018
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Read raw IPUMS 2015 single year ACS data for vacant housing 
 units for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS )

%let yr = 2015;
%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

%let revisions = Update for &yr. data. ;

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_r_path\ipums\raw\rp\usa_00109.dat";

data 
  ACS_&yr._vacant_DC (label="IPUMS ACS sample, &yr., vacant housing units, DC")
  ACS_&yr._vacant_MD (label="IPUMS ACS sample, &yr., vacant housing units, MD")
  ACS_&yr._vacant_VA (label="IPUMS ACS sample, &yr., vacant housing units, VA")
  ACS_&yr._vacant_WV (label="IPUMS ACS sample, &yr., vacant housing units, WV");

  /**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

  infile ASCIIDAT pad missover lrecl=114;

	input
	  YEAR       1-4
	  DATANUM    5-6
	  SERIAL     7-14
	  CBSERIAL   15-27
	  HHWT       28-37 .2
	  REGION     38-39
	  STATEICP   40-41
	  STATEFIP   42-43
	  COUNTY     44-47
	  METRO      48-48
	  CITY       49-52
	  PUMA       53-57
	  HOMELAND   58-58
	  CNTRY      59-61
	  GQ         62-62
	  GQTYPE     63-63
	  GQTYPED    64-66
	  RENT       67-70
	  VALUEH     71-77
	  LINGISOL   78-78
	  VACANCY    79-79
	  KITCHEN    80-80
	  FRIDGE     81-81
	  SINK       82-82
	  STOVE      83-83
	  ROOMS      84-85
	  PLUMBING   86-87
	  HOTWATER   88-88
	  SHOWER     89-89
	  BUILTYR2   90-91
	  UNITSSTR   92-93
	  BEDROOMS   94-95
	  PHONE      96-96
	  FUELHEAT   97-97
	  VEHICLES   98-98
	;

	label
	  YEAR     = "Census year"
	  DATANUM  = "Data set number"
	  SERIAL   = "Household serial number"
	  CBSERIAL = "Original Census Bureau household serial number"
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
	  BUILTYR2  BUILTYR2_f.
	  UNITSSTR  UNITSSTR_f.
	  BEDROOMS  BEDROOMS_f.
	  PHONE     PHONE_f.
	  FUELHEAT  FUELHEAT_f.
	  VEHICLES  VEHICLES_f.
	;

	format
	  CBSERIAL  13.
	  HHWT      11.2
	;
  
  /**** UI STANDARD CODE HERE ****/
  
  ** Create unique PUMA ID **;

  %upuma() 

  ** Keep only vacant units **;
  if vacancy ^= 0 ;
  
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
    serial rooms hhwt puma rent valueh county;
  
  ** Drop unneeded variables **;
  
  drop lingisol phone fuelheat vehicles;
  
run;


/* Save final datasets */

%macro final_state (st);

%Finalize_data_set( 
  data=ACS_&yr._vacant_&st.,
  out=ACS_&yr._vacant_&st.,
  outlib=ipums,
  label="IPUMS ACS sample, &yr., vacant housing units, &st.",
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
