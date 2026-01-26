---
author: Josh
date: 2026-01-24
layout: post
title: "Extract Certificates from PFX with OpenSSL"
description: How to extract private key, certificate, and chain files from a PFX for use on Linux servers.
permalink: /extract-certificates-from-pfx-with-openssl/
---

While we live in the world of Let's Encrypt and automated certificate renewals, I still have several boxes running yearly wildcard certificates that need manual updates.

Windows servers are happy with PFX files, but Linux web services typically require separate key, certificate, and chain files. These can be extracted from a PFX using OpenSSL.

Assuming OpenSSL is already installed on your system, here's how to get the required files.

## Extract the Certificate Components

First, transfer your PFX file to the Linux box and navigate to where it's stored.

Extract the private key:

```bash
openssl pkcs12 -in example.pfx -nocerts -out app-key.pem -nodes -legacy
```

Extract the certificate:

```bash
openssl pkcs12 -in example.pfx -clcerts -nokeys -out app-cert.pem -legacy
```

Extract the certificate chain:

```bash
openssl pkcs12 -in example.pfx -cacerts -nokeys -chain -out app-chain.pem -legacy
```

The `-legacy` flag is needed for PFX files created with older cryptographic algorithms. If your PFX was generated recently, you might not need it - remove `-legacy` if you get errors about it being unrecognised.

## Move Files and Set Permissions

Move the certificates to your application's directory:

```bash
sudo mv app-key.pem /etc/webapp/certs/
sudo mv app-chain.pem /etc/webapp/certs/
sudo mv app-cert.pem /etc/webapp/certs/
```

Set proper ownership and permissions:

```bash
sudo chown -R appuser:appuser /etc/webapp/certs/
sudo chmod 700 /etc/webapp/certs
sudo chmod 600 /etc/webapp/certs/app-key.pem
sudo chmod 644 /etc/webapp/certs/app-cert.pem
sudo chmod 644 /etc/webapp/certs/app-chain.pem
```

The 700 on the directory ensures only the owner can access it. The 600 on the private key means only the application user can read it - this prevents other users or processes from accessing your private key material. The 644 on the certificate and chain files allows them to be read by other processes that need to verify the certificate, since these files contain no sensitive data.

## Clean Up

Remove the PFX file from wherever you stored it, then restart your service.

And that's it. Perhaps one day I'll automate this with Let's Encrypt, but for now, this manual process works fine.
