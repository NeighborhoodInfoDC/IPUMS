************************************************************************
* Program:  Make_formats.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  10/13/04
* Version:  SAS 8.2
* Environment:  Windows
* 
* Description:  Special formats for IPUMS data.
*
* Modifications:
*  11/23/04  Added upload to the Alpha.
*  02/02/05  Added $pumacty.  PAT
   04/04/05  Added Fairfax county, Fairfax city, and Falls Church to
             $pumacty.
   10/23/07  Removed upload to Alpha (upload done in Upload_*.sas).
   02/09/11  PAT Added hudinc. format. 
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Ipums )

proc format library=Ipums;

  /** PUMA to selected counties **/

  value $pumacty (notsorted)
    '1100101' = 'District of Columbia'
    '1100102' = 'District of Columbia'
    '1100103' = 'District of Columbia'
    '1100104' = 'District of Columbia'
    '1100105' = 'District of Columbia'
    '2401001' = 'Montgomery county, MD'
    '2401002' = 'Montgomery county, MD'
    '2401003' = 'Montgomery county, MD'
    '2401004' = 'Montgomery county, MD'
    '2401005' = 'Montgomery county, MD'
    '2401006' = 'Montgomery county, MD'
    '2401007' = 'Montgomery county, MD'
    '2401101' = 'Prince George''s county, MD'
    '2401102' = 'Prince George''s county, MD'
    '2401103' = 'Prince George''s county, MD'
    '2401104' = 'Prince George''s county, MD'
    '2401105' = 'Prince George''s county, MD'
    '2401106' = 'Prince George''s county, MD'
    '2401107' = 'Prince George''s county, MD'
    '5100100' = 'Arlington county, VA'
    '5100200' = 'Alexandria city, VA'
    '5100301' = 'Fairfax county/Fairfax city/Falls Church city, VA'
    '5100302' = 'Fairfax county/Fairfax city/Falls Church city, VA'
    '5100303' = 'Fairfax county/Fairfax city/Falls Church city, VA'
    '5100304' = 'Fairfax county/Fairfax city/Falls Church city, VA'
    '5100305' = 'Fairfax county/Fairfax city/Falls Church city, VA'
    other = 'Not coded';

  /** PUMA to Washington, DC PMSA (1999) **/

  value $pumareg (notsorted)
    '1100101' = 'District of Columbia'
    '1100102' = 'District of Columbia'
    '1100103' = 'District of Columbia'
    '1100104' = 'District of Columbia'
    '1100105' = 'District of Columbia'
    '5100100' = 'Inner Core'
    '5100200' = 'Inner Core'
    '2401001' = 'Inner Suburbs'
    '2401002' = 'Inner Suburbs'
    '2401003' = 'Inner Suburbs'
    '2401004' = 'Inner Suburbs'
    '2401005' = 'Inner Suburbs'
    '2401006' = 'Inner Suburbs'
    '2401007' = 'Inner Suburbs'
    '2401101' = 'Inner Suburbs'
    '2401102' = 'Inner Suburbs'
    '2401103' = 'Inner Suburbs'
    '2401104' = 'Inner Suburbs'
    '2401105' = 'Inner Suburbs'
    '2401106' = 'Inner Suburbs'
    '2401107' = 'Inner Suburbs'
    '5100301' = 'Inner Suburbs'
    '5100302' = 'Inner Suburbs'
    '5100303' = 'Inner Suburbs'
    '5100304' = 'Inner Suburbs'
    '5100305' = 'Inner Suburbs'
    '2400300' = 'Outer/Far Suburbs'
    '2401500' = 'Outer/Far Suburbs'
    '2401600' = 'Outer/Far Suburbs'
    '5100501' = 'Outer/Far Suburbs'
    '5100502' = 'Outer/Far Suburbs'
    '5100600' = 'Outer/Far Suburbs'
    '5100800' = 'Outer/Far Suburbs'
    '5100900' = 'Outer/Far Suburbs'
    '5400400' = 'Outer/Far Suburbs'
    other = 'Outside region';

  /** PUMA to Washington, DC PMSA (1999) - italics for RTF output **/

  value $pumregi (notsorted)
    '1100101' = '\i District of Columbia'
    '1100102' = '\i District of Columbia'
    '1100103' = '\i District of Columbia'
    '1100104' = '\i District of Columbia'
    '1100105' = '\i District of Columbia'
    '5100100' = '\i Inner Core'
    '5100200' = '\i Inner Core'
    '2401001' = '\i Inner Suburbs'
    '2401002' = '\i Inner Suburbs'
    '2401003' = '\i Inner Suburbs'
    '2401004' = '\i Inner Suburbs'
    '2401005' = '\i Inner Suburbs'
    '2401006' = '\i Inner Suburbs'
    '2401007' = '\i Inner Suburbs'
    '2401101' = '\i Inner Suburbs'
    '2401102' = '\i Inner Suburbs'
    '2401103' = '\i Inner Suburbs'
    '2401104' = '\i Inner Suburbs'
    '2401105' = '\i Inner Suburbs'
    '2401106' = '\i Inner Suburbs'
    '2401107' = '\i Inner Suburbs'
    '5100301' = '\i Inner Suburbs'
    '5100302' = '\i Inner Suburbs'
    '5100303' = '\i Inner Suburbs'
    '5100304' = '\i Inner Suburbs'
    '5100305' = '\i Inner Suburbs'
    '2400300' = '\i Outer/Far Suburbs'
    '2401500' = '\i Outer/Far Suburbs'
    '2401600' = '\i Outer/Far Suburbs'
    '5100501' = '\i Outer/Far Suburbs'
    '5100502' = '\i Outer/Far Suburbs'
    '5100600' = '\i Outer/Far Suburbs'
    '5100800' = '\i Outer/Far Suburbs'
    '5100900' = '\i Outer/Far Suburbs'
    '5400400' = '\i Outer/Far Suburbs'
    other = '\i Outside region';

  /** HUD Income Categories **/
  value hudinc
    1 = 'Extremely low (0-30% AMI)'
    2 = 'Very low (31-50%)'
    3 = 'Low (51-80%)'
    4 = 'Middle (81-120%)'
    5 = 'High (over 120%)';

run;

proc catalog catalog=Ipums.formats;
  modify hudinc (desc="HUD income categories") / entrytype=format;
  contents;
quit;


