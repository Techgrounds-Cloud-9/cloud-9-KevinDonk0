# Network detection

In order to see what is going on your network you need a tools like Wireshark can show all the packets that we send or recieve. 

# Key terminology

1. *nmap* : Is used to scan your network and make a map out of it (network mapper)

# Exercise

* Scan the network of your Linux machine using nmap. What do you find?
* Open Wireshark in Windows/MacOS Machine. Analyse what happens when you open an internet browser. (Tip: you will find that Zoom is constantly sending packets over the network. You can either turn off Zoom for a minute, or look for the packets sent by the browser between the packets sent by Zoom.)


# Sources

[nmap scan](https://www.redhat.com/sysadmin/quick-nmap-inventory)


# Overcome challenges

none

# Results

## Wireshark all hosts

Install nmap by this commmand:
sudo apt install nmap

Install net-tools to show inet in ifconfig with this command:
sudo apt install net-tools

Ffconfig to see what my inet im using. here you can also see you netmask.

nmap -sP your inet id /24 beacasue the this ip can handle 254 host (netmask 255.255.255.0 /24) 

You can also use a wildcard at the end.

![All hosts](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-01-00.PNG)

## Wireshark Tree-way-handshake.
By openingen the webbrowser we had a TCP protocol like:
I send SYN packets to the server.
The server respons by sending back the SYN, ACK. I send back the ACK to the server.

![Wireshark](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-01-01.PNG)



