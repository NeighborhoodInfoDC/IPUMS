/**************************************************************************
 Program:  ACS_2019_23.sas
 Library:  Ipums
 Project:  Urban-Greater DC
 Author:   Nina Veronica Russell
 Created:  04/23/2025
 Version:  SAS 9.4
 Environment:  Windows
 
 Description:  Read IPUMS <year> ACS data and create data sets 
 for DC, MD, VA, and WV.
 
 Input files were downloaded from IPUMS as SAS data sets.
 L:\Libraries\IPUMS\Raw\<list downloaded files here>

 Modifications:
**************************************************************************/

%include "\\sas1\DCdata\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( IPUMS )

*options obs=100;  ** Uncomment for testing **;

** Location of input data sets **;

libname indat "\\sas1\DCDATA\Libraries\IPUMS\Raw\ACS 2019-23\5 year";

%let input_data_sets = usa_00003;

** File year **;

%let yr = 2019_23;

%let revisions = New file.;  ** Default is New file. Change if updating an existing data set. **;

%let yr_dash = %sysfunc( tranwrd( &yr, _, - ) );

%let FIPS_DC = '11';
%let FIPS_MD = '24';
%let FIPS_VA = '51';
%let FIPS_WV = '54';

/* Added this code b/c otherwise formats wouldn't be found*/


data ACS_&yr._DC ACS_&yr._MD ACS_&yr._VA ACS_&yr._WV;

  set indat.usa_00003;



    /**** COPY FORMAT STATEMENTS FROM DOWNLOADED SAS PROGRAM HERE ****/
label
  YEAR        = "Census year"
  MULTYEAR    = "Actual year of survey, multi-year ACS/PRCS"
  SAMPLE      = "IPUMS sample identifier"
  SERIAL      = "Household serial number"
  CBSERIAL    = "Original Census Bureau household serial number"
  NUMPREC     = "Number of person records following"
  SUBSAMP     = "Subsample number"
  HHWT        = "Household weight"
  EXPWTH      = "Experimental housing unit weight"
  HHTYPE      = "Household Type"
  CBHHTYPE    = "Census bureau household type (with cohabiting)"
  REPWT       = "Household replicate weights [80 variables]"
  CLUSTER     = "Household cluster for variance estimation"
  ADJUST      = "Adjustment factor, ACS/PRCS"
  CPI99       = "CPI-U adjustment factor to 1999 dollars"
  REGION      = "Census region and division"
  STATEICP    = "State (ICPSR code)"
  STATEFIP    = "State (FIPS code)"
  COUNTYICP   = "County (ICPSR code, identifiable counties only)"
  COUNTYFIP   = "County (FIPS code, identifiable counties only)"
  PUMA        = "Public Use Microdata Area"
  DENSITY     = "Population-weighted density of PUMA"
  METRO       = "Metropolitan status (where determinable)"
  PCTMETRO    = "Percent of PUMA population living in metro area"
  MET2013     = "Metropolitan area (2013 delineations, identifiable areas only)"
  MET2013ERR  = "Coverage error in MET2013 variable"
  METPOP10    = "Average 2010 population of 2013 metro/micro areas in PUMA"
  CITY        = "City (identifiable cities only)"
  CITYERR     = "Coverage error in CITY variable"
  HOMELAND    = "American Indian, Alaska Native, or Native Hawaiian homeland area"
  STRATA      = "Household strata for variance estimation"
  CNTRY       = "Country"
  GQ          = "Group quarters status"
  GQTYPE      = "Group quarters type [general version]"
  GQTYPED     = "Group quarters type [detailed version]"
  FARM        = "Farm status"
  OWNERSHP    = "Ownership of dwelling (tenure) [general version]"
  OWNERSHPD   = "Ownership of dwelling (tenure) [detailed version]"
  MORTGAGE    = "Mortgage status"
  MORTGAG2    = "Second mortgage status"
  FARMPROD    = "Sales of farm products"
  ACREHOUS    = "House acreage"
  MORTAMT1    = "First mortgage monthly payment"
  MORTAMT2    = "Second mortgage monthly payment"
  TAXINCL     = "Mortgage payment includes property taxes"
  INSINCL     = "Mortgage payment includes property insurance"
  PROPINSR    = "Annual property insurance cost"
  PROPTX99    = "Annual property taxes, 1990"
  OWNCOST     = "Selected monthly owner costs"
  RENT        = "Monthly contract rent"
  RENTGRS     = "Monthly gross rent"
  RENTMEAL    = "Meals included in rent"
  CONDOFEE    = "Monthly condominium fee"
  MOBLHOME    = "Annual mobile home costs"
  COSTELEC    = "Annual electricity cost"
  COSTGAS     = "Annual gas cost"
  COSTWATR    = "Annual water cost"
  COSTFUEL    = "Annual home heating fuel cost"
  HHINCOME    = "Total household income "
  FOODSTMP    = "Food stamp recipiency"
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
  BUILTYR2    = "Age of structure, decade"
  UNITSSTR    = "Units in structure"
  BEDROOMS    = "Number of bedrooms"
  PHONE       = "Telephone availability"
  CINETHH     = "Access to internet"
  CILAPTOP    = "Laptop, desktop, or notebook computer"
  CISMRTPHN   = "Smartphone"
  CITABLET    = "Tablet or other portable wireless computer"
  CIOTHCOMP   = "Other computer equipment"
  CIDATAPLN   = "Cellular data plan for a smartphone or other mobile device"
  CIHISPEED   = "Broadband (high speed) Internet service such as cable, fiber optic, or DSL service"
  CISAT       = "Satellite internet service"
  CIDIAL      = "Dial-up service"
  CIOTHSVC    = "Other internet service"
  FUELHEAT    = "Home heating fuel"
  VEHICLES    = "Vehicles available"
  COUPLETYPE  = "Householder couple type"
  SSMC        = "Same-sex married couple"
  NFAMS       = "Number of families in household"
  NSUBFAM     = "Number of subfamilies in household"
  NCOUPLES    = "Number of couples in household"
  NMOTHERS    = "Number of mothers in household"
  NFATHERS    = "Number of fathers in household"
  MULTGEN     = "Multigenerational household [general version]"
  MULTGEND    = "Multigenerational household [detailed version]"
  CBNSUBFAM   = "Number of subfamilies in household (original Census Bureau classification)"
  REPWT1      = "Household replicate weight 1"
  REPWT2      = "Household replicate weight 2"
  REPWT3      = "Household replicate weight 3"
  REPWT4      = "Household replicate weight 4"
  REPWT5      = "Household replicate weight 5"
  REPWT6      = "Household replicate weight 6"
  REPWT7      = "Household replicate weight 7"
  REPWT8      = "Household replicate weight 8"
  REPWT9      = "Household replicate weight 9"
  REPWT10     = "Household replicate weight 10"
  REPWT11     = "Household replicate weight 11"
  REPWT12     = "Household replicate weight 12"
  REPWT13     = "Household replicate weight 13"
  REPWT14     = "Household replicate weight 14"
  REPWT15     = "Household replicate weight 15"
  REPWT16     = "Household replicate weight 16"
  REPWT17     = "Household replicate weight 17"
  REPWT18     = "Household replicate weight 18"
  REPWT19     = "Household replicate weight 19"
  REPWT20     = "Household replicate weight 20"
  REPWT21     = "Household replicate weight 21"
  REPWT22     = "Household replicate weight 22"
  REPWT23     = "Household replicate weight 23"
  REPWT24     = "Household replicate weight 24"
  REPWT25     = "Household replicate weight 25"
  REPWT26     = "Household replicate weight 26"
  REPWT27     = "Household replicate weight 27"
  REPWT28     = "Household replicate weight 28"
  REPWT29     = "Household replicate weight 29"
  REPWT30     = "Household replicate weight 30"
  REPWT31     = "Household replicate weight 31"
  REPWT32     = "Household replicate weight 32"
  REPWT33     = "Household replicate weight 33"
  REPWT34     = "Household replicate weight 34"
  REPWT35     = "Household replicate weight 35"
  REPWT36     = "Household replicate weight 36"
  REPWT37     = "Household replicate weight 37"
  REPWT38     = "Household replicate weight 38"
  REPWT39     = "Household replicate weight 39"
  REPWT40     = "Household replicate weight 40"
  REPWT41     = "Household replicate weight 41"
  REPWT42     = "Household replicate weight 42"
  REPWT43     = "Household replicate weight 43"
  REPWT44     = "Household replicate weight 44"
  REPWT45     = "Household replicate weight 45"
  REPWT46     = "Household replicate weight 46"
  REPWT47     = "Household replicate weight 47"
  REPWT48     = "Household replicate weight 48"
  REPWT49     = "Household replicate weight 49"
  REPWT50     = "Household replicate weight 50"
  REPWT51     = "Household replicate weight 51"
  REPWT52     = "Household replicate weight 52"
  REPWT53     = "Household replicate weight 53"
  REPWT54     = "Household replicate weight 54"
  REPWT55     = "Household replicate weight 55"
  REPWT56     = "Household replicate weight 56"
  REPWT57     = "Household replicate weight 57"
  REPWT58     = "Household replicate weight 58"
  REPWT59     = "Household replicate weight 59"
  REPWT60     = "Household replicate weight 60"
  REPWT61     = "Household replicate weight 61"
  REPWT62     = "Household replicate weight 62"
  REPWT63     = "Household replicate weight 63"
  REPWT64     = "Household replicate weight 64"
  REPWT65     = "Household replicate weight 65"
  REPWT66     = "Household replicate weight 66"
  REPWT67     = "Household replicate weight 67"
  REPWT68     = "Household replicate weight 68"
  REPWT69     = "Household replicate weight 69"
  REPWT70     = "Household replicate weight 70"
  REPWT71     = "Household replicate weight 71"
  REPWT72     = "Household replicate weight 72"
  REPWT73     = "Household replicate weight 73"
  REPWT74     = "Household replicate weight 74"
  REPWT75     = "Household replicate weight 75"
  REPWT76     = "Household replicate weight 76"
  REPWT77     = "Household replicate weight 77"
  REPWT78     = "Household replicate weight 78"
  REPWT79     = "Household replicate weight 79"
  REPWT80     = "Household replicate weight 80"
  RESPMODE    = "Response mode"
  PERNUM      = "Person number in sample unit"
  CBPERNUM    = "Original Census Bureau person number in sample unit"
  PERWT       = "Person weight"
  EXPWTP      = "Experimental person weight"
  SLWT        = "Sample-line weight"
  REPWTP      = "Person replicate weights [80 variables]"
  FAMUNIT     = "Family unit membership"
  FAMSIZE     = "Number of own family members in household"
  SUBFAM      = "Subfamily membership"
  SFTYPE      = "Subfamily type"
  SFRELATE    = "Relationship within subfamily"
  CBSUBFAM    = "Subfamily number (original Census Bureau classification)"
  CBSFTYPE    = "Subfamily type (original Census Bureau classification)"
  CBSFRELATE  = "Subfamily relationship (original Census Bureau classification)"
  MOMLOC      = "Mother's location in the household"
  STEPMOM     = "Probable step/adopted mother"
  MOMRULE     = "Rule for linking mother (new)"
  POPLOC      = "Father's location in the household"
  STEPPOP     = "Probable step/adopted father"
  POPRULE     = "Rule for linking father (new)"
  SPLOC       = "Spouse's location in household"
  SPRULE      = "Rule for linking spouse or partner (new)"
  MOMLOC2     = "Second mother's location in the household"
  MOM2RULE    = "Rule for linking second mother (new)"
  POPLOC2     = "Second father's location in the household"
  POP2RULE    = "Rule for linking second father (new)"
  NCHILD      = "Number of own children in the household"
  NCHLT5      = "Number of own children under age 5 in household"
  NSIBS       = "Number of own siblings in household"
  ELDCH       = "Age of eldest own child in household"
  YNGCH       = "Age of youngest own child in household"
  RELATE      = "Relationship to household head [general version]"
  RELATED     = "Relationship to household head [detailed version]"
  SEX         = "Sex"
  AGE         = "Age"
  BIRTHQTR    = "Quarter of birth"
  MARST       = "Marital status"
  BIRTHYR     = "Year of birth"
  MARRNO      = "Times married"
  MARRINYR    = "Married within the past year"
  YRMARR      = "Year married"
  DIVINYR     = "Divorced in the past year"
  WIDINYR     = "Widowed in the past year"
  FERTYR      = "Children born within the last year"
  RACE        = "Race [general version]"
  RACED       = "Race [detailed version]"
  HISPAN      = "Hispanic origin [general version]"
  HISPAND     = "Hispanic origin [detailed version]"
  BPL         = "Birthplace [general version]"
  BPLD        = "Birthplace [detailed version]"
  ANCESTR1    = "Ancestry, first response [general version]"
  ANCESTR1D   = "Ancestry, first response [detailed version]"
  ANCESTR2    = "Ancestry, second response [general version]"
  ANCESTR2D   = "Ancestry, second response [detailed version]"
  CITIZEN     = "Citizenship status"
  YRNATUR     = "Year naturalized"
  YRIMMIG     = "Year of immigration"
  YRSUSA1     = "Years in the United States"
  YRSUSA2     = "Years in the United States, intervalled"
  LANGUAGE    = "Language spoken [general version]"
  LANGUAGED   = "Language spoken [detailed version]"
  SPEAKENG    = "Speaks English"
  TRIBE       = "Tribe [general version]"
  TRIBED      = "Tribe [detailed version]"
  RACAMIND    = "Race: American Indian or Alaska Native"
  RACASIAN    = "Race: Asian"
  RACBLK      = "Race: black or African American"
  RACPACIS    = "Race: Pacific Islander"
  RACWHT      = "Race: white"
  RACOTHER    = "Race: some other race"
  RACNUM      = "Number of major race groups"
  HCOVANY     = "Any health insurance coverage"
  HCOVPRIV    = "Private health insurance coverage"
  HINSEMP     = "Health insurance through employer/union"
  HINSPUR     = "Health insurance purchased directly"
  HINSTRI     = "Health insurance through TRICARE"
  HCOVPUB     = "Public health insurance coverage"
  HINSCAID    = "Health insurance through Medicaid"
  HINSCARE    = "Health insurance through Medicare"
  HINSVA      = "Health insurance through VA"
  HINSIHS     = "Health insurance through Indian Health Services"
  HCOVANY2    = "Any health insurance coverage (original)"
  HCOVPRIV2   = "Private health insurance coverage (original)"
  HINSEMP2    = "Health insurance through employer/union (original)"
  HINSPUR2    = "Health insurance purchased directly (original)"
  HINSTRI2    = "Health insurance through TRICARE (original)"
  HCOVPUB2    = "Public health insurance coverage (original)"
  HINSCAID2   = "Health insurance through Medicaid (original)"
  HINSCARE2   = "Health insurance through Medicare (original)"
  HINSVA2     = "Health insurance through VA (original)"
  HINSIHS2    = "Health insurance through Indian Health Services (original)"
  SCHOOL      = "School attendance"
  EDUC        = "Educational attainment [general version]"
  EDUCD       = "Educational attainment [detailed version]"
  GRADEATT    = "Grade level attending [general version]"
  GRADEATTD   = "Grade level attending [detailed version]"
  SCHLTYPE    = "Public or private school"
  DEGFIELD    = "Field of degree [general version]"
  DEGFIELDD   = "Field of degree [detailed version]"
  DEGFIELD2   = "Field of degree (2) [general version]"
  DEGFIELD2D  = "Field of degree (2) [detailed version]"
  EMPSTAT     = "Employment status [general version]"
  EMPSTATD    = "Employment status [detailed version]"
  LABFORCE    = "Labor force status"
  CLASSWKR    = "Class of worker [general version]"
  CLASSWKRD   = "Class of worker [detailed version]"
  OCC         = "Occupation"
  OCC1950     = "Occupation, 1950 basis"
  OCC1990     = "Occupation, 1990 basis"
  OCC2010     = "Occupation, 2010 basis"
  OCCSOC      = "Occupation, SOC classification"
  IND         = "Industry"
  IND1950     = "Industry, 1950 basis"
  IND1990     = "Industry, 1990 basis"
  INDNAICS    = "Industry, NAICS classification"
  WKSWORK1    = "Weeks worked last year"
  WKSWORK2    = "Weeks worked last year, intervalled"
  UHRSWORK    = "Usual hours worked per week"
  WRKLSTWK    = "Worked last week"
  ABSENT      = "Absent from work last week"
  LOOKING     = "Looking for work"
  AVAILBLE    = "Available for work"
  WRKRECAL    = "Informed of work recall"
  WORKEDYR    = "Worked last year"
  INCTOT      = "Total personal income"
  FTOTINC     = "Total family income"
  INCWAGE     = "Wage and salary income"
  INCBUS00    = "Business and farm income, 2000"
  INCSS       = "Social Security income"
  INCWELFR    = "Welfare (public assistance) income"
  INCINVST    = "Interest, dividend, and rental income"
  INCRETIR    = "Retirement income"
  INCSUPP     = "Supplementary Security Income"
  INCOTHER    = "Other income"
  INCEARN     = "Total personal earned income"
  POVERTY     = "Poverty status"
  CBPOVERTY   = "Poverty status (original Census Bureau calculation)"
  OCCSCORE    = "Occupational income score"
  SEI         = "Duncan Socioeconomic Index "
  HWSEI       = "Socioeconomic Index, Hauser and Warren"
  PRESGL      = "Occupational prestige score, Siegel"
  PRENT       = "Occupational prestige score, Nakao and Treas"
  ERSCOR50    = "Occupational earnings score, 1950 basis"
  ERSCOR90    = "Occupational earnings score, 1990 basis"
  EDSCOR50    = "Occupational education score, 1950 basis"
  EDSCOR90    = "Occupational education score, 1990 basis"
  NPBOSS50    = "Nam-Powers-Boyd occupational status score, 1950 basis"
  NPBOSS90    = "Nam-Powers-Boyd occupational status score, 1990 basis"
  MIGRATE1    = "Migration status 1 year ago [general version]"
  MIGRATE1D   = "Migration status 1 year ago [detailed version]"
  MIGPLAC1    = "State or country of residence 1 year ago"
  MIGCOUNTY1  = "County of residence 1 year ago (FIPS code)"
  MIGPUMA1    = "Migration PUMA of residence 1 year ago"
  MIGMET131   = "Metropolitan area of residence 1 year ago (2013 delineations)"
  MIGMET13ERR = "Coverage error in MIGMET13 variables"
  MIGPUMANOW  = "Migration PUMA of residence, now"
  MOVEDIN     = "When occupant moved into residence"
  VETDISAB    = "VA service-connected disability rating"
  DIFFREM     = "Cognitive difficulty"
  DIFFPHYS    = "Ambulatory difficulty"
  DIFFMOB     = "Independent living difficulty"
  DIFFCARE    = "Self-care difficulty"
  DIFFSENS    = "Vision or hearing difficulty"
  DIFFEYE     = "Vision difficulty"
  DIFFHEAR    = "Hearing difficulty"
  VETSTAT     = "Veteran status [general version]"
  VETSTATD    = "Veteran status [detailed version]"
  VET01LTR    = "Veteran, served 2001 or later"
  VET90X01    = "Veteran, served 1990-2001"
  VET75X90    = "Veteran, served May 1975 to July 1990"
  VETVIETN    = "Veteran, served during Vietnam era"
  VET55X64    = "Veteran, served 1955 to 1964"
  VETKOREA    = "Veteran, served during Korean conflict era"
  VETWWII     = "Veteran, served during WWII era"
  VETOTHER    = "Veteran of other period [general version]"
  VETOTHERD   = "Veteran of other period [detailed version]"
  PWSTATE2    = "Place of work: state"
  PWCOUNTY    = "Place of work: county"
  PWMET13     = "Place of work: metropolitan area (2013 delineations)"
  PWMET13ERR  = "Coverage error in PWMET13 variable"
  PWPUMA00    = "Place of work: PUMA, 2000 onward"
  TRANWORK    = "Means of transportation to work"
  CARPOOL     = "Carpooling"
  RIDERS      = "Vehicle occupancy"
  TRANTIME    = "Travel time to work"
  DEPARTS     = "Time of departure for work"
  ARRIVES     = "Time of arrival at work"
  REPWTP1     = "Person replicate weight 1"
  REPWTP2     = "Person replicate weight 2"
  REPWTP3     = "Person replicate weight 3"
  REPWTP4     = "Person replicate weight 4"
  REPWTP5     = "Person replicate weight 5"
  REPWTP6     = "Person replicate weight 6"
  REPWTP7     = "Person replicate weight 7"
  REPWTP8     = "Person replicate weight 8"
  REPWTP9     = "Person replicate weight 9"
  REPWTP10    = "Person replicate weight 10"
  REPWTP11    = "Person replicate weight 11"
  REPWTP12    = "Person replicate weight 12"
  REPWTP13    = "Person replicate weight 13"
  REPWTP14    = "Person replicate weight 14"
  REPWTP15    = "Person replicate weight 15"
  REPWTP16    = "Person replicate weight 16"
  REPWTP17    = "Person replicate weight 17"
  REPWTP18    = "Person replicate weight 18"
  REPWTP19    = "Person replicate weight 19"
  REPWTP20    = "Person replicate weight 20"
  REPWTP21    = "Person replicate weight 21"
  REPWTP22    = "Person replicate weight 22"
  REPWTP23    = "Person replicate weight 23"
  REPWTP24    = "Person replicate weight 24"
  REPWTP25    = "Person replicate weight 25"
  REPWTP26    = "Person replicate weight 26"
  REPWTP27    = "Person replicate weight 27"
  REPWTP28    = "Person replicate weight 28"
  REPWTP29    = "Person replicate weight 29"
  REPWTP30    = "Person replicate weight 30"
  REPWTP31    = "Person replicate weight 31"
  REPWTP32    = "Person replicate weight 32"
  REPWTP33    = "Person replicate weight 33"
  REPWTP34    = "Person replicate weight 34"
  REPWTP35    = "Person replicate weight 35"
  REPWTP36    = "Person replicate weight 36"
  REPWTP37    = "Person replicate weight 37"
  REPWTP38    = "Person replicate weight 38"
  REPWTP39    = "Person replicate weight 39"
  REPWTP40    = "Person replicate weight 40"
  REPWTP41    = "Person replicate weight 41"
  REPWTP42    = "Person replicate weight 42"
  REPWTP43    = "Person replicate weight 43"
  REPWTP44    = "Person replicate weight 44"
  REPWTP45    = "Person replicate weight 45"
  REPWTP46    = "Person replicate weight 46"
  REPWTP47    = "Person replicate weight 47"
  REPWTP48    = "Person replicate weight 48"
  REPWTP49    = "Person replicate weight 49"
  REPWTP50    = "Person replicate weight 50"
  REPWTP51    = "Person replicate weight 51"
  REPWTP52    = "Person replicate weight 52"
  REPWTP53    = "Person replicate weight 53"
  REPWTP54    = "Person replicate weight 54"
  REPWTP55    = "Person replicate weight 55"
  REPWTP56    = "Person replicate weight 56"
  REPWTP57    = "Person replicate weight 57"
  REPWTP58    = "Person replicate weight 58"
  REPWTP59    = "Person replicate weight 59"
  REPWTP60    = "Person replicate weight 60"
  REPWTP61    = "Person replicate weight 61"
  REPWTP62    = "Person replicate weight 62"
  REPWTP63    = "Person replicate weight 63"
  REPWTP64    = "Person replicate weight 64"
  REPWTP65    = "Person replicate weight 65"
  REPWTP66    = "Person replicate weight 66"
  REPWTP67    = "Person replicate weight 67"
  REPWTP68    = "Person replicate weight 68"
  REPWTP69    = "Person replicate weight 69"
  REPWTP70    = "Person replicate weight 70"
  REPWTP71    = "Person replicate weight 71"
  REPWTP72    = "Person replicate weight 72"
  REPWTP73    = "Person replicate weight 73"
  REPWTP74    = "Person replicate weight 74"
  REPWTP75    = "Person replicate weight 75"
  REPWTP76    = "Person replicate weight 76"
  REPWTP77    = "Person replicate weight 77"
  REPWTP78    = "Person replicate weight 78"
  REPWTP79    = "Person replicate weight 79"
  REPWTP80    = "Person replicate weight 80"
;

format
  YEAR         YEAR_f.
  SAMPLE       SAMPLE_f.
  SUBSAMP      SUBSAMP_f.
  HHTYPE       HHTYPE_f.
  CBHHTYPE     CBHHTYPE_f.
  REPWT        REPWT_f.
  REGION       REGION_f.
  STATEICP     STATEICP_f.
  STATEFIP     STATEFIP_f.
  COUNTYICP    COUNTYICP_f.
  METRO        METRO_f.
  MET2013      MET2013_f.
  MET2013ERR   MET2013ERR_f.
  CITY         CITY_f.
  CITYERR      CITYERR_f.
  HOMELAND     HOMELAND_f.
  CNTRY        CNTRY_f.
  GQ           GQ_f.
  GQTYPE       GQTYPE_f.
  GQTYPED      GQTYPED_f.
  FARM         FARM_f.
  OWNERSHP     OWNERSHP_f.
  OWNERSHPD    OWNERSHPD_f.
  MORTGAGE     MORTGAGE_f.
  MORTGAG2     MORTGAG2_f.
  FARMPROD     FARMPROD_f.
  ACREHOUS     ACREHOUS_f.
  MORTAMT1     MORTAMT1_f.
  MORTAMT2     MORTAMT2_f.
  TAXINCL      TAXINCL_f.
  INSINCL      INSINCL_f.
  PROPINSR     PROPINSR_f.
  PROPTX99     PROPTX99_f.
  OWNCOST      OWNCOST_f.
  RENT         RENT_f.
  RENTGRS      RENTGRS_f.
  RENTMEAL     RENTMEAL_f.
  CONDOFEE     CONDOFEE_f.
  MOBLHOME     MOBLHOME_f.
  HHINCOME     HHINCOME_f.
  FOODSTMP     FOODSTMP_f.
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
  BUILTYR2     BUILTYR2_f.
  UNITSSTR     UNITSSTR_f.
  BEDROOMS     BEDROOMS_f.
  PHONE        PHONE_f.
  CINETHH      CINETHH_f.
  CILAPTOP     CILAPTOP_f.
  CISMRTPHN    CISMRTPHN_f.
  CITABLET     CITABLET_f.
  CIOTHCOMP    CIOTHCOMP_f.
  CIDATAPLN    CIDATAPLN_f.
  CIHISPEED    CIHISPEED_f.
  CISAT        CISAT_f.
  CIDIAL       CIDIAL_f.
  CIOTHSVC     CIOTHSVC_f.
  FUELHEAT     FUELHEAT_f.
  VEHICLES     VEHICLES_f.
  COUPLETYPE   COUPLETYPE_f.
  SSMC         SSMC_f.
  NFAMS        NFAMS_f.
  NSUBFAM      NSUBFAM_f.
  NCOUPLES     NCOUPLES_f.
  NMOTHERS     NMOTHERS_f.
  NFATHERS     NFATHERS_f.
  MULTGEN      MULTGEN_f.
  MULTGEND     MULTGEND_f.
  CBNSUBFAM    CBNSUBFAM_f.
  RESPMODE     RESPMODE_f.
  CBPERNUM     CBPERNUM_f.
  REPWTP       REPWTP_f.
  FAMUNIT      FAMUNIT_f.
  FAMSIZE      FAMSIZE_f.
  SUBFAM       SUBFAM_f.
  SFTYPE       SFTYPE_f.
  SFRELATE     SFRELATE_f.
  CBSUBFAM     CBSUBFAM_f.
  CBSFTYPE     CBSFTYPE_f.
  CBSFRELATE   CBSFRELATE_f.
  STEPMOM      STEPMOM_f.
  MOMRULE      MOMRULE_f.
  STEPPOP      STEPPOP_f.
  POPRULE      POPRULE_f.
  SPRULE       SPRULE_f.
  MOM2RULE     MOM2RULE_f.
  POP2RULE     POP2RULE_f.
  NCHILD       NCHILD_f.
  NCHLT5       NCHLT5_f.
  NSIBS        NSIBS_f.
  ELDCH        ELDCH_f.
  YNGCH        YNGCH_f.
  RELATE       RELATE_f.
  RELATED      RELATED_f.
  SEX          SEX_f.
  AGE          AGE_f.
  BIRTHQTR     BIRTHQTR_f.
  MARST        MARST_f.
  MARRNO       MARRNO_f.
  MARRINYR     MARRINYR_f.
  YRMARR       YRMARR_f.
  DIVINYR      DIVINYR_f.
  WIDINYR      WIDINYR_f.
  FERTYR       FERTYR_f.
  RACE         RACE_f.
  RACED        RACED_f.
  HISPAN       HISPAN_f.
  HISPAND      HISPAND_f.
  BPL          BPL_f.
  BPLD         BPLD_f.
  ANCESTR1     ANCESTR1_f.
  ANCESTR1D    ANCESTR1D_f.
  ANCESTR2     ANCESTR2_f.
  ANCESTR2D    ANCESTR2D_f.
  CITIZEN      CITIZEN_f.
  YRNATUR      YRNATUR_f.
  YRIMMIG      YRIMMIG_f.
  YRSUSA1      YRSUSA1_f.
  YRSUSA2      YRSUSA2_f.
  LANGUAGE     LANGUAGE_f.
  LANGUAGED    LANGUAGED_f.
  SPEAKENG     SPEAKENG_f.
  TRIBE        TRIBE_f.
  TRIBED       TRIBED_f.
  RACAMIND     RACAMIND_f.
  RACASIAN     RACASIAN_f.
  RACBLK       RACBLK_f.
  RACPACIS     RACPACIS_f.
  RACWHT       RACWHT_f.
  RACOTHER     RACOTHER_f.
  RACNUM       RACNUM_f.
  HCOVANY      HCOVANY_f.
  HCOVPRIV     HCOVPRIV_f.
  HINSEMP      HINSEMP_f.
  HINSPUR      HINSPUR_f.
  HINSTRI      HINSTRI_f.
  HCOVPUB      HCOVPUB_f.
  HINSCAID     HINSCAID_f.
  HINSCARE     HINSCARE_f.
  HINSVA       HINSVA_f.
  HINSIHS      HINSIHS_f.
  HCOVANY2     HCOVANY2_f.
  HCOVPRIV2    HCOVPRIV2_f.
  HINSEMP2     HINSEMP2_f.
  HINSPUR2     HINSPUR2_f.
  HINSTRI2     HINSTRI2_f.
  HCOVPUB2     HCOVPUB2_f.
  HINSCAID2    HINSCAID2_f.
  HINSCARE2    HINSCARE2_f.
  HINSVA2      HINSVA2_f.
  HINSIHS2     HINSIHS2_f.
  SCHOOL       SCHOOL_f.
  EDUC         EDUC_f.
  EDUCD        EDUCD_f.
  GRADEATT     GRADEATT_f.
  GRADEATTD    GRADEATTD_f.
  SCHLTYPE     SCHLTYPE_f.
  DEGFIELD     DEGFIELD_f.
  DEGFIELDD    DEGFIELDD_f.
  DEGFIELD2    DEGFIELD2_f.
  DEGFIELD2D   DEGFIELD2D_f.
  EMPSTAT      EMPSTAT_f.
  EMPSTATD     EMPSTATD_f.
  LABFORCE     LABFORCE_f.
  CLASSWKR     CLASSWKR_f.
  CLASSWKRD    CLASSWKRD_f.
  OCC          OCC_f.
  OCC1950      OCC1950_f.
  OCC1990      OCC1990_f.
  OCC2010      OCC2010_f.
  IND          IND_f.
  IND1950      IND1950_f.
  IND1990      IND1990_f.
  WKSWORK2     WKSWORK2_f.
  UHRSWORK     UHRSWORK_f.
  WRKLSTWK     WRKLSTWK_f.
  ABSENT       ABSENT_f.
  LOOKING      LOOKING_f.
  AVAILBLE     AVAILBLE_f.
  WRKRECAL     WRKRECAL_f.
  WORKEDYR     WORKEDYR_f.
  INCWAGE      INCWAGE_f.
  INCBUS00     INCBUS00_f.
  INCWELFR     INCWELFR_f.
  INCINVST     INCINVST_f.
  INCRETIR     INCRETIR_f.
  INCSUPP      INCSUPP_f.
  INCOTHER     INCOTHER_f.
  INCEARN      INCEARN_f.
  OCCSCORE     OCCSCORE_f.
  SEI          SEI_f.
  HWSEI        HWSEI_f.
  PRESGL       PRESGL_f.
  PRENT        PRENT_f.
  ERSCOR50     ERSCOR50_f.
  ERSCOR90     ERSCOR90_f.
  EDSCOR50     EDSCOR50_f.
  EDSCOR90     EDSCOR90_f.
  NPBOSS50     NPBOSS50_f.
  NPBOSS90     NPBOSS90_f.
  MIGRATE1     MIGRATE1_f.
  MIGRATE1D    MIGRATE1D_f.
  MIGPLAC1     MIGPLAC1_f.
  MIGMET131    MIGMET131_f.
  MIGMET13ERR  MIGMET13ERR_f.
  MOVEDIN      MOVEDIN_f.
  VETDISAB     VETDISAB_f.
  DIFFREM      DIFFREM_f.
  DIFFPHYS     DIFFPHYS_f.
  DIFFMOB      DIFFMOB_f.
  DIFFCARE     DIFFCARE_f.
  DIFFSENS     DIFFSENS_f.
  DIFFEYE      DIFFEYE_f.
  DIFFHEAR     DIFFHEAR_f.
  VETSTAT      VETSTAT_f.
  VETSTATD     VETSTATD_f.
  VET01LTR     VET01LTR_f.
  VET90X01     VET90X01_f.
  VET75X90     VET75X90_f.
  VETVIETN     VETVIETN_f.
  VET55X64     VET55X64_f.
  VETKOREA     VETKOREA_f.
  VETWWII      VETWWII_f.
  VETOTHER     VETOTHER_f.
  VETOTHERD    VETOTHERD_f.
  PWSTATE2     PWSTATE2_f.
  PWMET13      PWMET13_f.
  PWMET13ERR   PWMET13ERR_f.
  TRANWORK     TRANWORK_f.
  CARPOOL      CARPOOL_f.
  RIDERS       RIDERS_f.
  DEPARTS      DEPARTS_f.
  ARRIVES      ARRIVES_f.
;

format
  CBSERIAL     13.
  HHWT         11.2
  CLUSTER      13.
  STRATA       12.
  PERWT        11.2
  SLWT         11.2
;
  
  *** UI-created format for race Yes/No vars. ***;
  format racamind racasian racblk racother racpacis racwht uracyn.;

  ** Create unique PUMA ID **;

  %upuma() 
  
  ** Recode n/a values **;
  
  array inca{*}  incwage incbus00 incretir incinvst  ;

  do i = 1 to dim( inca );
    if inca{i} = 999999 then inca{i} = .n;
  end;

  array incb{*} incss incwelfr incsupp incother owncost;

  do i = 1 to dim( incb );
    if incb{i} = 99999 then incb{i} = .n;
  end;

  array incc{*} ftotinc hhincome inctot valueh;

  do i = 1 to dim( incc );
    if incc{i} = 9999999 then incc{i} = .n;
  end;

  ** Utility cost codes 9993-9998 indicate no charge, not used, or costs included in rent/condo fee **;

  array incd{*} costelec costgas costfuel costwatr;
  
  do i = 1 to dim( incd );
    if incd{i} >= 9992 then incd{i} = .n;
  end;
  
  ** 2-digit N/A codes **;
  
  array ince{*} eldch yngch;
  
  do i = 1 to dim( ince );
    if ince{i} = 99 then ince{i} = .n;
  end;
  
  ** yrnatur **;
  
  array incf{*} yrnatur;
  
  do i = 1 to dim( incf );
    if incf{i} >= 9997 then incf{i} = .n;
  end;
  
  ** Earnings, education, and occupational status scores **;
  
  array incg{*} erscor50 erscor90 edscor50 edscor90 npboss50 npboss90;
  
  do i = 1 to dim( incg );
    if incg{i} = 999.9 then incg{i} = .n;
  end;
  
  ** HUD income categories **;
  
  %hud_inc_all()

  ** Output files by state **;
  
  select ( statefip );
    when( &FIPS_DC ) output ACS_&yr._DC;
    when( &FIPS_MD ) output ACS_&yr._MD;
    when( &FIPS_VA ) output ACS_&yr._VA;
    when( &FIPS_WV ) output ACS_&yr._WV;
    otherwise do;
      %err_put( msg="Invalid state code: " _n_= serial= statefip= pernum= )
    end;
  end;
  
  drop i;

run;


** Finalize data sets **;

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._DC,
  out=ACS_&yr._DC,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., DC",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._MD,
  out=ACS_&yr._MD,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., MD",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._VA,
  out=ACS_&yr._VA,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., VA",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=ACS_&yr._WV,
  out=ACS_&yr._WV,
  outlib=Ipums,
  label="IPUMS ACS sample, &yr_dash., WV",
  sortby=serial pernum,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=0,
  freqvars=statefip gq vacancy hud_inc
)


title2 '** Unrecoded special values check **';
title3 '** Check maximum value of each variable. Should not be 999...9. **';

proc means data=ACS_&yr._DC n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._MD n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._VA n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

proc means data=ACS_&yr._WV n min max;
var mortamt1 mortamt2 taxincl insincl propinsr proptx99 rent
rentgrs condofee moblhome costelec costgas costwatr costfuel
hhincome valueh inctot ftotinc incwage incbus00 incss incwelfr 
incinvst incretir incsupp incother incearn;
run;

title2;

