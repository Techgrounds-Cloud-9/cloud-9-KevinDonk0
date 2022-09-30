# File permissions

The permissions give you the authority to read, write and excuted files.

# Key terminology

1. *chown* : change ownership of a file or directory.

2. *chgrp* : change group of files or directorys


# Exercise

* Create a text file.
Make a long listing to view the file’s permissions. Who is the file’s owner and group? What kind of permissions does the file have?

* Make the file executable by adding the execute permission (x).

* Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner. Can you still read it?

* Change the owner of the file to a different user. If everything went well, you shouldn’t be able to read the file unless you assume root privileges with ‘sudo’.

* Change the group ownership of the file to a different group.


# Sources
[Permission](https://www.pluralsight.com/blog/it-ops/linux-file-permissions)

# Overcome challenges

none

# Results

create file, make long list, execution permission remove write and read permissions, chang owner and different group.

![create file, make long list, execution permission remove write and read permissions, chang owner and different group.](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/LNX/LNX-05-00.PNG)