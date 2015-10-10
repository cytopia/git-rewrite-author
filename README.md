# git-rewrite-author

[![Build Status](https://travis-ci.org/cytopia/git-rewrite-author.svg?branch=master)](https://travis-ci.org/cytopia/rewrite-author)
[![Latest Stable Version](https://poser.pugx.org/cytopia/git-rewrite-author/v/stable)](https://packagist.org/packages/cytopia/git-rewrite-author) [![Total Downloads](https://poser.pugx.org/cytopia/git-rewrite-author/downloads)](https://packagist.org/packages/cytopia/git-rewrite-author) [![Latest Unstable Version](https://poser.pugx.org/cytopia/git-rewrite-author/v/unstable)](https://packagist.org/packages/cytopia/git-rewrite-author) [![License](https://poser.pugx.org/cytopia/git-rewrite-author/license)](http://opensource.org/licenses/MIT)
[![POSIX](https://img.shields.io/badge/posix-100%25-brightgreen.svg)](https://en.wikipedia.org/?title=POSIX)
[![Type](https://img.shields.io/badge/type-%2Fbin%2Fsh-red.svg)](https://en.wikipedia.org/?title=Bourne_shell)

`git-rewrite-author` is a shell tool to manipulate the author and committer git history. You can use this tool to replace a specific git author/committer email with a different one.

**For example:** You have accidentally committed and pushed something urgent from your production server...
```
commit 70dbf556b735a7e1729f79b36502829415c037dd
Author: Charly Root <root@localhost>
Date:   Sat Oct 10 18:30:01 2015 +0200

    Applied Security Fix
```
...and now you see that your git author history is not very tidy anymore. Can this be changed? Of course :-)


## 1. Features

* List all current git authors and committers (name and email)
* Search author/committer by email and replace with different name and email
* Show how all commands work (`--dry` option)


## 2. Usage

### 2.1 All options

```shell
Usage: git-rewrite-author -l [--dry]
       git-rewrite-author -r <old_email> <new_email> <new_name> [--dry]
       git-rewrite-author -h
       git-rewrite-author -v

 -l       List current authors and committers in git
 -r       Rewrite history from <old_email> to <new_email> and <new_name>
 --dry    (optional) Do not do anything, just print the command.
 -v       Show version information.
 -h       Show this help screen.
```

### 2.2 List all authors

```shell
$ git-rewrite-author -l
cytopia <cytopia@everythingcli.org>
```

### 2.3 Replace author

```shell
# Rewrite hisstory
$ git-rewrite-author -r "cytopia@everythingcli.org" "better@email.com" "Cool Name"

# See who is left in the history
$ git-rewrite-author -l
Cool Name <better@email.com>
```

## 3. Installation

You can download `git-rewrite-author` via git or composer:
```shell
# git
git clone -https://github.com/cytopia/git-rewrite-author.git

# composer
composer require cytopia/git-rewrite-author
```

Afterwards just execute the `install.sh`, it will simply symlink the file to your home binary directory. So whenever you update the git repository afterwards, the symlink will always point to that version.
```shell
$ ./install.sh
Symlink git-rewrite-author to ~/bin? (Y/n)y
```


##  4. Contribution
Contributors are welcome.


##  5. License
[![license](https://poser.pugx.org/cytopia/git-rewrite-author/license)](http://opensource.org/licenses/mit)
