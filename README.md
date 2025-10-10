
Hospital Data Monitoring & Archival System

Automated log management for a hospital environment: collects real-time device data, archives logs safely on demand, and analyzes usage patterns to produce actionable reports, all with standard Linux tools and interactive Bash scripts.
Repo name: Coding-lab_Group1
Contributors assessed via: GitHub commits (per member)

Overview
This project demonstrates a complete log lifecycle:
Collection Python simulators stream readings from devices (heart rate, temperature, water usage) into hospital_data/active_logs/.


Archival: An interactive Bash script rotates a selected active log into its archive folder with a precise timestamp and immediately recreates a fresh active log (so collection never stops).


Analysis: Another interactive Bash script parses logs, counts events per device, extracts temporal ranges (first/last entry), and appends a formatted report to reports/analysis_report.txt.


Features
Interactive menus using Bash select/case


Safe log rotation (mv + touch) with timestamps


Device statistics via awk | sort | uniq -c


Append-only reporting with run metadata and timestamps


Defensive error handling for missing files, bad input, and perms


Simple, portable, dependency-light (POSIX tools + Python 3)













Repository Structure:



[
"hospital_data/",
"├─ active_logs/                    
"│  ├─ heart_rate.log              
"│  ├─ temperature.log",
"│  └─ water_usage.log",
"├─ archived_logs/                 
"│  ├─ heart_data_archive/",
"│  ├─ temperature_data_archive/",
"│  └─ water_usage_data_archive/",
"└─ reports/",
"   └─ analysis_report.txt",
]




Task 1 — Archival (archive_logs.sh)

What it does:
Shows a numbered menu to pick a log to rotate.


Moves the selected active log into its archive folder.


Renames it precisely: <type>_YYYY-MM-DD_HH:MM:SS.log.


Recreates an empty active log so Python simulators keep writing seamlessly.


Validates inputs and file presence, creates directories if missing, and prints clear status messages.

Task 2 — Analysis (analyze_logs.sh)

What it does:

Presents a menu of logs to analyze.


Counts occurrences per device (e.g., HRM-1, TEMP-2, FLOW-1).


Optionally extracts first and last timestamps (bonus).


Appends a formatted section to reports/analysis_report.txt including:


Run timestamp


Source log path


Count per device (sorted)


First/Last entry if available












Data & File Naming Conventions

Active logs


hospital_data/active_logs/heart_rate.log


hospital_data/active_logs/temperature.log


hospital_data/active_logs/water_usage.log


Archived logs


hospital_data/archived_logs/heart_data_archive/heart_rate_YYYY-MM-DD_HH:MM:SS.log


hospital_data/archived_logs/temp_data_archive/temperature_YYYY-MM-DD_HH:MM:SS.log


hospital_data/archived_logs/water_data_archive/water_usage_YYYY-MM-DD_HH:MM:SS.log


Reports


reports/analysis_report.txt (append-only history)













Error Handling & Reliability

Invalid input: menu only accepts 1–3; otherwise, re-prompts or exits with a friendly message.


Missing files: checks for file existence and creates directories as needed.
Permissions: warns if mv/touch fail and returns a non-zero exit code.
No data yet: analysis prints “no entries” and still appends a structured section to the report for traceability.

Idempotent archive dirs: creating folders is safe even if they exist.
















How Each File Contributes

Python Simulators
heart_rate_monitor.py: Emits periodic heart rate readings for two devices (e.g., HRM-1, HRM-2) into active_logs/heart_rate.log.
 Contribution: Provides continuous live data to test log rotation without stopping collection.


Temperature_recorder.py: Writes temperature events for two devices into active_logs/temperature.log.
    Contribution: Adds a second data stream to verify the menu system and per-type archive/analysis logic.


Water_consumption.py:  Writes water flow/usage entries into active_logs/water_usage.log.
Contribution: Provides a third data stream with different semantics (resource usage) to ensure our analysis patterns and reporting are general.


All simulators accept start and cleanly handle Ctrl+C.


FINAL NOTES
The repo demonstrates end-to-end handling: generation → rotation → analysis → reporting.


Scripts are interactive, defensive, and portable.


Report file (reports/analysis_report.txt) shows history of analyses across runs.




