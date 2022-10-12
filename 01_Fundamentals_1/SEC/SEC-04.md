# Symmetric encryption

Is a type of encryption which use the same key for encryption and decryption data.

# Key terminology

1. *AES* : The Advanced Encryption Standard using block size of 128bits and a key size of 128, 192 or 256 bits. AES ciphers specifies the numbers of transformation rounds that converts the input (data) into the output. (ciphertext) the rounds can be 10 for 128 bits, 12 for 192 bits or 14 for 256 bits. Each round consist of multiple prossing steps making it very hard the crack.


# Exercise

* Find two more historic ciphers besides the Caesar cipher.
* Find two digital ciphers that are being used today.
* Send a symmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone. 
You are not allowed to use any private messages or other communication channels besides Slack. Analyse the shortcomings of this method.


# Sources

[Playfair cipher](https://www.geeksforgeeks.org/playfair-cipher-with-examples/)

[Route cipher](https://crypto.interactive-maths.com/route-cipher.html#intro)

[AES encryption](https://www.devglan.com/online-tools/aes-encryption-decryption)

[RSA encryption](https://www.devglan.com/online-tools/rsa-encryption-decryption)

# Overcome challenges

none

# Results

## Historic encryption

### playfair ciphers

The playfair cipher was the first cipher to encrypt pairs of letters. Playfair ciphers used a 5 by 5 table that contains a keyword of phase. to crack the code you needed to follow these four simple rules.

* If both letters are the same add a "X" after the first letter. 

* If two letters are in the same row replace them with letters on the rightside. 

* If letters appear on the same column replace them with the letter below.

* If letters are not on the same row or column replace them with letters on other pair of the corners.

For that time (1854) it was very hard to crack to code.

<br>

### Route cipher

The plaintext is written in a grid. to crack the code you first needed to decide how big the grid needed to be if you had the right size you needed to know what route to follow. Like in a spiralling inwards form that started from the left bottem or zigzagging up and down. this was only to make it harder to cracking the code.

<br>

## Encryption being used today

AES encryption is widely used today like the US goverment use it the secure the data. Its using the same key to encrypt and decrypt data. this does create a problem how can we send the key in a secureway this is where RSA comes in. RSA is a Asymmetric cipher that has two keys one public key that everyone can use to encrypt data. The private key is not shared and can only decrypt data to its original format. with those two (AES and RSA) ciphers it is very secure.


## Send a secret encrypted message to team mate.

First we create a secret message that we encrypt by using AES.

Next we needed to give the password to open the message. we use RSA to encrypt the password so nobody know what it is. We can create it by using the person public key. The receiver can decryot the password (with RSA) and the secret message.(with AES)

![Decrypt the secret password using RSA](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-04-00.PNG)

![Decrypt the secret message using AES](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-04-01.PNG)