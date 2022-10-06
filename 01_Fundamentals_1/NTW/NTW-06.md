# Subnetting

Within the network we can create a process subnetwork. In this subnetwork devices can communicate with each other directly.

# Key terminology

1. *Subnet ID* : Is always the first address of the subnetwork.
2. *Broadcast address* : Is always the last of the subnetwork. broadcast can push a packet forwards to all sub net addresses.
3. *netmask* : used to identify the subnet of an IP address by applying AND operater.       this way the router knows the destination.


# Exercise

* Create a network architecture that meets the following requirements:
    * 1 private subnet accessible only from within the LAN. This subnet must be able to accommodate a minimum of 15 hosts.
    * 1 private subnet that has Internet access through a NAT gateway. This subnet must be able to accommodate a minimum of 30 hosts (the 30 hosts does not include the NAT gateway).
    * 1 public subnet with an internet gateway. This subnet must be able to accommodate a minimum of 5 hosts (the 5 hosts does not include the internet gateway).
* Place the architecture you created including a brief explanation in the Github repository you shared with the learning coach.


# Sources

[Calculate subnets](https://www.calculator.net/ip-subnet-calculator.html)

[Subnet](https://www.techtarget.com/searchnetworking/definition/subnet)



# Overcome challenges

none

# Results

## Private subnet

10.0.0.0 /28 will have 16 host but the network address and broadcast address use 2 host. this means that we only have 14 usable host and it will be not enough. this si why it must be 10.0.0.0 /27 for 32 host - netwerk address and broadcast = 30 usable host.


<br>

## Private subnet with gateway

10.0.0.0 /27 will have 32 host - 2 = 30 usable host. But there is also a NAT gatway that use one host IP so we dont have enough. This is why it must be 10.0.0.0 /26

** Private subnet with gatway

<br>

## Public subnet

10.0.0.0 /29 has 8 host - 2 = 6 usable hosts. 5 for the hosts and 1 for the internet gateway 6 in total.


<br>

## Total scope of subnet

10.0.0.0 /24 submask 255.255.255.0 is used for t he entire net.


![Subnet total scope](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/NTW/NTW-06-00.PNG)

