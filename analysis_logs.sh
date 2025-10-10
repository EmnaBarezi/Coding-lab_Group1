#!/usr/bin/bash

BASE_DIR="hospital_data"
ACTIVE_DIR="$BASE_DIR/active_logs"
REPORT_DIR="$BASE_DIR/reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"

mkdir -p "$REPORT_DIR"

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3): " choice

if [[ "$choice" != "1" && "$choice" != "2" && "$choice" != "3" ]]; then
    echo " Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi

case "$choice" in
    1) log_file="hospital_data/active_logs/heart_rate_log.log" ;;
    2) log_file="hospital_data/active_logs/temperature_log.log" ;;
    3) log_file="hospital_data/active_logs/water_usage_log.log" ;;
esac

echo "You selected: $log_file"

echo "" >> "$REPORT_FILE"
echo "===== Analysis: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$REPORT_FILE"
echo "Log file: $log_file" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Device Counts:" >> "$REPORT_FILE"

awk '{gsub(/[:]/,"",$3); print $3}' "$log_file" | sort | uniq -c >> "$REPORT_FILE"

first_ts=$(head -n1 "$log_file" | awk '{print $1, $2}')
last_ts=$(tail -n1 "$log_file" | awk '{print $1, $2}')


echo "" >> "$REPORT_FILE"
echo "First entry: $first_ts" >> "$REPORT_FILE"
echo "Last entry : $last_ts" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Analysis complete! Results saved in: $REPORT_FILE"

