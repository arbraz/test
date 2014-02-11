/*
 * This default data file was taken from:
 * /home/user/trick/07.23.1/trick_source/sim_services/include/executive.d
 * The header file is:
 * TRICK_HOME/trick_source/sim_services/include/executive.h
 * The type substitution is:
 * EXECUTIVE -> sys.exec
 */


/* $Id: S_source.c auto 2013/09/29 21:26:09 user */

/*******************************************************************************
*                                                                              *
* Trick Simulation Environment Software                                        *
*                                                                              *
* Copyright (c) 1996,1997 LinCom Corporation, Houston, TX                      *
* All rights reserved.                                                         *
*                                                                              *
* Copyrighted by LinCom Corporation and proprietary to it. Any unauthorized    *
* use of Trick Software including source code, object code or executables is   *
* strictly prohibited and LinCom assumes no liability for such actions or      *
* results thereof.                                                             *
*                                                                              *
* Trick Software has been developed under NASA Government Contracts and        *
* access to it may be granted for Government work by the following contact:    *
*                                                                              *
* Contact: Charles Gott, Branch Chief                                          *
*          Simulation and Graphics Branch                                      *
*          Automation, Robotics, & Simulation Division                         *
*          NASA, Johnson Space Center, Houston, TX                             *
*                                                                              *
*******************************************************************************/
/*
PURPOSE: (Trick runtime executive initialization data.)

PROGRAMMERS:
    (((Robert W. Bailey) (LinCom Corp) 
       (September 1990) (v1.0) (Initial Release)))
*/

EXEC_IN * EI = &sys.exec.in ;
EXEC_OUT * EO = &sys.exec.out ;
EXEC_WORK * EW = &sys.exec.work ;
SIM_COM * ESC = &sys.exec.sim_com ;
INPUT_PROCESSOR * EIP = &sys.exec.ip ;

sys.exec.monte.in.activate = Off ;
sys.exec.monte.in.use_input_data  = Yes ;
sys.exec.monte.in.input_files  = alloc(16) ;
sys.exec.monte.in.timeout  = 120.0 ;
sys.exec.monte.in.max_tries  = 3 ;

sys.exec.in.enable_var_server = Yes ;
sys.exec.in.stripchart_sample_rate = 0.1 ;
sys.exec.in.reduced_checkpoint = Yes ;
sys.exec.in.safestore_checkpoint = No ;
sys.exec.in.safestore_period = 1.0e37 ;
sys.exec.in.time_tic = 0.00000000100000000 ;/* Resolution of simulation time */

sys.exec.in.rt_clock = Gettimeofday ;
sys.exec.in.rt_clock_ratio = 1.000 ;

sys.exec.ip.print_deprecated = Yes ;

/* Do not check for realtime overrun / underruns */
sys.exec.in.rt_max_overrun_cnt = 100000000 ;
sys.exec.in.rt_max_overrun_time {s} = 1.0e37 ;
sys.exec.in.rt_software_frame {s} = 1.0e37 ;
sys.exec.in.rt_nap = Yes ;
sys.exec.in.rt_itimer_frame {s} = 1.0e37 ;

/* Signal trap flags */
sys.exec.in.trap_sigsegv = On ;
sys.exec.in.trap_sigbus = On ;
sys.exec.in.trap_sigfpe = No ; /* FPE signals are normaly automatically traped
                                   and handled (default values substituted)
                                   by the OS - e.g. when dividing by 0 */
sys.exec.in.stack_trace = On ;

sys.exec.work.rt_software_frame_saved {s} = 1.0 ;
sys.exec.work.itimer_frame_cnt = -1 ; /* Must be -1 to account for first
                                          sync in itimer */
sys.exec.in.freeze_cycle {s} = 0.9999 ; /* Must be < 1.0 for setitimer() */

sys.exec.in.frame_log_max_samples = 1000 ;

/* Sim control panel */
sys.exec.sim_com.panel_size = Panel_Size_Normal;
sys.exec.sim_com.panel_x_pos = 0 ;
sys.exec.sim_com.panel_y_pos = 0 ;
sys.exec.sim_com.timeout = 60.0 ;
sys.exec.sim_com.data_rec_status = On;
sys.exec.sim_com.send_hs_device.port = 54;
sys.exec.sim_com.user_freeze_time {s} = 1.0e20 ;
sys.exec.sim_com.monitor_off = Off;

/* Simulation time to Real Time ratio displayed on Sim control panel */
sys.exec.work.sim_rt_ratio = 0.0; 

/* Slave activation/deactivation */
sys.exec.in.activate_slave[0] =
 Yes, Yes, Yes, Yes, Yes, Yes, Yes, Yes,
 Yes, Yes, Yes, Yes, Yes, Yes, Yes, Yes;
sys.exec.in.remote_shell = TRICK_SSH ;

/* Synchronization master/slave control */
sys.exec.in.rt_sync_frame {s} = 1.0e37 ;
sys.exec.in.sync_wait_limit {s} = 1.0e37 ;
sys.exec.in.ms_sync = No_sync;
sys.exec.in.sync_error_terminate = Yes;
sys.exec.in.sync_port_offset = 1;
sys.exec.work.next_sync_check {s} = 1.0e37;
sys.exec.work.slave_sync_at_init = Yes;
sys.exec.error_handler.report_level = TRICK_ERROR_SILENT;

sys.exec.work.max_var_servers = 64 ;
sys.exec.work.var_serve_broadcast = Yes ;
sys.exec.work.main_multicast_address = "224.2.71.82" ;
sys.exec.work.main_multicast_port = 8182 ;

sys.exec.work.dr_cpu_number = -1 ;

for ( int sync_cnt = 0 ; sync_cnt < 16 ; sync_cnt++ ) {
   sys.exec.work.sync[sync_cnt].error_handler = &sys.exec.error_handler ;
}
sys.exec.work.var_serve_listen_dev.error_handler = &sys.exec.error_handler ;
sys.exec.monte.work.sync_listen_dev.error_handler = &sys.exec.error_handler ;
sys.exec.monte.work.data_listen_dev.error_handler = &sys.exec.error_handler ;
sys.exec.monte.work.sync_conn.error_handler = &sys.exec.error_handler ;
sys.exec.monte.work.data_conn.error_handler = &sys.exec.error_handler ;

sys.exec.sim_com.send_hs_device.error_handler = alloc(1) ;
sys.exec.sim_com.send_hs_device.error_handler->report_level = TRICK_ERROR_SILENT ;

sys.exec.work.save_send_hs_buffer = Yes ;
sys.exec.work.save_var_server_msgs = Yes ;
sys.exec.work.send_hs_buffer_size = 1000000 ;
sys.exec.work.send_hs_buffering = DR_Thread_Buffer ;

sys.exec.work.xtra_derivative = No;

/* Set the default value to off for braodcasting events & malfs being fired */
sys.exec.work.event_malf_broadcast = Off;
