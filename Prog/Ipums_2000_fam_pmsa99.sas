************************************************************************
* Program:  Ipums_2000_fam_pmsa99.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  11/16/04
* Version:  SAS 8.2
* Environment:  Windows with SAS/Connect
* 
* Description:  Create HH level family vars. for IPUMS data.
*               Washington, D.C. PMSA (1999)
*
* Modifications:
   02/04/05  Added persons_hh (number of persons in HH) and 
             unrelated_pers (number of unrelated persons in HH)
   03/01/06  Corrected problems with IS_SNGFEM, IS_SNGMAL, 
             IS_SFEMWKIDS, IS_SMALWKIDS.
             Added vars GQ, STATEFIP, HHWT, HHH_SEX, HHH_AGE, 
             IS_ELDERLY, HAS_UNMRD_PRTNR.
             HAS_SPOUSE changed to 0/1.
************************************************************************;

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Ipums )

rsubmit;

*options obs=50;

data Ipums.Ipums_2000_fam_pmsa99
       (compress=binary 
        label="IPUMS 5% sample data, calculated family types (HH level), 2000, Washington, D.C. PMSA (1999)");

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

  set Ipums.Ipums_2000_pmsa99 
        (keep=serial statefip gq pernum age sex famsize sploc poploc momloc 
              marst related empstatd hhwt);
  by serial;
  
  *WHERE SERIAL = 1477709;

  if first.serial then do;
  
    *PUT SERIAL= ;
  
    related_pers = famsize;
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

  if 201 <= related < 1100 then do;
    if 301 <= related then do;                 ** Do not count spouse as related child **;
      if age < 6 then related_children_6 + 1;
      if age < 18 then related_children_18 + 1;
    end;
  end;
  else if 1100 <= related < 1270 then do;      ** Do not count group quarters pers as unrelated **;
    unrelated_pers + 1;
  end;
  
  ** Check for unmarried partner **;
  
  if not( has_spouse ) and related = 1114 then has_unmrd_prtnr = 1;
  
  *PUT SERIAL= PERNUM= RELATED= SEX= AGE= FAMSIZE= SPLOC= POPLOC= MOMLOC= RELATED_PERS= HAS_SPOUSE=
      HAS_UNMRD_PRTNR= OWN_CHILDREN_18= ;

  *PUT SERIAL= PERNUM= RELATED= FAMSIZE= PERSONS_HH= RELATED_PERS= UNRELATED_PERS= ;

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
    
    *PUT ( HHH_SEX HHH_AGE IS_: ) ( = ) /;
  
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

** Purge older versions **;

x "purge [dcdata.Ipums.data]Ipums_2000_fam_pmsa99.*";

%File_info( data=Ipums.Ipums_2000_fam_pmsa99, freqvars=gq )

** Register with metadata system **;

%Dc_update_meta_file(
  ds_lib=Ipums,
  ds_name=Ipums_2000_fam_pmsa99,
  creator_process=Ipums_2000_fam_pmsa99.sas,
  revisions=%str(Corrected problems with IS_SNGFEM, IS_SNGMAL, IS_SFEMWKIDS, IS_SMALWKIDS. Added vars GQ, STATEFIP, HHWT, HHH_SEX, HHH_AGE, IS_ELDERLY, HAS_UNMRD_PRTNR. HAS_SPOUSE changed to 0/1.),
  restrictions=None
)

run;

endrsubmit;

signoff;

