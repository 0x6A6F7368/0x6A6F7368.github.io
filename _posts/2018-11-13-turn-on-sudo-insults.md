---
title: Turn on Sudo Insults
date: 2018-11-13T02:37:17+00:00
author: Josh
layout: post
permalink: /turn-on-sudo-insults/
image: /images/uploads/2018/11/sudo-insults.jpg
categories:
  - Linux
---
As part of using [Linux as my daily driver](https://joshdawes.com/linux-as-my-daily-driver/), there are certain things I like having on my Servers that I can now have on the Desktop. i.e. Sudo Insults.

&#8216;Sudo insults&#8217; swaps the &#8216;incorrect password message&#8217; for a funny one-liner, or better &#8211; an insult &#8211; when you have incorrectly entered your password using sudo.

To enable insults we need to edit the sudoers file. This should always be done using **visudo. **To edit the sudoers file enter the following command:

<pre>sudo visudo</pre>

Add the following line under **Defaults env_reset**

<pre>Defaults insults</pre>

Save your file and exit.

You will now be insulted when you incorrectly enter your password, just as the Unix beards of old intended.