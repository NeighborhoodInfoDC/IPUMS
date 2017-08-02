/**************************************************************************
 Program:  Create_HHType.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Rob Pitingolo
 Created:  09/21/11
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro in Ipums library to create HH type indicators
			   broken down by race of householder.

 Modifications:
**************************************************************************/

%macro Create_HHType( year= );

/** Read-in and prep ACS data from the Ipums library **/ 
data Acs_&year._fam_pmsa99; set ipums.Acs_&year._fam_pmsa99; run;
data Acs_&year._dc; set ipums.Acs_&year._dc; run;

proc sort data = Acs_&year._fam_pmsa99 (where = (statefip = 11)); by serial; run;
proc sort data = Acs_&year._dc (where = (pernum = 1)); by serial; run;

data Acs_&year._dc_comb;
	merge Acs_&year._fam_pmsa99 Acs_&year._dc (keep = serial race hispan);
	by serial;

	/** Keep only cases with 1970 GQ definition **/
	if gq ^= 1 then delete;  

	/** Recode race variables to net-out Hispanics 
	1 = White Non-Hispanic
	2 = Black Non-Hispanic
	3 = Asian Non-Hispanic
	4 = Other Non-Hispanic
	5 = Hispanic                                **/
							
	if race = 1 and hispan = 0 then race_rc = 1;
		else if race = 2 and hispan = 0 then race_rc = 2;
		else if race = 4 and hispan = 0 then race_rc = 3;
		else if race = 5 and hispan = 0 then race_rc = 3;
		else if race = 5 and hispan = 0 then race_rc = 3;
		else if race = 3 and hispan = 0 then race_rc = 4;
		else if race = 7 and hispan = 0 then race_rc = 4;
		else if race = 8 and hispan = 0 then race_rc = 4;
		else if race = 9 and hispan = 0 then race_rc = 4;
		else if hispan = 1 then race_rc = 5;
		else if hispan = 2 then race_rc = 5;
		else if hispan = 3 then race_rc = 5;
		else if hispan = 4 then race_rc = 5;

	/** Create dummy variables to define each HH type **/ 

	hhall_&year. = 1;
	if is_family = 1 then family_&year. = 1;
		else family_&year. = 0;
	if own_children_18 > 0 then hhownchild_&year. = 1;
		else hhownchild_&year. = 0;
	if is_mrdnokid = 1 or is_mrdwkids = 1 then married_&year. = 1;
		else married_&year. = 0;
	if is_mrdwkids = 1 and own_children_18 > 0 then marchild_&year. = 1;
		else marchild_&year. = 0;
	if is_smalwkids = 1 or (is_sngmal = 1 and is_family = 1) then singmale_&year. = 1;
		else singmale_&year. = 0;
	if is_smalwkids = 1 and own_children_18 > 0 then singmalechild_&year. = 1;
		else singmalechild_&year. = 0;
	if is_sfemwkids = 1 or (is_sngfem = 1 and is_family = 1) then singfem_&year. = 1;
		else singfem_&year. = 0;
	if is_sfemwkids = 1 and own_children_18 > 0 then singfemchild_&year. = 1;
		else singfemchild_&year. = 0;
	if is_family = 0 then nonfam_&year. = 1;
		else nonfam_&year. = 0;
	if persons_hh = 1 then livealone_&year. = 1;
		else livealone_&year. = 0;

	label 
        hhall_&year. = "Total HHs, &year."
		family_&year. = "Family HHs, &year."
        hhownchild_&year. = "Families with own child under 18, &year."
		married_&year. = "Married couple families, &year."
		marchild_&year. = "Married couple families with own child under 18, &year."
		singmale_&year. = "Male HH, no wife, family, &year."
		singmalechild_&year. = "Male HH, no wife, family with own child under 18, &year."
		singfem_&year. = "Female HH, no husband, family, &year."
		singfemchild_&year. = "Female HH, no husband, family with own child under 18, &year."
		nonfam_&year. = "Nonfamily HHs, &year."
		livealone_&year. = "Householder living alone, &year."
	;


	/** Create dummy variables to define each HH type by race **/
		%HHType_ByRace (White,1);
		%HHType_ByRace (Black,2);
		%HHType_ByRace (Asian,3);
		%HHType_ByRace (Other,4);
		%HHType_ByRace (Hisp,5);

run;

/** Create macro variable list **/
%let hhtype_vars = hhall_&year. family_&year. hhownchild_&year. married_&year. marchild_&year. singmale_&year.
		singmalechild_&year. singfem_&year singfemchild_&year. nonfam_&year. livealone_&year.
		hhall_white_&year. family_white_&year. hhownchild_white_&year. married_white_&year. marchild_white_&year.
		singmale_white_&year. singmalechild_white_&year. singfem_white_&year.
		singfemchild_white_&year. nonfam_white_&year. livealone_white_&year.
		hhall_black_&year. family_black_&year. hhownchild_black_&year. married_black_&year. marchild_black_&year.
		singmale_black_&year. singmalechild_black_&year. singfem_black_&year.
		singfemchild_black_&year. nonfam_black_&year. livealone_black_&year.
		hhall_asian_&year. family_asian_&year. hhownchild_asian_&year. married_asian_&year. marchild_asian_&year.
		singmale_asian_&year. singmalechild_asian_&year. singfem_asian_&year.
		singfemchild_asian_&year. nonfam_asian_&year. livealone_asian_&year.
		hhall_other_&year. family_other_&year. hhownchild_other_&year. married_other_&year. marchild_other_&year.
		singmale_other_&year. singmalechild_other_&year. singfem_other_&year.
		singfemchild_other_&year. nonfam_other_&year. livealone_other_&year.
		hhall_hisp_&year. family_hisp_&year. hhownchild_hisp_&year. married_hisp_&year. marchild_hisp_&year.
		singmale_hisp_&year. singmalechild_hisp_&year. singfem_hisp_&year.
		singfemchild_hisp_&year. nonfam_hisp_&year. livealone_hisp_&year. ;


/** Sum the households in each category **/
proc means data = Acs_&year._dc_comb noprint;
	var &hhtype_vars. ;
	output out = hhtype_&year._summed
	sum = &hhtype_vars. ;
	weight hhwt ;
run;


/** Save the final dataset to the ipums directory **/
data ipums.hhtype_&year. ;
	set hhtype_&year._summed (drop = _type_ _freq_);
run;


%mend Create_HHType ;

/** End Macro Definition **/
