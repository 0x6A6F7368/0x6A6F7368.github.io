---
title: Installing Screen for FreeBSD
date: 2016-12-08T00:27:49+00:00
author: Josh
layout: post
permalink: /installing-screen-for-freebsd/
image: /images/uploads/2016/12/installing-screen-freebsd.png
categories:
  - FreeBSD
---
Screen is an application that allows a user to run multiple sessions within a single terminal window. This is handy if multiple programs are required to be run simultaneously by allowing the user to swap between different &#8216;screens&#8217; to view the output. Another feature of screen is the ability to restore a remote session if a connection is lost. Using screen is a great habit to get into, especially when running tasks that require a longer running time, such as when installing updates or compiling software.

To install screen ensure your ports are up-to-date by running:  
**_portsnap fetch update_**

After this completes you will need to change into the directory that the screen port is located:  
_**cd /usr/ports/sysutils/screen**_

And then to install screen type:  
_**make install clean**_

Screen will now be installed.

One example for using screen is so that you can restore a remote session if a connection is lost. To do this type in _**screen**_ after logging in via ssh.

If the connection is lost, log back in via ssh and type _**screen -RD**_ the session will be restore where you left off.

I hope you find this information useful!

&nbsp;