---
title: Install Sudo for FreeBSD
date: 2019-05-30T23:34:28+00:00
author: Josh
layout: post
permalink: /install-sudo-for-freebsd/
image: /images/uploads/2017/06/install-sudo-for-freebsd.jpg
categories:
  - FreeBSD
---
FreeBSD doesn&#8217;t come with <a href="https://www.sudo.ws/" target="_blank" rel="noopener noreferrer"><strong>sudo</strong></a> pre-installed. Instead you are required to log in as root to make changes to the system. This is not best practise as you can do plenty of damage to your system when running as root.

With that said, for this task, you will need to be running as root.

You can easily install sudo for FreeBSD. We will go through this now. Before we start, make sure the ports tree is up to date.

<pre>portsnap fetch update</pre>

Type out the following command to change directory to the sudo port and commence the installation.

<pre>cd /usr/ports/security/sudo/ && make install clean</pre>

Leave the defaults selected, but be sure to also select <a href="https://joshdawes.com/turn-on-sudo-insults/" target="_blank" rel="noopener noreferrer">insults</a> so you get a witty message when you incorrectly enter your sudo password &#8211; then select ok.

The port will now build. Once it has completed, you will be required to add a user to the sudoers. To edit the sudoers file it is recommended to use the visudo tool. It can be ran by entering the following:

<pre>visudo</pre>

On FreeBSD, **visudo** uses **vim** as the default editor. If you haven&#8217;t used vim before it can be a little daunting. First of all we need to navigate down to find the line **root ALL=(ALL) ALL**. This can be done using either the **J** or the **down arrow **keys.

Once you have found that line, enter the letter **o **twice to create a new line and activate insert mode. Add the line below, substituting **username** with your actual username. If you haven&#8217;t add a user yet, you can do this with the **adduser** command.

<pre>username ALL=(ALL) ALL</pre>

We now need to save the file and quit vim. You can do this with the following command:

<pre>:wq</pre>

You can now log in without root and _superuser do_, the way Todd. C. Miller intended.