# Firewalls

A firewall is based on securty rules, it will monitor and controls incoming and outgoing networktraffic. it act like a barrier between your trusted network and the internet.

# Key terminology

1. *stateful* : stateful protocol does remembers the state of the data that's passing through and can filter according to deeper information.
2. *stateless* : stateless protocol doesn't remember any previous state of data packets. stateless filter the packet that is passing through in real-time.
3. *hardware* : Physical part or component of a computer.
4. *software* : Is a set of intructions or program which are used for specific task. The computers hardware reads software in order to operate.

# Exercise

* Install a web server on your VM.
* View the default page installed with the Web server.
* Set the firewall to block web traffic but allow ssh traffic.
* Verify that the firewall is doing its job.

# Sources

[Stateful and stateless firewalls](https://www.fortinet.com/resources/cyberglossary/stateful-vs-stateless-firewall)

[Apache 2](https://fedingo.com/apache-commands-cheat-sheet/)

[Ufw](https://www.tecmint.com/how-to-install-and-configure-ufw-firewall/)

# Overcome challenges

none

# Results

Apache2 was already installed.

![Apache2](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-02-00.PNG)

<br>

Apache2 webserver is up and running.

![Apache server runnning](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-02-01.PNG)

Apache2 default webpage.

![Apache2 default page](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-02-02.PNG)


<br>

Set firewall to allow SSH port (22)

![allowed SSH port](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-02-03.PNG)

<br>

can't connect to apaches main page on port 80.

![Apache2 can't connect to show page](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-02-04.PNG)

