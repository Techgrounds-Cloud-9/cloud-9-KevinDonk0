# Cron jobs

Is a command used for schedulling tasks to be executed sometime in the future.

# Key terminology


1. *CRONtab* : This is the file (and command) where you define what task to run and how often to run it.
 A crontab can have multiple cron jobs in it. in the tabular form where each row is a cron job.

2. *CRON* : This is the actual program you install on your system and run as a daemon.

3. *CRON jobs* : a job in Linux is a program that is up and running. 
Cron can handle multiple tasks and run them at their scheduled time. 
Each of these tasks are referred to as ‘cron jobs’.

# Exercise

* Create a Bash script that writes the current date and time to a file in your home directory.

* Register the script in your crontab so that it runs every minute.

* Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.


# Sources

[Date and time](https://tecadmin.net/get-current-date-and-time-in-bash/)

[Crontab](https://linuxhint.com/run_cron_job_every_minute/)

# Overcome challenges

Had a small problem with my script. i didn't understand why is was printing "data" in the .txt file. I found the problem. Had to change the ' to `. Had alot of problems with crontab but i managed to fix it.

# Results

Date and time.

![Date and time.](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-08-00.PNG)

Date and time in crontab.

![Date and time in crontab.](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-08-01.PNG)

Diskspace script and crontab

![Diskspace script and crontab](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-08-02.PNG)

Diskspace.log file

![Diskspace.log file](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-08-03.PNG)

