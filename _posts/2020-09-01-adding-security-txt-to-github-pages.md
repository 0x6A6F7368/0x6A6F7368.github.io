---
author: Josh
date: 2020-09-01
layout: post
title: "Adding security.txt to Github Pages"
image: https://joshdawes.com/images/2020-09/security.txt.png
description: Security.txt is a proposed standard which allows websites to define security policies.
permalink: /adding-security-txt-to-github-pages/
---

![image](/images/2020-09/security.txt.png){: .center-image }

Security.txt is a simple way to have information regarding your security reporting process available for any researcher who may have found a vulnerability in your project.

It involves adding a file, security.txt, to the .well-known directory of your project. If your project is on GitHub Pages you must do things a little differently to make it viewable in the browser.

First of create a file security.txt and put in the root directory of your project.

Edit security.txt and add the following as the header.

```
---
layout: none
permalink: .well-known/security.txt
---
```

Below the header add the suggested information as per the [security.txt website.](https://securitytxt.org/){:target="_blank"}

Save your file and publish it as per your normal means. You will now have your security contact conveniently located at yourdomain.com/.well-known/security.txt
