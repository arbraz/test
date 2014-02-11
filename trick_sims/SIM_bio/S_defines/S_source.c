
/* $Id: S_source.c auto 2013/09/29 21:26:09 user */
char *version_date_tag = "@(#)CP Version 07.23.1-1, Sun Sep 29 21:26:09 2013" ;
char *build_date = "Sun Sep 29 21:26:09 2013" ;
char *current_version = "07.23.1-1" ;
/* Headers that are always included for each sim */

#include <math.h>
#include <pthread.h>
#include <stdio.h>
#include <sys/types.h>
#ifndef __vxworks
#if __Lynx__
#  include <time.h>
#else
#  include <sys/time.h>
#endif
#else
#  include <sys/times.h>
#endif
#include <string.h>
#include <errno.h>

#ifdef __cplusplus
# include <new>

extern "C" {
#endif
# include "trick_utils/trick_adt/include/avl.h"
# include "trick_utils/trick_adt/include/lqueue.h"
#ifdef __cplusplus
}
#endif

#include "sim_services/env/get_trick_env.h"
#include "sim_services/include/parameter_types.h"
#include "sim_services/include/module_classes.h"
#include "sim_services/include/attributes.h"
#include "sim_services/include/release.h"
#include "trick_utils/trick_adt/include/MapStrToPtr.h"
#include "sim_services/include/exec_proto.h"
#include "sim_services/include/dr_proto.h"
#include "sim_services/include/io_proto.h"
#include "sim_services/include/input_processor_proto.h"
#include "sim_services/include/input_processor_error.h"
#include "sim_services/include/jobdata.h"
#include "sim_services/include/data_record.h"
#include "sim_services/include/regula_falsi.h"
#include "sim_services/include/io_alloc.h"
#include "sim_services/include/integrator.h"
#include "trick_utils/math/include/trick_math.h"

/* Headers taken from S_define */

#ifdef __cplusplus
extern "C" {
#endif

#include "bio/organs/include/organs.h"
#include "sim_services/include/executive.h"
#include "sim_services/include/integrator.h"

#ifdef __cplusplus
}
#endif
#define TRICK_DEBUG(X) if(trick->sys.exec.in.echo_job||trick->sys.exec.in.debugging)send_hs(stderr,"%.4f "#X"\n",trick->sys.exec.out.time)
#define MALF_BEFORE(job) \
    if( job.work.before_malf_triggers != NULL ) { \
        exec_malf_trigger(&(E->ip) , job.work.before_malf_triggers) ; \
    } \
    if( job.work.before_malf_vars != NULL ) { \
        exec_malf_var(&(E->ip) , job.work.before_malf_vars) ; \
    } \
    if( job.work.before_malf_jobs != NULL ) { \
        exec_malf_job(&(E->ip) , job.work.before_malf_jobs) ; \
    }
#define MALF_AFTER(job) \
    if( job.work.after_malf_triggers != NULL ) { \
        exec_malf_trigger(&(E->ip) , job.work.after_malf_triggers) ; \
    } \
    if( job.work.after_malf_vars != NULL ) { \
        exec_malf_var(&(E->ip) , job.work.after_malf_vars) ; \
    } \
    if( job.work.after_malf_jobs != NULL ) { \
        exec_malf_job(&(E->ip) , job.work.after_malf_jobs) ; \
    }

/* C Function Prototypes */

#ifdef __cplusplus
extern "C" {
#endif

/* sim_object dyn */
int     concentration_deriv(ORGANS*) ; 
int     organ_init(ORGANS*) ; 
int     organ_integ(INTEGRATOR*,ORGANS*) ; 

#ifdef __cplusplus
}
#endif


/* CPP Function Prototypes */



/* Init Function Prototypes */


#ifdef __cplusplus
extern "C" {
#endif
void init_attrORGANS( void ) ; 
void init_attrEXECUTIVE( void ) ;
void init_attrJOBDATA( void ) ;
void init_attrINTEGRATOR( void ) ;

#ifdef __cplusplus
}

void map_classes( void ) ;

#endif

#define NUM_IMPEXP 0


struct avl_table * alloc_tree_by_address ;
struct avl_table * deleted_addresses ;
struct avl_table * structs_tree ;
struct avl_table * alloc_tree_copy ;
struct avl_table * equiv_attributes ;

extern ATTRIBUTES attrALLOC_INFO[] ;
extern ATTRIBUTES attrALLOC_STATS[] ;
extern ATTRIBUTES attrATTRIBUTES[] ;
extern ATTRIBUTES attrBC_INFO[] ;
extern ATTRIBUTES attrCHILD_IPC[] ;
extern ATTRIBUTES attrCOMMANDLINE_ARGS[] ;
extern ATTRIBUTES attrDATA_RECORD[] ;
extern ATTRIBUTES attrDR_GROUP[] ;
extern ATTRIBUTES attrDR_INFO[] ;
extern ATTRIBUTES attrENUM_ATTR[] ;
extern ATTRIBUTES attrENUM_LIST[] ;
extern ATTRIBUTES attrEQUIV_ATTRIBUTES[] ;
extern ATTRIBUTES attrEVENT_CONDITION[] ;
extern ATTRIBUTES attrEXECUTIVE[] ;
extern ATTRIBUTES attrEXEC_IN[] ;
extern ATTRIBUTES attrEXEC_OUT[] ;
extern ATTRIBUTES attrEXEC_WORK[] ;
extern ATTRIBUTES attrGMTTIME[] ;
extern ATTRIBUTES attrGMT_STRUCT[] ;
extern ATTRIBUTES attrHS_MSG[] ;
extern ATTRIBUTES attrINDEX[] ;
extern ATTRIBUTES attrINPUT_DEF[] ;
extern ATTRIBUTES attrINPUT_EVENT[] ;
extern ATTRIBUTES attrINPUT_FILE[] ;
extern ATTRIBUTES attrINPUT_PROCESSOR[] ;
extern ATTRIBUTES attrINPUT_VAR[] ;
extern ATTRIBUTES attrINTEGRATOR[] ;
extern ATTRIBUTES attrImpExpConn[] ;
extern ATTRIBUTES attrJOBDATA[] ;
extern ATTRIBUTES attrJOBDATA_IN[] ;
extern ATTRIBUTES attrJOBDATA_WORK[] ;
extern ATTRIBUTES attrMCAST_INFO[] ;
extern ATTRIBUTES attrMONTE_CARLO[] ;
extern ATTRIBUTES attrMONTE_CARLO_RUN[] ;
extern ATTRIBUTES attrMONTE_INPUT[] ;
extern ATTRIBUTES attrMONTE_RANGE[] ;
extern ATTRIBUTES attrMONTE_SLAVE[] ;
extern ATTRIBUTES attrMONTE_VAR[] ;
extern ATTRIBUTES attrMONTE_WORK[] ;
extern ATTRIBUTES attrNAME_TO_ATTR[] ;
extern ATTRIBUTES attrORGANS[] ;
extern ATTRIBUTES attrRAND_GENERATOR[] ;
extern ATTRIBUTES attrREDO_INFO[] ;
extern ATTRIBUTES attrREF[] ;
extern ATTRIBUTES attrREF2[] ;
extern ATTRIBUTES attrREGULA_FALSI[] ;
extern ATTRIBUTES attrSEND_ME[] ;
extern ATTRIBUTES attrSIMTIME[] ;
extern ATTRIBUTES attrSIM_COM[] ;
extern ATTRIBUTES attrSLAVE[] ;
extern ATTRIBUTES attrTCDevice[] ;
extern ATTRIBUTES attrTRANSFORM[] ;
extern ATTRIBUTES attrTRICK_GSL_RANDIST[] ;
extern ATTRIBUTES attrTRICK_GSL_RETURN_TYPE[] ;
extern ATTRIBUTES attrTRICK_MALF[] ;
extern ATTRIBUTES attrTRICK_MALF_JOB[] ;
extern ATTRIBUTES attrTRICK_MALF_TRIGGER[] ;
extern ATTRIBUTES attrTRICK_MALF_VAR[] ;
extern ATTRIBUTES attrTrickErrorHndlr[] ;
extern ATTRIBUTES attrVALUE[] ;
extern ATTRIBUTES attrVALUE_LIST[] ;
extern ATTRIBUTES attrVARIABLE_NODE[] ;
extern ATTRIBUTES attrVARIABLE_SERVER[] ;
extern ATTRIBUTES attrVAR_DECLARE[] ;
extern ATTRIBUTES attrVAR_LIST[] ;
extern ATTRIBUTES attrV_DATA[] ;
extern ATTRIBUTES attrWAVE_FORM[] ;
extern ATTRIBUTES attrYY_EVENT_CONDITION[] ;
extern ATTRIBUTES attrparams_T[] ;
extern ATTRIBUTES attrstruct_ATTRIBUTES_tag[] ;
extern ATTRIBUTES attrstruct_INPUT_EVENT_struct[] ;
extern ATTRIBUTES attrstruct_INPUT_FILE_struct[] ;
extern ATTRIBUTES attrstruct_TRICK_MALF_JOB_struct[] ;
extern ATTRIBUTES attrstruct_TRICK_MALF_TRIGGER_struct[] ;
extern ATTRIBUTES attrstruct_TRICK_MALF_VAR_struct[] ;
extern ATTRIBUTES attrstruct_TRICK_MALF_struct[] ;
extern ATTRIBUTES attrstruct__TrickErrorHndlr[] ;
extern ATTRIBUTES attrstruct_data_record_struct[] ;


/* ENUMERATED TYPE STRUCTS */
extern ENUM_ATTR enumCHECKPOINT_TYPE[] ;
extern ENUM_ATTR enumDR_Buffering[] ;
extern ENUM_ATTR enumDR_Byte_Order[] ;
extern ENUM_ATTR enumDR_Destination[] ;
extern ENUM_ATTR enumDR_Format[] ;
extern ENUM_ATTR enumDR_Freq[] ;
extern ENUM_ATTR enumEuler_Seq[] ;
extern ENUM_ATTR enumExec_Clock[] ;
extern ENUM_ATTR enumFlag[] ;
extern ENUM_ATTR enumImpExpEnable[] ;
extern ENUM_ATTR enumInput_Oper[] ;
extern ENUM_ATTR enumIntegrator[] ;
extern ENUM_ATTR enumLanguage[] ;
extern ENUM_ATTR enumMS_SYNC_TYPE[] ;
extern ENUM_ATTR enumPANEL_SIZE[] ;
extern ENUM_ATTR enumPROCESS_TYPE[] ;
extern ENUM_ATTR enumRealtime_Process_ID[] ;
extern ENUM_ATTR enumRegula_Falsi[] ;
extern ENUM_ATTR enumSIM_COMMAND[] ;
extern ENUM_ATTR enumSIM_MODE[] ;
extern ENUM_ATTR enumTCCommBlocking[] ;
extern ENUM_ATTR enumTCCommFlag[] ;
extern ENUM_ATTR enumTRICK_FILE_PERMS[] ;
extern ENUM_ATTR enumTRICK_GSL_TYPE[] ;
extern ENUM_ATTR enumTRICK_MALF_JOB_ACTION[] ;
extern ENUM_ATTR enumTRICK_MONTE_EXIT_STATUS[] ;
extern ENUM_ATTR enumTRICK_MONTE_VAR_TYPE[] ;
extern ENUM_ATTR enumTRICK_REMOTE_SHELL[] ;
extern ENUM_ATTR enumTrickErrorLevel[] ;
extern ENUM_ATTR enumWave_Form[] ;
extern ENUM_ATTR enumrand_generator[] ;
extern ENUM_ATTR enumudp_kind_type[] ;
extern ENUM_ATTR enumuniform_generator[] ;
ENUM_LIST enum_list[] = { 
        { "CHECKPOINT_TYPE" , enumCHECKPOINT_TYPE } , 
        { "DR_Buffering" , enumDR_Buffering } , 
        { "DR_Byte_Order" , enumDR_Byte_Order } , 
        { "DR_Destination" , enumDR_Destination } , 
        { "DR_Format" , enumDR_Format } , 
        { "DR_Freq" , enumDR_Freq } , 
        { "Euler_Seq" , enumEuler_Seq } , 
        { "Exec_Clock" , enumExec_Clock } , 
        { "Flag" , enumFlag } , 
        { "ImpExpEnable" , enumImpExpEnable } , 
        { "Input_Oper" , enumInput_Oper } , 
        { "Integrator" , enumIntegrator } , 
        { "Language" , enumLanguage } , 
        { "MS_SYNC_TYPE" , enumMS_SYNC_TYPE } , 
        { "PANEL_SIZE" , enumPANEL_SIZE } , 
        { "PROCESS_TYPE" , enumPROCESS_TYPE } , 
        { "Realtime_Process_ID" , enumRealtime_Process_ID } , 
        { "Regula_Falsi" , enumRegula_Falsi } , 
        { "SIM_COMMAND" , enumSIM_COMMAND } , 
        { "SIM_MODE" , enumSIM_MODE } , 
        { "TCCommBlocking" , enumTCCommBlocking } , 
        { "TCCommFlag" , enumTCCommFlag } , 
        { "TRICK_FILE_PERMS" , enumTRICK_FILE_PERMS } , 
        { "TRICK_GSL_TYPE" , enumTRICK_GSL_TYPE } , 
        { "TRICK_MALF_JOB_ACTION" , enumTRICK_MALF_JOB_ACTION } , 
        { "TRICK_MONTE_EXIT_STATUS" , enumTRICK_MONTE_EXIT_STATUS } , 
        { "TRICK_MONTE_VAR_TYPE" , enumTRICK_MONTE_VAR_TYPE } , 
        { "TRICK_REMOTE_SHELL" , enumTRICK_REMOTE_SHELL } , 
        { "TrickErrorLevel" , enumTrickErrorLevel } , 
        { "Wave_Form" , enumWave_Form } , 
        { "rand_generator" , enumrand_generator } , 
        { "udp_kind_type" , enumudp_kind_type } , 
        { "uniform_generator" , enumuniform_generator } , 
        { "" , NULL }
} ;

int num_enum_list = 33 ; 
typedef struct td_dyn {
        ORGANS  organs ;
        INTEGRATOR  integ ;
        JOBDATA job[3] ;
} TD_dyn ;

ATTRIBUTES attrstruct_td_dyn[] = {
{ "organs", "ORGANS", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(ORGANS),0,0,Language_C,0x0,
  0,(char*)attrORGANS, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "integ", "INTEGRATOR", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(INTEGRATOR),0,0,Language_C,0x0,
  0,(char*)attrINTEGRATOR, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "job", "JOBDATA", "--", "", "",
  "Job Scheduling Info",
  3,TRICK_STRUCTURED,sizeof(JOBDATA),0,0,Language_C,0x0,
  0,(char*)attrJOBDATA, 1,{{3,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

ATTRIBUTES attrTD_dyn[] = {
{ "organs", "ORGANS", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(ORGANS),0,0,Language_C,0x0,
  0,(char*)attrORGANS, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "integ", "INTEGRATOR", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(INTEGRATOR),0,0,Language_C,0x0,
  0,(char*)attrINTEGRATOR, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "job", "JOBDATA", "--", "", "",
  "Job Scheduling Info",
  3,TRICK_STRUCTURED,sizeof(JOBDATA),0,0,Language_C,0x0,
  0,(char*)attrJOBDATA, 1,{{3,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

void init_attrTD_dyn( void );
void init_attrstruct_td_dyn( void );
void init_attrstruct_td_dyn(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrstruct_td_dyn[i++].offset = offsetof(struct td_dyn,organs) ;
        attrstruct_td_dyn[i++].offset = offsetof(struct td_dyn,integ) ;
        attrstruct_td_dyn[i++].offset = offsetof(struct td_dyn,job) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrstruct_td_dyn ;
        equiv->base = attrstruct_td_dyn ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrORGANS() ;
        init_attrINTEGRATOR() ;
        init_attrJOBDATA() ;
}

void init_attrTD_dyn(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrTD_dyn[i++].offset = offsetof(TD_dyn,organs) ;
        attrTD_dyn[i++].offset = offsetof(TD_dyn,integ) ;
        attrTD_dyn[i++].offset = offsetof(TD_dyn,job) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrTD_dyn ;
        equiv->base = attrstruct_td_dyn ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrORGANS() ;
        init_attrINTEGRATOR() ;
        init_attrJOBDATA() ;
}

typedef struct td_sys {
        EXECUTIVE  exec ;
        JOBDATA job[3] ;
} TD_sys ;

ATTRIBUTES attrstruct_td_sys[] = {
{ "exec", "EXECUTIVE", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(EXECUTIVE),0,0,Language_C,0x0,
  0,(char*)attrEXECUTIVE, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "job", "JOBDATA", "--", "", "",
  "Job Scheduling Info",
  3,TRICK_STRUCTURED,sizeof(JOBDATA),0,0,Language_C,0x0,
  0,(char*)attrJOBDATA, 1,{{3,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

ATTRIBUTES attrTD_sys[] = {
{ "exec", "EXECUTIVE", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(EXECUTIVE),0,0,Language_C,0x0,
  0,(char*)attrEXECUTIVE, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "job", "JOBDATA", "--", "", "",
  "Job Scheduling Info",
  3,TRICK_STRUCTURED,sizeof(JOBDATA),0,0,Language_C,0x0,
  0,(char*)attrJOBDATA, 1,{{3,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

void init_attrTD_sys( void );
void init_attrstruct_td_sys( void );
void init_attrstruct_td_sys(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrstruct_td_sys[i++].offset = offsetof(struct td_sys,exec) ;
        attrstruct_td_sys[i++].offset = offsetof(struct td_sys,job) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrstruct_td_sys ;
        equiv->base = attrstruct_td_sys ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrEXECUTIVE() ;
        init_attrJOBDATA() ;
}

void init_attrTD_sys(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrTD_sys[i++].offset = offsetof(TD_sys,exec) ;
        attrTD_sys[i++].offset = offsetof(TD_sys,job) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrTD_sys ;
        equiv->base = attrstruct_td_sys ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrEXECUTIVE() ;
        init_attrJOBDATA() ;
}

typedef struct td_sim {
    TD_sys sys ;
    TD_dyn dyn ;
} SIM ; 
ATTRIBUTES attrstruct_td_sim[] = {
{ "sys", "TD_sys", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(TD_sys),0,0,Language_C,0x0,
  0,(char*)attrTD_sys, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "dyn", "TD_dyn", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(TD_dyn),0,0,Language_C,0x0,
  0,(char*)attrTD_dyn, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

ATTRIBUTES attrSIM[] = {
{ "sys", "TD_sys", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(TD_sys),0,0,Language_C,0x0,
  0,(char*)attrTD_sys, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "dyn", "TD_dyn", "--", "", "",
  "Declared in S_define",
  3,TRICK_STRUCTURED,sizeof(TD_dyn),0,0,Language_C,0x0,
  0,(char*)attrTD_dyn, 0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
{ "","","","","","",
  0,0,0,0,0,Language_C,0,0,0,
  0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } };

void init_attrSIM( void );
void init_attrstruct_td_sim( void );
void init_attrstruct_td_sim(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrstruct_td_sim[i++].offset = offsetof(struct td_sim,sys) ;
        attrstruct_td_sim[i++].offset = offsetof(struct td_sim,dyn) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrstruct_td_sim ;
        equiv->base = attrstruct_td_sim ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrTD_sys() ;
        init_attrTD_dyn() ;
}

void init_attrSIM(void) {


        EQUIV_ATTRIBUTES * equiv;
        ATTRIBUTES* last_non_bf;
        int i = 0;
        static int initialized_1337 ;

        if ( initialized_1337 ) {
                return ;
        }
        initialized_1337 = 1 ;

        last_non_bf = NULL ;
        attrSIM[i++].offset = offsetof(SIM,sys) ;
        attrSIM[i++].offset = offsetof(SIM,dyn) ;

        equiv = (EQUIV_ATTRIBUTES*) malloc(sizeof(EQUIV_ATTRIBUTES));
        equiv->attr = attrSIM ;
        equiv->base = attrstruct_td_sim ;
        avl_insert(equiv_attributes , (void *)equiv) ;

        init_attrTD_sys() ;
        init_attrTD_dyn() ;
}


ATTRIBUTES attrTRICK[] = {
        { "trick", "top_level", "--", "", "",
        "Declared in S_define",
        3,TRICK_STRUCTURED,sizeof(TD_sys),0,0,Language_C,0,
        0,(char*)attrSIM, 0, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} } ,
        { "","","","","","",
          0,0,0,0,0,Language_C,0,0,0,
          0,{{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}} }
} ;

SIM * trick ;
SIM * trick_copy ;
MapStrToPtr * classes ;

/* Memory Init */
void memory_init( void ) {

        alloc_tree_by_address = avl_create(io_compare_addr, NULL , NULL) ;
        trick = (SIM *)ip_alloc(1 , (int)sizeof(SIM)) ;

#ifdef __cplusplus
        map_classes() ;
        new ( trick ) SIM ;

#endif
        return ;
}

int ref_name2_java(REF2 * R, char *name, VALUE_LIST * V ) {(void)R; (void)name; (void)V;  return(0);}

int ref_assignment_java(REF2 * R , VALUE_LIST * V) { (void)R; (void)V; return(0) ; }

int ref_get_java(REF2 * R , V_DATA * V) { (void)R; (void)V; return(0) ; }

int ref_get_type_java(REF2 * R) { (void)R; return(0) ; }

#ifdef __cplusplus
/* Map Classes */
void map_classes( void ) {

        return ;
}

#endif
/* Memory Contruct */
void memory_construct(char * address, char *cl, int num ) {

        (void)address ; (void)cl ; (void)num ;
        return ;
}

/* Copy Contruct */
void copy_construct(char * new_addr, char *old_addr, char *cl, int num ) {
#if 0
# ifdef __cplusplus
# endif
#endif
        (void)new_addr ; (void)old_addr ; (void)cl ; (void)num ;
        return ;
}

/* Memory Destruct */
void memory_destruct(char * address, char *cl, int num ) {
        (void)address ; (void)cl ; (void)num ;
        return ;
}

/* Memory Shutdown */
void memory_shutdown( void ) {
#ifdef __cplusplus
        trick->~SIM() ;
        if ( classes != NULL ) {
                SM_Delete(classes) ;
        }
#endif
        return ;
} 

/* Miscellaneous Executive Utility Functions */
static Realtime_Process_ID process_id = Master ;

#ifdef __cplusplus
extern "C" {
#endif

void mem_shutdown( void )                { memory_shutdown() ; }
EXECUTIVE * exec_get_exec( void )        { return( &(trick->sys.exec) ) ; }
char * exec_get_run_dir( void )          { return( trick->sys.exec.work.run_dir ) ; }
void * get_trick_start_addr( void )      { return( (void *)trick ); }
void * get_trick_end_addr( void )        { return( (void *)((char *)trick + sizeof(SIM) - 1)); }
void * get_trick_copy_start_addr( void ) { return( (void *)trick_copy ); }
void * get_trick_copy_end_addr( void )   { return( (void *)((char *)trick_copy + sizeof(SIM))); }
void init_param( REF2 *R )             { R->attr = attrTRICK ; R->address = (char *)trick ; }
int exec_get_input_job_select( void )    { return( 1 ) ; }
int exec_get_var_sync_job_select( void ) { return( 2 ) ; }

#ifdef __cplusplus
}
#endif

JOBDATA * exec_jobs[4] ; 
JOBDATA * all_jobs[6] ; 

void exec_set_job_list( void ) {

        exec_jobs[0] = &(trick->sys.job[2]);
        exec_jobs[1] = &(trick->sys.job[0]);
        exec_jobs[2] = &(trick->sys.job[1]);
        exec_jobs[3] = (JOBDATA*)NULL ;


        all_jobs[0] = &(trick->sys.job[2]);
        all_jobs[1] = &(trick->sys.job[0]);
        all_jobs[2] = &(trick->sys.job[1]);
        all_jobs[3] = &(trick->dyn.job[0]);
        all_jobs[4] = &(trick->dyn.job[1]);
        all_jobs[5] = &(trick->dyn.job[2]);
        return ;
}
void init_attr( void ) {

        NAME_TO_ATTR *nta ;


        structs_tree = avl_create(name_to_attr_cmp, NULL , NULL) ;
        equiv_attributes = avl_create(io_compare_attr, NULL , NULL) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ALLOC_INFO") ;
        nta->attr = attrALLOC_INFO ;
        nta->size = sizeof(ALLOC_INFO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ALLOC_STATS") ;
        nta->attr = attrALLOC_STATS ;
        nta->size = sizeof(ALLOC_STATS) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ATTRIBUTES") ;
        nta->attr = attrATTRIBUTES ;
        nta->size = sizeof(ATTRIBUTES) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("BC_INFO") ;
        nta->attr = attrBC_INFO ;
        nta->size = sizeof(BC_INFO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("CHILD_IPC") ;
        nta->attr = attrCHILD_IPC ;
        nta->size = sizeof(CHILD_IPC) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("COMMANDLINE_ARGS") ;
        nta->attr = attrCOMMANDLINE_ARGS ;
        nta->size = sizeof(COMMANDLINE_ARGS) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("DATA_RECORD") ;
        nta->attr = attrDATA_RECORD ;
        nta->size = sizeof(DATA_RECORD) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("DR_GROUP") ;
        nta->attr = attrDR_GROUP ;
        nta->size = sizeof(DR_GROUP) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("DR_INFO") ;
        nta->attr = attrDR_INFO ;
        nta->size = sizeof(DR_INFO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ENUM_ATTR") ;
        nta->attr = attrENUM_ATTR ;
        nta->size = sizeof(ENUM_ATTR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ENUM_LIST") ;
        nta->attr = attrENUM_LIST ;
        nta->size = sizeof(ENUM_LIST) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EQUIV_ATTRIBUTES") ;
        nta->attr = attrEQUIV_ATTRIBUTES ;
        nta->size = sizeof(EQUIV_ATTRIBUTES) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EVENT_CONDITION") ;
        nta->attr = attrEVENT_CONDITION ;
        nta->size = sizeof(EVENT_CONDITION) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EXECUTIVE") ;
        nta->attr = attrEXECUTIVE ;
        nta->size = sizeof(EXECUTIVE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EXEC_IN") ;
        nta->attr = attrEXEC_IN ;
        nta->size = sizeof(EXEC_IN) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EXEC_OUT") ;
        nta->attr = attrEXEC_OUT ;
        nta->size = sizeof(EXEC_OUT) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("EXEC_WORK") ;
        nta->attr = attrEXEC_WORK ;
        nta->size = sizeof(EXEC_WORK) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("GMTTIME") ;
        nta->attr = attrGMTTIME ;
        nta->size = sizeof(GMTTIME) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("GMT_STRUCT") ;
        nta->attr = attrGMT_STRUCT ;
        nta->size = sizeof(GMT_STRUCT) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("HS_MSG") ;
        nta->attr = attrHS_MSG ;
        nta->size = sizeof(HS_MSG) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INDEX") ;
        nta->attr = attrINDEX ;
        nta->size = sizeof(INDEX) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INPUT_DEF") ;
        nta->attr = attrINPUT_DEF ;
        nta->size = sizeof(INPUT_DEF) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INPUT_EVENT") ;
        nta->attr = attrINPUT_EVENT ;
        nta->size = sizeof(INPUT_EVENT) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INPUT_FILE") ;
        nta->attr = attrINPUT_FILE ;
        nta->size = sizeof(INPUT_FILE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INPUT_PROCESSOR") ;
        nta->attr = attrINPUT_PROCESSOR ;
        nta->size = sizeof(INPUT_PROCESSOR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INPUT_VAR") ;
        nta->attr = attrINPUT_VAR ;
        nta->size = sizeof(INPUT_VAR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("INTEGRATOR") ;
        nta->attr = attrINTEGRATOR ;
        nta->size = sizeof(INTEGRATOR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ImpExpConn") ;
        nta->attr = attrImpExpConn ;
        nta->size = sizeof(ImpExpConn) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("JOBDATA") ;
        nta->attr = attrJOBDATA ;
        nta->size = sizeof(JOBDATA) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("JOBDATA_IN") ;
        nta->attr = attrJOBDATA_IN ;
        nta->size = sizeof(JOBDATA_IN) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("JOBDATA_WORK") ;
        nta->attr = attrJOBDATA_WORK ;
        nta->size = sizeof(JOBDATA_WORK) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MCAST_INFO") ;
        nta->attr = attrMCAST_INFO ;
        nta->size = sizeof(MCAST_INFO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_CARLO") ;
        nta->attr = attrMONTE_CARLO ;
        nta->size = sizeof(MONTE_CARLO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_CARLO_RUN") ;
        nta->attr = attrMONTE_CARLO_RUN ;
        nta->size = sizeof(MONTE_CARLO_RUN) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_INPUT") ;
        nta->attr = attrMONTE_INPUT ;
        nta->size = sizeof(MONTE_INPUT) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_RANGE") ;
        nta->attr = attrMONTE_RANGE ;
        nta->size = sizeof(MONTE_RANGE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_SLAVE") ;
        nta->attr = attrMONTE_SLAVE ;
        nta->size = sizeof(MONTE_SLAVE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_VAR") ;
        nta->attr = attrMONTE_VAR ;
        nta->size = sizeof(MONTE_VAR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("MONTE_WORK") ;
        nta->attr = attrMONTE_WORK ;
        nta->size = sizeof(MONTE_WORK) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("NAME_TO_ATTR") ;
        nta->attr = attrNAME_TO_ATTR ;
        nta->size = sizeof(NAME_TO_ATTR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("ORGANS") ;
        nta->attr = attrORGANS ;
        nta->size = sizeof(ORGANS) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("RAND_GENERATOR") ;
        nta->attr = attrRAND_GENERATOR ;
        nta->size = sizeof(RAND_GENERATOR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("REDO_INFO") ;
        nta->attr = attrREDO_INFO ;
        nta->size = sizeof(REDO_INFO) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("REF") ;
        nta->attr = attrREF ;
        nta->size = sizeof(REF) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("REF2") ;
        nta->attr = attrREF2 ;
        nta->size = sizeof(REF2) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("REGULA_FALSI") ;
        nta->attr = attrREGULA_FALSI ;
        nta->size = sizeof(REGULA_FALSI) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("SEND_ME") ;
        nta->attr = attrSEND_ME ;
        nta->size = sizeof(SEND_ME) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("SIMTIME") ;
        nta->attr = attrSIMTIME ;
        nta->size = sizeof(SIMTIME) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("SIM_COM") ;
        nta->attr = attrSIM_COM ;
        nta->size = sizeof(SIM_COM) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("SLAVE") ;
        nta->attr = attrSLAVE ;
        nta->size = sizeof(SLAVE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TCDevice") ;
        nta->attr = attrTCDevice ;
        nta->size = sizeof(TCDevice) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRANSFORM") ;
        nta->attr = attrTRANSFORM ;
        nta->size = sizeof(TRANSFORM) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_GSL_RANDIST") ;
        nta->attr = attrTRICK_GSL_RANDIST ;
        nta->size = sizeof(TRICK_GSL_RANDIST) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_GSL_RETURN_TYPE") ;
        nta->attr = attrTRICK_GSL_RETURN_TYPE ;
        nta->size = sizeof(TRICK_GSL_RETURN_TYPE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_MALF") ;
        nta->attr = attrTRICK_MALF ;
        nta->size = sizeof(TRICK_MALF) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_MALF_JOB") ;
        nta->attr = attrTRICK_MALF_JOB ;
        nta->size = sizeof(TRICK_MALF_JOB) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_MALF_TRIGGER") ;
        nta->attr = attrTRICK_MALF_TRIGGER ;
        nta->size = sizeof(TRICK_MALF_TRIGGER) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TRICK_MALF_VAR") ;
        nta->attr = attrTRICK_MALF_VAR ;
        nta->size = sizeof(TRICK_MALF_VAR) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("TrickErrorHndlr") ;
        nta->attr = attrTrickErrorHndlr ;
        nta->size = sizeof(TrickErrorHndlr) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VALUE") ;
        nta->attr = attrVALUE ;
        nta->size = sizeof(VALUE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VALUE_LIST") ;
        nta->attr = attrVALUE_LIST ;
        nta->size = sizeof(VALUE_LIST) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VARIABLE_NODE") ;
        nta->attr = attrVARIABLE_NODE ;
        nta->size = sizeof(VARIABLE_NODE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VARIABLE_SERVER") ;
        nta->attr = attrVARIABLE_SERVER ;
        nta->size = sizeof(VARIABLE_SERVER) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VAR_DECLARE") ;
        nta->attr = attrVAR_DECLARE ;
        nta->size = sizeof(VAR_DECLARE) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("VAR_LIST") ;
        nta->attr = attrVAR_LIST ;
        nta->size = sizeof(VAR_LIST) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("V_DATA") ;
        nta->attr = attrV_DATA ;
        nta->size = sizeof(V_DATA) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("WAVE_FORM") ;
        nta->attr = attrWAVE_FORM ;
        nta->size = sizeof(WAVE_FORM) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("YY_EVENT_CONDITION") ;
        nta->attr = attrYY_EVENT_CONDITION ;
        nta->size = sizeof(YY_EVENT_CONDITION) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("params_T") ;
        nta->attr = attrparams_T ;
        nta->size = sizeof(params_T) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct ATTRIBUTES_tag") ;
        nta->attr = attrstruct_ATTRIBUTES_tag ;
        nta->size = sizeof(struct ATTRIBUTES_tag) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct INPUT_EVENT_struct") ;
        nta->attr = attrstruct_INPUT_EVENT_struct ;
        nta->size = sizeof(struct INPUT_EVENT_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct INPUT_FILE_struct") ;
        nta->attr = attrstruct_INPUT_FILE_struct ;
        nta->size = sizeof(struct INPUT_FILE_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct TRICK_MALF_JOB_struct") ;
        nta->attr = attrstruct_TRICK_MALF_JOB_struct ;
        nta->size = sizeof(struct TRICK_MALF_JOB_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct TRICK_MALF_TRIGGER_struct") ;
        nta->attr = attrstruct_TRICK_MALF_TRIGGER_struct ;
        nta->size = sizeof(struct TRICK_MALF_TRIGGER_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct TRICK_MALF_VAR_struct") ;
        nta->attr = attrstruct_TRICK_MALF_VAR_struct ;
        nta->size = sizeof(struct TRICK_MALF_VAR_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct TRICK_MALF_struct") ;
        nta->attr = attrstruct_TRICK_MALF_struct ;
        nta->size = sizeof(struct TRICK_MALF_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct _TrickErrorHndlr") ;
        nta->attr = attrstruct__TrickErrorHndlr ;
        nta->size = sizeof(struct _TrickErrorHndlr) ;
        avl_insert( structs_tree , (void *)nta ) ;

        nta = (NAME_TO_ATTR *)malloc(sizeof(NAME_TO_ATTR)) ;
        nta->name = strdup("struct data_record_struct") ;
        nta->attr = attrstruct_data_record_struct ;
        nta->size = sizeof(struct data_record_struct) ;
        avl_insert( structs_tree , (void *)nta ) ;

        init_attrSIM();

}
#ifdef __cplusplus
extern "C" {
#endif

int trick_function_calls(char *name , VALUE_LIST *V ) {
        /* this function doesn't work, so it got deleted */
        (void)name ; (void)V ;
        return(0) ;
}

#ifdef __cplusplus
}
#endif

ENV_VAL local_env[] = {
{ "TRICK_CATALOG_HOME" , "/home/user/trick_catalog" } ,
{ "TRICK_CAT_MGR_HOME" , "/home/user/trick/07.23.1/catalog" } ,
{ "TRICK_CC" , "cc" } ,
{ "TRICK_CFLAGS" , "-I/home/user/trick/07.23.1/trick_models" } ,
{ "TRICK_CPPC" , "c++" } ,
{ "TRICK_DEBUG" , "0" } ,
{ "TRICK_EDITOR" , "vi" } ,
{ "TRICK_EXEC_LINK_LIBS" , "" } ,
{ "TRICK_FORCE_32BIT" , "0" } ,
{ "TRICK_GTE_EXT" , "" } ,
{ "TRICK_HOME" , "/home/user/trick/07.23.1" } ,
{ "TRICK_HOST_CPU" , "Linux_4.4_212" } ,
{ "TRICK_HOST_CPU_USER_SUFFIX" , "" } ,
{ "TRICK_HOST_TYPE" , "Linux" } ,
{ "TRICK_ICG_EXCLUDE" , "" } ,
{ "TRICK_MAKE" , "" } ,
{ "TRICK_PATH" , "/home/user/trick/07.23.1/bin_Linux_4.4_212:/home/user/trick/07.23.1/bin" } ,
{ "TRICK_PRINTER_NAME" , "" } ,
{ "TRICK_PRINT_CMD" , "lpr" } ,
{ "TRICK_USER_CSHRC" , "/home/user/.Trick_user_cshrc" } ,
{ "TRICK_USER_HOME" , "/home/user/trick_sims" } ,
{ "TRICK_USER_LINK_LIBS" , "" } ,
{ "TRICK_USER_PROFILE" , "/home/user/.Trick_user_profile" } ,
{ "TRICK_VER" , "07.23.1" } 
};

int num_local_env = sizeof(local_env) / sizeof(ENV_VAL);
extern ENV_VAL * s_source_env ;
extern int num_s_source_env ;

void set_local_env( void ) {

        s_source_env = local_env ;
        num_s_source_env = num_local_env ;

}

#ifdef __cplusplus
extern "C" {
#endif

/*---------------------------------------------------------------------*/

int ref_attributes( REF *R , int alloc_enable) {

        int error = IP_PARAMETER_NAME ;
        (void)alloc_enable ; /* unused */

        R->attr_level = 0 ;

        if( R->dim[0] != 0 ) {
                /* This is an error condition */
                fprintf(stderr, "ERROR: S_source.c : ref_attributes.\n"
                 "       R->dim[0] != 0\n" ) ;
        }
        else if( ! strcmp( R->name[0] , "sys" ) ) {
                R->address = (char*)&(trick->sys) ;
                error = io_attr( attrTD_sys , R ) ;
        }
        else if( ! strcmp( R->name[0] , "dyn" ) ) {
                R->address = (char*)&(trick->dyn) ;
                error = io_attr( attrTD_dyn , R ) ;
        }
        return( error ) ;
}

/*---------------------------------------------------------------------*/

int ref_allocate( REF *R , int num ) {

        int error = IP_PARAMETER_NAME ;
        R->attr_level = 0 ;

        if( R->dim[0] != 0 ) {
                /* This is an error condition */
                fprintf(stderr, "ERROR: S_source.c : ref_allocate.\n"
                 "       R->dim[0] != 0\n" ) ;
        }
        else if ( ! strcmp( R->name[0] , "sys" ) ) {
                R->address = (char*)&(trick->sys) ;
                error = io_alloc( attrTD_sys , R , num , alloc_tree_by_address ) ;
        }
        else if ( ! strcmp( R->name[0] , "dyn" ) ) {
                R->address = (char*)&(trick->dyn) ;
                error = io_alloc( attrTD_dyn , R , num , alloc_tree_by_address ) ;
        }
        return( error ) ;
}

/*---------------------------------------------------------------------*/

int ref_multiallocate( REF *R ) {

        int error = IP_PARAMETER_NAME ;
        R->attr_level = 0 ;

        if( R->dim[0] != 0 ) {
                /* This is an error condition */
                fprintf(stderr, "ERROR: S_source.c : ref_multiallocate.\n"
                 "       R->dim[0] != 0\n" ) ;
        }
        else if ( ! strcmp( R->name[0] , "sys" ) ) {
                R->address = (char*)&(trick->sys) ;
                error = io_multialloc( attrTD_sys , R , alloc_tree_by_address ) ;
        }
        else if ( ! strcmp( R->name[0] , "dyn" ) ) {
                R->address = (char*)&(trick->dyn) ;
                error = io_multialloc( attrTD_dyn , R , alloc_tree_by_address ) ;
        }
        return( error ) ;
}

/*---------------------------------------------------------------------*/

char * get_var_name( char * ptr , ATTRIBUTES ** attr ) {

        ALLOC_INFO al ;
        ALLOC_INFO * ret_node ;

        if ( (long)ptr >= (long)&trick->dyn ) {
                return (io_get_var_name( ptr , attrTD_dyn , (char*)&(trick->dyn), "dyn" , attr )) ;
        }
        if ( (long)ptr >= (long)&trick->sys ) {
                return (io_get_var_name( ptr , attrTD_sys , (char*)&(trick->sys), "sys" , attr )) ;
        }

        al.start = (void *)ptr ;
        ret_node = (ALLOC_INFO *)avl_find( alloc_tree_by_address , (void *)&al ) ;
        if ( ret_node != NULL ) {
                return(ret_node->name) ;
        }

        return NULL;
}

/*---------------------------------------------------------------------*/

int get_fixed_truncated_size( char * ptr , int dims , ATTRIBUTES * attr ) {

        if ( (long)ptr >= (long)&trick->dyn ) {
                return (io_get_fixed_truncated_size( ptr , attrTD_dyn , (char*)&(trick->dyn), dims , attr )) ;
        }
        if ( (long)ptr >= (long)&trick->sys ) {
                return (io_get_fixed_truncated_size( ptr , attrTD_sys , (char*)&(trick->sys), dims , attr )) ;
        }
        return 0;
}

/*---------------------------------------------------------------------*/

void exec_writer( FILE *fp , VALUE_LIST *V ) {

        struct avl_traverser avl_t ;
        ALLOC_INFO * al ;
        LQUEUE *ptr_assigns ;
        LQUEUE *redo_assigns ;
        char * assign ;
        int ii ;

        ptr_assigns = LQ_Create() ;
        redo_assigns = LQ_Create() ;

        avl_t_init( &avl_t , alloc_tree_by_address ) ;
        while ( (al = (ALLOC_INFO *)avl_t_next(&avl_t)) != NULL ) {
                if ( al->name != NULL ) {
                        free(al->name) ;
                }
                al->name = NULL ;
        }
        alloc_tree_by_address->avl_compare = io_address_within ;
        if ( V == NULL ) {
                io_write( fp , attrTD_sys ,
                 (char*)&(trick->sys) , "sys", ptr_assigns, redo_assigns ) ;
                io_write( fp , attrTD_dyn ,
                 (char*)&(trick->dyn) , "dyn", ptr_assigns, redo_assigns ) ;
        }
        else {
                for ( ii = 0 ; ii < V->num_val ; ii++ ) {
                        if ( ! strcmp(V->v_data[ii].value.cp , "sys" )) {
                                io_write( fp , attrTD_sys , 
                                 (char*)&(trick->sys) , "sys", ptr_assigns, redo_assigns ) ;
                                break ;
                        }
                }
                for ( ii = 0 ; ii < V->num_val ; ii++ ) {
                        if ( ! strcmp(V->v_data[ii].value.cp , "dyn" )) {
                                io_write( fp , attrTD_dyn , 
                                 (char*)&(trick->dyn) , "dyn", ptr_assigns, redo_assigns ) ;
                                break ;
                        }
                }
        }

        io_write_redo_assigns( fp , ptr_assigns , redo_assigns ) ;

        while ( (assign = (char *)LQ_DeQ( ptr_assigns )) != NULL) {
                fprintf(fp, "%s\n", assign ) ;
                free( assign ) ;
        }

        free( ptr_assigns ) ;
        free( redo_assigns ) ;
        return ;
}

/*---------------------------------------------------------------------*/

void exec_clear( void ) {

        INPUT_EVENT * iep ;
        deleted_addresses = avl_create(io_compare_addr, NULL , NULL) ;
        deleted_addresses->avl_compare = io_address_within;
        io_clear( attrTD_sys , (char*)&(trick->sys), "sys" , deleted_addresses) ;
        io_clear( attrTD_dyn , (char*)&(trick->dyn), "dyn" , deleted_addresses) ;
        iep = trick->sys.exec.ip.event;
        while (iep != NULL) {
                int ii ;
                if (iep->name != NULL) ip_free((void **)&iep->name) ;
                if (iep->action != NULL) ip_free((void **)&iep->action) ;
                if (iep->action_filename != NULL) ip_free((void **)&iep->action_filename) ;
                for (ii = 0 ; ii < iep->num_conditions ; ii++ ) {
                        if (iep->conditions[ii].cond_str != NULL ) ip_free((void **)&iep->conditions[ii].cond_str) ;
                }
                iep = iep->next ;
        }
        trick->sys.exec.ip.event = NULL ;
        avl_destroy(deleted_addresses, io_delete_alloc_info_name_only);
        return ;
}

/*---------------------------------------------------------------------*/

void sie_resource( void ) {

        FILE * sie_file ;
        int ii , jj , kk, num ;
        char buf[1024];

        if( ( sie_file = fopen( "S_sie.resource" , "w" ) ) == NULL ) {
                fprintf( stderr , "ERROR: Cannot create 'S_sie.resource'\n" ) ;
                exit( 1 ) ;
        }

        for( ii = 0 ; ii < num_enum_list ; ii++ ) {
                num = 0 ;
                while( enum_list[ii].E[num].label[0] != '\0' ) num++ ;
        
                /*
                 * Tcl doesn't like the spaces
                 */
                for ( kk = 0 ; kk < (int)strlen(enum_list[ii].type_name) ; kk++ ) {
                    if ( enum_list[ii].type_name[kk] == ' ' ) {
                                buf[kk] = '_' ;
                    } else {
                                buf[kk] = enum_list[ii].type_name[kk] ;
                    }
                }
                buf[kk] = '\0' ;

                fprintf( sie_file, "set trick_enums(%s) {", buf );
                for( jj = 0 ; jj < num-1 ; jj++ ) {
                        fprintf( sie_file , "%s\t" , enum_list[ii].E[jj].label ) ;
                }
                fprintf( sie_file , "%s}\n" , enum_list[ii].E[jj].label ) ;
        }

        io_sie( sie_file , attrTD_sys , "sys" ) ;
        io_sie( sie_file , attrTD_dyn , "dyn" ) ;
        fclose( sie_file ) ;

        return ;
}

/*---------------------------------------------------------------------*/

void impexp_init( int child_index ) {

        (void)child_index ;
        return ;
}

/*---------------------------------------------------------------------*/

void impexp_disconnect(void) {

        int i ;

        for ( i = 0 ; i < NUM_IMPEXP ; i++) {
                if ( tc_isValid(&(trick->sys.exec.impexp.device[i])) ) {
                        tc_disconnect(&(trick->sys.exec.impexp.device[i])) ;
                }
        }
        return ;
}

/*---------------------------------------------------------------------*/

void exec_job_execution( FILE * fp ) {

        fprintf( fp , "\n"
         "===============================================================================\n"
         "Derivative, Integrate and Dynamic Event\n"
         "for job 0:\n" ) ;
        fprintf(fp,"%7d | %3d | %8.6f | %8.6f | %8g | %3d | %s\n",
         exec_jobs[0]->in.enabled && trick->dyn.job[1].in.enabled,
         exec_jobs[0]->in.process_id,exec_jobs[0]->in.start,
         exec_jobs[0]->in.cycle,exec_jobs[0]->in.stop,
         0,
         trick->dyn.job[1].in.name); 
        fprintf(fp,"%7d | %3d | %8.6f | %8.6f | %8g | %3d | %s\n",
         exec_jobs[0]->in.enabled && trick->dyn.job[2].in.enabled,
         exec_jobs[0]->in.process_id,exec_jobs[0]->in.start,
         exec_jobs[0]->in.cycle,exec_jobs[0]->in.stop,
         0,
         trick->dyn.job[2].in.name); 
        return ;
}

/*---------------------------------------------------------------------*/

void exec_collect_init( void ) {

        if( process_id == Master ) {
        }
        return ;
}

/*---------------------------------------------------------------------*/

void exec_default_data_modules( EXECUTIVE * E ) {

        return ;
}

/*---------------------------------------------------------------------*/

void exec_init_modules( EXECUTIVE * E , int id ) {

        EXEC_IN * EI ;
        EXEC_OUT * EO  ;
        EO = &(E->out) ;
        EI = &(E->in) ;

        switch( id ) {
                case 0:
                        if( trick->dyn.job[0].in.enabled == No ) {
                                break ;
                        }
                        if ( EI->debugging == On ) {
                                send_hs(stderr,"%.4f debugging pause before init_job organ_init()\n" , EO->time ) ;
                                pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
                        }
                        MALF_BEFORE(trick->dyn.job[0]);
                        TRICK_DEBUG( organ_init() );
                        organ_init(&(trick->dyn.organs)) ;
                        MALF_AFTER(trick->dyn.job[0]);
                        break;
        }

        return ;
}

/*---------------------------------------------------------------------*/

void exec_init_integ_check( void ) {

        return ;
}

/*---------------------------------------------------------------------*/

void exec_derivative_modules( EXECUTIVE * E ) {

        EXEC_WORK * EW = &(E->work) ;
        EXEC_IN * EI = &(E->in) ;
        EXEC_OUT * EO = &(E->out) ;

        if( trick->dyn.job[1].in.enabled == Yes ) {
                if ( EI->debugging == On ) {
                        send_hs(stderr,"%.4f debugging pause before concentration_deriv()\n" ,
                                EO->time ) ;
                        pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
                }
                EW->job_select[process_id] = 0;
                MALF_BEFORE(trick->dyn.job[1]);
                TRICK_DEBUG( concentration_deriv() );
                concentration_deriv(&(trick->dyn.organs)) ;
                MALF_AFTER(trick->dyn.job[1]);
        }
        return ;
}

/*---------------------------------------------------------------------*/

void exec_checkpoint_modules( EXECUTIVE * E ) {

        if( process_id == Master ) {
        }
        (void)E ;
        return ;
}

/*---------------------------------------------------------------------*/

void exec_pre_load_checkpoint_modules( EXECUTIVE * E ) {

        if( process_id == Master ) {
        }
        (void)E ;
        return ;
}

/*---------------------------------------------------------------------*/

void exec_restart_modules( EXECUTIVE * E ) {

        if( process_id == Master ) {
                exec_collect_init() ;
        }
        (void)E ;
        return ;
}

/*---------------------------------------------------------------------*/

int exec_scheduled_modules( EXECUTIVE * E , int job_index , int proc_id ) {

        int ret = 0 ;
        double outtime = 0.0;
        double clk_time = 0.0;

        /* For monte carlo */
        EXEC_IN * EI ;
        EXEC_OUT * EO  ;
        EXEC_WORK * EW ;
        EO = &(E->out) ;
        EI = &(E->in) ;
        EW = &(E->work) ;

        if ( EI->debugging == On && proc_id == Master ) {
                send_hs(stderr,"%.4f debugging pause before %d:%s\n" ,
                 EO->time, job_index, exec_jobs[job_index]->in.name ) ;
                pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
        }
        
	if( EI->frame_log == Yes ) {
                clk_time = clock_time(E , proc_id) ;
                EO->frame_sched_times[proc_id] += ( clk_time - EW->frame_last_time[proc_id] );
                if( (EW->num_job_time_samples != NULL ) && 
                    (EW->num_job_time_samples[proc_id-1] < ((EI->frame_log_max_samples-1)*4)) &&
                    (EO->time >= EI->frame_log_start_time) ) {
                        EW->job_times[proc_id-1][EW->num_job_time_samples[proc_id-1]] = clk_time ;
                        EW->job_time_ids[proc_id-1][EW->num_job_time_samples[proc_id-1]] = -1 ;
                        EW->num_job_time_samples[proc_id-1] += 1 ;
                        EW->job_times[proc_id-1][EW->num_job_time_samples[proc_id-1]] = clk_time ;
                        EW->job_time_ids[proc_id-1][EW->num_job_time_samples[proc_id-1]] = (short) job_index ;
                        EW->num_job_time_samples[proc_id-1] += 1 ;
                }
        }

        switch( job_index ) {
                case 0: {
                        int ipass ;
                        INTEGRATOR * I ;
                        EW->event_tgo = exec_jobs[0]->in.cycle ;
                        {
                                trick->dyn.integ.dt = EW->event_tgo ;
                                do {
                                        ipass = 0 ;
                                        I = &(trick->dyn.integ) ;
                                        if( I->init || I->first_step_deriv || I->intermediate_step != 0 ) {
                                                if( trick->dyn.job[1].in.enabled == Yes ) {
                                                        if ( EI->debugging == On ) {
                                                                send_hs(stderr,"%.4f debugging pause before concentration_deriv()\n" ,
                                                                        EO->time ) ;
                                                                pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
                                                        }
                                                        MALF_BEFORE(trick->dyn.job[1]);
                                                        TRICK_DEBUG( concentration_deriv() );
                                                        concentration_deriv(&(trick->dyn.organs)) ;
                                                        MALF_AFTER(trick->dyn.job[1]);
                                                }
                                        }

                                        if( trick->dyn.job[2].in.enabled == Yes ) {
                                                if ( EI->debugging == On ) {
                                                        send_hs(stderr,"%.4f debugging pause before organ_integ()\n" ,
                                                                EO->time ) ;
                                                        pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
                                                }
                                                MALF_BEFORE(trick->dyn.job[2]);
                                                TRICK_DEBUG( organ_integ() );
                                                ipass |= organ_integ(&(trick->dyn.integ), &(trick->dyn.organs)) ;
                                                MALF_AFTER(trick->dyn.job[2]);
                                        }

                                } while ( ipass ) ;

                                if (EW->xtra_derivative == Yes) {
                                        I = &(trick->dyn.integ) ;
                                        if( I->init || I->first_step_deriv || I->intermediate_step != 0 ) {
                                                if( trick->dyn.job[1].in.enabled == Yes ) {
                                                        if ( EI->debugging == On ) {
                                                                send_hs(stderr,"%.4f debugging pause before concentration_deriv()\n" ,
                                                                        EO->time ) ;
                                                                pthread_cond_wait(&(EI->go_cv[Master]), &(EI->go_mutex[Master])) ;
                                                        }
                                                        MALF_BEFORE(trick->dyn.job[1]);
                                                        TRICK_DEBUG( concentration_deriv() );
                                                        concentration_deriv(&(trick->dyn.organs)) ;
                                                        MALF_AFTER(trick->dyn.job[1]);
                                                }
                                        }

                                  ;}                           }
                }
                break ;
                case 1:
                        MALF_BEFORE(trick->sys.job[0]);
                      TRICK_DEBUG( input_processor() );
                        ret = input_processor(&(trick->sys.exec.ip));
                        MALF_AFTER(trick->sys.job[0]);
                        break ; 
                case 2:
                        MALF_BEFORE(trick->sys.job[1]);
                      TRICK_DEBUG( var_server_sync() );
                        ret = var_server_sync(&(trick->sys.exec));
                        MALF_AFTER(trick->sys.job[1]);
                        break ; 
        }

        if( EI->frame_log == Yes ) {
                outtime = clock_time(E , proc_id) ;
                EO->frame_job_time[job_index] += ( outtime - clk_time ) ;
                EW->frame_last_time[proc_id] = clk_time = outtime ;
                if( (EW->num_job_time_samples != NULL) &&
                    (EW->num_job_time_samples[proc_id-1] < ((EI->frame_log_max_samples-1)*4)) &&
                    (EO->time >= EI->frame_log_start_time) ) {
                        EW->job_times[proc_id-1][EW->num_job_time_samples[proc_id-1]] = clk_time ;
                        EW->job_time_ids[proc_id-1][EW->num_job_time_samples[proc_id-1]] = (short) job_index ;
                        EW->num_job_time_samples[proc_id-1] += 1 ;
                        EW->job_times[proc_id-1][EW->num_job_time_samples[proc_id-1]] = clk_time ;
                        EW->job_time_ids[proc_id-1][EW->num_job_time_samples[proc_id-1]] = -1 ;
                        EW->num_job_time_samples[proc_id-1] += 1 ;
                }
        }
        else {
                EO->frame_job_time[job_index] = 0.0 ;
        }

        return( ret ) ;
}

/*---------------------------------------------------------------------*/

void exec_monte_master_init_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_master_shutdown_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_master_prerun_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_master_postrun_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_slave_init_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_slave_shutdown_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_monte_slave_prerun_jobs(EXECUTIVE * E) {

        (void)E ;

}
/*---------------------------------------------------------------------*/

void exec_malf_modules(int job_id) {

        switch (job_id) {
        }
}
/*---------------------------------------------------------------------*/

int exec_malf_trigger_modules(int job_id) {

        int ret = 0 ;

        switch (job_id) {
        }
        return(ret) ;
}
/*---------------------------------------------------------------------*/

void exec_monte_slave_postrun_jobs(EXECUTIVE *E) {

        int run_num ;
        if ( tc_connect(&E->monte.work.data_conn) == TC_SUCCESS ) {
                run_num = htonl((uint32_t)E->monte.work.curr_run) ;
                tc_write(&E->monte.work.data_conn , (char *)&run_num , (int)sizeof(int));
                send_hs(stderr,"[31mSent results for run_num = %d[00m\n" , E->monte.work.curr_run ) ;
                tc_disconnect(&E->monte.work.data_conn) ;
        }
}
/*---------------------------------------------------------------------*/

void exec_freeze_init_modules( EXECUTIVE * E , int proc_id ) {

        (void)E ; (void)proc_id ;
        return ;
}
/*---------------------------------------------------------------------*/

void exec_freeze_modules( EXECUTIVE * E , int proc_id ) {

        (void)E ; (void)proc_id ;
        return ;
}
/*---------------------------------------------------------------------*/

void exec_unfreeze_modules( EXECUTIVE * E , int proc_id ) {

        (void)E ; (void)proc_id ;
        return ;
}
/*---------------------------------------------------------------------*/

void exec_shutdown_modules(EXECUTIVE * E , int proc_id) {

        (void)E ; (void)proc_id ;
        return ;
}
#ifdef __cplusplus
}
#endif

