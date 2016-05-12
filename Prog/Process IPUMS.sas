
%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib(ipums);

proc contents data = ipums.Acs_2009_fam_pmsa99; run;


if is_mrdwkids = 1 and own_children_18 >0 then married_ownchild = 1;
if is_sfemwkids = 1 and own_children_18 >0 then singlefemale_ownchild = 1;
if is_smalwkids = 1 and own_children_18 >0 then singlemale_ownchild = 1;
