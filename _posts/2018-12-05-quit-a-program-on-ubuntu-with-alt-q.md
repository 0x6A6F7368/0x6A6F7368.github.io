---
id: 315
title: Quit a program on Ubuntu with Alt + Q
date: 2018-12-05T01:54:51+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=315
permalink: /quit-a-program-on-ubuntu-with-alt-q/
image: /wp-content/uploads/2018/12/quit-a-program-on-ubuntu.jpg
categories:
  - Linux
  - Ubuntu
---
It has been just over 3 weeks since I  started using [Linux as my daily driver](https://blog.joshdawes.com/linux-as-my-daily-driver/). It hasn&#8217;t been an unpleasant experience &#8211; although there have been [tweaks](https://blog.joshdawes.com/minimise-windows-on-ubuntu-18-04-with-super-m/) and [fixes](https://blog.joshdawes.com/fixing-the-calculator-key-in-ubuntu-18-04/) along the way.

Instead of bringing over something from Windows that I am so used to having; today&#8217;s tweak comes from the Mac &#8211; where you can use **Command (⌘) + Q** to quit a program. This is mush more elegant than **Alt + F4** on Windows and Ubuntu.

On my Microsoft 600 Keyboard **Alt + Q** feels very much like **Command (⌘) + Q** on the Mac &#8211; so I will go with that.

First of all I will remove the old keybinding for **Close Window**. This can be done by entering the following into a Terminal window.

<pre>gsettings set org.gnome.desktop.wm.keybindings close "@as []"</pre>

Now I will add the keybinding for **Alt + Q**. This can be done by entering the following into a Terminal window.

<pre>gsettings set org.gnome.desktop.wm.keybindings close "'&lt;Alt&gt;q'"</pre>

You can now quit programs on a PC running Ubuntu the way the Apple Corporation running under Steve Jobs intended.

Or close enough to it!