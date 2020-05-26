---
id: 307
title: Minimise windows on Ubuntu 18.04 with Super + M
date: 2018-11-23T04:30:23+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=307
permalink: /minimise-windows-on-ubuntu-18-04-with-super-m/
image: /wp-content/uploads/2018/11/windows-key.jpg
categories:
  - Linux
  - Ubuntu
---
This has turned somewhat into a series of blog posts outlining my transition to <a href="https://blog.joshdawes.com/linux-as-my-daily-driver/" target="_blank" rel="noopener">Linux as my daily driver</a>. I’m not new to Linux, and have run various variants of Linux on servers (<a href="https://www.slackware.com" target="_blank" rel="noopener">Slackware</a> and <a href="https://www.ubuntu.com" target="_blank" rel="noopener">Ubuntu</a> mostly). The desktop experience has been a little different as there are certain things I have been so used to on Windows – and I don&#8217;t like too much change all at once!

These steps may carry over to other versions of Ubuntu. I will now show you how to Minimise windows on Ubuntu 18.04 with Super + M.

This post will go though changing the ‘minimise all windows’ keyboard shortcut from **Control + Super (Windows Key) + D** to **Super (Windows Key) + M**.

**Super + M** by default on Ubuntu 18.04 opens the Message Tray. The Message Tray can also be opened with **Super + V**.

First up I will remove the key bindings for &#8216;toggle message tray&#8217;. To do this open Terminal and run the following command:

<pre>gsettings set org.gnome.shell.keybindings toggle-message-tray "@as []"</pre>

This will  remove the key bindings for both **Super + M** &  **Super + V**. We can re-add **Super + V** so we still have a keyboard shortcut for the message tray with the following command.

<pre>gsettings set org.gnome.shell.keybindings toggle-message-tray "['&lt;Super&gt;v']"</pre>

Now to add **Super + M** to minimise windows.

<pre>gsettings set org.gnome.desktop.wm.keybindings show-desktop "['&lt;Super&gt;m']"</pre>

You can now minimise all open windows the way the 90’s <a href="https://www.nytimes.com/1994/09/06/business/microsoft-is-bringing-out-its-first-computer-keyboard.html" target="_blank" rel="noopener">Microsoft Corporation intended</a>.