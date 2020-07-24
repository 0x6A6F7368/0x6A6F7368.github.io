---
title: Simple disk repartition and format with diskpart
date: 2017-06-19T23:33:38+00:00
author: Josh
layout: post
permalink: /simple-disk-repartition-and-format-with-diskpart/
image: https://joshdawes.com/images/uploads/2017/06/simple-disk-repartition-and-format-with-diskpart.png.png
categories:
  - Windows
---
Disclaimer: These steps will wipe the hard drive permanently. If you need to keep the data create a backup first.

At an elevated Command Prompt/PowerShell type **diskpart**. This will bring up diskpart utility. Diskpart allows you to manage disks, partitions, and volumes. Diskpart is ready when you can see **DISKPART>** on the Command Prompt/PowerShell window. We can now repartition and format the hard drive.

  * First identify the disk you wish to repartiton. To do this type **list disk**. The disk will be identified with a number. i.e. Disk 3.
  * Select the disk by typing **select disk** **3** or whatever number corresponds with your drive.
  * Type **list partition** to view the current partitions. Make note of the  partition/s you wish to remove. i.e. partition 1.
  * To remove a partition first type **select partition 1**, or whatever number corresponds with the partition you wish to remove.
  * Delete the partition by typing **delete partition**. This will remove the currently selected partition. Repeat for multiple partitions.
  * Create a new partition by typing **create partition primary**. Your new partition is created and ready to format.
  * Format the partition by typing **format fs=ntfs label=&#8221;Local Disk&#8221;**. The drive will now be formatted. If you requrie a qucik format you can type **format fs=ntfs label=&#8221;Local Disk&#8221; quick**

Your hard drive is now formatted and ready to use.
