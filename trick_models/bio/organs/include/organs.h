/*************************************************************************
PURPOSE:      (Organ Structure)
**************************************************************************/

#ifndef _organ_h_
#define _organ_h_

#include "sim_services/include/regula_falsi.h"
#include "trick_utils/comm/include/tc.h"
#include "./organ_params.h"


typedef struct {

  double Cli;        /* *io -- Concentration in liver */ 
  double Clu;        /* *io -- Concentration in lung */
  double Cm;         /* *io -- Concentration in tissue */

  double dC_liver_dt;  /* -- Concentration rate in liver */
  double dC_lung_dt;  /* -- Concentration rate in lung */
  double dC_tissue_dt;  /* -- Concentration rate in medium tissue */

  params_T  params ;   /* *i M test */

  /* Impact */
  REGULA_FALSI rf ; /* -- Dynamic event  params for impact */

  /* Communication Connection */
  TCDevice connection ;  /* -- Socket connection for sending position */
} ORGANS ;


int concentration_deriv(
			ORGANS* organs );

#endif
