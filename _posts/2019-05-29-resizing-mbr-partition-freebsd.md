---
title: Resizing MBR Partition FreeBSD
date: 2019-05-29T06:38:27+00:00
author: Josh
layout: post
permalink: /resizing-mbr-partition-freebsd/
image: /images/uploads/2019/05/resizing-mbr-partition-freebsd.png
categories:
  - FreeBSD
  - Tools
---
Recently, the FreeBSD virtual machine that hosts my internal wiki got low on space. I had not provisioned a large enough virtual hard drive when creating the VM. When you want to store all the things in the wiki, you will need all the space. So, I will guide you through the steps for increasing the MBR partition size in FreeBSD.

First things first: **Backup the important data**

Second: **Backup the important data**

Now that you&#8217;ve got your **data backed up**, lets have a look at our current drive usage. This can be done using the following command:

<pre class="wp-block-preformatted"><strong>df -Ph</strong></pre>

<pre class="wp-block-verse">Filesystem     Size    Used   Avail Capacity  Mounted on<br />/dev/da0s1a    120G     27G     84G    24%    /<br />devfs          1.0K    1.0K      0B   100%    /dev</pre>

Because I didn’t know I was going to blog this, my drive already has enough space. But because I’m greedy, and want to educate others, I will resize the drive to 256GB.

Let have a look at our current hard drive partitions. You can do this using gpart:

<pre class="wp-block-preformatted"><strong>gpart show</strong></pre>

<pre class="wp-block-verse">=&gt;       63  268435393  da0  MBR  (128G)<br />         63       1985       - free -  (993K)<br />       2048  268433408    1  freebsd  [active]  (128G)<br /><br />=&gt;        0  268433408  da0s1  BSD  (128G)<br />          0  260046848      1  freebsd-ufs  (124G)<br />  260046848    8386560      2  freebsd-swap  (4.0G)</pre>

I powered off my VM and provisioned more drive storage. Powered it up again and ran the above command a second time. You can see the newly acquired free space.

<pre class="wp-block-verse">=&gt;       63  536870849  da0  MBR  (256G)<br />         63       1985       - free -  (993K)<br />       2048  268433408    1  freebsd  [active]  (128G)<br />  268435456  268435456       - free -  (128G)<br /><br />=&gt;        0  268433408  da0s1  BSD  (128G)<br />          0  260046848      1  freebsd-ufs  (124G)<br />  260046848    8386560      2  freebsd-swap  (4.0G)</pre>

Before resizing a partition we are required to get rid of the swap partition. First of all disable swap with the following command:

<pre class="wp-block-preformatted"><strong>sudo swapoff -all</strong></pre>

<pre class="wp-block-verse">swapoff: removing
/dev/da0s1b as swap device</pre>

We can now delete the swap partition. Ensure the index matches the index of the **swap-partiton** and the drive identifier corresponds with the correct drive in the BSD section.

<pre class="wp-block-preformatted"><strong>sudo gpart delete -i 2 da0s1</strong></pre>

Before we can use the free space we need resize the MBR section.

<pre class="wp-block-preformatted"><strong>sudo gpart resize -i 1 da0</strong></pre>

Confirm the freespace has moved to BSD using gpart.

<pre class="wp-block-preformatted"><strong>gpart show</strong></pre>

<pre class="wp-block-verse">=&gt;       63  536870849  da0  MBR  (256G)<br />         63       1985       - free -  (993K)<br />       2048  536868864    1  freebsd  [active]  (256G)<br /><br />=&gt;        0  536868864  da0s1  BSD  (256G)<br />          0  260046848      1  freebsd-ufs  (124G)<br />  260046848  276822016         - free -  (132G)</pre>

You will also see the swap partition is gone.

Now we want to resize the hard drive – be sure to leave enough create a new <a rel="noreferrer noopener" aria-label="swap partition (opens in a new tab)" href="https://itsfoss.com/swap-size/" target="_blank">swap partition</a>. 

<pre class="wp-block-preformatted"><strong>sudo gpart resize -i 1 -s 252G -a 4k da0s1</strong></pre>

That will leave me with 4GB to create a swap drive which can be done with the following command:

<pre class="wp-block-preformatted"><strong>sudo gpart add -t freebsd-swap -a 4k da0s1</strong></pre>

Check that the partitions have been resized and created using gpart:

<pre class="wp-block-preformatted"><strong>gpart show da0s1</strong></pre>

<pre class="wp-block-verse">=&gt;        0  536868864  da0s1  BSD  (256G)<br />          0  528482304      1  freebsd-ufs  (252G)<br />  528482304    8386560      2  freebsd-swap  (4.0G)</pre>

Now we need to enable the swap drive and grow the file system to fit the new partition. This can be done with the following commands:

<pre class="wp-block-preformatted"><strong>sudo swapon -a</strong></pre>

<pre class="wp-block-preformatted"><strong>sudo growfs /</strong></pre>

You will need to confirm that you wish the resize the partition. **Did you remember to make a backup?**

<pre class="wp-block-preformatted">Device is mounted read-write; resizing will result in temporary write suspension for /. It's strongly recommended to make a backup before growing the file system. OK to grow filesystem on /dev/da0s1a, mounted on /, from 124GB to 252GB? [yes/no]</pre>

We can check our partitions again with gpart:

<pre class="wp-block-preformatted"><strong>gparts show</strong></pre>

<pre class="wp-block-verse">=&gt;       63  536870849  da0  MBR  (256G)<br />         63       1985       - free -  (993K)<br />       2048  536868864    1  freebsd  [active]  (256G)<br /><br />=&gt;        0  536868864  da0s1  BSD  (256G)<br />          0  528482304      1  freebsd-ufs  (252G)<br />  528482304    8386560      2  freebsd-swap  (4.0G)</pre>

If everything looks good, we can then check our hard drive usage with the following command.

<pre class="wp-block-preformatted"><strong>df -Ph</strong></pre>

<pre class="wp-block-verse">Filesystem     Size    Used   Avail Capacity  Mounted on<br />/dev/da0s1a    244G     27G    198G    12%    /<br />devfs          1.0K    1.0K      0B   100%    /dev</pre>

And there is it &#8211; You have now resized your partitions and can store all the files the way data hoarders intended.