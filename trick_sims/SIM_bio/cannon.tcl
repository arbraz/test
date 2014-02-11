#! /bin/sh
# \
exec wish "$0" "$@"

# Grab package Trick's SimCom package
global auto_path
set auto_path [linsert $auto_path 0 $env(TRICK_HOME)/bin/tcl]
package require Simcom
namespace import Simcom::*

proc create { } {

        global cannon

        button .b -text "Fire Jet" -command "fire_jet $cannon(socket)"
        label  .l -textvariable cannon(x_position)
        pack .b .l
}

proc fire_jet { sock } {

        Simcom::send_cmd $sock "dyn.baseball.jet_on = 1 ;"
}

proc get_sim_data { } {

        global cannon

        Simcom::send_cmd $cannon(socket) "var_cycle = 0.5 ;"
        Simcom::send_cmd $cannon(socket) "var_add dyn.baseball.pos\[0\] ;"

        while { [gets $cannon(socket) sim_data] != -1 } {
                set cannon(x_position) [format "%.2f" $sim_data]
                update
        }
}

proc main { } {

        global cannon
        global argv

        set cannon(port) [lindex $argv 0] 
        set cannon(socket) [Simcom::connect "localhost" $cannon(port)]

        create

        get_sim_data
}

main
