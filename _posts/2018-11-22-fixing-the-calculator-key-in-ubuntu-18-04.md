---
title: Fixing the Calculator Key in Ubuntu 18.04
date: 2018-11-22T04:32:21+00:00
author: Josh
layout: post
permalink: /fixing-the-calculator-key-in-ubuntu-18-04/
image: https://joshdawes.com/images/uploads/2018/11/fixing_the_calculator_key_in_ubuntu_18.04.jpg
categories:
  - Linux
  - Ubuntu
---
Recently I decided to give Ubuntu 18.04 a go as [my daily driver.](https://joshdawes.com/linux-as-my-daily-driver/) I have slowly been finding things that do not work as expected, and will blog about them [here](https://joshdawes.com).

So far I&#8217;ve found there was [no date](https://joshdawes.com/show-date-in-ubuntu-18-04-top-bar/) in the top bar, my printer doesn&#8217;t work, and sudo [didn&#8217;t curse me](https://joshdawes.com/turn-on-sudo-insults/) if my password was entered incorrectly.

This time my issue is the calculator keyboard shortcut on the Microsoft Wired Keyboard 600, doesn&#8217;t open the Calculator. I use this key many times a day, and eventually got sick of searching calc in the Application menu.

I did a bit of Googling and found <a href="https://askubuntu.com/questions/1031673/cannot-open-calculator-app-from-keyboard-calculator-button" target="_blank" rel="noopener">this post on askubuntu.com</a>, It appears to be a common issue on Ubuntu 18.04 &#8211; and fortunately it is a simple fix. Here is a link to the <a href="https://bugs.launchpad.net/ubuntu/+source/gnome-settings-daemon/+bug/1796499" target="_blank" rel="noopener">bug report.</a>

The issue looks to be with the **gnome-calculator snap package**. To fix the issue, first we need to remove gnome-calculator and reinstall it using apt. Type the following commands into a terminal window.

<pre>sudo snap remove gnome-calculator</pre>

followed by

<pre>sudo apt install gnome-calculator</pre>

The keyboard shortcut for the fancy abacus will now work as the mighty Sumerian and Egyptian empires intended.
