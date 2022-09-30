# Setting-up

Setting-up a open SSH-connection to the server

# Key terminology

1. *GUI* : Graphical User Interface is a system of interactive visual components for computer software.

2. *CLI* : command line where you can typ in the commands.

3. *SSH* : Secure Shell is a tool for secure system administration, file transfers, and other communication across the internet or other untrusted network.

4. *OpenSSH* : is a open-source implementation of the SSH protocol.

5. *VM* : stand for Virtual Machine.

6. *whoami* : is a command that shows you who you are.

# Exercise

* Make an SSH-connection to your machine. SSH requires the key file to have specific permissions, so you might need to change those.

* When the connection is successful, type whoami in the terminal. This command should show your username.
# Sources

[OpenSSH](https://www.ssh.com/academy/ssh/openssh)



# Overcome challenges

In our introduction week we needed to work with PuTTY. This is a tool used to connect to a server. PuTTY was unable to accept the .pem file to overcome this problem i used the PuTTYgen to generate a new key, that PuTTY can accept (.ppk). When i was loged-in i did the "whoami" command and it shows "kevin".


# Results

Loged in and did command "whoami"

![Loged in and did command "whoami"](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-01-00.PNG])
