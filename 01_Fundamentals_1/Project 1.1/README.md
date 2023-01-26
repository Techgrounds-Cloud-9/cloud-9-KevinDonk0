# Project 1.1

The client is satisfied with the delivery of your application. This is just not the end. The customer would like to take more advantage of the capabilities of the cloud.(1.1 is a follow-up from 1.0)

<br>

# Requirements

* The Web server should no longer be accessible "naked" on the Internet. Ideally, the client would like to see a proxy inserted between them. Also, the server will no longer need to have a public IP address.
* Should a user connect to the load balancer via HTTP, this connection should be automatically upgraded to HTTPS.
* In doing so, the connection must be secured with at least TLS 1.2 or higher.
* The web server should undergo a health check on a regular basis.
* Should the Web server fail this health check, the server should be automatically restored.
* Should the Web server come under sustained load then a temporary additional server should be started. The customer believes that no more than 3 servers total will ever be needed given the user numbers in the past.

<br>

# User stories

* An application gateway is needed to do the offloading. A load balancer doesn't support offloading.
* The application gateway will act as a proxy to all the virtual machines.
* We need to implement redirection in application gateway in order to redirect the traffic from HTTP to HTTPS.
* Have to implement minProtocolVersion of TLS1.2 in to the application gateway with a cipherSuites.
* Implement a health checker that will check the webserver if its healthy or not. if its not healthy it should repair the webserver and make it healthy again automaticly.
* The Linux virtual machine (webserver) will be replaced with a virtual machine scale set. 

<br>

# Plan

Below we can use the code of 1.0. in 1.1 we have replace the linux virtual machine with a virtual machine scale set and application gateway.

<br>

## Windows management server
1. Create a Windows virtual machine.
2. Create a virtual network. (10.20.20.0/24)
3. Create one subnet in the virtual network.
4. Create a public IP for the management server.
5. Create a network security group with rules that only allows the admins ip (office or admin's home) can connect to the management server with RDP (port 3389). The admin should also be able to connect to the webserver with a SSH (port 22) connection.
6. Create a network interface card for the management server.
7. create a windows disk encryption for the management server.

![Management server](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.1/Management%20server.PNG)

<br>

## Linux webserver (virtual machine sclae set)
1. Create a virtual machine scale set.
2. Create a virtual network. (10.10.10.0/24)
3. Create two subnets in the virtual network for appliaction gateway and virtual machine scale set.
4. Create a public IP for the virtual machine scale set.
5. Create a network security group with rules that all all traffic for HTTP (port 80) and HTTPS (port 443). The admin needs to be able to connect to this webserver with SSH (port 22). this will me applied to the virtual machine scale set.
6. Create a network interface card for the webserver.
7. Create a extention for the health probe in virtual machine scale set.
8. Create a automatic repair policy to able automatic repair when a virtual machine is not healthy.
8. Create a extention for the webserver that will execute the apache script.
9. Create a auto scale setting to set up the the minimum (1) and maximum(3) virtual machines and when the virtual machine should scale up (CPU > 70%) or down (CPU < 30%). By default it should be 1.
10. Create the link to the application gateway backend addresses. 
11. The disk of the scale set will be automatic encrypted with PMK encryption.

<br>

## Application gateway

1. Create a application gateway
2. In the application gateway we have to apply autoscaleConfiguration
3. Create two subnets in the virtual network for appliaction gateway and virtual machine scale set.
4. create the ssl policy to apply the CA certificate.
5. create a probe to check the health o the application gateway.
6. create a listener to listen to port 80
7. create the backend httpsetting collection.
8. Create request routing rules for the application gateway.

![Virtual machine scale set and application gateway.](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.1/Application%20gateway%20and%20virtual%20machine%20scale%20set.PNG)

<br>

## Peering
1. Create two peerings that connects both virtual machine with eachother.

![Peering](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.1/Peering.PNG)

<br>

## Storage
1. Create a storage account.
2. Create a blob storage in the storage account.
3. Create a deployment script that grep the sh script and deploy it in to the blob storage.

<br>

## Keyvault
1. Create a keyvault that allows keys and secrets.

![Storage and keyvault](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.1/Storage%20and%20keyvault.PNG)

## Overcome challenges

I didn't accomplish to apply the CA certificate in the application gateway. i have created a script that will automaticly create a certificate and redirect traffic from HTTP to HTTPS but every time the virtual machine scale set deploys a new virtual machine the certificate will be create again. this will give issues because we can't create a new certificate with the same DNS name. i also achieve to get the right CA certificate but i was not able to implement it in to my applicaiton gateway. i had the lock symbol but got the error page with code 400.

<br>

## Result
Project 1.1 overview

![Project 1.1](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/Project%201.1/project%201.1.PNG)

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
6. It will ask you the provide a name(admin) for both virtual machines.
7. it will also ask for a password. (it need to be provided with : it must me 8 charterlong and you have to provide 1 upper case, 1 lower case, a nummer and a symbol.)
8. It is now deploying to the azure portal. This can take 15 minutes to finish.

<br>

## Connect to the management virtual machines

1. Within the azure portal in the search bar type `resource group` click on the resource group and select your created resource group.
2. Select your management server(Mgmt-VM with unique id)
3. On the left-top you will see "connect" click on it and select RDP.
4. download the RDP file and execute the file.
5. Login to the management server with the credentials.

## connect to the webserver within the management server
1. Open search bar and look for "powershell" and open powershell.
2. To connect to the webserver you give this command:
`ssh <adminsname>@10.10.10.132`
3. Provide the password for the webserver and you are login from the management server in to the webserver with a secure connection(SSH).



