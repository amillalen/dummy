#!/bin/bash
cd $WORKDIR

function queue_task_run_once(){
  jobcount=$(atq -q i|wc -l)
  if [ "$jobcount" == "0" ]; then
    at -q i -f $I3GWORKDIR/once.sh -t 202107231240
  fi
}

function clear_task_queue(){
   atq -q i|while read line;do jobn=$(echo "$line"|cut -d' ' -f1); echo "remove job $jobn"; atrm $jobn;done
}

queue_task_run_once

