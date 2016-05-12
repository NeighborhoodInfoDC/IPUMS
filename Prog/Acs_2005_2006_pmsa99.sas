/**************************************************************************
 Program:  Acs_2005_2006_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/28/08
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Create pooled ACS microdata sample for 2005-2006.
   Washington, DC PMSA (1999)
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
%let keep_vars = serial pernum perwt hhwt gq year statefip;

** Population totals for DC ACS samples **;

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
	  IPUMS.acs_2005_pmsa99 (in=b keep=&keep_vars)
	  IPUMS.acs_2006_pmsa99 (in=c keep=&keep_vars);
	by year serial;
	
	** Add DC population totals and estimates for weight adjustment **;
	
	if _n_ = 1 then do;
	  set perwt_sum_2005;
	  set perwt_sum_2006_gq;
	  set perwt_sum_2006_notgq;
	  set Census.Pop_est_age_dc 
	       (keep=age_group pop_2005 pop_2006
	        where=(age_group=1));
	end;	  
	
	** Create new person weight for pooled samples **;
	** NB: There is no GQ sample in 2004 and 2005, so 2006 GQ sample is scaled up 3x **;
	
	if statefip = 11 then do;
	
	  ** DC **;
    
        ratio_in_hhs = perwt_sum_2006_notgq / ( perwt_sum_2006_notgq + perwt_sum_2006_gq );
        
        select ( year );
          when ( 5 ) do;
            ** 2005 **;
            perwt_pool = ( perwt / 2 ) * ( ( pop_2005 * ratio_in_hhs ) / perwt_sum_2005 );
          end;
          when ( 6 ) do;
            ** 2006 **;
            if not &is_group_quarters then do;
              ** Households **;
              perwt_pool = ( perwt / 2 ) * ( ( pop_2006 * ratio_in_hhs ) / perwt_sum_2006_notgq );
            end;
            else do; 
              ** Group quarters **;
              perwt_pool = ( perwt ) * ( ( ( ( pop_2005 + pop_2006 ) / 2 ) * ( 1 - ratio_in_hhs ) ) / perwt_sum_2006_gq );
            end;
          end;
          otherwise do;
            %err_put( msg="Unsupported year. " _n_= year= )
            stop;
          end;
        end;
        
      end;
      else do;
      
        select ( year );
          when ( 5 ) do;
            ** 2005 **;
            perwt_pool = ( perwt / 2 );
          end;
          when ( 6 ) do;
            ** 2006 **;
            if not &is_group_quarters then do;
              ** Households **;
              perwt_pool = ( perwt / 2 );
            end;
            else do; 
              ** Group quarters **;
              perwt_pool = ( perwt );
            end;
          end;
          otherwise do;
            %err_put( msg="Unsupported year. " _n_= year= )
            stop;
          end;
        end;
        
      end;
        
	label
	  perwt_pool = 'Person weight, pooled for 2005-2006 samples'
	  perwt = 'Person weight, original [Use PERWT instead]'
	  hhincome_adj = 'Annual household income (2006 $)'
	  incearn_adj = 'Annual earnings (2006 $)'
	  ;
	  
	drop ratio_in_hhs perwt_sum_: pop_: repwt: ;
	
	rename perwt=perwt_org perwt_pool=perwt;

run;

%File_info( data=Pooled, printobs=40 )

proc format;
  value gqb 
    1, 2, 5 = 'In HHs'
    3, 4    = 'In GQs';

proc tabulate data=Pooled format=comma12. noseps missing;
  class statefip gq year;
  var perwt_org perwt;
  table 
    /** Pages **/
    statefip=' ',
    /** Rows **/
    all='Total' gq=' ',
    /** Columns **/
    sum='Person weights' * ( ( perwt_org='Original' * year=' ' ) perwt='Pooled   2005-06' )
    / condense;
  format gq gqb.;
  title2 'Adjusted, pooled sample weights';
run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
