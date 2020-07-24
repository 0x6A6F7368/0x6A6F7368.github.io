---
title: Installing and Using Git and GitHub on Ubuntu
date: 2019-01-07T02:50:29+00:00
author: Josh
layout: post
permalink: /installing-and-using-git-and-github-on-ubuntu/
image: https://joshdawes.com/images/uploads/2019/01/github.png
categories:
  - Linux
  - Tools
  - Ubuntu
---
<a rel="noreferrer noopener" aria-label="GitHub (opens in a new tab)" href="https://github.com/" target="_blank">GitHub</a> is a web-based hosting of the version control system, <a rel="noreferrer noopener" aria-label="Git (opens in a new tab)" href="https://git-scm.com/" target="_blank">Git</a>. It allows for teams to easily work on projects, share code, and monitor versions. GitHub has both free and paid services depending on your needs.

This is just a simple tutorial to show you how to install and Use Git and GitHub on Ubuntu.

**Notes:** Before we get started if you are using GitHub with 2FA, you will need to setup a Personal Assess Token. This can be generated at <a rel="noreferrer noopener" aria-label="https://github.com/settings/tokens (opens in a new tab)" href="https://github.com/settings/tokens" target="_blank">https://github.com/settings/tokens</a>

Also, if you do not wish to share your email address publicly, you can use your GitHub noreply email address. It will be in the form of **number+username@users.noreply.github.com** and can be found at <a rel="noreferrer noopener" aria-label="https://github.com/settings/emails (opens in a new tab)" href="https://github.com/settings/emails" target="_blank">https://github.com/settings/emails</a>

You email address will also need to be verified. Information on this can be found at: <a href="https://help.github.com/articles/verifying-your-email-address/" target="_blank" rel="noreferrer noopener" aria-label="https://help.github.com/articles/verifying-your-email-address/ (opens in a new tab)">https://help.github.com/articles/verifying-your-email-address/</a>

## Installing and Using Git and GitHub on Ubuntu

To get started we will need to install Git on Ubuntu. To do this enter the following command into terminal.

<pre class="wp-block-preformatted">sudo apt install git</pre>

Once completed, you will now need to set your username and email address. These are your GitHub username and your GitHub noreply email address.

<pre class="wp-block-preformatted">git config --global user.name "username"</pre>

<pre class="wp-block-preformatted">git config --global user.email "number+username@users.noreply.github.com"</pre>

Now change to the Home Directory and create your first Git Repository.

<pre class="wp-block-preformatted">cd ~ && git init MyFirstGit</pre>

If successful you should see the message: **Initialized empty Git repository in /home/owner/MyFirstGit/.git/**

Change into the newly created directory

<pre class="wp-block-preformatted">cd MyFirstGit</pre>

Create a simple **README** file and add some text. This can be done with an editor of your choice. A quick sample is shown below.

<pre class="wp-block-preformatted">echo "This is MyFirstGit" &gt; README<br /></pre>

Now you can add the file to the index and record changes to the repository

<pre class="wp-block-preformatted">git add README<br />git commit -m "First commit to GitHub"<br /></pre>

Now you need to create a repository on GitHub. This can be done via: <a rel="noreferrer noopener" aria-label="https://github.com/new (opens in a new tab)" href="https://github.com/new" target="_blank">https://github.com/new</a>  


The repository will need to share the same name as the folder you created earlier, i.e. MyFirstGit. You can leave **Initialize this repository with a README&nbsp;**unchecked as we have already created this file.

This is a fairly simple procedure but if you get stuck detailed steps can be found here: <a rel="noreferrer noopener" href="https://help.github.com/articles/creating-a-new-repository/" target="_blank">https://help.github.com/articles/creating-a-new-repository/</a>

Upon creating a new repository you will be given the links to the repository, which should be similar to: **https://github.com/username/MyFirstGit.git**

We can now add the files to GitHub

<pre class="wp-block-preformatted">git remote add origin https://github.com/username/MyFirstGit.git<br />git push -u origin master</pre>

You will be prompted to enter your username and password (or Personal Access Token if you are using 2FA).

You will now be able to share code and monitor versions the way Linus Torvalds intended.
