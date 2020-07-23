---
author: Josh
date: 2020-07-21
layout: post
title: "Migrating WordPress to Jekyll"
image: https://joshdawes.com/images/jekyll.png
description: Dynamic websites do have their advantages, but for a simple blog a static website may be a more secure option.
permalink: /migrating-wordpress-to-jekyll/
---

WordPress powers just over a [quarter](https://www.techrepublic.com/article/wordpress-quietly-powers-27-percent-of-the-web/){:target="_blank"} of the web.

As with anything that has a large install base, it tends to be the target of malicious actors. Unpatched WordPress, or more likely, unpatched plugins are often the leverage required for an attacker to gain a foothold on your webserver.

Dynamic websites do have their advantages, but for a simple blog - such as the one you're reading now - a static website may be a more secure option. Enter [Jekyll](https://jekyllrb.com/){:target="_blank"} a simple, blog-aware, static site generator written in Ruby.

I recently migrated this blog from WordPress running on a FAMP stack in my living room to Jekyll running on [GitHub Pages](https://pages.github.com/){:target="_blank"}. I will take you through the process now.

# Configuring the Environment and Installing Jekyll

***If you haven't already used GitHub you can check out one of my previous [Blog Posts](https://joshdawes.com/installing-and-using-git-and-github-on-ubuntu/){:target="_blank"}. It is assumed you already have a GitHub account.***

First, you will need to setup the environment in which Jekyll can be installed and run. This can be done by running the following commands:

```
sudo apt-get update
sudo apt install ruby-dev build-essential
sudo gem update
sudo gem install bundler jekyll
```
Once this has completed you can create your Jekyll website. This can be done by running the following command (where username is your GitHub username):
```
jekyll new username.github.io
```

# Creating the Website
A basic website was created in the last command you executed. You will now want to modify the ***_config.yml*** file to customise your settings. Then you can start building the website.
Change into the directory for the newly created website and then edit the ***_config.yml*** file with the following commands:
```
cd username.github.io
vi _config.yml
```
It is self-explanatory on what information you are required to change. Before going any further, you will be required to create a new repository on GitHub. This should be named username.github.io. There will be no need to initialise it with a README file, as you will initialise the repository shortly.

***For more information you can visit the [GitHub Pages](https://guides.github.com/features/pages/){:target="_blank"} website.***

Now that you have made the basic changes lets finished setting up the repo and get the basic website live.

First, initialise the repository:

```
git init
```
Now add all the website information we've created thus far to the repository:
```
git add --all
```
Commit the changes ready to push to GitHub:
```
git commit -m "Gunna git me a website!"
```
Currently the computer doesn't know where to store the data - update that now with the repo you created earlier:
```
git remote add origin https://github.com/username/username.github.io.git
```
And finally push the website live:
```
git push -u origin master
```

Later, as you make changes you will only need to run the following commands to update your website:

```
git add -all
git commit -m "Your message here."
git push -u origin master
```

# Migrating data from WordPress
If you are just looking at setting up a new blog, you can stop now. But if you wish to migrate data from WordPress you can continue below.

There are several WordPress to Jekyll plugin available, but the one I found works best is called [Jekyll Exporter](https://wordpress.org/plugins/jekyll-exporter.){:target="_blank"}

Download and install the plugin. Log into WordPress and from your WordPress dashboard make your way to ***Tools*** and then select ***Export to Jekyll***. Save the file ***jekyll-export.zip*** somewhere where you can easily access it. I have downloaded it to the home directory (~) 

Come back to a terminal so that you can extract the data from WordPress. First, change into the directory in which you have downloaded the file:

```
cd ~
```
The data can now be unzipped. In this case I am extracting the data into a folder called wordpress:

```
unzip jekyl-export.zip -d wordpress/
```
***Jekyll Exporter*** creates its own ***_config.yml*** file. We will delete that as we have already created one for the new wesbite.
```
rm wordpress/_config.yml
```
The data can now be transferred from the wordpress folder into your username.github.io folder.
```
cp -R wordpress/* ~/username.github.io
```

Your posts and pages from WordPress have now been added to your new Jekyll website. You can now push to GitHub with the following commands:

```
git add --all
git commit -m "Migrated data from WordPress"
git push -u origin master
``` 
Your website is now live!

# Testing Changes
At any stage you can test changes on your machine before pushing it to GitHub. To do this you can by running the following command:
```
bundle exec jekyll serve
```
This command should be run from within your ***username.github.io*** folder.

This allows you to see the changes before deciding to go live.

And there is it, you can now say goodbye to updating wordpress and its plugins and spend more time blogging!
