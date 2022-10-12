# Passwords

A password is used to log in to different websites. The server doesn't store the passwords. the server stores the hashed value of the passwords.

# Key terminology

1. *rainbow table* : is a pre-build file that contains alot of password with the hashed values of the passwords.
2. *salt hashing* : salt is randomly generated and fixed value that is designed to be unique. if our team had the same password stored the hashed value is not the same. this way its very hard to crack the password.


# Exercise

* Find out what hashing is and why it is preferred over symmetric encryption for storing passwords.
* Find out how a Rainbow Table can be used to crack hashed passwords.
* Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.
* 03F6D7D1D9AAE7160C05F71CE485AD31
* 03D086C9B98F90D628F2D1BD84CFA6CA
* Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table.
* Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted. 



# Sources

[Hashing vs encryption](https://cybernews.com/security/hashing-vs-encryption/)

# Overcome challenges

none

# Results

## Hashing vs symmetric encryption

With symmetric encryption you can encrypt and decrypt passwords. This can be bad when a site is hacked, all password are stolen the hacker can easily reverse the ciphers to the real password. This way the hacker has access to all accounts. Hashing is a one-way process, if the website is hacked and the hacker stole all passwords he still dont know what the passwords are. This is why hashing is preferred over symmetric encryption.

<br>

## Rainbow table

The rainbow table is a file that is full of hashes and passwords that people already know. E.g. downlaod the rockyou.txt with all common passwords. hash all the passwords and you have a file with the passwords and hashes of the passwords. This is called a rainbow table.

<br>

This can be done by crypto-algorithms. the algorithm will create a hexadecimal number with a specific length. It does not matter how long a passwords is, because in the end it will always be 128 bit hash value.
most of the times the attacker doesn't created a rainbow table but its already exist beforehand. A new hash is created from the text and this will happen many times to create a chain. in the final table only the first password and last hash value of the chain will appear. by using the reduce function all other values can be determined. The same input will always create the same hash value. This hash is then compared (fucntion checksum) with the hash that is stored on the server. if both hashes are the same you have access to the account. The has should always be unique. This way the servr knows that you really are who you say you are. This unique hash cannot be reversed making it very hard to crack a password.

<br>

The first hash is an easy password and is crackt in a second. The second is 16 random characters long so its much harder to crack, because not alot of people will use this exact password.

![Weak vs strong passwords hash](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-07-00.PNG)

<br>

Make a new linux user with password 12345.

![new user](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-07-01.PNG)

<br>

By default linux store the passwords in hashes values this way its harder for the hacker to crack your system. password 12345 will be this in linux

![linux hashed password]()

<br>

Our team had make a new user with the same passwords 12345 the hash value is not the same!

![my password 12345](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-07-02.PNG)

![ehab password 12345](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-07-03.PNG)

