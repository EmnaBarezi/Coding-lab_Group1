#!/bin/bash

   
 logs_dir="hospital_data/active_logs"
 arch_dir="hospital_data/archived_logs"
    
    declare -A FILES=( [1]="heart_rate.log" [2]="temperature.log" [3]="water_usage.log" )
    declare -A ARCHDIR=( [1]="heart_data_archive" [2]="temp_data_archive" [3]="water_data_archive" )
   
    
   echo "Select log to archive:"
  echo "1) Heart Rate (heart_rate.log)"
  echo "2) Temperature (temperature.log)"
  echo "3) Water Usage (water_usage.log)"
  
  read -rp "Enter choice (1-3):" choice

  if ! [[ "$choice" =~ ^[1-3]$ ]]; then
	  echo "Invalid choice" >&2
	  exit 1
     fi

     act_file= "$logs_dir/${FILES[$choice]}"
     archives_file= "$arch_dir/${ARCHDIR[$choice]}"

     if [ ! -f "$act_file" ]; then
  echo "Log file not found: $act__file" >&2
  exit 2
fi
