---
author: Josh
date: 2020-07-21
layout: post
title: "Installing VimWiki on Ubuntu 20.04"
permalink: /installing-vimwiki-on-ubuntu-20-04/
---

I first heard of [VimWiki](https://github.com/vimwiki/vimwiki){:target="_blank"} reading a blog post written by [Linell Bonnette](https://thelinell.com/using-vimwiki/){:target="_blank"} (I'm not the Josh mentioned in his post). I knew right away that I needed VimWiki in my life. No mucking around, let's hook right in.

# Setting up the Environment 

*These steps are for Ubuntu 20.04 LTS but should work fine on other versions of Linux with minimal changes to commands.*

Even though Vim is included in Ubuntu (via the **vi** command) I was required to reinstall Vim via the package manager. This can be done by running the following command:

```
sudo apt-get update && sudo apt install vim
```

You will now need to setup the environment for VimWiki by editing your **vimrc** file. Open your **vimrc** with the following command:

```
vim ~/.vimrc
```

And then add the following lines:

```
set nocompatible
filetype plugin on
syntax on 
```

Save and close Vim with the following command:

```
:wq
```

# Installing VimWiki

There are multiple ways to install VimWiki. The easiest is to clone the GitHub repository into the Vim plugins directory. This can be done with the following command:

```
git clone https://github.com/vimwiki/vimwiki.git ~/.vim/pack/plugins/start/vimwiki
```

VimWiki is now installed.

# Accessing your VimWiki

By default, VimWiki is stored at **~/vimwiki**. This is where you can access all the files you create. The real magic is when you open your files in Vim.

Open Vim and type the following command

```
\ww
```

This command takes you to the index page of your wiki. As per the [ReadMe](https://github.com/vimwiki/vimwiki/blob/master/README.md){:target="_blank"} VimWiki has three syntaxes; VimWiki (default), Markdown (markdown), and MediaWiki (media). I have opted to use Markdown as it is the same syntax that is used by [Jekyll](https://jekyllrb.com/){:target="_blank"}.


To use markdown add the following line to your **vimrc** file.

```
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
```

You can now navigate your text files with the grace of a [Vim Poweruser!](https://danielmiessler.com/study/vim/){:target="_blank"}
