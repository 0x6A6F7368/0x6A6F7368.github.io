---
title: Python 3 KeePass Dictionary Attack
date: 2019-01-08T00:23:00+00:00
author: Josh
layout: post
permalink: /python-3-keepass-dictionary-attack/
image: https://joshdawes.com/images/uploads/2019/01/python-3-keepass-dictionary-attack.png
categories:
  - Linux
  - Security
  - Tools
---
Github: <a rel="noreferrer noopener" aria-label=" (opens in a new tab)" href="https://github.com/0x6A6F7368/KeePassDictionaryAttack" target="_blank">https://github.com/0x6A6F7368/KeePassDictionaryAttack</a>

A few years back I created a <a rel="noreferrer noopener" aria-label="python script (opens in a new tab)" href="https://joshdawes.com/keepass-dictionary-attack/" target="_blank">python script</a> for a class I was teaching on password security. It is a basic script to run a dictionary attack against a <a href="https://keepass.info" target="_blank" rel="noreferrer noopener" aria-label="KeePass (opens in a new tab)">KeePass</a> database. Being that Python 2.7 <a rel="noreferrer noopener" aria-label="EOL date is quickly approaching (opens in a new tab)" href="https://www.python.org/dev/peps/pep-0373/" target="_blank">EOL date is quickly approaching</a>, I thought I might change my script to suit Python 3 &#8211; and do a quick blog post on how to run the new script.

First of all you will need to download and install the **libkeepass** module. This can be done using pip. If you haven&#8217;t installed pip3 you will need to do this first.

<pre class="wp-block-preformatted">sudo apt-get install python3-pip<br />pip3 install libkeepass</pre>

Create a directory to store the script, and then change into the newly created directory.

<pre class="wp-block-preformatted">cd ~ && mkdir keepassdictionaryattack<br />cd keepassdictionaryattack</pre>

You can supply your own password list as **password.txt** or download one of the many available online. I am using the <a rel="noreferrer noopener" aria-label="500 worst passwords (opens in a new tab)" href="https://github.com/danielmiessler/SecLists/blob/master/Passwords/Common-Credentials/500-worst-passwords.txt" target="_blank">500 worst passwords</a> list I found on <a rel="noreferrer noopener" aria-label="Daniel Miessler (opens in a new tab)" href="https://danielmiessler.com/" target="_blank">Daniel Miessler&#8217;s</a> GitHub. 

Download the passwords and rename the file to passwords.txt

<pre class="wp-block-preformatted">curl -O <a href="https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/500-worst-passwords.txt">https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/500-worst-passwords.txt</a><br /><br />mv 500-worst-passwords.txt passwords.txt</pre>

Now, download the KeePass Dictionary Attack script.

<pre class="wp-block-preformatted">curl -O
<a href="https://raw.githubusercontent.com/0x6A6F7368/KeePassDictionaryAttack/master/KeePassAttack.py">https://raw.githubusercontent.com/0x6A6F7368/KeePassDictionaryAttack/master/KeePassAttack.py</a></pre>

Copy a KeePass database into ~/keepassdictionaryattack and then run the script.

<pre class="wp-block-preformatted">python3 KeePassAttack.py</pre>

If the KeePass database is using a weak password, you may gain access to the database and all the goodies inside.
