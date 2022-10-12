# Asymmetric encryption

Is a type of encryption that uses two separate keys. The public key is used for encryption and the pricate key is used for decryption in asymmetric encryption. 

# Key terminology

1. *RSA* : The Rivest-Shamir-Adleman encryption algorithm uses aa key pair that is mathematically linked to eachother to encrypt and decrypt data. one public key that can be shared with everyone and one private key being a secret known only by the creator of the key.

# Exercise

* Generate a key pair.
* Send an asymmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. The recipient should be able to read the message, but it should remain a secret to everyone else.
* You are not allowed to use any private messages or other communication channels besides Slack. Analyse the difference between this method and symmetric encryption.

# Sources

[What is RSA and how does it work](https://www.comparitech.com/blog/information-security/rsa-encryption/)

[RSA encryption](https://www.devglan.com/online-tools/rsa-encryption-decryption)

# Overcome challenges

none

# Results

We used a website (see sources) to create RSA private and public key.

![RSA key generator](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-05-00.PNG)

<br>

With the public key of my team mate i was able to encrypt the secret message and give the secure encrypted message to my team mate.

![Public key and secret messages on Slack](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-05-01.PNG)

<br>

Encrypt message and decrypt my message

![RSA encrypt and decrypt](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-05-02.PNG)


## Differents between asymmetric and symmetric encryption

Asymmeric encryption uses a public and pricate key, one to encrypt your message the other to decrypt the message. This encryption process is slower then the aymmetric encryption but remain safer because it uses 2 keys. There are different algorithms that use asymmetric encrytion like: Diffe-Hellman, RSA and ECC.

<br>

symmetric encryption make uses of only one key. This key is to encrypt and decrypt the message. This method is faster but less secure than asymmetric encryption. there are diffrent algorithms that use symmetric encrypion like : AES, RC4, DES and 3DES 






