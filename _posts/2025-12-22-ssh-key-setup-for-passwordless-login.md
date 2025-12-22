---
author: Josh
date: 2025-12-22
layout: post
title: "SSH Key Setup for Passwordless Login"
image: https://joshdawes.com/images/2025-12/ssh-keys.png
description: Setting up SSH keys for secure, passwordless authentication to remote servers.
permalink: /ssh-key-setup-for-passwordless-login/
---

![image](/images/2025-12/ssh-keys.png){: .center-image }

SSH keys provide a more secure and convenient way to authenticate to remote servers compared to passwords. This guide walks through setting up SSH key-based authentication from a Mac to a new server.

## Generate a New Keypair

From your Mac, generate a new ED25519 keypair:

```bash
ssh-keygen -t ed25519 -C "username@servername" -f ~/.ssh/id_ed25519_servername
```

Change **username** and **servername** to match your environment.

## Copy Your Public Key to the Server

There are many ways to do this, but a simple way is to display your new public key in the terminal and copy the text:

```bash
cat ~/.ssh/id_ed25519_servername.pub
```

On the server, paste it into **~/.ssh/authorized_keys** as a single line.

Set the correct permissions on the server:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

## Configure SSH for Easy Login

Edit **~/.ssh/config** on your Mac and add:

```text
Host servername
    HostName servername_or_IP
    User yourusername
    IdentityFile ~/.ssh/id_ed25519_servername
```

Replace **servername_or_IP** and **yourusername** as needed for your new server.

## Connect

You can now connect to the server with:

```bash
ssh servername
```

Security and convenience - no password required.
