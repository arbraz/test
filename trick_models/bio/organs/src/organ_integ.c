/*****************************************************************************
PURPOSE:    ( Try Trick integration )
*****************************************************************************/
#include "sim_services/include/integrator.h"
#include "../include/organs.h"

int organ_integ(
      INTEGRATOR *I,
      ORGANS* O )
{

  /* Load current states */
  I->state[0] = O->Cli;
  I->state[1] = O->Clu;
  I->state[2] = O->Cm;

  /* Load derivatives */
  I->deriv[I->intermediate_step][0] = O->dC_liver_dt ;
  I->deriv[I->intermediate_step][1] = O->dC_lung_dt ;
  I->deriv[I->intermediate_step][2] = O->dC_tissue_dt ;


  /* Call the Trick integrator */
  integrate( I ) ;

  /* Unload new states */
  O->Cli = I->state_ws[I->intermediate_step][0] ;
  O->Clu = I->state_ws[I->intermediate_step][1] ;
  O->Cm  = I->state_ws[I->intermediate_step][2] ;

	
  /* Return step.  Used for multi-pass integration */
  return ( I->intermediate_step ) ;
}
