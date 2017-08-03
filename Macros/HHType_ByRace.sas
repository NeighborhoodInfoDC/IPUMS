/**************************************************************************
 Program:  HHType_ByRace.sas
 Library:  Ipums
 Project:  NeighborhoodInfo DC
 Author:   Rob Pitingolo
 Created:  09/21/11
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro in Ipums library to create HH type indicators
			   by defined race.

 Modifications:
**************************************************************************/

%macro HHType_ByRace( race,rc );

	if race_rc = &rc. then hhall_&race._&year. = 1;
	if is_family = 1 and race_rc = &rc. then family_&race._&year. = 1;
		else family_&race._&year. = 0;
	if own_children_18  > 0 and race_rc = &rc. then hhownchild_&race._&year. = 1;
		else hhownchild_&race._&year. = 0;
	if (is_mrdnokid = 1 or is_mrdwkids = 1) and race_rc = &rc. then married_&race._&year. = 1;
		else married_&race._&year. = 0;
	if (is_mrdwkids = 1 and own_children_18 > 0) and race_rc = &rc. then marchild_&race._&year. = 1;
		else marchild_&race._&year. = 0;
	if (is_smalwkids = 1 or (is_sngmal = 1 and is_family = 1)) and race_rc = &rc. then singmale_&race._&year. = 1;
		else singmale_&race._&year. = 0;
	if (is_smalwkids = 1 and own_children_18 > 0) and race_rc = &rc. then singmalechild_&race._&year. = 1;
		else singmalechild_&race._&year. = 0;
	if (is_sfemwkids = 1 or (is_sngfem = 1 and is_family = 1)) and race_rc = &rc. then singfem_&race._&year. = 1;
		else singfem_&race._&year. = 0;
	if (is_sfemwkids = 1 and own_children_18 > 0) and race_rc = &rc. then singfemchild_&race._&year. = 1;
		else singfemchild_&race._&year. = 0;
	if is_family = 0 and race_rc = &rc. then nonfam_&race._&year. = 1;
		else nonfam_&race._&year. = 0;
	if persons_hh = 1 and race_rc = &rc. then livealone_&race._&year. = 1;
		else livealone_&race._&year. = 0;

	label 
		hhall_&race._&year. = "Total &race. HHs, &year."
		family_&race._&year. = "&race. family HHs, &year."
		hhownchild_&race._&year. = "&race. families with own child under 18, &year."
		married_&race._&year. = "&race. married couple families, &year."
		marchild_&race._&year. = "&race. married couple families with own child under 18, &year."
		singmale_&race._&year. = "&race. male HH, no wife, family, &year."
		singmalechild_&race._&year. = "&race. male HH, no wife, family with own child under 18, &year."
		singfem_&race._&year. = "&race. female HH, no husband, family, &year."
		singfemchild_&race._&year. = "&race. female HH, no husband, family with own child under 18, &year."
		nonfam_&race._&year. = "&race. nonfamily HHs, &year."
		livealone_&race._&year. = "&race. householder living alone, &year."
	;

%mend HHType_ByRace;

/** End Macro Definition **/
