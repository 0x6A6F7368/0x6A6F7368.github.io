---
title: Dumping NTLM Hashes
date: 2017-02-10T00:29:58+00:00
author: Josh
layout: post
permalink: /dumping-ntlm-hashes/
image: https://joshdawes.com/images/uploads/2017/02/dumping_ntlm_hashes.jpg
categories:
  - Security
  - Tools
---
Since discovering Hashcat, password cracking has become somewhat of a hobby of mine – even enough to buy the first video card in about 15 years (not much of a modern gamer)

Although the card is nothing flash – GT750 – it does the job. We all start small.

Having physical access to a machine most likely means you will not need to crack a password to gain access to data on the device (bootable Linux USB) but sometimes its all about knowing the password itself. The password could be the keys to the kingdom.

And I am curious about what people pick for passwords. I am kind of pasionate about password security.

I do get clients on a daily basis who have forgotten passwords for their home Windows machines, and while I can easily backup their data, I like to also tell them that their password was Petsname1 (or some other “creative” conconcton) and that its time to start using more secure passwords. Because reasons.

Grabbing a NTLM hash is as easy as&nbsp;Backbox, Bkhive, Samdump2…

The reason I use Backbox is I find it boots on everything I need it to boot on. And the reason I used bkhive to dump the system key rather than just using samdump2 to dump key and hash is that is was not dumping properly and I was getting incorrect keys, and incorrect/uncrackable hashes. Im just showing the way that works for me.

### Getting the Hash

  1. Boot up from Bootable&nbsp;<a href="https://backbox.org/" target="_blank" rel="noreferrer noopener">BackBox&nbsp;</a>USB
  2. Open Terminal
  3. Mount victim hard drive
  4. Change directory to directorywheredrivewasmounted/Windows/System32/config
  5. type in&nbsp;**bkhive SYSTEM key.txt**&nbsp;– now from a forensic point of view this is going to make a file right there in the config folder that someone could possibly find later on – even if you delete
  6. type in&nbsp;**samdump2 SAM key.txt > hashes.txt**&nbsp;– again from a forensics point of view this file is being written to the local drive and could be discovered later on

You now have a file, hashes.txt, that contains the hashed password of each user from that machine.
