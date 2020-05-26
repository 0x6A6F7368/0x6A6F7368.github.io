---
title: Upgrading to Ubuntu 20.04 LTS
date: 2020-04-28T04:08:04+00:00
author: Josh
layout: post
permalink: /upgrading-to-ubuntu-20-04-lts/
image: /images/uploads/2020/04/ubuntu-20-04.png
categories:
  - Linux
  - Ubuntu
---
**TL;DR: sudo do-release-upgrade -d**

Ubuntu 20.04 LTS &#8211; Focal Fossa &#8211; was released on April 23rd 2020 and can be easily upgraded via the Terminal. If you are using Ubuntu on mission critical systems it may be worth holding off to ensure all the bugs are ironed out. But if you like to live on the edge, and run the latest and greatest, please continue. 

Just over a year ago I decided to use <a rel="noreferrer noopener" href="https://joshdawes.com/linux-as-my-daily-driver/" target="_blank">Ubuntu for my daily driver</a>. I had to make a few tweaks <a rel="noreferrer noopener" href="https://joshdawes.com/quit-a-program-on-ubuntu-with-alt-q/" target="_blank">here</a> and <a rel="noreferrer noopener" href="https://joshdawes.com/fixing-the-calculator-key-in-ubuntu-18-04/" target="_blank">there</a> to get things how <a rel="noreferrer noopener" href="https://joshdawes.com/minimise-windows-on-ubuntu-18-04-with-super-m/" target="_blank">I wanted them,</a> but overall it hasn&#8217;t been a terrible experience.

While I was already on a LTS version of <a rel="noreferrer noopener" href="https://ubuntu.com/download" target="_blank">Ubuntu</a> &#8211; I thought I might as well upgrade to the latest LTS &#8211; and write a blog post about it.

## Before you start

Before getting started please ensure you have a <a rel="noreferrer noopener" href="https://joshdawes.com/backup-home-directory-with-rsnapshot/" target="_blank">backup of your data</a>. Once you have a backup feel free to continue. 

Start by ensuring all software updates are installed. To do this open Terminal and run the following command:

<pre class="wp-block-preformatted">sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y</pre>

This may take some time if you don&#8217;t have automatic updates enabled and haven&#8217;t manually run an update recently.

Once this has completed, remove old packages and dependencies with the following command:

<pre class="wp-block-preformatted">sudo apt autoremove -y</pre>

You can now reboot your computer.

## Upgrading Ubuntu

After a reboot has completed we can move onto installing the upgrade. Open up Terminal and type the following command:

<pre class="wp-block-preformatted">sudo do-release-upgrade -d</pre>

If you are upgrading a server, it is likely you are connected via ssh. If this is the case a message will display giving instructions on how to enable a secondary access in the event you lose access. If you open the firewall to enable this, remember to close this again after the upgrade.

The upgrade will take some time, during which multiple prompts to continue will be displayed. This will allow you to confirm which packages are going to be removed during the upgrade as well as display information regarding changes to the system. When the upgrade has finished you will be prompted to reboot.

## Finalising the Update

After you have rebooted, check again for any updates. This should have been done during the upgrade purpose, but it doesn&#8217;t hurt to do it manually. To check for updates open Terminal and run the following command:

<pre class="wp-block-preformatted">sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y</pre>

Once this has completed, you can also remove any packages and dependencies that are no longer needed. Again this should have been done during the upgrade process, but it doesn&#8217;t hurt to do it manually. This can be done with the following command:

<pre class="wp-block-preformatted">sudo apt autoremove -y</pre>

To check what versions of Ubuntu is running type the following into Terminal:

<pre class="wp-block-preformatted">lsb_release -a</pre>

The following will display if you are running Ubuntu 20.04 LTS:

<pre class="wp-block-preformatted"><strong>No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 20.04 LTS
Release: 20.04
Codename: focal</strong></pre>

And there it is, you are now running the latest LTS version of Ubuntu. You can expect to see updates until April 2025.

<hr class="wp-block-separator" />

<p class="has-text-align-center">
  <a href="https://joshdawes.com/recent-posts/" target="_blank" rel="noreferrer noopener">While you&#8217;re here feel free to read my other posts!</a>
</p>