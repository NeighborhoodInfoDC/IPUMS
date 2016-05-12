/**************************************************************************
 Program:  Afford_hsng_2009.sas
 Library:  IPUMS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  02/09/11
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Affordable housing summary tables for Washington
region, 2009.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( IPUMS )

data tables;

  set Ipums.Acs_2009_pmsa99_full 
        (keep=pernum gq hhwt upuma hud_inc ownershp owncost rentgrs hhincome
              is_: );
  where pernum = 1 and gq in ( 1, 2, 5 );
  
  total = 1;

  if ownershp = 1 then housing_costs = owncost;
  else if ownershp = 2 then housing_costs = rentgrs;

  if housing_costs = 0 then cost_burden = 0;
  else if missing ( hhincome ) then cost_burden = .u;
  else if hhincome > 0 then cost_burden = ( 100 * 12 * housing_costs ) / hhincome;
  else cost_burden = 100;
  
  cost_gap = housing_costs - ( 0.3 * hhincome / 12 );

  if cost_burden > 30 then Affprob = 100; **Affordability problem**;
  else if 0 <= cost_burden < 30 then Affprob = 0; **No affordability problem**;

  if cost_burden > 50 then Sevaff = 100; **Severe Affordabilty problem**;
  else if 0 <= cost_burden < 50 then Sevaff = 0; **No severe affordability problem**;
  
  if is_family and ( is_sngfem or is_sngmal or is_sfemwkids or is_smalwkids ) then single_hh = 100;
  else single_hh = 0;

run;

proc means; 

proc tabulate data=tables format=comma10. noseps missing;
  weight hhwt;
  var total affprob sevaff single_hh;
  class upuma / preloadfmt order=data;
  class hud_inc;
  table 
    /** Rows **/
    all upuma,
    /** Columns **/
    sum * total * ( all='Total' hud_inc )
  ;
  table 
    /** Rows **/
    all upuma,
    /** Columns **/
    rowpctsum * total * ( all='Total' hud_inc ) * f=comma10.1
  ;
  table 
    /** Rows **/
    all upuma,
    /** Columns **/
    mean * affprob * ( all='Total' hud_inc ) * f=comma10.1
  ;
  table 
    /** Rows **/
    all upuma,
    /** Columns **/
    mean * sevaff * ( all='Total' hud_inc ) * f=comma10.1
  ;
  table 
    /** Rows **/
    all upuma,
    /** Columns **/
    mean * single_hh * ( all='Total' hud_inc ) * f=comma10.1
  ;
  format upuma $pumacty. hud_inc hudinc.;

run;
