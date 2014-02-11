/*****************************************************************************
PURPOSE:    ( Concentration calculation )
*****************************************************************************/
#include <stdio.h>
#include "../include/organs.h"

int concentration_deriv(
      ORGANS* O )
{
        static double time = 0.0 ;
	double A,B,C,D,E,F;
	double Cli, Clu, Cm;

	Cli = O->Cli;
	Clu = O->Clu;
	Cm = O->Cm;

	/* liver concentration calc */
	A = Clu/O->params.Plu - Cli/O->params.Pli;
	A = O->params.Qli / O->params.Vli *A;
	
	B = (O->params.Vmax_p_450 * Cli)/(O->params.Km_p_450 + Cli) * O->params.Mli * O->params.Pli;

	/* change in liver concentration for this time step */
	O->dC_liver_dt = A - B;
	

	/* lung concentration calc */
	C = O->params.Qm * Cm + O->params.Qli*Cli/O->params.Pli - O->params.Qlu*Clu/O->params.Plu;
	C = C / O->params.Vlu;

	D = (O->params.Vmax_p_450 * Clu)/(O->params.Km_p_450 + Clu) * O->params.Mlu * O->params.Plu;

	/* change in lung concentration for this time step */
	O->dC_lung_dt = C - D;
        

	/* tissue concentration calc */
	E = Clu/O->params.Plu - Cm;	
	E = O->params.Qm / O->params.Vm * E;

	F = O->params.kinj / O->params.Vm;

	/* change in tissue concentration for this time step */
	O->dC_tissue_dt = E + F;

        /*
         * Increment time by the time delta associated with this job
         * Note that the 0.01 matches the frequency of this job
         * as specified in the S_define.
         */
         time += 0.01 ;

	 

        return 0 ; 
}
