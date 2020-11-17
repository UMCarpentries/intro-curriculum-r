---
title: "Intro to Git & GitHub"
teaching: 10
exercises: 0
questions:
- "What is version control and why should I use it?"
- "How do I get set up to use Git?"
- "How do I share my changes with others on the web?"
objectives:
- "Explain what version control is and why it's useful."
- "Configure `git` the first time it is used on a computer."
- "Push to or pull from a remote repository."
keypoints:
- "Version control is like an unlimited 'undo'."
- "Version control also allows many people to work in parallel."
---

### Contents
1. [Background](#background)
1. [Setting up git](#setting-up-git)
1. [Basic Workflow](#basic-workflow)
1. [Intro to GitHub](#intro-to-github)
1. [Collaborating with GitHub](#collaborating-with-github)

## Background
_[Back to top](#contents)_

We'll start by exploring how version control can be used
to keep track of what one person did and when.
Even if you aren't collaborating with other people,
automated version control is much better than this situation:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531]({{ page.root }}/fig/git/phd101212s.png)](http://www.phdcomics.com)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com

We've all been in this situation before: it seems ridiculous to have
multiple nearly-identical versions of the same document. Some word
processors let us deal with this a little better, such as Microsoft
Word's
[Track Changes](https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a),
Google Docs' [version history](https://support.google.com/docs/answer/190843?hl=en), or
LibreOffice's [Recording and Displaying Changes](https://help.libreoffice.org/Common/Recording_and_Displaying_Changes).

Version control systems start with a base version of the document and
then record changes you make each step of the way. You can
think of it as a recording of your progress: you can rewind to start at the base
document and play back each change you made, eventually arriving at your
more recent version.

![Changes Are Saved Sequentially]({{ page.root }}/fig/git/play-changes.svg)

Once you think of changes as separate from the document itself, you
can then think about "playing back" different sets of changes on the base document, ultimately
resulting in different versions of that document. For example, two users can make independent
sets of changes on the same document.

![Different Versions Can be Saved]({{ page.root }}/fig/git/versions.svg)

Unless multiple users make changes to the same section of the document - a conflict - you can
incorporate two sets of changes into the same base document.

![Multiple Versions Can be Merged]({{ page.root }}/fig/git/merge.svg)

A version control system is a tool that keeps track of these changes for us,
effectively creating different versions of our files. It allows us to decide
which changes will be made to the next version (each record of these changes is
called a [commit]({{ page.root }}{% link reference.md %}#commit)), and keeps useful metadata
about them. The complete history of commits for a particular project and their
metadata make up a [repository]({{ page.root }}{% link reference.md %}#repository).
Repositories can be kept in sync across different computers, facilitating
collaboration among different people.


> ## Paper Writing
>
> *   Imagine you drafted an excellent paragraph for a paper you are writing, but later ruin
>     it. How would you retrieve the *excellent* version of your conclusion? Is it even possible?
>
> *   Imagine you have 5 co-authors. How would you manage the changes and comments
>     they make to your paper?  If you use LibreOffice Writer or Microsoft Word, what happens if
>     you accept changes made using the `Track Changes` option? Do you have a
>     history of those changes?
>
> > ## Solution
> >
> > *   Recovering the excellent version is only possible if you created a copy
> >     of the old version of the paper. The danger of losing good versions
> >     often leads to the problematic workflow illustrated in the PhD Comics
> >     cartoon at the top of this page.
> >     
> > *   Collaborative writing with traditional word processors is cumbersome.
> >     Either every collaborator has to work on a document sequentially
> >     (slowing down the process of writing), or you have to send out a
> >     version to all collaborators and manually merge their comments into
> >     your document. The 'track changes' or 'record changes' option can
> >     highlight changes for you and simplifies merging, but as soon as you
> >     accept changes you will lose their history. You will then no longer
> >     know who suggested that change, why it was suggested, or when it was
> >     merged into the rest of the document. Even online word processors like
> >     Google Docs or Microsoft Office Online do not fully resolve these
> >     problems.
> {: .solution}
{: .challenge}


## Setting up Git
_[Back to top](#contents)_

When we use Git on a new computer for the first time,
we need to configure a few things. Below are a few examples
of configurations we will set as we get started with Git:

*   our name and email address,
*   what our preferred text editor is,
*   and that we want to use these settings globally (i.e. for every project).

On a command line, Git commands are written as `git verb options`,
where `verb` is what we actually want to do and `options` is additional optional information which may be needed for the `verb`. So here is how
Riley sets up their new laptop:

~~~
$ git config --global user.name "Riley Shor"
$ git config --global user.email "Riley.Shor@fake.email.address"
~~~
{: .language-bash}

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
>
> As with other keys, when you hit <kbd>Return</kbd> on your keyboard,
> your computer encodes this input as a character.
> Different operating systems use different character(s) to represent the end of a line.
> (You may also hear these referred to as newlines or line breaks.)
> Because Git uses these characters to compare files,
> it may cause unexpected issues when editing a file on different machines.
> Though it is beyond the scope of this lesson, you can read more about this issue
> [in the Pro Git book](https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_core_autocrlf).
{: .callout}
>
> You can change the way Git recognizes and encodes line endings
> using the `core.autocrlf` command to `git config`.
> The following settings are recommended:
>
> On macOS and Linux:
>
> ~~~
> $ git config --global core.autocrlf input
> ~~~
> {: .language-bash}
>
> And on Windows:
>
> ~~~
> $ git config --global core.autocrlf true
> ~~~
> {: .language-bash}
>


Riley also has to set their favorite text editor, nano.

```
$ git config --global core.editor "nano -w"
```
{: .language-bash}

If you have a different preferred text editor, it is possible to reconfigure the text editor for Git to other editors whenever you want to change it.
Vim is the default editor. If did not change your editor and stuck in this editor, the following instructions will help you exit.

> ## Exiting Vim
>
> Note that Vim is the default editor for many programs. If you haven't used Vim before and wish to exit a session without saving
your changes, press <kbd>Esc</kbd> then type `:q!` and hit <kbd>Return</kbd>.
> If you want to save your changes and quit, press <kbd>Esc</kbd> then type `:wq` and hit <kbd>Return</kbd>.
{: .callout}

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
>
> In some networks you need to use a
> [proxy](https://en.wikipedia.org/wiki/Proxy_server). If this is the case, you
> may also need to tell Git about the proxy:
>
> ~~~
> $ git config --global http.proxy proxy-url
> $ git config --global https.proxy proxy-url
> ~~~
> {: .language-bash}
>
> To disable the proxy, use
>
> ~~~
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ~~~
> {: .language-bash}
{: .callout}

> ## Git Help and Manual
>
> Always remember that if you forget a `git` command, you can access the list of commands by using `-h` and access the Git manual by using `--help` :
>
> ~~~
> $ git config -h
> $ git config --help
> ~~~
> {: .language-bash}
>
> While viewing the manual, remember the `:` is a prompt waiting for commands and you can press <kbd>Q</kbd> to exit the manual.
>
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

![git-basics-flow-01-opt1]({{ page.root }}/fig/git-basics/20201117-git-01-opt1.png)  

```
git init
```
{: .language-bash}

NOTE (from RD): if starting from a working directory that is not empty (which is likely the case when we get to this part on the basis of R plotting materials)

![git-basics-flow-01-opt2]({{ page.root }}/fig/git-basics/20201117-git-01-opt2.png)  


```
git init
```
{: .language-bash}

NOTE (from RD): use this image if initiating an empty directory

![git-basics-flow-02]({{ page.root }}/fig/git-basics/20201117-git-02.png)

NOTE (from RD): Make edits to the initiated directory, or initiating from an existing, non-empty directory. I personally use a lot of `git status` to show changes and progresses and they are not necessary.

```
git status
```
{: .language-bash}

![git-basics-flow-03]({{ page.root }}/fig/git-basics/20201117-git-03.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-04]({{ page.root }}/fig/git-basics/20201117-git-04.png)

```
git commit
git status
```
{: .language-bash}

![git-basics-flow-05]({{ page.root }}/fig/git-basics/20201117-git-05.png)

NOTE (from RD): this two diagrams are optional. I used to emphasize 1) the `.git` directory is changed but not the working directory and 2) the committed changes are "official" in the git "memory" at this point if presenting in-person

![git-basics-flow-06]({{ page.root }}/fig/git-basics/20201117-git-06.png)

![git-basics-flow-07]({{ page.root }}/fig/git-basics/20201117-git-07.png)

NOTE (from RD): usually between this two diagrams, I would walk through adding another edits to the directory (e.g. adding another line in a text file) so that we can repeat the `git status`, `git add`, and `git commit` to familiarize the usage of these three specific commands. (Because in my opinion they are the most frequently used commands. This part can be adjusted accordingly.) Since we usually take a "detour" to make edits that are not directly relevant to `git`, I have included a repeated image below to pick up from where we are before the editing.

![git-basics-flow-08]({{ page.root }}/fig/git-basics/20201117-git-08=05.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-09]({{ page.root }}/fig/git-basics/20201117-git-09.png)

```
git diff
```
{: .language-bash}

![git-basics-flow-10]({{ page.root }}/fig/git-basics/20201117-git-10.png)

NOTE (from RD): just an optional reprise of diagram before the showing the differences.

![git-basics-flow-11]({{ page.root }}/fig/git-basics/20201117-git-11=9.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-12]({{ page.root }}/fig/git-basics/20201117-git-12.png)

```
git commit
git status
```
{: .language-bash}

![git-basics-flow-13]({{ page.root }}/fig/git-basics/20201117-git-13.png)

NOTE (from RD): an optional reprise of the effects of committing

```
git log
git shortlog
```
{: .language-bash}

![git-basics-flow-14]({{ page.root }}/fig/git-basics/20201117-git-14.png)

```
git diff <commit>{{ page.root }}<commit>
```
{: .language-bash}

![git-basics-flow-15]({{ page.root }}/fig/git-basics/20201117-git-15.png)

NOTE (from RD): an optional reprise. This exists only because I personally like to pause and touch base on some of the "theory" or backgound info or best practices (e.g. writing informative and concise commit messages) and therefore need to pick up again.

![git-basics-flow-16]({{ page.root }}/fig/git-basics/20201117-git-16=13.png)

```
git remote add
```
{: .language-bash}

![git-basics-flow-17]({{ page.root }}/fig/git-basics/20201117-git-17.png)

```
git push -u origin master
```
{: .language-bash}

![git-basics-flow-18]({{ page.root }}/fig/git-basics/20201117-git-18.png)

NOTE (frome RD): this might be a good place to add some collaborative contents too. If needed can reuse the figure above for a refresher.

![git-basics-flow-19]({{ page.root }}/fig/git-basics/20201117-git-19.png)

```
git remote update
git status
```
{: .language-bash}

![git-basics-flow-20]({{ page.root }}/fig/git-basics/20201117-git-20.png)

![git-basics-flow-21]({{ page.root }}/fig/git-basics/20201117-git-21=19.png)

```
git pull
git status
```
{: .language-bash}

![git-basics-flow-22]({{ page.root }}/fig/git-basics/20201117-git-22.png)

NOTE (from RD): I used to show the log again and emphasize on the difference in user names if the new edits are collaborative, or just to show that the history can pick up edits done "somewhere else".

```
git log
git status
```
{: .language-bash}

![git-basics-flow-23]({{ page.root }}/fig/git-basics/20201117-git-23.png)

NOTE (from RD): the next 4 images (i.e. 24 to 27) were made for a third round of `git add`, `commit`, `status`, now also `push` for a small exercise for practicing themselves.

![git-basics-flow-24]({{ page.root }}/fig/git-basics/20201117-git-24=22.png)

![git-basics-flow-25]({{ page.root }}/fig/git-basics/20201117-git-25.png)

![git-basics-flow-26]({{ page.root }}/fig/git-basics/20201117-git-26.png)

![git-basics-flow-27]({{ page.root }}/fig/git-basics/20201117-git-27.png)

NOTE (from RD): final remark on the importance of having a remote backup of the work and how keeping history can help reproducing the work.

![git-basics-flow-28]({{ page.root }}/fig/git-basics/20201117-git-28.png)


```
git revert
```
{: .language-bash}

NOTE (from RD): these first two diagrams for `git revert` essentially is just the second (i.e. diagram #30). I separated the two to indicate a step of inferring that since the bug / unintended change has been committed, it would be part of the .git history.

![git-basics-flow-29]({{ page.root }}/fig/git-basics/20201117-git-29.png)

![git-basics-flow-30]({{ page.root }}/fig/git-basics/20201117-git-30.png)

![git-basics-flow-31]({{ page.root }}/fig/git-basics/20201117-git-31.png)

![git-basics-flow-32]({{ page.root }}/fig/git-basics/20201117-git-32.png)

NOTE (from RD): I added a box in the diagram to emphasize how git does not deletion information while reverting. No new operation for this step.

![git-basics-flow-33]({{ page.root }}/fig/git-basics/20201117-git-33.png)

```
git restore
git checkout <file>
```
{: .language-bash}

![git-basics-flow-34]({{ page.root }}/fig/git-basics/20201117-git-34.png)

![git-basics-flow-35]({{ page.root }}/fig/git-basics/20201117-git-35.png)

## Intro to GitHub
_[Back to top](#contents)_

- TODO: make sure they've created GitHub account already
(part of setup instructions?) and use that same email in the config steps.
- TODO: replace images to use correct repo name.

Now that you've created a git repo and gotten the hang of the basic git workflow,
it's time to share your repo with the world.
Systems like Git allow us to move work between any two repositories. In
practice, though, it's easiest to use one copy as a central hub, and to keep it
on the web rather than on someone's laptop. Most programmers use hosting
services like [GitHub](https://github.com), [Bitbucket](https://bitbucket.org) or
[GitLab](https://gitlab.com/) to hold those master copies.

Let's start by sharing the changes we've made to our current project with the
world. Log in to GitHub, then click on the icon in the top right corner to
create a new repository called `umswc-project`.

![Creating a Repository on GitHub (Step 1)]({{ page.root }}/fig/git/github-create-repo-01.png)

Name your repository `umswc-project` and then click `Create Repository`.

Note: Since this repository will be connected to a local repository, it needs to be empty. Leave
"Initialize this repository with a README" unchecked, and keep "None" as options for both "Add
.gitignore" and "Add a license." See the "GitHub License and README files" exercise below for a full
explanation of why the repository needs to be empty.

![Creating a Repository on GitHub (Step 2)]({{ page.root }}/fig/git/github-create-repo-02.png)

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository:

![Creating a Repository on GitHub (Step 3)]({{ page.root }}/fig/git/github-create-repo-03.png)

This effectively does the following on GitHub's servers:

```
$ mkdir umswc-project
$ cd umswc-project
$ git init
```
{: .language-bash}

If you remember back to the earlier [lesson]({{ page.root }}/04-changes/) where we added and
committed our earlier work on `mars.txt`, we had a diagram of the local repository
which looked like this:

![The Local Repository with Git Staging Area]({{ page.root }}/fig/git/git-staging-area.svg)

Now that we have two repositories, we need a diagram like this:

![Freshly-Made GitHub Repository]({{ page.root }}/fig/git/git-freshly-made-github-repo.svg)

Note that our local repository still contains our earlier work on `mars.txt`, but the
remote repository on GitHub appears empty as it doesn't contain any files yet.

The next step is to connect the two repositories.  We do this by making the
GitHub repository a [remote]({{ page.root}}{% link reference.md %}#remote) for the local repository.
The home page of the repository on GitHub includes the string we need to
identify it:

![Where to Find Repository URL on GitHub]({{ page.root }}/fig/git/github-find-repo-string.png)

Copy that URL from the browser, go into the local `umswc-project` repository, and run
this command:

```
$ git remote add origin https://github.com/USERNAME/umswc-project.git
```
{: .language-bash}

Make sure to replace `USERNAME` with your actual GitHub username so it will use
the correct URL for your repository; that should be the only difference.

`origin` is a local name used to refer to the remote repository. It could be called
anything, but `origin` is a convention that is often used by default in git
and GitHub, so it's helpful to stick with this unless there's a reason not to.

We can check that the command has worked by running `git remote -v`:

```
$ git remote -v
```
{: .language-bash}

```
origin   https://github.com/USERNAME/umswc-project.git (push)
origin   https://github.com/USERNAME/umswc-project.git (fetch)
```
{: .output}

Once the remote is set up, this command will push the changes from
our local repository to the repository on GitHub:

```
$ git push origin master
```
{: .language-bash}

```
Enumerating objects: 16, done.
Counting objects: 100% (16/16), done.
Delta compression using up to 8 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (16/16), 1.45 KiB | 372.00 KiB/s, done.
Total 16 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/USERNAME/umswc-project.git
 * [new branch]      master -> master
```
{: .output}

Our local and remote repositories are now in this state:

![GitHub Repository After First Push]({{ page.root }}/fig/git/github-repo-after-first-push.svg)

> ## The '-u' Flag
>
> You may see a `-u` option used with `git push` in some documentation.  This
> option is synonymous with the `--set-upstream-to` option for the `git branch`
> command, and is used to associate the current branch with a remote branch so
> that the `git pull` command can be used without any arguments. To do this,
> simply use `git push -u origin master` once the remote has been set up.
{: .callout}

We can pull changes from the remote repository to the local one as well:

```
$ git pull origin master
```
{: .language-bash}

```
From https://github.com/USERNAME/umswc-project
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```
{: .output}

Pulling has no effect in this case because the two repositories are already
synchronized.  If someone else had pushed some changes to the repository on
GitHub, though, this command would download them to our local repository.

> ## GitHub GUI
>
> Browse to your `umswc-project` repository on GitHub.
> Under the Code tab, find and click on the text that says "XX commits" (where "XX" is some number).
> Hover over, and click on, the three buttons to the right of each commit.
> What information can you gather/explore from these buttons?
> How would you get that same information in the shell?
>
> > ## Solution
> > The left-most button (with the picture of a clipboard) copies the full identifier of the commit
> > to the clipboard. In the shell, ```git log``` will show you the full commit identifier for each
> > commit.
> >
> > When you click on the middle button, you'll see all of the changes that were made in that
> > particular commit. Green shaded lines indicate additions and red ones removals. In the shell we
> > can do the same thing with ```git diff```. In particular, ```git diff ID1{{ page.root }}ID2``` where ID1 and
> > ID2 are commit identifiers (e.g. ```git diff a3bf1e5{{ page.root }}041e637```) will show the differences
> > between those two commits.
> >
> > The right-most button lets you view all of the files in the repository at the time of that
> > commit. To do this in the shell, we'd need to checkout the repository at that particular time.
> > We can do this with ```git checkout ID``` where ID is the identifier of the commit we want to
> > look at. If we do this, we need to remember to put the repository back to the right state
> > afterwards!
> {: .solution}
{: .challenge}

> ## Uploading files directly in GitHub browser
>
> Github also allows you to skip the command line and upload files directly to
> your repository without having to leave the browser. There are two options.
> First you can click the "Upload files" button in the toolbar at the top of the
> file tree. Or, you can drag and drop files from your desktop onto the file
> tree. You can read more about this [on this GitHub page](https://help.github.com/articles/adding-a-file-to-a-repository/)
{: .callout}

> ## Push vs. Commit
>
> In this lesson, we introduced the "git push" command.
> How is "git push" different from "git commit"?
>
> > ## Solution
> > When we push changes, we're interacting with a remote repository to update it with the changes
> > we've made locally (often this corresponds to sharing the changes we've made with others).
> > Commit only updates your local repository.
> {: .solution}
{: .challenge}

> ## GitHub License and README files
>
> In this section we learned about creating a remote repository on GitHub, but when you initialized
> your GitHub repo, you didn't add a README.md or a license file. If you had, what do you think
> would have happened when you tried to link your local and remote repositories?
>
> > ## Solution
> > In this case, we'd see a merge conflict due to unrelated histories. When GitHub creates a
> > README.md file, it performs a commit in the remote repository. When you try to pull the remote
> > repository to your local repository, Git detects that they have histories that do not share a
> > common origin and refuses to merge.
> > ```
> > $ git pull origin master
> > ```
> > {: .language-bash}
> >
> > ```
> > warning: no common commits
> > remote: Enumerating objects: 3, done.
> > remote: Counting objects: 100% (3/3), done.
> > remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
> > Unpacking objects: 100% (3/3), done.
> > From https://github.com/USERNAME/umswc-project
> >  * branch            master     -> FETCH_HEAD
> >  * [new branch]      master     -> origin/master
> > fatal: refusing to merge unrelated histories
> > ```
> > {: .output}
> >
> > You can force git to merge the two repositories with the option `--allow-unrelated-histories`.
> > Be careful when you use this option and carefully examine the contents of local and remote
> > repositories before merging.
> > ```
> > $ git pull --allow-unrelated-histories origin master
> > ```
> > {: .language-bash}
> >
> > ```
> > From https://github.com/USERNAME/umswc-project
> >  * branch            master     -> FETCH_HEAD
> > Merge made by the 'recursive' strategy.
> > README.md | 1 +
> > 1 file changed, 1 insertion(+)
> > create mode 100644 README.md
> > ```
> > {: .output}
> >
> {: .solution}
{: .challenge}

## Collaborating with GitHub
_[Back to top](#contents)_

## More Commands
