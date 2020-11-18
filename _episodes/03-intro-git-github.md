1. [Glossary of terms](#glossary)
~~~
$ git config --global user.name "Riley Shor"
$ git config --global user.email "Riley.Shor@fake.email.address"
~~~
Please use your own name and email address instead of Riley's. This user name and email will be associated with your subsequent Git activity,
which means that any changes pushed to
[GitHub](https://github.com/),
[BitBucket](https://bitbucket.org/),
[GitLab](https://gitlab.com/) or
another Git host server
in a later lesson will include this information.
For these lessons, we will be interacting with [GitHub](https://github.com/) and so the email address used should be the same as the one used when setting up your GitHub account. If you are concerned about privacy, please review [GitHub's instructions for keeping your email address private][git-privacy].
>## Keeping your email private
>
>If you elect to use a private email address with GitHub, then use that same email address for the `user.email` value, e.g. `username@users.noreply.github.com` replacing `username` with your GitHub one.
{: .callout}
> ## Line Endings
> As with other keys, when you hit <kbd>Return</kbd> on your keyboard,
> your computer encodes this input as a character.
> Different operating systems use different character(s) to represent the end of a line.
> (You may also hear these referred to as newlines or line breaks.)
> Because Git uses these characters to compare files,
> it may cause unexpected issues when editing a file on different machines.
> Though it is beyond the scope of this lesson, you can read more about this issue
> [in the Pro Git book](https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_core_autocrlf).
{: .callout}
> You can change the way Git recognizes and encodes line endings
> using the `core.autocrlf` command to `git config`.
> The following settings are recommended:
> On macOS and Linux:
> ~~~
> $ git config --global core.autocrlf input
> ~~~
> And on Windows:
> ~~~
> $ git config --global core.autocrlf true
> ~~~
> {: .language-bash}
Riley also has to set their favorite text editor, nano.
```
$ git config --global core.editor "nano -w"
```
{: .language-bash}
If you have a different preferred text editor, it is possible to reconfigure the text editor for Git to other editors whenever you want to change it.
Vim is the default editor. If did not change your editor and stuck in this editor, the following instructions will help you exit.
> ## Exiting Vim
> Note that Vim is the default editor for many programs. If you haven't used Vim before and wish to exit a session without saving
your changes, press <kbd>Esc</kbd> then type `:q!` and hit <kbd>Return</kbd>.
> If you want to save your changes and quit, press <kbd>Esc</kbd> then type `:wq` and hit <kbd>Return</kbd>.
The four commands we just ran above only need to be run once: the flag `--global` tells Git
to use the settings for every project, in your user account, on this computer.
You can check your settings at any time:
~~~
$ git config --list
~~~
{: .language-bash}

You can change your configuration as many times as you want: use the
same commands to choose another editor or update your email address.

> ## Proxy
> In some networks you need to use a
> [proxy](https://en.wikipedia.org/wiki/Proxy_server). If this is the case, you
> may also need to tell Git about the proxy:
> ~~~
> $ git config --global http.proxy proxy-url
> $ git config --global https.proxy proxy-url
> ~~~
> {: .language-bash}
> To disable the proxy, use
> ~~~
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ~~~
> {: .language-bash}
{: .callout}
> ## Git Help and Manual
> Always remember that if you forget a `git` command, you can access the list of commands by using `-h` and access the Git manual by using `--help` :
> ~~~
> $ git config -h
> $ git config --help
> ~~~
> While viewing the manual, remember the `:` is a prompt waiting for commands and you can press <kbd>Q</kbd> to exit the manual.
{: .callout}
[git-privacy]: https://help.github.com/articles/keeping-your-email-address-private/
## Basic Workflow
_[Back to top](#contents)_
TODO:

- [x] list diagram images
- [x] intersperse `git` commands corresponding to each diagram part
- [ ] make diagram for `git revert`
- [ ] make example for `git revert`
- [ ] walk through to check flow of diagrams with `git` commands
- [ ] add example code (including outputs) to commands
- [ ] if time allows / needed, adjust diagram image dimensions
- [ ] write text to explain commands, essentially a script for instructors to improvise from.
Diagrams to go with the basic commands.
(starting with only a working directory, coordinate with R plotting contents)
NOTE (from RD): this image only applicable when the starting working directory is currently empty
- TODO: make sure they've created GitHub account already
(part of setup instructions?) and use that same email in the config steps.
- TODO: replace images to use correct repo name.

create a new repository called `umswc-project`.
Name your repository `umswc-project` and then click `Create Repository`.
Note: Since this repository will be connected to a local repository, it needs to be empty. Leave
"Initialize this repository with a README" unchecked, and keep "None" as options for both "Add
.gitignore" and "Add a license." See the "GitHub License and README files" exercise below for a full
explanation of why the repository needs to be empty.
$ mkdir umswc-project
$ cd umswc-project
committed our earlier work on `mars.txt`, we had a diagram of the local repository
Note that our local repository still contains our earlier work on `mars.txt`, but the
Copy that URL from the browser, go into the local `umswc-project` repository, and run
$ git remote add origin https://github.com/USERNAME/umswc-project.git
origin   https://github.com/USERNAME/umswc-project.git (push)
origin   https://github.com/USERNAME/umswc-project.git (fetch)
To https://github.com/USERNAME/umswc-project.git
From https://github.com/USERNAME/umswc-project
> Browse to your `umswc-project` repository on GitHub.
> > From https://github.com/USERNAME/umswc-project
> > From https://github.com/USERNAME/umswc-project
## Glossary