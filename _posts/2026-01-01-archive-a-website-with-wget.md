---
author: Josh
date: 2026-01-01
layout: post
title: "Archive a website with wget"
description: A quick, polite way to archive a website for offline viewing using wget.
permalink: /archive-a-website-with-wget/
---
On occasion I have needed to download the contents of a website before it was decommissioned. I wanted to keep the content, but was not really interested in keeping the entire website and its data. A quick and easy way to do this is with wget.

To do this, open a terminal and type:

```bash
mkdir website-name
cd website-name
```

You can name the folder anything you like.

Now run the following command:

```bash
wget --limit-rate=200k --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla https://joshdawes.com
```

Make sure you are archiving a website you have permission for, such as a site you own.

Replace `joshdawes.com` with the actual site you want to archive. Here is what each flag does:

- --limit-rate=200k: Limit the download to 200 KB/sec. Higher rates can look suspicious.
- --no-clobber: Do not overwrite existing files (useful for resuming).
- --convert-links: Make links work locally, offline.
- --random-wait: Random waits between downloads.
- -r: Recursive; downloads the full site.
- -p: Pulls in assets (images, etc).
- -E: Ensures the right file extensions.
- -e robots=off: Ignore robots.txt restrictions (only use this where you have permission).
- -U mozilla: Spoof a browser user agent.
