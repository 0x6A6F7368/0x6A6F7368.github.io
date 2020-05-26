---
id: 454
title: USB Rubber Ducky
date: 2019-06-14T06:50:25+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=454
permalink: /usb-rubber-ducky/
image: /wp-content/uploads/2019/06/usb-rubber-ducky.jpg
categories:
  - Security
tags:
  - Pentest
  - Rubber Ducky
---
I purchased a <a rel="noreferrer noopener" aria-label="USB Rubber Ducky f (opens in a new tab)" href="https://shop.hak5.org/products/usb-rubber-ducky-deluxe" target="_blank">USB Rubber Ducky</a> from Hak5 a few years back and it has been sitting in the office collecting dust ever since. A USB Rubber Ducky is a device that looks like a USB Flash Drive but thinks its a keyboard. When plugged into a computer, a USB Rubber Ducky can start typing commands. Because it is able to type commands a lot quicker than you or I, the USB Rubber Ducky can be a handy tool for automating a task, or for quickly installing a remote backdoor during a physical penetration test.

## Let&#8217;s get some remote shells!!

Instead of jumping right into loading a remote shell (sorry for the misleading heading), I will start small; how to write a basic &#8220;<a rel="noreferrer noopener" aria-label="Ducky Script (opens in a new tab)" href="https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Duckyscript" target="_blank">Ducky Script</a>&#8221; and how to encode it and load it onto the USB Rubber Ducky. 

For this task, I am working on Ubuntu and creating a USB Rubber Ducky to &#8220;attack&#8221; a Windows PC. 

First things first, Lets start by setting up a working directory. On Ubuntu we can do that with the following commands:

<pre class="wp-block-preformatted">mkdir ~/RubberDucky/
mkdir ~/RubberDucky/scripts</pre>

Now change directory to RubberDucky with the following command:

<pre class="wp-block-preformatted">cd ~/RubberDucky</pre>

Let move onto downloading the require tools.

## Duckencoder

Hak5 provide the tools required to encode the Ducky Script text files into a bin file that can be used by the Rubber Ducky. Before we can run **Duckencoder** we will need to install the java runtime environment. This can be done with the following command:

<pre class="wp-block-preformatted">sudo apt install default-jre</pre>

Once this has installed, it is time to download duckencoder. We have already changed into our RubberDucky directory, so we can go ahead and download the tool. Do that with the following command:

<pre class="wp-block-preformatted">wget https://github.com/hak5darren/USB-Rubber-Ducky/raw/master/duckencoder.jar</pre>

## Creating basic Ducky Script

My basic script is inspired by the Matrix. It&#8217;s not very elaborate, it just opens Notepad on Windows and displays a message to the users.

To get started lets create a blank text file and open it with our favourite text editor.

<pre class="wp-block-preformatted">touch ~/RubberDucky/scripts/HelloWorld.txt && vi ~/RubberDucky/scripts/HelloWorld.txt</pre>

Now enter the text below. If you are not familiar with Vim, you will need to press **i** to enter the insert mode before you can enter the text.

<pre class="wp-block-preformatted">REM Ducky Payload inspired by The Matrix
DELAY 500
GUI r
DELAY 500
STRING notepad.exe
ENTER
DELAY 500
STRING Wake up User.
ENTER
STRING The Matrix has you.
ENTER
STRING Follow the Rubber Ducky.
ENTER</pre>

To save the file and exit Vim, press escape to go back to command mode and the type **:wq** and press enter.

<a href="https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Payloads" target="_blank" rel="noreferrer noopener" aria-label="Other Scripts  (opens in a new tab)">Other Scripts </a>are available from Hak5.

## Encoding the Ducky Script

Before we can load the script onto the USB Rubber Ducky, we will need to encode the file with the Duckencoder tool we downloaded earlier. This is a simple process and can be done using the command below:

<pre class="wp-block-preformatted">java -jar duckencoder.jar -i ~/RubberDucky/scripts/HelloWorld.txt -o inject.bin</pre>

Essentially we are using java to run duckencoder, taking the text file as an input (-i) and setting the output (-o) as the bin file.

Once this completes you will see the **inject.bin** file in the **~/RubberDucky** directory. This can be transferred over to a Micro SD card and inserted into your RubberDucky. This can be now plugged into a Windows PC for a little bit of non-malicious fun.