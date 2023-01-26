# Project 1.0 

I have been tasked with helping a company transition to the cloud. The company has had its infrastructure analyzed by a previous team.

<br>

# Requirements

* All VM disks must be encrypted.
* The web server must be backed up daily. The backups must be retained for 7 days.
* The Web server must be installed in an automated manner.
* The admin/management server must be reachable with a public IP.
* The admin/management server must be reachable only from trusted locations (office/* admin's home).
* The following IP ranges are used: 10.10.10.0/24 & 10.20.20.0/24
* All subnets must be protected by a firewall at the subnet level.
* SSH or RDP connections to the web server should only be established from the admin server.

<br>

# User stories

* requires two virtual machines (1 windows - management server and 1 linux - webserver)
* two virtual networks with both one subnet
* Network security groups rules for linux. (allows port 80 HTTP and 443 HTTPS for users. Only the management server can access the webserver with the 22 SSH port.)
* Network security group rules for windows. (allow port 3389 RDP to login to the management server. Allow port 22 SSH to connect to the webserver.)
* Both virtual machine should have a public IP address.
* Both the virtual machine need to be connected by peering.
* The storage account need to have a blob storage. Inside the blob storage there will be a sh script that we need for the webserver.
* The webserver should have a extention that execute the deployment script that is storage in the blob storage.
* Keyvault need to have the encrypted keys for both the virtual machines.
* The virtual machine disks need to be back-up in the keyvault for seven days.
* When a disaster happends we need to be able to restore the virtual machines.

<br>

# Plan

## Windows management server
1. Create a Windows virtual machine.
2. Create a virtual network. (10.20.20.0/24)
3. Create one subnet in the virtual network.
4. Create a public IP for the management server.
5. Create a network security group with rules that only allows the admins ip (office or admin's home) can connect to the management server with RDP (port 3389). The admin should also be able to connect to the webserver with a SSH (port 22) connection.
6. Create a network interface card for the management server.
7. create a windows disk encryption for the management server.

![Windows management server](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Management%20VM.PNG)

<br>

## Linux webserver
1. Create a Linux virtual machine.
2. Create a virtual network. (10.10.10.0/24)
3. Create one subnet in the virtual network.
4. Create a public IP for the webserver.
5. Create a network security group with rules that all all traffic for HTTP (port 80) and HTTPS (port 443). The admin needs to be able to connect to this webserver with SSH (port 22).
6. Create a extention for the webserver that will execute the apache script.
7. Create a network interface card for the webserver.
8. Create a Linux disk encryption for the webserver.

![Linux webserver](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Webserver.PNG)

<br>

## Peering
1. Create two peerings that connects both virtual machine with eachother.

![Peering](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Peering.PNG)

<br>

## Storage
1. Create a storage account.
2. Create a blob storage in the storage account.
3. Create a deployment script that grep the sh script and deploy it in to the blob storage.

![Storage](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Storage.PNG)

<br>

## Keyvault
1. Create a keyvault that allows keys and secrets.
2. Create a back-up policy that will store the data of both virtual machine for 7 days.
3. Create a recovery service vault that can recover the data of both machines.
4. Create protected items that protect the data.

![Keyvault](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Keyvault.PNG)

<br>

## Result
Project 1.0 overview

![Project 1.0 overview](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.0/Project1.0.PNG)

<br>

# How to use

In order to use this .bicep file, you have to install some nessesery files.

<br>

## Install

### Visual Studio Code
1. Go to https://code.visualstudio.com/.
2. Download the Visual Studio Code (VSC) for windows.
3. Install the file and follow the instructions.

<br>

### Deploying in VSC
1. Open VSC and open a new terminal (can be found on the top of the screen)
2. Go to the path where the main.bicep file is located. (E.g. C:\Users\kdonk\Desktop) this can be done by using the "cd" command in the terminal. E.g. :
`cd C:\Users\kdonk\Desktop`
3. Install the azure portal by using the this command in the terminal:
`az bicep install`
4. Create a resource group and give it a name with this command:
`az group create -n <resource group> -l westeurope`
5. Deploy the main.bicep file by using this command:
`az deployment group create -n deployment1 -g <resource group> -f main.bicep`
6. It will ask you the provide a name for both virtual machines.
7. it will also ask for a password. (it need to be provided with : it must me 8 charterlong and you have to provide 1 upper case, 1 lower case, a nummer and a symbol.)
8. It is now deploying to the azure portal. This can take 15 minutes to finish.

<br>

### Connect to the management virtual machines

1. Within the azure portal in the search bar type `resource group` click on the resource group and select your created resource group.
2. Select your management server(Mgmt-VM)
3. On the left-top you will see "connect" click on it and select RDP.
4. download the RDP file and execute the file.
5. Login to the management server with the credentials.

## Connect to the webserver within the management server
1. Open search bar and look for "powershell" and open powershell.
2. To connect to the webserver you give this command:
`ssh <adminsname>@10.10.10.4`
3. Provide the password for the webserver and you are login from the management server in to the webserverwith a secure connection.



