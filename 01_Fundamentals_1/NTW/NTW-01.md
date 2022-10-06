# OSI stack

OSI and TCP/IP are models that describe a set of communication protocals used on the internet.

# Key terminology

1. *PDU* : Protocol Data Unit is a specific block of information transferred over a network.
2. *TCP* : Transmission control protocol is a collection of standards that allow systems to communicate over the internet.
3. *UDP* : User Datagram Protocal is a protocol that doesn't acknowledge that the packets being sent or received.
4. *IP* : Internet Protocol provides a set of standard rules for sending and receiving data over the internet.



# Exercise

* The OSI model and its uses.

* The TCP/IP model and its uses.


# Sources

[OSI model](https://www.imperva.com/learn/application-security/osi-model/)

[TCP/IP model](https://www.interviewbit.com/blog/tcp-ip-model/)


# Overcome challenges

None


# Results

## OSI model
The Open System interconnection (OSI) model is a framework that describes the functions of a networking system. By using this model users can communicate with eachother over the internet.

The sender of information will use the OSI model in top-to-bottom way. On the receivers side it will be bottem-to-top.

<br>

7 Application : Users interaction layers where application can access the network service.

6 Presentation : Data will be encrypted and check if its in the right format.

5 Session : Is responsible for controlling ports and sessions to maintain connections.

4 Transport : Transmit data using the TCP or UDP protocols

3 Network : Looks what kind of physical path the data will take.

2 Data Link : Desides the format of data on the network.

1 Physical : Transmits the raw bits by cable to the other users physical device.

<br>

The receiver will start at the Phycical layer and work its way to the top layer.

<br>


## TCP/IP
The TCP/IP model is almost the same as the OSI model, the difference is that the first three layers had been put together.

TCP/IP will look like :

5 Application (Data)

4 Transport (TCP & Data)

3 Network (IP & TCP & Data)

2 Data link (Ethernet & IP & TCP & Data )

1 Physical ( Ethernet & IP & TCP & Data . Will be send to the receiver ) 

The receiver handle it in reverse order (same as OSI model)



