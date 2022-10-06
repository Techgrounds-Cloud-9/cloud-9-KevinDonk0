# Protocols

Protocals are a set of rules for formatting and processing data.


# Key terminology

1. *HTTP* : Hypertext Transfer Protocol defines how messages are formatted and transmitted to webbrowsers.
2. *SSL* : Secure Socket Layer is an encryption based internet security protocol
3. *Handshaking* : is a process between two participants through the exchange of information.
4. *IPv4* : is a IP address which indentifies the device within a network.
5. *MAC Address* : Media Access Control is given by the manufacturer that has a unique number that can't be changed.


# Exercise

* Identify several other protocols and their associated OSI layer. Name at least one for each layer.

* Figure out who determines what protocols we use and what is needed to introduce your own protocol.

* Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.


# Sources

[List of protocols](https://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model))

[Network protocols](https://www.comptia.org/content/guides/what-is-a-network-protocol)

[Protocols and standards](https://www.internetx.com/en/news-detailview/who-creates-the-standards-and-protocols-for-the-internet)

[RFC](https://networkencyclopedia.com/request-for-comments-rfc/)

[TCP](https://www.ionos.ca/digitalguide/server/know-how/introduction-to-tcp/)

# Overcome challenges

none

# Results

## ISO with different protocols.

The OSI model can have many different protocols like :

7 Application layer : HTTP, SMTP, IMAP, SNMP, POP3, FTP.

6 Presentation layer : ASCII characters, MPEG, SSL,TSL, comperssion. (Encryption & Decryption)

5 Session layer : NetBIOS, SAP, handshaking connection.

4 Transport layer : TCP, UDP

3 Network layer : IPv4, IPv6, ICMP, IPSec, MPLS, ARP.

2 Data link layer : Ethernet, 802.1x, PPP, ATM, Fiber channel, MPLS, FDDI, MAC Addresses.

1 Pysical layer : Cables, Connectors, Hubs.

<br>

##

Each function must cooperate at each level in order to complete the larger task. The network protocols are created to industry standard by information en networking organization. Each protocol is unique and operates in the specific way detailed by the organization that created it.

There are some groups that have defined and published different network protocols:

* Request For Comments(RFC)

* Internet Architecture Board (IAB)

* Internet corparation for Assigned Names and Numbers (ICANN)

* Internet Assigned Number Authority (IANA)

* The institute of Electrical and Electronics Engineers (IEEE)

* The internet Engineering Task Force (IETF)

* The international organization for standardization (ISO)

* The international telecommunications union (ITU)

* The world Wide Web Consortium (W3C)

## Own protocol.
In order to create your own protocols you need to register the protocol. The protocol also need to cooperate with the different layers in order to make it work.


<br>

## Three-way-handshake.
The user make a request for the server and send the server a SYN packet with a unique random number. 

If the server has received the SYN packet. If the server agrees, it will send a SYN-ACK packet back to the user.

The user gets the SYN-ACK packet and send his own ACK packet to the server, with the server number plus one.


![Wireshark TCP](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/NTW/NTW-03-00.PNG)

