/************************************************************************
* Program:  Upuma.sas
* Library:  Ipums
* Project:  DC Data Warehouse
* Author:   P. Tatian
* Created:  10/13/04
* Version:  SAS 8.2
* Environment:  Windows
* 
* Description:  Autocall macro to create UPUMA (unique PUMA code) var.
*
* Modifications:
************************************************************************/

/** Macro Upuma - Start Definition **/

%macro Upuma( var=upuma, state=statefip, puma=puma );

  length &var $ 7;
  
  &var = put( &state, z2. ) || put( &puma, z5. );

  label &var = 'Unique PUMA ID (ssppppp)';

%mend Upuma;

/** End Macro Definition **/

