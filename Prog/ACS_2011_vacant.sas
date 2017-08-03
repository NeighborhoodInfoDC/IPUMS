/**************************************************************************
 Program:  ACS_2011_vacant.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/07/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Read raw IPUMS 2011 ACS data for vacant housing units
 for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS, local=n )

%let yr = 2011;
%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_r_path\ipums\raw\pat\usa_00020.dat";

data 
  ipums.ACS_&yr._vacant_DC (label="IPUMS ACS sample, &yr_dash., vacant housing units, DC")
  ipums.ACS_&yr._vacant_MD (label="IPUMS ACS sample, &yr_dash., vacant housing units, MD")
  ipums.ACS_&yr._vacant_VA (label="IPUMS ACS sample, &yr_dash., vacant housing units, VA")
  ipums.ACS_&yr._vacant_WV (label="IPUMS ACS sample, &yr_dash., vacant housing units, WV");

  /**** COPY INFILE, INPUT, AND LABEL STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

  infile ASCIIDAT pad missover lrecl=114;

  input
    YEAR          1-4
    DATANUM       5-6
    SERIAL        7-14
    HHWT          15-24 .2
    REGION        25-26
    STATEICP      27-28
    STATEFIP      29-30
    COUNTY        31-34
    METRO         35-35
    METAREA       36-38
    METAREAD      39-42
    CITY          43-46
    CITYPOP       47-51
    PUMA          52-56
    PUMARES2MIG   57-61
    PUMASUPR      62-66
    CONSPUMA      67-69
    APPAL         70-70
    APPALD        71-72
    HOMELAND      73-73
    CNTRY         74-76
    GQ            77-77
    GQTYPE        78-78
    GQTYPED       79-81
    RENT          82-85
    VALUEH        86-92
    LINGISOL      93-93
    VACANCY       94-94
    KITCHEN       95-95
    FRIDGE        96-96
    SINK          97-97
    STOVE         98-98
    ROOMS         99-100
    PLUMBING      101-102
    HOTWATER      103-103
    SHOWER        104-104
    TOILET        105-105
    BUILTYR2      106-107
    UNITSSTR      108-109
    BEDROOMS      110-111
    PHONE         112-112
    FUELHEAT      113-113
    VEHICLES      114-114
  ;

  label
    YEAR        = "Census year"
    DATANUM     = "Data set number"
    SERIAL      = "Household serial number"
    HHWT        = "Household weight"
    REGION      = "Census region and division"
    STATEICP    = "State (ICPSR code)"
    STATEFIP    = "State (FIPS code)"
    COUNTY      = "County"
    METRO       = "Metropolitan status"
    METAREA     = "Metropolitan area [general version]"
    METAREAD    = "Metropolitan area [detailed version]"
    CITY        = "City"
    CITYPOP     = "City population"
    PUMA        = "Public Use Microdata Area"
    PUMARES2MIG = "Public Use Microdata Area matching MIGPUMA"
    PUMASUPR    = "Super Public Use Microdata Area"
    CONSPUMA    = "Consistent Public Use Microdata Area"
    APPAL       = "Appalachian region [general version]"
    APPALD      = "Appalachian region [detailed version]"
    HOMELAND    = "American Indian, Alaska Native, or Native Hawaiian homeland area"
    CNTRY       = "Country"
    GQ          = "Group quarters status"
    GQTYPE      = "Group quarters type [general version]"
    GQTYPED     = "Group quarters type [detailed version]"
    RENT        = "Monthly contract rent"
    VALUEH      = "House value"
    LINGISOL    = "Linguistic isolation"
    VACANCY     = "Vacancy status"
    KITCHEN     = "Kitchen or cooking facilities"
    FRIDGE      = "Refrigerator"
    SINK        = "Sink with faucet"
    STOVE       = "Stove or range"
    ROOMS       = "Number of rooms"
    PLUMBING    = "Plumbing facilities"
    HOTWATER    = "Hot and cold piped water"
    SHOWER      = "Bathtub or shower"
    TOILET      = "Flush toilet"
    BUILTYR2    = "Age of structure, decade"
    UNITSSTR    = "Units in structure"
    BEDROOMS    = "Number of bedrooms"
    PHONE       = "Telephone availability"
    FUELHEAT    = "Home heating fuel"
    VEHICLES    = "Vehicles available"
  ;

  format
    YEAR         YEAR_f.
    REGION       REGION_f.
    STATEICP     STATEICP_f.
    STATEFIP     STATEFIP_f.
    COUNTY       COUNTY_f.
    METRO        METRO_f.
    METAREA      METAREA_f.
    METAREAD     METAREAD_f.
    CITY         CITY_f.
    CITYPOP      CITYPOP_f.
    PUMASUPR     PUMASUPR_f.
    CONSPUMA     CONSPUMA_f.
    APPAL        APPAL_f.
    APPALD       APPALD_f.
    HOMELAND     HOMELAND_f.
    CNTRY        CNTRY_f.
    GQ           GQ_f.
    GQTYPE       GQTYPE_f.
    GQTYPED      GQTYPED_f.
    RENT         RENT_f.
    VALUEH       VALUEH_f.
    LINGISOL     LINGISOL_f.
    VACANCY      VACANCY_f.
    KITCHEN      KITCHEN_f.
    FRIDGE       FRIDGE_f.
    SINK         SINK_f.
    STOVE        STOVE_f.
    ROOMS        ROOMS_f.
    PLUMBING     PLUMBING_f.
    HOTWATER     HOTWATER_f.
    SHOWER       SHOWER_f.
    TOILET       TOILET_f.
    BUILTYR2     BUILTYR2_f.
    UNITSSTR     UNITSSTR_f.
    BEDROOMS     BEDROOMS_f.
    PHONE        PHONE_f.
    FUELHEAT     FUELHEAT_f.
    VEHICLES     VEHICLES_f.
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
    when( &FIPS_DC ) output Ipums.ACS_&yr._vacant_DC;
    when( &FIPS_MD ) output Ipums.ACS_&yr._vacant_MD;
    when( &FIPS_VA ) output Ipums.ACS_&yr._vacant_VA;
    when( &FIPS_WV ) output Ipums.ACS_&yr._vacant_WV;
    otherwise do;
      /** Nothing **/
    end;
  end;
  
  ** Remove extraneous format associations **;
  
  format 
    serial rooms hhwt puma pumasupr conspuma rent valueh county;
  
  ** Drop unneeded variables **;
  
  drop appal appald lingisol phone fuelheat vehicles;
  
run;

%File_info( data=ipums.ACS_&yr._vacant_DC, printobs=5, freqvars=year statefip gq vacancy )

