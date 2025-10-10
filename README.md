To document how the application works:
Hospital Data Monitoring & Archival System

Automated log management for a hospital environment: collects real-time device data, archives logs safely on demand, and analyzes usage patterns to produce actionable reports, all with standard Linux tools and interactive Bash scripts.
Repo name: Coding-lab_Group1
Contributors assessed via: GitHub commits (per member)

Overview:
This project demonstrates a complete log lifecycle:
Collection Python simulators stream readings from devices (heart rate, temperature, water usage) into hospital_data/active_logs/.


Archival: An interactive Bash script rotates a selected active log into its archive folder with a precise timestamp and immediately recreates a fresh active log (so collection never stops).


Analysis: Another interactive Bash script parses logs, counts events per device, extracts temporal ranges (first/last entry), and appends a formatted report to reports/analysis_report.txt.


Features:
Interactive menus using Bash select/case


Safe log rotation (mv + touch) with timestamps


Device statistics via awk | sort | uniq -c


Append-only reporting with run metadata and timestamps


Defensive error handling for missing files, bad input, and perms


Simple, portable, dependency-light (POSIX tools + Python 3)

And after this is the
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
-Shows a numbered menu to pick a log to rotate.

-Moves the selected active log into its archive folder.

-Renames it precisely: <type>_YYYY-MM-DD_HH:MM:SS.log.

-Recreates an empty active log so Python simulators keep writing seamlessly.

-Validates inputs and file presence, creates directories if missing, and prints clear status messages.

Task 2 — Analysis (analyze_logs.sh)

What it does:

-Presents a menu of logs to analyze.

-Counts occurrences per device (e.g., HRM-1, TEMP-2, FLOW-1).

-Optionally extracts first and last timestamps (bonus).

-Appends a formatted section to reports/analysis_report.txt including:

-Run timestamp

-Source log path

-Count per device (sorted)

-First/Last entry if available

