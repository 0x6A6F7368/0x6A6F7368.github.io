---
layout: page
title: Recent Posts 
image: https://joshdawes.com/images/recent-posts.jpg
description: I hope you find something of interest!
permalink: /recent-posts/
---
![image](/images/recent-posts.jpg){: .center-image }

<div align="center">
<strong><i>I hope you find something of interest!</i></strong>
</div>
<br>
I first created this blog in 2015 as a way to learn WordPress. In 2020 I migrated the blog to Jekyll.  
<br>Now armed with Vim, Git, and a GitHub account - there is no stopping me!
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
<div align="center">
<i>Thank you for stopping by!</i></div>

