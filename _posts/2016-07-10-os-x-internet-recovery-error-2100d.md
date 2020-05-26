---
title: OS X Internet Recovery Error 2100D
date: 2016-07-10T00:23:32+00:00
author: Josh
layout: post
permalink: /os-x-internet-recovery-error-2100d/
categories:
  - OSX
---
I recently decided to overhaul my 2011 MacBook Air and perform a fresh install of OS X. Of course this turned out to be a much bigger job than anticipated.

Booting into OS X Recovery, I was able to reinstall OS X, but much to my surprise everything was still on my machine. This is usually the best case scenario, but I was looking for a fresh out of box state.

I booted up with Kali and formatted the hard drive. I then booted into Internet Recovery by holding Option, Command & R while powering on the device. This is when the trouble started.

The first issue was not getting past the WiFi selection screen. I would connect to my wireless network and then watch the spinning globe go round and round. I left this running for a few hours thinking it was downloading OS X in the background.

When I released that nothing was downloading I rebooted the MacBook Air into the Internet Recovery. This time I was greeted with error **2100D** &#8211; and that more information could be found on apple.com/support. There was very little information in regards to **2100D**.

I rebooted again several times, and was greeted with the same infinite spinning globe, another occurrence of error **2100D**, and a new error &#8211; **2100F** &#8211; again with a message explaining I could find more information on apple.com/support. This one was a little more informative and appears to be to do with a bad internet connection.

Google Search provided the usual fanboy answer. The only fix is to take it to a Genius Bar.

I changed my routers DNS from my local DNSMASQ server to Googles DNS. Still unable to get past the WiFi selection screen.

I tried several wireless network setting configurations before coming back to WPA/WPA2 &#8211; which according to <a href="https://support.apple.com/en-au/HT201314" target="_blank">Apple</a> &#8211; is the only connection supported for running Internet Recovery. With everything set as Apple requires, I was still unable to perform Internet Recovery.

I eventually put it down to a bad configuration setting in my router. Looking though the router configuration I noticed the in-built DNSMASQ was enabled, and there was an option to use DSNMASQ for DHCP and DNS. Turned both of these on, rebooted to Internet Recovery, and OS X is now downloading.