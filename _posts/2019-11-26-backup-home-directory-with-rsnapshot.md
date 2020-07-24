---
title: Backup Home Directory with rsnapshot
date: 2019-11-26T03:39:11+00:00
author: Josh
layout: post
permalink: /backup-home-directory-with-rsnapshot/
image: https://joshdawes.com/images/uploads/2019/11/rsnapshot.png
categories:
  - Linux
  - Tools
---
Backing up data is important. rsnapshot is a simple tool you can use to take snapshots of your home directory (or other data) automatically on a schedule.

## Prerequisites

_Before starting it is assumed you have an external hard drive or secondary hard drive that snapshots will be copied to. This should automatically mount upon startup and you should know the mounting point of the device._

## Installing rsnapshot

Open up a terminal window and ensure that your packages list is up to date by running the following command:

<pre class="wp-block-preformatted">sudo apt-get update</pre>

After this has completed, install rsnapshot and rsync with the following command:

<pre class="wp-block-preformatted">sudo apt-get install rsnapshot rsync</pre>

## Configuring rsnapshot

Once the install has completed edit the configuration file in the text editor of your choice. The config file is located at /etc/rsnapshot.conf

**Note:** _Use tabs rather than spaces when editing the rsnapshot.conf file._

To edit this in Vim run the following command:

<pre class="wp-block-preformatted">sudo vi /etc/rsnapshot.conf</pre>

First of all modify the location where the snapshots will be stored. Scroll through the config file to find the line beginning with **snapshot_root**

**Note:** _In Vim you can use search mode after pressing a forward slash (/). Type in the text string you&#8217;re looking for i.e. snapshot_root and press enter. You will be taken directly to that line. If a string appears multiple times you can cycle through them by pressing the letter N_.

Modify this to read where the snapshots will be stored. This should match the location of the drive listed in prerequisites. i.e.

<pre class="wp-block-preformatted">snapshot_root /mnt/snapshots</pre>

**Note**_**:** If you are using Vim you can navigate the text file using the arrow keys or the letters H (left), L (right), J (down), K (up). To enter insert mode (so you can type text) Press I. To delete a character (when not in insert mode) Press X._

Now scroll down (or search) until you reach the backup levels section. The lines will start with **retain alpha, retain beta**, etc. Modify this so that it a little more user friendly.

<pre class="wp-block-preformatted">retain hourly 24
retain daily 7
retain weekly 4
retain monthly 12</pre>

Scroll down further to the lines starting with **backup**. This is where you chose the folders that you wish to create snapshots of. In this case only the home folder is being backed up, comment out all the lines except the following:

<pre class="wp-block-preformatted">backup /home/ localhost/</pre>

_**Note:** To comment out a line simply put a # at the beginning of a line._

Save your configuration files and close the text editor.

**_Note_**_: If you are using Vim save the file by pressing the ESC key, and then the letter W (write file), the letter Q (quit), and then press Enter._

## Testing the Configuration

After the configuration file has been modified, the syntax of the file can be checked by running the following command:

<pre class="wp-block-preformatted">/usr/bin/rsnapshot configtest</pre>

If all goes well the output will say **Syntax OK**. If there are any issues you will need to investigate further.

rsnapshot also allows for a test run of the backup. It outputs to the screen what would happening during a backup, but doesn&#8217;t actually touch any files. This can be run with the following command:

<pre class="wp-block-preformatted">/usr/bin/rsnapshot -t hourly</pre>

If you are noticing anything in the output that shouldn&#8217;t happen, double check your configuration file.

If everything looks good, the initial backup can be run using the following command:

<pre class="wp-block-preformatted">/usr/bin/rsnapshot hourly</pre>

## Automating the backup

Now that rsnapshot is configured we want to configure a cronjob to automate the backup. To do this open crontab using the following command:

<pre class="wp-block-preformatted">sudo crontab -e</pre>

**Note:** _If this is the first time you are using crontab you will be asked to choose an editor. Pick whichever editor you are most comfortable with._

Add the following lines to the bottom of the file.

<pre class="wp-block-preformatted">0 * * * * /usr/bin/rsnapshot hourly<br />30 3 * * * /usr/bin/rsnapshot daily<br />0 0 * * 1 /usr/bin/rsnapshot weekly<br />30 2 1 * * /usr/bin/rsnapshot monthly</pre>

Save the file and exit.

In the configuration section we&#8217;ve set how long backups are going to be kept. To break this down:

  * A snapshot is taken every hour over a 24 hour period
  * A snapshot is taken daily at 3:30 am
  * A snapshot is taken every Monday at 12:00 am
  * A snapshot is taken on the first day of the month at 2:30 am

The older versions will be removed as per the retention policy in the configuration policy.

And that&#8217;s it &#8211; you have an automated system that takes snapshots of your home directory and stores those files on a local drive. 

Now that you&#8217;ve automated your backups with rsnapshot, you&#8217;ll have plenty of time to browse my other [blog posts!](https://joshdawes.com/recent-posts/)
