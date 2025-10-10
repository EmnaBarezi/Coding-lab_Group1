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



