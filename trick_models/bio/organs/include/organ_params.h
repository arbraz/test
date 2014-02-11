/*************************************************************************
PURPOSE:      (Organ params)
**************************************************************************/

#ifndef _organ_params_h_
#define _organ_params_h_

#include "sim_services/include/regula_falsi.h"
#include "trick_utils/comm/include/tc.h"

typedef struct {

        double Pli;        /* *i -- liver P param */ 
        double Plu;        /* *i -- lung P param  */ 
        double Qli;        /* *i -- liver Q param */ 
        double Qlu;        /* *i -- lung Q param */ 
        double Qm;         /* *i -- tissue Q param */ 
        double Vli;        /* *i -- liver V param */
        double Vlu;        /* *i -- lung V param */
        double Vm;         /* *i -- tissue V param */
	double Km_p_450;   /* *i -- Km param */
	double Vmax_p_450; /* *i -- Vmax p-450 param */
	double Mli;        /* *i -- Mli param */
	double Mlu;	   /* *i -- Mlu param */  
	double kinj;


} params_T ;

#endif
