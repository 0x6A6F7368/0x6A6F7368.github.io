---
title: Repair Windows Boot Errors
date: 2016-12-07T00:12:48+00:00
author: Josh
layout: post
permalink: /repair-windows-boot-errors/
image: /images/uploads/2016/11/repair-windows-boot-errors.png
categories:
  - Windows
---
Not being able to boot into Windows can be frustrating and can often lead to the dreaded re-installation of Windows. This doesn&#8217;t have to be the case, with some boot troubles easily fixed using tools provided on your installation media.

_**Disclaimer:** Before undertaking any of the steps below create a backup of your files. This can be done by booting from a bootable USB stick (Windows Installation Media or Live Linux Distro) and transferring files to an External Drive. I am not  responsible for data lost undertaking these repairs. **If you are unable to access your hard drive using bootable media you might have a dead hard drive.**  
_ 

I have used these steps to troubleshoot the following errors:

  * INACCESSIBLE\_BOOT\_DEVICE Blue Screen
  * Blinking White Cursor
  * Stuck on Windows 10 Spinning Wheel
  * Booting to Recovery Mode

### CHKDSK

Often overlooked, your boot troubles could be something as simple as a errors within the file system or files in bad sectors that are required upon boot.

To run chkdsk (check disk) you will need to boot up from a bootable Windows Installation DVD or USB stick and choose the **Command Prompt** from recovery options.

At the command prompt run the following command:

  * **chkdsk /r**

the **/r** switch fixes errors on the disk and locates bad sectors and attempts to recovery information in those sectors.

### CMOS Settings

Sometimes boot issues can be caused by incorrect CMOS settings. With most machines you can access CMOS by pressing DEL when powering up. If this doesn&#8217;t work you might need to press ESC first to pause &#8216;fast boot&#8217;. You will then be displayed a menu with the key you need to press to access CMOS (also referred to as BIOS).

Once in CMOS check that SATA mode is set correctly, i.e. IDE, AHCI, or RAID. Be sure to save changes upon exit.

A flat CMOS battery will reset CMOS settings to default. If the settings where changed from default before installing Windows (i.e. from IDE to AHCI), and CMOS is reset, Windows will fail to boot.

A user inadvertently holding the power button in for an extended period of time (or a sticky power button) can also cause CMOS to be reset.

If you are unsure what setting you need, try swapping from the default to IDE or AHCI.

### Bootrec

Bootrec is a tool found on Windows Installation Media. To use this tool you will need to boot up from a bootable Windows Installation DVD or USB stick and choose the Command Prompt from recovery options.

At the command prompt run the following commands:

  * **bootrec /FixMbr**
  * **bootrec /FixBoot**
  * **bootrec /RebuildBcd**

**_bootrec /FixMbr_** writes a new master boot record to the system partition.

**_bootrec /FixBoot_** writes a new boot sector the the drive.

**_bootrec /RebuildBcd_** searches available hard drives for installations of Windows and adds them to the boot configuration data. If you have multiple hard drives containing Windows installations these will be added to BCD.

If no installations are found using _**bootrec /RebuildBcd**_** **I have found running the command _**bootsect /nt60 all /mbr**_ followed by a reboot (returning to a command prompt) and then running_ **bootrec /RebuildBcd**_ will allow Windows _**Installation to be added to BCD.  
**_ 

_**bootsect /nt60 all /mbr**_ applies the master boot code compatible with BOOTMGR. BOOTMGR is used by Windows Vista, Windows 7, Windows 8, and Windows 10.

Windows XP uses NTLDR which requires the switch _**/nt52**_ rather than _**/nt60**_.

Also if you are still using Window XP it might be time to upgrade!

### Diskpart

Diskpart can be found on Windows Installation Media. To use this boot up from a bootable Windows DVD or USB and choose the Command Prompt from recovery options.

Steps for Diskpart will differ from machine to machine, but I usually find Disk 0 is the main hard drive, and the largest partition (Possibly Partition 1) is the Windows Installation partition.

At the command prompt run the following commands, taking into account your differing Disk and Partition numbers:

  * **Diskpart**  
    _Opens the Diskpart Utility_
  * **List Disk**  
    _This allows you to view the number of a disk_
  * **Select Disk #**  
    _Replace # with the number of the disk shown above, possibly &#8216;0&#8217;_
  * **List Partition**  
    _This allows you to view partition numbers_
  * **Select Partition #**  
    _Replace # with the number of the partition shown above, possibly &#8216;1&#8217;_
  * **Active**  
    _This marks the partition as an active system partition._ _ _
  * **Exit**  
    _Quits Diskpart Utility_
  * **Bootrec /RebuildBcd  
** _Searches available hard drives for installations of Windows and adds them to the boot configuration data._

For some machines I have also had to run **Extend** after running **Active** in the steps above. Extend is used to extend a freshly created partition, so I am not sure 100% while this has been successful for me.

**I hope this post is able to help someone out!**