---
title: Diceware Passphrase Generator
date: 2017-10-17T00:41:56+00:00
author: Josh
layout: post
permalink: /diceware-passphrase-generator/
image: /images/uploads/2016/10/diceware.png
categories:
  - Python
  - Security
---
## Update:

Python 3 Version can be found on [GitHub](https://github.com/0x6A6F7368/diceware).

## Diceware Passphrase Generator &#8211; Python 2.7

It has been a while since I have done anything with Python so as a quick easy &#8216;get back into it&#8217; I though I would create a **Diceware Passphrase Generator**. This is **not** a truly secure implementation as I am only using the python <a href="https://docs.python.org/2/library/random.html" target="_blank" rel="noreferrer noopener">random</a> function, as this quote from the Python Document Library explains:

<blockquote class="wp-block-quote">
  <p>
    Warning: The pseudo-random generators of this module should not be used for security purposes. Use os.urandom() or SystemRandom if you require a cryptographically secure pseudo-random number generator.
  </p>
</blockquote>

<div class="wp-block-image">
  <figure class="aligncenter is-resized"><img src="https://joshdawes.com/images/uploads/2016/10/diceware.png" alt="diceware passphrase" class="wp-image-161" width="187" height="187" /></figure>
</div>

I will be modifying the script to use the <a href="https://docs.python.org/2/library/os.html#miscellaneous-functions" target="_blank" rel="noreferrer noopener">os.urandom()</a> function and will post it here when I do.

The wordlist I used can be found <a href="http://world.std.com/%7Ereinhold/diceware.wordlist.asc" target="_blank" rel="noreferrer noopener">here</a>; more information about Diceware Passphrases can be read <a href="http://world.std.com/~reinhold/diceware.html" target="_blank" rel="noreferrer noopener">here</a>.

And here is the code:

<pre class="wp-block-preformatted">import random

def dicenumber():
    diceout = ""
    for i in range(5): # 5 dice rolls
        diceout += `random.randint(1,6)` # add result of dice roll to variable
    return diceout

def diceware(x):
    wordlist = open('diceware.wordlist.asc', 'r')
    for line in wordlist:
        if line.startswith(x):
            wordlist.close()
            return line

for i in range(4): print diceware(dicenumber()), # increase number for longer passphrases</pre>