/*
 * This default data file was taken from:
 * /home/user/trick/07.23.1/trick_models/bio/organs/include/organ_integ.d
 * The header file is:
 * TRICK_HOME/trick_source/sim_services/include/integrator.h
 * The type substitution is:
 * INTEGRATOR -> dyn.integ
 */


/* $Id: S_source.c auto 2013/09/29 21:26:09 user */

#define NUM_STEP 12
#define NUM_VARIABLES 4

dyn.integ.state = alloc(NUM_VARIABLES) ;
dyn.integ.deriv = alloc(NUM_STEP) ;
dyn.integ.state_ws = alloc(NUM_STEP) ;

for (int kk = 0 ; kk < NUM_STEP ; kk++ ) {
    dyn.integ.deriv[kk] = alloc(NUM_VARIABLES) ;
    dyn.integ.state_ws[kk] = alloc(NUM_VARIABLES) ;
}

dyn.integ.stored_data = alloc(8) ;
for (int kk = 0 ; kk < 8 ; kk++ ) {
    dyn.integ.stored_data[kk] = alloc(NUM_VARIABLES) ;
}

dyn.integ.option = Runge_Kutta_2 ;
dyn.integ.init = True ;
dyn.integ.first_step_deriv = Yes ;
dyn.integ.num_state = NUM_VARIABLES ;

#undef NUM_STEP
#undef NUM_VARIABLES
