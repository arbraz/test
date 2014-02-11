/*****************************************************************************
PURPOSE: (Initialize the organs) 
*****************************************************************************/
#include <stdio.h>
#include <math.h>
#include "../include/organs.h"

int organ_init(
	       ORGANS* O) 
{
  O->Cli = O->Cli ;
  O->Clu = O->Clu ;
  O->Cm = O->Cm ;
  O->params.Pli = O->params.Pli ;
  O->params.Plu = O->params.Plu ;
  O->params.Qli = O->params.Qli ;
  O->params.Qlu = O->params.Qlu ;
  O->params.Qm = O->params.Qm ;
  O->params.Vli = O->params.Vli ;
  O->params.Vlu = O->params.Vlu ;
  O->params.Vm = O->params.Vm ;
  O->params.Km_p_450 = O->params.Km_p_450 ;
  O->params.Vmax_p_450 = O->params.Vmax_p_450 ;
  O->params.Mli = O->params.Mli ;
  O->params.Mlu = O->params.Mlu ;
  O->params.kinj = O->params.kinj ;

  return 0 ; 
}
