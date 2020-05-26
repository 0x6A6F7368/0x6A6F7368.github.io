---
id: 154
title: White Screen of Death (WordPress)
date: 2016-09-09T01:22:11+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=154
permalink: /white-screen-death-wordpress/
categories:
  - WordPress
---
I had a reoccurring issue with several clients WordPress boxes that would get a &#8216;white screen of death&#8217; when logging into the dashboard.

The affected URLs appeared to be example.com/wp-admin/ and also example.com/wp-login.php

The rest of the site appeared to work fine without issue.

The fix for my cases was to enabled cURL support for PHP on the server.

Problem solved and clients are not having issues logging in.