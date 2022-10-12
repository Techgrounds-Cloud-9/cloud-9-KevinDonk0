# Public key infrastructure

Is a tool that is used to create and manage public keys for encryption. it helps to secure your public internet traffic.

# Key terminology

1. *certificate* : proves to users that they are visiting a real webpage and not a fake one. a validation process ius attempted to verify that the certificate is issued to the real business and domain name.

# Exercise

* Create a self-signed certificate on your VM.
* Analyze some certification paths of known websites (ex. techgrounds.nl / google.com / ing.nl).
* Find the list of trusted certificate roots on your system (bonus points if you also find it in your VM).


# Sources

[certificate](https://www.cisa.gov/uscert/ncas/tips/ST05-010)

[Openssl](https://wiki.debian.org/Self-Signed_Certificate)

# Overcome challenges

none

# Results

Install the open ssl.
![apt-get install apache2 openssl](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-00.PNG)

<br>

When installing openssl it automatically created a certificed. (snaikoil.pem and snaikoil.key)

![automatically installed certificate](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-01.PNG)

<br>

I also created an own certificate and stored in localcerts.

![Create own certificate](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-02.PNG)

<br>

On google chrome i have found the certificate.

![Google.nl certificate](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-03.PNG)

<br>

In windows you can find your own certificates.

![windows certificate](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-04.PNG)

<br>

In linux you can also find certificates in the certs folder.

![linux certs](https://github.com/Techgrounds-Cloud-9/cloud-9-KevinDonk0/blob/main/00_includes/SEC/SEC-06-05.PNG)

