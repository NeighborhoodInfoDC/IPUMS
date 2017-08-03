/**************************************************************************
 Program:  IPUMS_2000_vacant_dc.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  08/07/14
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Read raw IPUMS 2000 data for vacant housing units
 for DC, MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS, local=n )

%let yr = 2000;
%let yr_dash = %sysfunc( tranwrd( "&yr", '_', '-' ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

filename asciidat "&_dcdata_r_path\ipums\raw\pat\usa_00021.dat";

data 
  ipums.Ipums_&yr._vacant_DC (label="IPUMS 5% sample data, &yr_dash., vacant housing units, DC")
  ipums.Ipums_&yr._vacant_MD (label="IPUMS 5% sample data, &yr_dash., vacant housing units, MD")
  ipums.Ipums_&yr._vacant_VA (label="IPUMS 5% sample data, &yr_dash., vacant housing units, VA")
  ipums.Ipums_&yr._vacant_WV (label="IPUMS 5% sample data, &yr_dash., vacant housing units, WV");

  /**** COPY INFILE, INPUT, LABEL, AND FORMAT STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/

  infile ASCIIDAT pad missover lrecl=139;

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
    PUMATY00      74-75
    PUMALAND      76-89
    PUMAAREA      90-103
    CNTRY         104-106
    GQ            107-107
    GQTYPE        108-108
    GQTYPED       109-111
    RENT          112-115
    VALUEH        116-122
    LINGISOL      123-123
    VACANCY       124-124
    KITCHEN       125-125
    ROOMS         126-127
    PLUMBING      128-129
    BUILTYR       130-130
    BUILTYR2      131-132
    UNITSSTR      133-134
    BEDROOMS      135-136
    PHONE         137-137
    FUELHEAT      138-138
    VEHICLES      139-139
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
    PUMATY00    = "PUMA type, 2000"
    PUMALAND    = "PUMA land area"
    PUMAAREA    = "PUMA total area"
    CNTRY       = "Country"
    GQ          = "Group quarters status"
    GQTYPE      = "Group quarters type [general version]"
    GQTYPED     = "Group quarters type [detailed version]"
    RENT        = "Monthly contract rent"
    VALUEH      = "House value"
    LINGISOL    = "Linguistic isolation"
    VACANCY     = "Vacancy status"
    KITCHEN     = "Kitchen or cooking facilities"
    ROOMS       = "Number of rooms"
    PLUMBING    = "Plumbing facilities"
    BUILTYR     = "Age of structure"
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
    PUMATY00     PUMATY00_f.
    CNTRY        CNTRY_f.
    GQ           GQ_f.
    GQTYPE       GQTYPE_f.
    GQTYPED      GQTYPED_f.
    RENT         RENT_f.
    VALUEH       VALUEH_f.
    LINGISOL     LINGISOL_f.
    VACANCY      VACANCY_f.
    KITCHEN      KITCHEN_f.
    ROOMS        ROOMS_f.
    PLUMBING     PLUMBING_f.
    BUILTYR      BUILTYR_f.
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
    when( &FIPS_DC ) output Ipums.Ipums_&yr._vacant_DC;
    when( &FIPS_MD ) output Ipums.Ipums_&yr._vacant_MD;
    when( &FIPS_VA ) output Ipums.Ipums_&yr._vacant_VA;
    when( &FIPS_WV ) output Ipums.Ipums_&yr._vacant_WV;
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

%File_info( data=ipums.Ipums_&yr._vacant_DC, printobs=5, freqvars=year statefip gq vacancy )

