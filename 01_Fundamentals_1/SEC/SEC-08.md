# Detection, response and analysis

If a attacker attack the website its crucial to detect this attack. the respons can be to stop the attacker to attack the website. then you need to analys what has happend and what we can do to provend this to happen again.

# Key terminology

1. *IDS and IPS* : Is a process that monitors the traffic on the network.
2. *system hardening* : Systems hardening is a collection of tools and techniques to reduce vulnerability in technology applications, systems, infrastructure, firmware, and other areas.
3. *Disaster recovery* : keeping data safe and maintaining buiness continuity.
4. *data center disaster recovery* : everything in a building can have a effect on the data center.
5. *cloud-based disaster recovery* : by using cloud-based data centers your data is safe within the cloud and you cna recover from its when ever you need.
6. *virtualization disaster recovery* : you are able to achieve your targeted recovery time objective more easy by placing a virtual server.
7. *disaster recovery as a service* : This is not stricly based on cloud their is a solution as a site to site service.
8. *RPO* : The point before a event happens is called recovery point objective.
9. *RTO* : after a event has happend the time to recover from it is called Recovery Time Objective.


# Exercise

* A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?
* An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?


# Sources

[IDS & IPS](https://www.juniper.net/us/en/research-topics/what-is-ids-ips.html)

[Disaster Recovery Plans](https://solutionsreview.com/backup-disaster-recovery/top-three-types-of-disaster-recovery-plans/)

[RPO](https://www.techtarget.com/whatis/definition/recovery-point-objective-RPO)

# Overcome challenges

none

# Results

The company has made a decission to make daily backups of the database this means that if a disastor appears the have a maximum of 24 hours. The RPO is maximum 24 hours.

<br>

The companies website has been configured to maken a backup when its powered it will pull the newest verion of the website from Github. This takes 8 minutes, theirfore the RTO will be 8 minutes.
