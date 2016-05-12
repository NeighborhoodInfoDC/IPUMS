/**************************************************************************
 Program:  Acs_2004_2006_dc.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/28/08
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Create pooled ACS microdata sample for 2004-2006.
   District of Columbia
   Population and household weights for DC are adjusted to updated
   population estimates.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )
%DCData_lib( Census )

** Start submitting commands to remote server **;

rsubmit;

%let is_group_quarters = (gq in (3,4));

%let keep_vars = _all_;
%*** %let keep_vars = serial pernum perwt hhwt gq year statefip incearn hhincome;

** Population totals for DC ACS samples **;

proc summary data=IPUMS.acs_2004_dc;
  var perwt;
  output out=perwt_sum_2004 (drop=_type_ _freq_ compress=no) sum=perwt_sum_2004;
  
proc summary data=IPUMS.acs_2005_dc;
  var perwt;
  output out=perwt_sum_2005 (drop=_type_ _freq_ compress=no) sum=perwt_sum_2005;

proc summary data=IPUMS.acs_2006_dc;
  where not &is_group_quarters;
  var perwt;
  output out=perwt_sum_2006_notgq (drop=_type_ _freq_ compress=no) sum=perwt_sum_2006_notgq;

proc summary data=IPUMS.acs_2006_dc;
  where &is_group_quarters;
  var perwt;
  output out=perwt_sum_2006_gq (drop=_type_ _freq_ compress=no) sum=perwt_sum_2006_gq;

** Combine ACS files, population totals, and estimates **;

data Pooled;

	set 
	  IPUMS.acs_2004_dc (in=a keep=&keep_vars)
	  IPUMS.acs_2005_dc (in=b keep=&keep_vars)
	  IPUMS.acs_2006_dc (in=c keep=&keep_vars);
	by year serial;
	
	** Add DC population totals and estimates for weight adjustment **;
	
	if _n_ = 1 then do;
	  set perwt_sum_2004;
	  set perwt_sum_2005;
	  set perwt_sum_2006_gq;
	  set perwt_sum_2006_notgq;
	  set Census.Pop_est_age_dc 
	       (keep=age_group pop_2004 pop_2005 pop_2006
	        where=(age_group=1));
	end;	  
	
	** Create new person weight for pooled samples **;
	** NB: There is no GQ sample in 2004 and 2005, so 2006 GQ sample is scaled up 3x **;
	
      ** DC **;
  
      ratio_in_hhs = perwt_sum_2006_notgq / ( perwt_sum_2006_notgq + perwt_sum_2006_gq );
      
      select ( year );
        when ( 4 ) do;
          ** 2004 **;
          perwt_pool = ( perwt / 3 ) * ( ( pop_2004 * ratio_in_hhs ) / perwt_sum_2004 );
          perwt_pool0506 = .n;
        end;
        when ( 5 ) do;
          ** 2005 **;
          perwt_pool = ( perwt / 3 ) * ( ( pop_2005 * ratio_in_hhs ) / perwt_sum_2005 );
          perwt_pool0506 = ( perwt / 2 ) * ( ( pop_2005 * ratio_in_hhs ) / perwt_sum_2005 );
        end;
        when ( 6 ) do;
          ** 2006 **;
          if not &is_group_quarters then do;
            ** Households **;
            perwt_pool = ( perwt / 3 ) * ( ( pop_2006 * ratio_in_hhs ) / perwt_sum_2006_notgq );
            perwt_pool0506 = ( perwt / 2 ) * ( ( pop_2006 * ratio_in_hhs ) / perwt_sum_2006_notgq );
          end;
          else do; 
            ** Group quarters **;
            perwt_pool = ( perwt ) * ( ( ( ( pop_2004 + pop_2005 + pop_2006 ) / 3 ) * ( 1 - ratio_in_hhs ) ) / perwt_sum_2006_gq );
            perwt_pool0506 = ( perwt ) * ( ( ( ( pop_2005 + pop_2006 ) / 2 ) * ( 1 - ratio_in_hhs ) ) / perwt_sum_2006_gq );
          end;
        end;
        otherwise do;
          %err_put( msg="Unsupported year. " _n_= year= )
          stop;
        end;
      end;
      
      ** Scale HH weights in proportion to population weights **;
      
      hhwt_pool = hhwt * ( perwt_pool / perwt );
      
      if year = 4 then
        hhwt_pool0506 = .n;
      else 
        hhwt_pool0506 = hhwt * ( perwt_pool0506 / perwt );
        
	** Adjust income, earnings to 2006 $ **;
	
	select ( year );
	  when ( 4 ) do;
	    %dollar_convert( hhincome, hhincome_adj, 2004, 2006 )
	    %dollar_convert( incearn, incearn_adj, 2004, 2006 )
	  end;
	  when ( 5 ) do;
	    %dollar_convert( hhincome, hhincome_adj, 2005, 2006 )
	    %dollar_convert( incearn, incearn_adj, 2005, 2006 )
	  end;
	  when ( 6 ) do;
	    hhincome_adj = hhincome;
	    incearn_adj = incearn;
	  end;
	end;

	label
	  perwt_pool = 'Person weight, pooled for 2004-2006 samples'
	  perwt_pool0506 = 'Person weight, pooled for 2005-2006 samples'
	  perwt = 'Person weight, original [Use PERWT or PERWT0506 instead]'
	  hhwt_pool = 'Household weight, pooled for 2004-2006 samples'
	  hhwt_pool0506 = 'Household weight, pooled for 2005-2006 samples'
	  hhwt = 'Household weight, original [Use HHWT or HHWT0506 instead]'
	  hhincome_adj = 'Annual household income (2006 $)'
	  incearn_adj = 'Annual earnings (2006 $)'
	  ;
	  
	drop age_group ratio_in_hhs perwt_sum_: pop_: repwt: ;
	
	rename perwt=perwt_org perwt_pool=perwt perwt_pool0506=perwt0506
	       hhwt=hhwt_org hhwt_pool=hhwt hhwt_pool0506=hhwt0506;

run;

** Add household and family characteristics **;

data HH_family_chars;

  format year yearx.;
  
  set ipums.acs_2004_fam_pmsa99 (in=inA)
      ipums.acs_2005_fam_pmsa99 (in=inB)
      ipums.acs_2006_fam_pmsa99 (in=inC);

  where statefip = 11;    ** DC only **;

  if inA then year=4;
  else if inB then year=5;
  else if inC then year=6;
  
  drop gq hhwt statefip;
  
run;

** Merge person-level and family-level data **;

data Ipums.Acs_2004_2006_dc (label="ACS microdata, pooled 2004-2006 sample, DC" sortedby=year serial);

  merge
    Pooled (in=inA)
    HH_family_chars;
  by year serial;
  
  if inA;
  
run;

x "purge [dcdata.ipums.data]Acs_2004_2006_dc.*";

%File_info( data=Ipums.Acs_2004_2006_dc, printobs=0 )

proc format;
  value gqb 
    1, 2, 5 = 'In HHs'
    3, 4    = 'In GQs';

proc tabulate data=Ipums.Acs_2004_2006_dc format=comma12. noseps missing;
  class statefip gq year;
  var perwt_org perwt perwt0506;
  table 
    /** Pages **/
    statefip=' ',
    /** Rows **/
    all='Total' gq=' ',
    /** Columns **/
    sum='Person weights' * ( ( perwt_org='Original' * year=' ' ) perwt='Pooled   2004-06' perwt0506='Pooled   2005-06' )
    / condense;
  format gq gqb.;
  title2 'Adjusted, pooled sample weights';

run;

proc tabulate data=Ipums.Acs_2004_2006_dc format=comma12. noseps missing;
  where pernum = 1;
  class statefip gq year;
  var hhwt_org hhwt hhwt0506;
  table 
    /** Pages **/
    statefip=' ',
    /** Rows **/
    all='Total' gq=' ',
    /** Columns **/
    sum='Household weights' * ( ( hhwt_org='Original' * year=' ' ) hhwt='Pooled   2004-06' hhwt0506='Pooled   2005-06' )
    / condense;
  format gq gqb.;
  title2 'Adjusted, pooled sample weights';

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
