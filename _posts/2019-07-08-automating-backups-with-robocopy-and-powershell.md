---
title: Automating backups with RoboCopy and PowerShell
date: 2019-07-08T05:31:16+00:00
author: Josh
layout: post
permalink: /automating-backups-with-robocopy-and-powershell/
image: /images/uploads/2019/07/robocopy.png
categories:
  - PowerShell
  - Tools
  - Windows
---
Backups are important and you should live by the 3-2-1 rule.

**That is: 3 copies of a file; 2 copies on site, 1 copy off site**

Backups should be automatic where possible. If you are manually backing up data, there is a good chance data wont get backed up as often as you hoped.

You should also test your backups regularly!

<a rel="noreferrer noopener" aria-label="RoboCopy (opens in a new tab)" href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy" target="_blank">RoboCopy</a>, short for &#8220;Robust File Copy&#8221;, is a command line utility included within Windows. It can be used to create backups of files and directories. There are many tools and programs for backing up data, but sometimes the free tools that come with the operating system are all you need.

We are going to backup files from an internal hard drive onto an external hard drive that is always plugged in. This will work well for hard drive failure, but wont be a great backup against ransomware.

Automating tasks is great for productivity. Especially if you can reuse scripts from [other tasks](https://joshdawes.com/usb-rubber-ducky/).

To get started, first open <a rel="noreferrer noopener" aria-label="PowerShell (opens in a new tab)" href="https://docs.microsoft.com/en-us/powershell/" target="_blank">PowerShell</a> as an administrator. We need to create a folder to store our basic script. In your PowerShell window enter the following command:

<pre class="wp-block-preformatted">New-Item -Path "c:\" -Name "scripts" -ItemType "directory"</pre>

And now change into the new directory:

<pre class="wp-block-preformatted">cd c:\scripts\</pre>

Now we are going to create the batch file to run RoboCopy. Do that with the following commands:

<pre class="wp-block-preformatted">New-Item -Name "backup.bat" -ItemType "file"</pre>

<pre class="wp-block-preformatted">Add-Content -Path .\backup.bat -Value "robocopy D:\ E:\ /B /MIR"</pre>

We have now created a script to backup drive D to drive E &#8211; of course you may need to adjust drive letters to suit your system.

RoboCopy with copy drive D to drive E using backup mode. This allows RoboCopy to override the file and folder permissions that may prevent a file being copied. MIR copies the complete directory tree. This keeps the second drive as an exact mirror of the first.

Now we want to make sure this script runs daily. We can do that using PowerShell to configure a scheduled task. Enter the following commands:

<pre class="wp-block-preformatted">$action = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '/c start "" "C:\scripts\backup.bat'</pre>

<pre class="wp-block-preformatted">$trigger = New-ScheduledTaskTrigger -Daily -At 1pm</pre>

<pre class="wp-block-preformatted">$principal = New-ScheduledTaskPrincipal -LogonType S4U</pre>

You will be asked to enter the username for the Administrator account, then follow on with the next command: 

<pre class="wp-block-preformatted">Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "Backup D Drive" -Description "Daily Backup of Drive D"</pre>

You now have a scheduled task that copies the content of drive D to drive E every day at 1pm &#8211; leaving you more time to [browse my blog!](https://joshdawes.com/recent-posts/)