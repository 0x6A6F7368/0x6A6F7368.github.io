---
title: Building SyncTerm on Ubuntu 18.04
date: 2020-03-10T04:25:46+00:00
author: Josh
layout: post
permalink: /building-syncterm-on-ubuntu-18-04/
image: https://joshdawes.com/images/uploads/2020/03/syncterm.png
categories:
  - Linux
  - Nostalgia
  - Ubuntu
---
SyncTERM is a <a rel="noreferrer noopener" aria-label="Bulletin board system (opens in a new tab)" href="https://en.wikipedia.org/wiki/Bulletin_board_system" target="_blank">Bulletin board system</a> (BBS) terminal program. BBSes can be seen as the precursor to the internet as we know it &#8211; back from a time where you would dial in to the server that you wished to view. Not all BBSes are gone. Surviving BBSes can be accessed via Telnet or by using a program such as <a rel="noreferrer noopener" aria-label="SyncTerm (opens in a new tab)" href="http://syncterm.bbsdev.net/" target="_blank">SyncTerm</a>.

(Un)fortunately I am too young that I missed the heyday of the BBS. But, when I read the blog post: <a rel="noreferrer noopener" aria-label="Bulletin Board Systems: The VICE Expose (opens in a new tab)" href="https://twobithistory.org/2020/02/02/bbs.html" target="_blank">Bulletin Board Systems: The VICE Expos</a>[é](https://twobithistory.org/2020/02/02/bbs.html) on <a rel="noreferrer noopener" aria-label="TwoBitHistory.org (opens in a new tab)" href="https://twobithistory.org/" target="_blank">TwoBitHistory.org</a> I was excited to learn that the BBS is alive and well, and anyone can &#8220;dial in&#8221; and have the experience of years gone by.

<a href="https://twitter.com/TwoBitHistory" target="_blank" rel="noreferrer noopener" aria-label="Two Bit History (opens in a new tab)">Two Bit History</a>&#8216;s post mentions that you will be required to build SyncTERM from the source code. This isn&#8217;t anywhere near as daunting as it sounds. I&#8217;ll take you through those steps now.

## Building SyncTERM

First of all open Terminal &#8211; we&#8217;ll start by installing the dependencies that are required during the build process:

<pre class="wp-block-preformatted">sudo apt install build-essential libncurses5-dev libncursesw5-dev</pre>

Once this is completed, change in to your home directory and then download the source code for syncTERM:

<pre class="wp-block-preformatted">cd ~ && wget http://syncterm.bbsdev.net/syncterm-src.tgz</pre>

After the sourcecode downloads, extract the code from the archive:

<pre class="wp-block-preformatted">tar -zxvf syncterm-src.tgz</pre>

We now want to change in to a subdirectory &#8211; that contains the source &#8211; of the archive we just extracted:

<pre class="wp-block-preformatted">cd syncterm-20200309/src/syncterm</pre>

Before we can build syncTERM, we have to tell the compiler where the source is located. This can be done with the following command:

<pre class="wp-block-preformatted">make SRC_ROOT=/home/<strong>YOURUSERNAME</strong>/syncterm-20200309/src</pre>

After this completes, build the software and install it:

<pre class="wp-block-preformatted">sudo make install</pre>

This may take some time. Once it completes you can run SyncTERM by typing **syncterm** into terminal or by finding it in the Application menu.

**Now you can exchange information the way <a rel="noreferrer noopener" aria-label="Ward Christensen (opens in a new tab)" href="https://twitter.com/wardxmodem" target="_blank">Ward Christensen</a> and Randy Suess intended.**

While you&#8217;re here check out my [earlier posts](https://joshdawes.com/recent-posts/)! If you have any interesting BBSes you wish to share feel free to [email](mailto:hello@joshdawes.com) me!
