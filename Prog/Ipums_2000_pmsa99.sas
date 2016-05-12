************************************************************************
* Program:  Ipums_2000_pmsa99.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  10/13/04
* Version:  SAS 8.2
* Environment:  Windows with SAS/Connect
* 
* Description:  Create SAS view of IPUMS 2000 data for Wash. region
* (PMSA 1999).
*
* Modifications:
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

rsubmit;

data Ipums.Ipums_2000_pmsa99 
  (label="IPUMS 5% sample data, 2000, Washington, D.C. PMSA (1999)") / view=Ipums.Ipums_2000_pmsa99;

  set 
    Ipums.Ipums_2000_dc
    Ipums.Ipums_2000_md
    Ipums.Ipums_2000_va
    Ipums.Ipums_2000_wv;
    
  by serial;

  where put( upuma, $pumareg. ) ~= 'Outside region';

  ** Recode n/a values **;
  
  array inca{*} inctot incwage incbus00 incretir incinvst hhincome value ftotinc;

  do i = 1 to dim( inca );
    if inca{i} = 999999 then inca{i} = .n;
  end;

  array incb{*} incss incwelfr incsupp incother;

  do i = 1 to dim( incb );
    if incb{i} = 99999 then incb{i} = .n;
  end;

  rename value=valueh;
  
  drop i;

run;

%File_info( data=Ipums.Ipums_2000_pmsa99, printobs=5, freqvars=statefip acre: )

run;

endrsubmit;

