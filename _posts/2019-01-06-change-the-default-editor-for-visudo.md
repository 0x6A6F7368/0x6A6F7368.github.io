---
id: 326
title: Change the default editor for Visudo
date: 2019-01-06T23:57:16+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=326
permalink: /change-the-default-editor-for-visudo/
image: /wp-content/uploads/2017/06/install-sudo-for-freebsd.jpg
categories:
  - Linux
  - Ubuntu
---
Visudo is a tool used to safely edit the sudoers file. Visudo locks the sudoers file to ensure multiple users are not trying to edit the file, as well as performing basic sanity checks, and checks for parse errors.

The sudoers file is where you edit the options for sudo. Such as allowing a user to use sudo for all programs &#8211; or a handful of programs they require.

To make things easier for people new to Linux, the default editor for Visudo on some Linux distros (i.e. Ubuntu) is Nano. I&#8217;ve never really got used Nano. So to make things easier for **me** I like to swap it back to Vim.

To make changes, we will first have to enter the following command to safely edit the sudoers file.

<pre class="wp-block-preformatted">sudo visudo</pre>

This of course will open with nano. Replace the line:

<pre class="wp-block-preformatted">Defaults        editor=/usr/bin/nano</pre>

with

<pre class="wp-block-preformatted">Defaults        editor=/usr/bin/vi</pre>

and save your file.

Visudo will now open with Vi, the way the greybeards of old intended.