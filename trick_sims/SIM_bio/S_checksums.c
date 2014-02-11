
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#define NUM_FILES 12

typedef struct {
   char * file_name ;
   int fn_match ;
   char * version ;
   char * date ;
   char * owner ;
   int checksum ; /* 1 = match , 0 = no match , -1 = no base checksum , -2 = realtime check */
   int chk1 ;
   int chk2 ;
} FILE_VERSIONS ;

FILE_VERSIONS fver_list[] = {
   {"/home/Alex/trick_models/bio/organs/include/organ_integ.d" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/include/organ_params.h" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/include/organs.d" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/include/organs.h" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/src/concentration_deriv.c" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/src/organ_init.c" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"/home/Alex/trick_models/bio/organs/src/organ_integ.c" , 1 , "--" , "--" , "--" , -1 , 0 , 0 } ,
   {"./Default_data/S_dyn_integ_organ_integ.d" , 1 , "auto" , "2014/02/11 15:38:05" , "Alex" , -2 , 7688 , 2} ,
   {"./Default_data/S_dyn_organs_organs.d" , 1 , "auto" , "2014/02/11 15:38:05" , "Alex" , -2 , 61249 , 2} ,
   {"./Default_data/S_sys_exec_executive.d" , 1 , "auto" , "2014/02/11 15:38:05" , "Alex" , -2 , 10375 , 12} ,
   {"./S_default.dat" , 1 , "auto" , "2014/02/11 15:38:05" , "Alex" , -2 , 22738 , 15} ,
   {"./S_source.c" , 1 , "auto" , "2014/02/11 15:38:05" , "Alex" , -2 , 23949 , 127} ,
   {"",0,"","","",0,0,0}
} ;
/* PROTOTYPE */
void version_print(FILE * fp , int calc_rt_chksums);
void version_print(FILE * fp , int calc_rt_chksums) {
   int i ;
   FILE *pipe1 ;
   int calc_chk1 , calc_chk2 ;
   char buf1[256] ;
   extern char *current_version ;
   char white[6] , red[6] , yellow[6] ;
   
   if ( fp == stderr ) {
       strcpy(white , "[00m") ;
       strcpy(red , "[31m") ;
       strcpy(yellow , "[33m") ;
       fprintf(fp, "\nBuilt with Trick version %s\n", current_version) ;
   }
   else {
       white[0] = red[0] = yellow[0] = '\0' ;
   }

   fprintf(fp, "\nLegend\n" ) ;
   fprintf(fp, "chksum = good , diff(erent) , undef(ined)\n" ) ;
   fprintf(fp, "version, owner and RCS date come from RCS log information from each file\n" ) ;
   fprintf(fp, "auto = auto generated file, no RCS information available\n\n" ) ;
   fprintf(fp, "chksum  version  owner      RCS date            file name\n") ;
   fprintf(fp, "-------------------------------------------------------------------------------\n") ;
   for ( i = 0 ; i < NUM_FILES ; i++ ) {
      if ( fver_list[i].checksum == 1 ) {
         fprintf(fp , "%sgood    %-8s %-10s %-19s %s\n", white , fver_list[i].version ,
          fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
      }
      else if ( fver_list[i].checksum == 0 ) {
         fprintf(fp , "%sdiff    %-8s %-10s %-19s %s\n", red , fver_list[i].version ,
          fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
      }
      else if ( fver_list[i].checksum == -1 ) {
         fprintf(fp , "%sundef   %-8s %-10s %-19s %s\n", yellow , fver_list[i].version ,
          fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
      }
      else if ( calc_rt_chksums ) {
         if ( access(fver_list[i].file_name, R_OK) == 0 ) {
#if __linux
            sprintf(buf1 , "/usr/bin/sum -s %s" , fver_list[i].file_name) ;
#elif __APPLE__
            sprintf(buf1 , "/usr/bin/cksum -o 2 %s" , fver_list[i].file_name) ;
#else
            sprintf(buf1 , "/usr/bin/sum %s" , fver_list[i].file_name) ;
#endif
            if ((pipe1 = popen(buf1, "r")) != NULL) {
               if (fscanf(pipe1, "%d %d" , &calc_chk1 , &calc_chk2) == 2) {
                  if ( calc_chk1 == fver_list[i].chk1 && calc_chk2 == fver_list[i].chk2) {
                     fprintf(fp , "%sgood    %-8s %-10s %-19s %s\n", white , fver_list[i].version ,
                      fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
                  }
                  else {
                     fprintf(fp , "%sdiff    %-8s %-10s %-19s %s\n", red , fver_list[i].version ,
                      fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
                  }
               }
            }
         }
         else {
            fprintf(fp , "%sundef   %-8s %-10s %19s %s\n", yellow , fver_list[i].version ,
             fver_list[i].owner, fver_list[i].date, fver_list[i].file_name ) ;
         }
      }
   }

   fprintf(fp , "%s", white) ;

}
