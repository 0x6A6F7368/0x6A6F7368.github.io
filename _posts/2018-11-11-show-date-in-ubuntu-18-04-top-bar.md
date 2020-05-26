---
title: Show date in Ubuntu 18.04 top bar
date: 2018-11-11T23:48:59+00:00
author: Josh
layout: post
permalink: /show-date-in-ubuntu-18-04-top-bar/
image: /images/uploads/2018/11/show-date-ubuntu.jpg
categories:
  - Linux
---
I have recently starting running [Linux as my daily driver.](https://joshdawes.com/linux-as-my-daily-driver/) Of course, after using Windows almost every day of my working life, there are things that I am used to just having. In this case a quick option to look at the date along with the time.

By default, Ubuntu 18.04 shows just the time. You can click on it to view a calendar and see the day. Sometimes you just want a way to quickly see the date (for the 11th time that day and you still cant remember what the date is). To enable the date I have installed Gnome Tweak Tools and then used dconf to see what has been changed when I use the GUI to make changes, so that it can just be done easily in Terminal.

Start by opening Terminal and then enter the following commands:

<pre>sudo apt-get update</pre>

<pre>sudo apt-get install gnome-tweak-tool</pre>

<a href="https://wiki.gnome.org/action/show/Apps/Tweaks" target="_blank" rel="noopener">GNOME Tweak Tool</a> will now be installed. You can open the GUI for GNOME Tweak Tool by clicking the Show Application button at the bottom left of the screen and selecting Tweaks

The Date can easily be added to the top menu by running the following command:

<pre>gsettings set org.gnome.desktop.interface clock-show-date true</pre>

You now have the date displayed alongside the time &#8211; Just as Chronos intended.