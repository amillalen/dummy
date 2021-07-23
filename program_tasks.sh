#!/bin/bash
cd $WORKDIR


function queue_task_run_once(){
  jobscript=$1
  jobexecdate=$2
  jobcount=$(atq -q i|wc -l)
  now=$(date '+%Y%m%d%H%M')
  if [[ "$jobcount" == "0"  && "$now" -le  "$jobexecdate" ]]; then
    at -q i -f $jobscript -t $jobexecdate
  fi
}

function clear_task_queue(){
   atq -q i|while read line;do jobn=$(echo "$line"|cut -d' ' -f1); echo "remove job $jobn"; atrm $jobn;done
}

queue_task_run_once "$I3GTASKDIR/once.sh" 202107231800
