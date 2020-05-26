---
id: 373
title: Cull your Twitter Friends with Thanos
date: 2019-01-22T09:09:38+00:00
author: Josh
layout: post
guid: https://blog.joshdawes.com/?p=373
permalink: /cull-your-twitter-friends-with-thanos/
image: /wp-content/uploads/2019/01/thanos.jpg
categories:
  - Python
---
Every now and again it feels good to cull some of the people you follow on Twitter. Sometimes though, you are not sure on who to remove and who to keep.

I was having the same dilemma, and thought that there had to be an easy way. I had used <a rel="noreferrer noopener" aria-label="Tweepy (opens in a new tab)" href="http://www.tweepy.org/" target="_blank">Tweepy</a> previously, and thought to call upon it to help with the cull.

I wrote a basic Python script which is inspired by Thanos. It can be found on <a rel="noreferrer noopener" aria-label="GitHub (opens in a new tab)" href="https://github.com/0x6A6F7368/thanosTwitter" target="_blank">GitHub.</a> I will give a quick run though on how to run it.

First of all we need the Tweepy module installed. It can be done with Pip.

<pre class="wp-block-preformatted">pip3 install tweepy</pre>

Now we need to create a folder in which to download the script.

<pre class="wp-block-preformatted">mkdir ~/thanosTwitter</pre>

change into the directory and download the script.

<pre class="wp-block-preformatted">cd ~/thanosTwitter && curl -O https://raw.githubusercontent.com/0x6A6F7368/thanosTwitter/master/thanosTwitter.py</pre>

You will now need to create a Twitter developer account. This is so you have the keys for the API access. You can create a developer account on the <a rel="noreferrer noopener" aria-label="Twitter Developer website (opens in a new tab)" href="https://developer.twitter.com/" target="_blank">Twitter Developer website</a>. You will also need to create a Twitter app through the <a rel="noreferrer noopener" aria-label="developer portal (opens in a new tab)" href="https://developer.twitter.com/en/account/get-started" target="_blank">developer portal</a>. Once you have the keys you can add them to the script with the text editor of your choice.

Save the changes and it is time to run the script. Before doing so I would like to point out that the script does **not** give warning and will start unfollowing as soon as it is executed. If you are happy with this, run the script.

<pre class="wp-block-preformatted">python3 thanosTwitter.py<br /></pre>

Once the script finishes, you will have half an many friends on Twitter, and the universe will be perfectly balanced, just as Thanos intended.