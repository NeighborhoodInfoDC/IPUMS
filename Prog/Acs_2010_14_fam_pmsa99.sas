/**************************************************************************
 Program:  Acs_2010_14_fam_pmsa99.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   P Tatian
 Created:  08/02/2017
 Version:  SAS 9.2
 Environment:  Windows
 
 Description: Create HH level family vars. for IPUMS data.
 Washington, D.C. PMSA (1999)

 Modifications: 
 07/21/16 MW Modified for SAS1 Server
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Ipums )

%let revisions = %str(Updated code for counting related and unrelated persons.);

data Acs_2010_14_fam_pmsa99;

  length related_pers has_spouse has_unmrd_prtnr 
         own_children_18 related_children_18 related_children_6 
         is_family is_mrdwkids is_mrdnokid is_sfemwkids is_smalwkids 
         is_sngfem is_sngmal is_civilian is_elderly 3;

  retain related_pers has_spouse has_unmrd_prtnr own_children_18 
         related_children_18 related_children_6 is_civilian 
         persons_hh unrelated_pers hhh_sex hhh_age;

  array flags{*} 
        is_family is_mrdwkids is_mrdnokid is_sfemwkids is_smalwkids 
        is_sngfem is_sngmal  ;

  set Ipums.Acs_2010_14_pmsa99 
        (keep=serial statefip gq pernum age sex famsize sploc poploc momloc 
              marst related empstatd hhwt);
  by serial;
  
  if first.serial then do;
  
    related_pers = 0;
    hhh_sex = sex;
    hhh_age = age;
    own_children_18 = 0;
    related_children_18 = 0;
    related_children_6 = 0;
    unrelated_pers = 0;
    persons_hh = 0;
    has_unmrd_prtnr = 0;

    if sploc > 0 then has_spouse = 1;
    else has_spouse = 0;
    
    if empstatd in ( 13, 14, 15 ) then is_civilian = 0;
    else is_civilian = 1;

  end;
  
  ** Persons in HH **;
  
  persons_hh + 1;
  
  ** Count up own and related children, unrelated persons **;
  
  if ( poploc = 1 or momloc = 1 ) and age < 18 and marst = 6 then 
    own_children_18 + 1;

  if ( 101 <= related < 1115 ) or ( 1270 <= related <= 1301 ) then do;
    related_pers + 1;
    if 301 <= related then do;                 ** Do not count household head or spouse as related child **;
      if age < 6 then related_children_6 + 1;
      if age < 18 then related_children_18 + 1;
    end;
  end;
  else if 1115 <= related < 1270 then do;      ** Do not count group quarters pers as unrelated **;
    unrelated_pers + 1;
  end;
  
  ** Check for unmarried partner **;
  
  if not( has_spouse ) and related = 1114 then has_unmrd_prtnr = 1;
  
  if last.serial then do;

    do i = 1 to dim( flags );
      flags{i} = 0;
    end;

    if related_pers > 1 then do;
    
      is_family = 1;
    
      if has_spouse then do;
        if related_children_18 > 0 then is_mrdwkids = 1;
        else is_mrdnokid = 1;
      end;

    end;
    
    if not( has_spouse ) then do;
    
      if related_children_18 > 0 then do;
        if hhh_sex = 1 then is_smalwkids = 1;
        else is_sfemwkids = 1;
      end;
      else do;
        if hhh_sex = 1 then is_sngmal = 1;
        else is_sngfem = 1;
      end;
      
    end;

	** Flag elderly HH heads (65+ years old) **;

	if hhh_age >= 65 then is_elderly = 1;
	else is_elderly = 0;
    
    ** Test consistency **;
    
    if persons_hh ~= related_pers + unrelated_pers then do;
      %Err_put( msg="PERSONS_HH ~= RELATED_PERS + UNRELATED_PERS:  "
                    serial= persons_hh= related_pers= unrelated_pers= ) 
    end;
    
    output;
    
  end;
  
  label
    has_spouse = "Householder's spouse present in HH"
    has_unmrd_prtnr = "Householder's unmarried partner present in HH"
    is_civilian = "Householder is a civilian"
    is_family = "Is a family household"
    is_mrdnokid = "Is a married-couple family with no related children"
    is_mrdwkids = "Is a married-couple family with related children"
    is_sfemwkids = "Is a female-headed family with related children"
    is_smalwkids = "Is a male-headed family with related children"
    is_sngfem = "Is a single female-headed HH"
    is_sngmal = "Is a single male-headed HH"
    is_elderly = "Householder is elderly (65+ years old)"
    own_children_18 = "Number of householder's own children under 18 present in HH"
    related_children_6 = "Number of householder's related children under 6 in HH"
    related_children_18 = "Number of householder's related children under 18 in HH"
    persons_hh = "Total number of persons in HH"
    related_pers = "Number of related persons in HH"
    unrelated_pers = "Number of unrelated persons in HH"
    hhh_sex = "Sex of householder"
    hhh_age = "Age of householder";
  
  format hhh_sex sex.;

  keep statefip serial gq hhwt persons_hh related_pers unrelated_pers 
       has_spouse has_unmrd_prtnr 
       own_children_18 related_children_18 related_children_6 is_: 
       hhh_sex hhh_age;

run;

** File info **;

%Finalize_data_set( 
  /** Finalize data set parameters **/
  data=Acs_2010_14_fam_pmsa99,
  out=Acs_2010_14_fam_pmsa99,
  outlib=IPUMS,
  label="ACS microdata, calculated family types (HH level), 2010-14, Washington, D.C. PMSA (1999)",
  sortby=serial,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=10,
  freqvars=gq
)

run;

