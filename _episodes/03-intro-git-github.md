---
title: "Intro to Git & GitHub"
teaching: 90
exercises: 30
questions:
- "What is version control and why should I use it?"
- "How do I get set up to use Git?"
- "How do I share my changes with others on the web?"
- "How can I use version control to collaborate with other people?"
objectives:
- "Explain what version control is and why it's useful."
- "Configure `git` the first time it is used on a computer."
- "Learn the basic git workflow."
- "Push, pull, or clone a remote repository."
- "Describe the basic collaborative workflow with GitHub."
keypoints:
- "Version control is like an unlimited 'undo'."
- "Version control also allows many people to work in parallel."
---

### Contents
1. [Background](#background)
1. [Setting up git](#setting-up-git)
1. [Creating a Repository](#creating-a-repository)
1. [Tracking Changes](#tracking-changes)
1. [Intro to GitHub](#intro-to-github)
1. [Collaborating with GitHub](#collaborating-with-github)
1. [BONUS](#bonus)
1. [Glossary of terms](#glossary)

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

```
$ git config --global user.name "Riley Shor"
$ git config --global user.email "Riley.Shor@fake.email.address"
```
{: .language-bash}

Please use your own name and email address instead of Riley's.
This user name and email will be associated with your subsequent Git activity,
which means that any changes pushed to
[GitHub](https://github.com/),
[BitBucket](https://bitbucket.org/),
[GitLab](https://gitlab.com/) or
another Git host server
in a later lesson will include this information.

For these lessons, we will be interacting with [GitHub](https://github.com/) and so the email address used should be the same as the one used when setting up your GitHub account. If you are concerned about privacy, please review [GitHub's instructions for keeping your email address private][git-privacy].

> ## GitHub, GitLab, & BitBucket
>
> GitHub, GitLab, & BitBucket are websites where you can store your git
> repositories, share them with the world, and collaborate with others.
> You can think of them like email applications. You may have a gmail address,
> and you can choose to manage your email through one of many services such as
> the Gmail app, Microsoft Outlook, Apple's Mail app, etc.
> They have different interfaces and features, but all of them allow you to
> manage your email. Similarly, GitHub, GitLab, & BitBucket have different
> interfaces and features, but they all allow you to store, share, and
> collaborate with others on your git repos.
>
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
> ```
> $ git config --global core.autocrlf input
> ```
> {: .language-bash}
>
> And on Windows:
>
> ```
> $ git config --global core.autocrlf true
> ```
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

```
$ git config --list
```
{: .language-bash}

You can change your configuration as many times as you want: use the
same commands to choose another editor or update your email address.

> ## Proxy
>
> In some networks you need to use a
> [proxy](https://en.wikipedia.org/wiki/Proxy_server). If this is the case, you
> may also need to tell Git about the proxy:
>
> ```
> $ git config --global http.proxy proxy-url
> $ git config --global https.proxy proxy-url
> ```
> {: .language-bash}
>
> To disable the proxy, use
>
> ```
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ```
> {: .language-bash}
{: .callout}

> ## Git Help and Manual
>
> Always remember that if you forget a `git` command, you can access the list of commands by using `-h` and access the Git manual by using `--help` :
>
> ```
> $ git config -h
> $ git config --help
> ```
> {: .language-bash}
>
> While viewing the manual, remember the `:` is a prompt waiting for commands and you can press <kbd>Q</kbd> to exit the manual.
>
{: .callout}

[git-privacy]: https://help.github.com/articles/keeping-your-email-address-private/

## Creating a Repository
_[Back to top](#contents)_

Once Git is configured, we can start using it.


First, let's make sure we are in our `un-report` directory, if not we need to move into that directory:

```
$ pwd
```
{: .language-bash}

```
$ /home/USERNAME/Desktop/un-report
```
{: .output}

> To get back to your `un-report` directory you can use the following command:
>
>Mac/git-bash:
>```
>cd ~/Desktop/un-report
>```
>{: .language-bash}
>
> On Windows' Unix subsystem for Linux:
>```
>cd c/USERNAME/Desktop/un-report
>```
>{: .language-bask}
{: .callout}

What is currently in our directory?

```
$ ls
```
{: .language-bash}

```
code    data    figures
```
{: .output}


Now we tell Git to make `un-report` a [repository]({{ page.root }}{% link reference.md %}#repository)
-- a place where Git can store versions of our files:


```
$ git init
```
{: .language-bash}

It is important to note that `git init` will create a repository that
includes subdirectories and their files---there is no need to create
separate repositories nested within the `un-report` repository, whether
subdirectories are present from the beginning or added later. Also, note
that the creation of the `un-report` directory and its initialization as a
repository are completely separate processes.

If we use `ls` to show the directory's contents,
it appears that nothing has changed:

```
$ ls
```
{: .language-bash}

But if we add the `-a` flag to show everything,
we can see that Git has created a hidden directory within `un-report` called `.git`:

```
$ ls -a
```
{: .language-bash}

```
.	..	.git	code	data	figures
```
{: .output}

Git uses this special subdirectory to store all the information about the project,
including all files and sub-directories located within the project's directory.
If we ever delete the `.git` subdirectory,
we will lose the project's history.

We can check that everything is set up correctly
by asking Git to tell us the status of our project:

```
$ git status
```
{: .language-bash}
```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

nothing added to commit but untracked files present (use "git add" to track)
```
{: .output}

If you are using a different version of `git`, the exact
wording of the output might be slightly different.

> ## Places to Create Git Repositories
>
> Along with tracking information about un-report (the project we have already created),
> Riley would also like to track information about countries.
> Despite our concerns, Riley creates a `countries` project inside their `un-report`
> project with the following sequence of commands:
>
> ```
> $ cd ~/Desktop   # return to Desktop directory
> $ cd un-report     # go into un-report directory, which is already a Git repository
> $ ls -a          # ensure the .git subdirectory is still present in the un-report directory
> $ mkdir countries    # make a subdirectory un-report/countries
> $ cd countries       # go into countries subdirectory
> $ git init       # make the countries subdirectory a Git repository
> $ ls -a          # ensure the .git subdirectory is present indicating we have created a new Git repository
> ```
> {: .language-bash}
>
> Is the `git init` command, run inside the `countries` subdirectory, required for
> tracking files stored in the `countries` subdirectory?
>
> > ## Solution
> >
> > No. Riley does not need to make the `countries` subdirectory a Git repository
> > because the `un-report` repository will track all files, sub-directories, and
> > subdirectory files under the `un-report` directory.  Thus, in order to track
> > all information about countries, Riley only needed to add the `countries` subdirectory
> > to the `un-report` directory.
> >
> > Additionally, Git repositories can interfere with each other if they are "nested":
> > the outer repository will try to version-control
> > the inner repository. Therefore, it's best to create each new Git
> > repository in a separate directory. To be sure that there is no conflicting
> > repository in the directory, check the output of `git status`. If it looks
> > like the following, you are good to go to create a new repository as shown
> > above:
> >
> > ```
> > $ git status
> > ```
> > {: .language-bash}
> > ```
> > fatal: Not a git repository (or any of the parent directories): .git
> > ```
> > {: .output}
> {: .solution}
{: .challenge}
> ## Correcting `git init` Mistakes
> We explain to Riley how a nested repository is redundant and may cause confusion
> down the road. Riley would like to remove the nested repository. How can Riley undo
> his last `git init` in the `countries` subdirectory?
>
> > ## Solution -- USE WITH CAUTION!
> >
> > ### Background
> > Removing files from a git repository needs to be done with caution. To remove files from the working tree and not from your working directory, use
> > ```
> > $ rm filename
> > ```
> > {: .language-bash}
> >
> > The file being removed has to be in sync with the branch head with no updates. If there are updates, the file can be removed by force by using the `-f` option. Similarly a directory can be removed from git using `rm -r dirname` or `rm -rf dirname`.
> >
> > ### Solution
> > Git keeps all of its files in the `.git` directory.
> > To recover from this little mistake, Riley can just remove the `.git`
> > folder in the countries subdirectory by running the following command from inside the `un-report` directory:
> >
> > ```
> > $ rm -rf countries/.git
> > ```
> > {: .language-bash}
> >
> > But be careful! Running this command in the wrong directory, will remove
> > the entire Git history of a project you might want to keep. Therefore, always check your current directory using the
> > command `pwd`.
> {: .solution}
{: .challenge}


## Tracking Changes
_[Back to top](#contents)_

Let's make sure we're still in the right directory.
You should be in the `un-report` directory.

```
$ cd ~/Desktop/un-report
```
{: .language-bash}

Let's create a file called `notes.txt`. We'll write some notes about the plot we
have made so far -- later we'll add more details about the project. We'll use
`nano` to edit the file; you can use whatever text editor you like.

```
$ nano notes.txt
```
{: .language-bash}

Type the text below into the `notes.txt` file:

```
We plotted life expectancy over time.
```

Let's first verify that the file was properly created by running the list command (`ls`):


```
$ ls
```
{: .language-bash}

```
notes.txt
```
{: .output}


`notes.txt` contains a single line, which we can see by running:

```
$ cat notes.txt
```
{: .language-bash}

```
We plotted life expectancy over time.
```
{: .output}

If we check the status of our project again,
Git tells us that it's noticed the new file:

```
$ git status
```
{: .language-bash}

```
On branch master

No commits yet

Untracked files:
   (use "git add <file>..." to include in what will be committed)

	notes.txt

nothing added to commit but untracked files present (use "git add" to track)
```
{: .output}

The "untracked files" message means that there's a file in the directory
that Git isn't keeping track of.
We can tell Git to track a file using `git add`:

```
$ git add notes.txt
```
{: .language-bash}

and then check that the right thing happened:

```
$ git status
```
{: .language-bash}

```
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   notes.txt

```
{: .output}

Git now knows that it's supposed to keep track of `notes.txt`,
but it hasn't recorded these changes as a commit yet.
To get it to do that,
we need to run one more command:

```
$ git commit -m "Start notes on analysis"
```
{: .language-bash}

```
[master (root-commit) f22b25e] Start notes on analysis
 1 file changed, 1 insertion(+)
 create mode 100644 notes.txt
```
{: .output}

When we run `git commit`,
Git takes everything we have told it to save by using `git add`
and stores a copy permanently inside the special `.git` directory.
This permanent copy is called a [commit]({{ page.root }}{% link reference.md %}#commit)
(or [revision]({{ page.root }}{% link reference.md %}#revision)) and its short identifier is `f22b25e`. Your commit may have another identifier.

We use the `-m` flag (for "message")
to record a short, descriptive, and specific comment that will help us remember later on what we did and why.
If we just run `git commit` without the `-m` option,
Git will launch `nano` (or whatever other editor we configured as `core.editor`)
so that we can write a longer message.

[Good commit messages][commit-messages] start with a brief (<50 characters) statement about the
changes made in the commit. Generally, the message should complete the sentence "If applied, this commit will" <commit message here>.
If you want to go into more detail, add a blank line between the summary line and your additional notes. Use this additional space to explain why you made changes and/or what their impact will be.

If we run `git status` now:

```
$ git status
```
{: .language-bash}

```
On branch master
nothing to commit, working directory clean
```
{: .output}

it tells us everything is up to date.
If we want to know what we've done recently,
we can ask Git to show us the project's history using `git log`:

```
$ git log
```
{: .language-bash}

```
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Riley Shor <Riley.Shor@fake.email.address>
Date:   Thu Aug 22 09:51:46 2020 -0400

    Start notes on analysis
```
{: .output}

`git log` lists all commits  made to a repository in reverse chronological order.
The listing for each commit includes
the commit's full identifier
(which starts with the same characters as
the short identifier printed by the `git commit` command earlier),
the commit's author,
when it was created,
and the log message Git was given when the commit was created.

> ## Where Are My Changes?
>
> If we run `ls` at this point, we will still see just one file called `notes.txt`.
> That's because Git saves information about files' history
> in the special `.git` directory mentioned earlier
> so that our filesystem doesn't become cluttered
> (and so that we can't accidentally edit or delete an old version).
{: .callout}

Now suppose Riley adds more information to the file.
(Again, we'll edit with `nano` and then `cat` the file to show its contents;
you may use a different editor, and don't need to `cat`.)

```
$ nano notes.txt
$ cat notes.txt
```
{: .language-bash}

```
We plotted life expectancy over time.
Each point represents a country.
```
{: .output}

When we run `git status` now,
it tells us that a file it already knows about has been modified:

```
$ git status
```
{: .language-bash}

```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   notes.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
{: .output}

The last line is the key phrase:
"no changes added to commit".
We have changed this file,
but we haven't told Git we will want to save those changes
(which we do with `git add`)
nor have we saved them (which we do with `git commit`).
So let's do that now. It is good practice to always review
our changes before saving them. We do this using `git diff`.
This shows us the differences between the current state
of the file and the most recently saved version:

```
$ git diff
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index df0654a..315bf3a 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1 +1,2 @@
 We plotted life expectancy over time.
+Each point represents a country.
```
{: .output}

The output is cryptic because
it is actually a series of commands for tools like editors and `patch`
telling them how to reconstruct one file given the other.
If we break it down into pieces:

1.  The first line tells us that Git is producing output similar to the Unix `diff` command
    comparing the old and new versions of the file.
2.  The second line tells exactly which versions of the file
    Git is comparing;
    `df0654a` and `315bf3a` are unique computer-generated labels for those versions.
3.  The third and fourth lines once again show the name of the file being changed.
4.  The remaining lines are the most interesting, they show us the actual differences
    and the lines on which they occur.
    In particular,
    the `+` marker in the first column shows where we added a line.

After reviewing our change, it's time to commit it:

```
$ git commit -m "Add information on points"
$ git status
```
{: .language-bash}

```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   notes.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
{: .output}

Whoops:
Git won't commit because we didn't use `git add` first.
Let's fix that:

```
$ git add notes.txt
$ git commit -m "Add information on points"
```
{: .language-bash}

```
[master 34961b1] Add information on points
 1 file changed, 1 insertion(+)
```
{: .output}

Git insists that we add files to the set we want to commit
before actually committing anything. This allows us to commit our
changes in stages and capture changes in logical portions rather than
only large batches.
For example,
suppose we're adding a few citations to relevant research to our thesis.
We might want to commit those additions,
and the corresponding bibliography entries,
but *not* commit some of our work drafting the conclusion
(which we haven't finished yet).

To allow for this,
Git has a special *staging area*
where it keeps track of things that have been added to
the current [changeset]({{ page.root }}{% link reference.md %}#changeset)
but not yet committed.

> ## Staging Area
>
> If you think of Git as taking snapshots of changes over the life of a project,
> `git add` specifies *what* will go in a snapshot
> (putting things in the staging area),
> and `git commit` then *actually takes* the snapshot, and
> makes a permanent record of it (as a commit).
> If you don't have anything staged when you type `git commit`,
> Git will prompt you to use `git commit -a` or `git commit --all`,
> which is kind of like gathering *everyone* to take a group photo!
> However, it's almost always better to
> explicitly add things to the staging area, because you might
> commit changes you forgot you made. (Going back to the group photo simile,
> you might get an extra with incomplete makeup walking on
> the stage for the picture because you used `-a`!)
> Try to stage things manually,
> or you might find yourself searching for "how to undo a commit" more
> than you would like!
> We'll show you how to do this a little later in this lesson.
{: .callout}

![The Git Staging Area]({{ page.root }}/fig/git/git-staging-area.svg)

Let's watch as our changes to a file move from our editor
to the staging area
and into long-term storage.
First,
we'll add another line to the file:

```
$ nano notes.txt
$ cat notes.txt
```
{: .language-bash}

```
We plotted life expectancy over time.
Each point represents a country.
Continents are grouped by color.
```
{: .output}

```
$ git diff
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index 315bf3a..b36abfd 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1,2 +1,3 @@
 We plotted life expectancy over time.
 Each point represents a country.
+Continents are grouped by color.
```
{: .output}

So far, so good:
we've added one line to the end of the file
(shown with a `+` in the first column).
Now let's put that change in the staging area
and see what `git diff` reports:

```
$ git add notes.txt
$ git diff
```
{: .language-bash}

There is no output:
as far as Git can tell,
there's no difference between what it's been asked to save permanently
and what's currently in the directory.
However,
if we do this:

```
$ git diff --staged
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index 315bf3a..b36abfd 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1,2 +1,3 @@
 We plotted life expectancy over time.
 Each point represents a country.
+Continents are grouped by color.
```
{: .output}

it shows us the difference between
the last committed change
and what's in the staging area.
Let's save our changes:

```
$ git commit -m "Add note about point color"
```
{: .language-bash}

```
[master 005937f] Add note about point color
 1 file changed, 1 insertion(+)
```
{: .output}

check our status:

```
$ git status
```
{: .language-bash}

```
On branch master
nothing to commit, working directory clean
```
{: .output}

and look at the history of what we've done so far:

```
$ git log
```
{: .language-bash}

```
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
Author: Riley Shor <Riley.Shor@fake.email.address>
Date:   Thu Aug 22 10:14:07 2020 -0400

    Add note about point color

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Riley Shor <Riley.Shor@fake.email.address>
Date:   Thu Aug 22 10:07:21 2020 -0400

    Add information on points

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Riley Shor <Riley.Shor@fake.email.address>
Date:   Thu Aug 22 09:51:46 2020 -0400

    Start notes on analysis
```
{: .output}

> ## Word-based diffing
>
> Sometimes, e.g. in the case of the text documents a line-wise
> diff is too coarse. That is where the `--color-words` option of
> `git diff` comes in very useful as it highlights the changed
> words using colors.
{: .callout}

> ## Paging the Log
>
> When the output of `git log` is too long to fit in your screen,
> `git` uses a program to split it into pages of the size of your screen.
> When this "pager" is called, you will notice that the last line in your
> screen is a `:`, instead of your usual prompt.
>
> *   To get out of the pager, press <kbd>Q</kbd>.
> *   To move to the next page, press <kbd>Spacebar</kbd>.
> *   To search for `some_word` in all pages,
>     press <kbd>/</kbd>
>     and type `some_word`.
>     Navigate through matches pressing <kbd>N</kbd>.
{: .callout}

> ## Limit Log Size
>
> To avoid having `git log` cover your entire terminal screen, you can limit the
> number of commits that Git lists by using `-N`, where `N` is the number of
> commits that you want to view. For example, if you only want information from
> the last commit you can use:
>
> ```
> $ git log -1
> ```
> {: .language-bash}
>
> ```
> commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
> Author: Riley Shor <Riley.Shor@fake.email.address>
> Date:   Thu Aug 22 10:14:07 2020 -0400
>
>    Add note about point color
> ```
> {: .output}
>
> You can also reduce the quantity of information using the
> `--oneline` option:
>
> ```
> $ git log --oneline
> ```
> {: .language-bash}
> ```
> 005937f Add note about point color
> 34961b1 Add information on points
> f22b25e Start notes on analysis
> ```
> {: .output}
>
> You can also combine the `--oneline` option with others. One useful
> combination adds `--graph` to display the commit history as a text-based
> graph and to indicate which commits are associated with the
> current `HEAD`, the current branch `master`, or
> [other Git references][git-references]:
>
> ```
> $ git log --oneline --graph
> ```
> {: .language-bash}
> ```
> * 005937f (HEAD -> master) Add note about point color
> * 34961b1 Add information on points
> * f22b25e Start notes on analysis
> ```
> {: .output}
{: .callout}

> ## Directories
>
> Two important facts you should know about directories in Git.
>
> 1. Git does not track directories on their own, only files within them.
>    Try it for yourself:
>
>    ```
>    $ mkdir analysis
>    $ git status
>    $ git add analysis
>    $ git status
>    ```
>    {: .language-bash}
>
>    Note, our newly created empty directory `analysis` does not appear in
>    the list of untracked files even if we explicitly add it (_via_ `git add`) to our
>    repository. This is the reason why you will sometimes see `.gitkeep` files
>    in otherwise empty directories. Unlike `.gitignore`, these files are not special
>    and their sole purpose is to populate a directory so that Git adds it to
>    the repository. In fact, you can name such files anything you like.
>
> 2. If you create a directory in your Git repository and populate it with files,
>    you can add all files in the directory at once by:
>
>    ```
>    git add <directory-with-files>
>    ```
>    {: .language-bash}
>
>    Try it for yourself:
>
>    ```
>    $ touch analysis/file-1.txt analysis/file-2.txt
>    $ git status
>    $ git add analysis
>    $ git status
>    ```
>    {: .language-bash}
>
>    Note: the `touch` command creates blank text files that you can later edit
>    with your preferred text editor.
>
>    Before moving on, we will commit these changes.
>
>    ```
>    $ git commit -m "Create blank text files"
>    ```
>    {: .language-bash}
>
{: .callout}

To recap, when we want to add changes to our repository,
we first need to add the changed files to the staging area
(`git add`) and then commit the staged changes to the
repository (`git commit`):

![The Git Commit Workflow]({{ page.root }}/fig/git/git-committing.svg)

> ## Choosing a Commit Message
>
> Which of the following commit messages would be most appropriate for the
> last commit made to `notes.txt`?
>
> 1. "Changes"
> 2. "Added line 'Continents are grouped by color.' to notes.txt"
> 3. "Describe grouping"
>
> > ## Solution
> > Answer 1 is not descriptive enough, and the purpose of the commit is unclear;
> > and answer 2 is redundant to using "git diff" to see what changed in this commit;
> > but answer 3 is good: short, descriptive, and imperative.
> {: .solution}
{: .challenge}

> ## Committing Changes to Git
>
> Which command(s) below would save the changes of `myfile.txt`
> to my local Git repository?
>
> 1. ```
>    $ git commit -m "my recent changes"
>    ```
>    {: .language-bash}
> 2. ```
>    $ git init myfile.txt
>    $ git commit -m "my recent changes"
>    ```
>    {: .language-bash}
> 3. ```
>    $ git add myfile.txt
>    $ git commit -m "my recent changes"
>    ```
>    {: .language-bash}
> 4. ```
>    $ git commit -m myfile.txt "my recent changes"
>    ```
>    {: .language-bash}
>
> > ## Solution
> >
> > 1. Would only create a commit if files have already been staged.
> > 2. Would try to create a new repository.
> > 3. Is correct: first add the file to the staging area, then commit.
> > 4. Would try to commit a file "my recent changes" with the message myfile.txt.
> {: .solution}
{: .challenge}

> ## Committing Multiple Files
>
> The staging area can hold changes from any number of files
> that you want to commit as a single snapshot.
>
> 1. Add some text to `notes.txt` noting your decision
> to consider writing a manuscript.
> 2. Create a new file `manuscript.txt` with your initial thoughts.
> 3. Add changes from both files to the staging area,
> and commit those changes.
>
> > ## Solution
> >
> > First we make our changes to the `notes.txt` and `manuscript.txt` files:
> > ```
> > $ nano notes.txt
> > $ cat notes.txt
> > ```
> > {: .language-bash}
> > ```
> > Maybe I should start with a draft manuscript.
> > ```
> > {: .output}
> > ```
> > $ nano manuscript.txt
> > $ cat manuscript.txt
> > ```
> > {: .language-bash}
> > ```
> > This is where I will write an awesome manuscript.
> > ```
> > {: .output}
> > Now you can add both files to the staging area. We can do that in one line:
> >
> > ```
> > $ git add notes.txt manuscript.txt
> > ```
> > {: .language-bash}
> > Or with multiple commands:
> > ```
> > $ git add notes.txt
> > $ git add manuscript.txt
> > ```
> > {: .language-bash}
> > Now the files are ready to commit. You can check that using `git status`. If you are ready to commit use:
> > ```
> > $ git commit -m "Note plans to start a draft manuscript"
> > ```
> > {: .language-bash}
> > ```
> > [master cc127c2]
> >  Note plans to start a draft manuscript
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 manuscript.txt
> > ```
> > {: .output}
> {: .solution}
{: .challenge}

> ## `workshop` Repository
>
> * Create a new Git repository on your computer called `workshop`.
> * Write a three lines about what you have learned about R and bash a file called `notes.txt`,
> commit your changes
> * Modify one line, add a fourth line
> * Display the differences
> between its updated state and its original state.
>
> > ## Solution
> >
> > If needed, move out of the `un-report` folder:
> >
> > ```
> > $ cd ..
> > ```
> > {: .language-bash}
> >
> > Create a new folder called `workshop` and 'move' into it:
> >
> > ```
> > $ mkdir workshop
> > $ cd workshop
> > ```
> > {: .language-bash}
> >
> > Initialise git:
> >
> > ```
> > $ git init
> > ```
> > {: .language-bash}
> >
> > Create your file `notes.txt` using `nano` or another text editor.
> > Once in place, add and commit it to the repository:
> >
> > ```
> > $ git add notes.txt
> > $ git commit -m "Add notes file"
> > ```
> > {: .language-bash}
> >
> > Modify the file as described (modify one line, add a fourth line).
> > To display the differences
> > between its updated state and its original state, use `git diff`:
> >
> > ```
> > $ git diff notes.txt
> > ```
> > {: .language-bash}
> >
> {: .solution}
{: .challenge}

[commit-messages]: https://chris.beams.io/posts/git-commit/
[git-references]: https://git-scm.com/book/en/v2/Git-Internals-Git-References

{% include links.md %}

## Undoing changes
_[Back to top](#contents)_

> ## Reverting a Commit
>
> Jennifer is collaborating on her Python script with her colleagues and
> realizes her last commit to the project's repository contained an error and
> she wants to undo it.  `git revert [erroneous commit ID]` will create a new
> commit that reverses Jennifer's erroneous commit. Therefore `git revert` is
> different to `git checkout [commit ID]` because `git checkout` returns the
> files within the local repository to a previous state, whereas `git revert`
> reverses changes committed to the local and project repositories.  
> Below are the right steps and explanations for Jennifer to use `git revert`,
> what is the missing command in step 1 below?
>
> 1. `________ # Look at the git history of the project to find the commit ID`
>
> 2. Copy the ID (the first few characters of the ID, e.g. 0b1d055).
>
> 3. `git revert [commit ID]`
>
> 4. Type in the new commit message.
>
> 5. Save and close
>
> > ## Solution
> >
> > Use `git log` to look at the git history to find the commit ID.
> {: .solution}
{: .challenge}

> ## Understanding Workflow and History
>
> What is the output of the last command in
>
> ```
> $ echo "Here are my notes from the workshop." > notes.txt
> $ git add notes.txt
> $ echo "I learned the unix shell, git & github, and the R programming language." >> notes.txt
> $ git commit -m "Create workshop notes"
> $ git checkout HEAD notes.txt
> $ cat notes.txt #this will print the contents of notes.txt to the screen
> ```
> {: .language-bash}
>
> 1. ```
>    I learned the unix shell, git & github, and the R programming language.
>    ```
>    {: .output}
> 2. ```
>    Here are my notes from the workshop.
>    ```
>    {: .output}
> 3. ```
>    Here are my notes from the workshop.
>    I learned the unix shell, git & github, and the R programming language.
>    ```
>    {: .output}
> 4. ```
>    Error because you have changed notes.txt without committing the changes
>    ```
>    {: .output}
>
> > ## Solution
> >
> > The answer is 2.
> >
> > The command `git add notes.txt` places the current version of `notes.txt` into the staging area.
> > The changes to the file from the second `echo` command are only applied to the working copy,
> > not the version in the staging area.
> >
> > So, when `git commit -m "Create workshop notes"` is executed,
> > the version of `notes.txt` committed to the repository is the one from the staging area and
> > has only one line.
> >  
> >  At this time, the working copy still has the second line (and
> >  `git status` will show that the file is modified). However, `git checkout HEAD notes.txt`
> >  replaces the working copy with the most recently committed version of `notes.txt`.
> >  
> >  So, `cat notes.txt` will output
> >  ```
> >  Here are my notes from the workshop..
> >  ```
> > {: .output}
> {: .solution}
{: .challenge}

> ## Checking Understanding of `git diff`
>
> Consider this command: `git diff HEAD~3 notes.txt`. What do you predict this command
> will do if you execute it? What happens when you do execute it? Why?
>
> > ## Solution
> > The diff will show the difference between the current version of notes.txt
> > and the version that existed 3 commits ago.
> {: .solution}
>
> Try another command, `git diff [ID] notes.txt`, where [ID] is replaced with
> the unique identifier for your most recent commit. What do you think will happen,
> and what does happen?
>
> > ## Solution
> >
> > The diff will show the difference between the current version of notes.txt
> > and the version that exited in the commit from [ID].
> {: .solution}
{: .challenge}

> ## Getting Rid of Staged Changes
>
> `git checkout` can be used to restore a previous commit when unstaged changes have
> been made, but will it also work for changes that have been staged but not committed?
> Make a change to `notes.txt`, add that change, and use `git checkout` to see if
> you can remove your change.
>
> > ## Solution
> >
> > `git checkout notes.txt` does not work for this purpose.
> > Instead, use the restore command with the staged flag:
> > `git restore --staged notes.txt`
> {: .solution}
{: .challenge}

> ## Explore and Summarize Histories
>
> Exploring history is an important part of Git, and often it is a challenge to find
> the right commit ID, especially if the commit is from several months ago.
>
> Imagine the `analysis` project has more than 50 files.
> You would like to find a commit that modifies some specific text in `notes.txt`.
> When you type `git log`, a very long list appeared.
> How can you narrow down the search?
>
> Recall that the `git diff` command allows us to explore one specific file,
> e.g., `git diff notes.txt`. We can apply a similar idea here.
>
> ```
> $ git log notes.txt
> ```
> {: .language-bash}
>
> Unfortunately some of these commit messages are very ambiguous, e.g., `update files`.
> How can you search through these files?
>
> Both `git diff` and `git log` are very useful and they summarize a different part of the history
> for you.
> Is it possible to combine both? Let's try the following:
>
> ```
> $ git log --patch notes.txt
> ```
> {: .language-bash}
>
> You should get a long list of output, and you should be able to see both commit messages and
> the difference between each commit.
>
> Question: What does the following command do?
>
> ```
> $ git log --patch HEAD~9 *.txt
> ```
> {: .language-bash}
{: .challenge}

## Intro to GitHub
_[Back to top](#contents)_

Now that you've created a git repo and gotten the hang of the basic git workflow,
it's time to share your repo with the world.
Systems like Git allow us to move work between any two repositories. In
practice, though, it's easiest to use one copy as a central hub, and to keep it
on the web rather than on someone's laptop. Most programmers use hosting
services like [GitHub](https://github.com), [Bitbucket](https://bitbucket.org) or
[GitLab](https://gitlab.com/) to hold those master copies.

Let's start by sharing the changes we've made to our current project with the
world. Log in to GitHub, then click on the icon in the top right corner to
create a new repository called `un-report`.

![Creating a Repository on GitHub (Step 1)]({{ page.root }}/fig/git/github-create-repo-01.png)

Name your repository `un-report` and then click `Create Repository`.

> ## Important options
>
> Since this repository will be connected to a local repository, it needs to be empty. Leave
> "Initialize this repository with a README" unchecked, and keep "None" as options for both "Add
> .gitignore" and "Add a license." See the "GitHub License and README files" exercise below for a full
> explanation of why the repository needs to be empty.
{: .checklist}

In the screenshots below, the Owner is 'mkuzak' and the Repository name is 'planets'.
You should instead see your own username for the Owner and you should name the
repository `un-report`.

![Creating a Repository on GitHub (Step 2)]({{ page.root }}/fig/git/github-create-repo-02.png)

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository:

![Creating a Repository on GitHub (Step 3)]({{ page.root }}/fig/git/github-create-repo-03.png)

This effectively does the following on GitHub's servers:

```
$ mkdir un-report
$ cd un-report
$ git init
```
{: .language-bash}

If you remember back to the earlier [lesson]({{ page.root }}/04-changes/) where we added and
committed our earlier work on `notes.txt`, we had a diagram of the local repository
which looked like this:

![The Local Repository with Git Staging Area]({{ page.root }}/fig/git/git-staging-area.svg)

Now that we have two repositories, we need a diagram like this:

![Freshly-Made GitHub Repository]({{ page.root }}/fig/git/git-freshly-made-github-repo.svg)

Note that our local repository still contains our earlier work on `notes.txt`, but the
remote repository on GitHub appears empty as it doesn't contain any files yet.

The next step is to connect the two repositories.  We do this by making the
GitHub repository a [remote]({{ page.root}}{% link reference.md %}#remote) for the local repository.
The home page of the repository on GitHub includes the string we need to
identify it:

![Where to Find Repository URL on GitHub]({{ page.root }}/fig/git/github-find-repo-string.png)

Copy that URL from the browser, go into the local `un-report` repository, and run
this command:

```
$ git remote add origin https://github.com/USERNAME/un-report.git
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
origin   https://github.com/USERNAME/un-report.git (push)
origin   https://github.com/USERNAME/un-report.git (fetch)
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
To https://github.com/USERNAME/un-report.git
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
From https://github.com/USERNAME/un-report
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```
{: .output}

Pulling has no effect in this case because the two repositories are already
synchronized.  If someone else had pushed some changes to the repository on
GitHub, though, this command would download them to our local repository.

> ## GitHub GUI
>
> Browse to your `un-report` repository on GitHub.
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
> your GitHub repo, you didn't add a readme or a license file. If you had, what do you think
> would have happened when you tried to link your local and remote repositories?
>
> > ## Solution
> > In this case, we'd see a merge conflict due to unrelated histories. When GitHub creates a
> > readme file, it performs a commit in the remote repository. When you try to pull the remote
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
> > From https://github.com/USERNAME/un-report
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
> > From https://github.com/USERNAME/un-report
> >  * branch            master     -> FETCH_HEAD
> > Merge made by the 'recursive' strategy.
> > notes.txt | 1 +
> > 1 file changed, 1 insertion(+)
> > create mode 100644 notes.txt
> > ```
> > {: .output}
> >
> {: .solution}
{: .challenge}

## Collaborating with GitHub
_[Back to top](#contents)_

For the next step, get into pairs.  One person will be the "Owner" and the other
will be the "Collaborator". The goal is that the Collaborator add changes into
the Owner's repository. We will switch roles at the end, so both persons will
play Owner and Collaborator.

> ## Practicing By Yourself
>
> If you're working through this lesson on your own, you can carry on by opening
> a second terminal window.
> This window will represent your partner, working on another computer. You
> won't need to give anyone access on GitHub, because both 'partners' are you.
{: .callout}

The Owner needs to give the Collaborator access. On GitHub, click the settings
button on the right, select Manage access, click Invite a collaborator, and
then enter your partner's username.

![Adding Collaborators on GitHub]({{ page.root }}/fig/git/github-add-collaborators.png)

To accept access to the Owner's repo, the Collaborator
needs to go to [https://github.com/notifications](https://github.com/notifications).
Once there she can accept access to the Owner's repo.

Next, the Collaborator needs to download a copy of the Owner's repository to her
 machine. This is called "cloning a repo". To clone the Owner's repo into
her `Desktop` folder, the Collaborator enters:

```
$ git clone https://github.com/USERNAME/un-report.git ~/Desktop/USERNAME-un-report
```
{: .language-bash}

Replace `USERNAME` with the Owner's username.

The Collaborator can now make a change in her clone of the Owner's repository,
exactly the same way as we've been doing before:

```
$ cd ~/Desktop/USERNAME-un-report
$ nano notes.txt
$ cat notes.txt
```
{: .language-bash}

You can write anything you like. Now might be a good time to list the
**dependencies** of the project -- the tools and packages that are needed
to run the code.
```
Dependencies:
- R >= 4.0
- tidyverse
```
{: .output}

```
$ git add notes.txt
$ git commit -m "List dependencies"
```
{: .language-bash}

```
 1 file changed, 1 insertion(+)
 create mode 100644 notes.txt
```
{: .output}

Then push the change to the *Owner's repository* on GitHub:

```
$ git push origin master
```
{: .language-bash}

```
Enumerating objects: 4, done.
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 306 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/USERNAME/un-report.git
   9272da5..29aba7c  master -> master
```
{: .output}

Note that we didn't have to create a remote called `origin`: Git uses this
name by default when we clone a repository.  (This is why `origin` was a
sensible choice earlier when we were setting up remotes by hand.)

Take a look at the Owner's repository on its GitHub website now (you may need
to refresh your browser.) You should be able to see the new commit made by the
Collaborator.

To download the Collaborator's changes from GitHub, the Owner now enters:

```
$ git pull origin master
```
{: .language-bash}

```
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/USERNAME/un-report
 * branch            master     -> FETCH_HEAD
   9272da5..29aba7c  master     -> origin/master
Updating 9272da5..29aba7c
Fast-forward
 notes.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 notes.txt
```
{: .output}

Now the three repositories (Owner's local, Collaborator's local, and Owner's on
GitHub) are back in sync!

> ## A Basic Collaborative Workflow
>
> In practice, it is good to be sure that you have an updated version of the
> repository you are collaborating on, so you should `git pull` before making
> your changes. The basic collaborative workflow would be:
>
> * update your local repo with `git pull`,
> * make your changes and stage them with `git add`,
> * commit your changes with `git commit -m`, and
> * upload the changes to GitHub with `git push`
>
> It is better to make many commits with smaller changes rather than
> one commit with massive changes: small commits are easier to
> read and review.
{: .callout}

> ## Switch Roles and Repeat
>
> Switch roles and repeat the whole process.
{: .challenge}

> ## Review Changes
>
> The Owner pushed commits to the repository without giving any information
> to the Collaborator. How can the Collaborator find out what has changed
> on GitHub?
>
> > ## Solution
> >
> > On GitHub, the Collaborator can go to the repository and click on
> > "commits" to view the most recent commits pushed to the repository.
> {: .solution}
{: .challenge}

> ## Comment Changes in GitHub
>
> The Collaborator has some questions about one line change made by the Owner and
> has some suggestions to propose.
>
> With GitHub, it is possible to comment the diff of a commit. Over the line of
> code to comment, a blue comment icon appears to open a comment window.
>
> The Collaborator posts comments and suggestions using GitHub interface.
{: .challenge}

> ## Version History, Backup, and Version Control
>
> Some backup software (e.g. Time Machine on macOS, Google Drive) can keep a
> history of the versions of your files.
> They also allow you to recover specific versions.
> How is this functionality different from version control?
> What are some of the benefits of using version control, Git and GitHub?
>
> > ## Solution
> >
> > Automated backup software gives you less control over how often backups are
> > created and it is often difficult to compare changes between backups.
> > However, Git has a steeper learning curve than backup software.
> > Advantages of using Git and GitHub for version control include:
> >   - Great control over which files to include in commits and when to make commits.
> >   - Very popular way to collaborate on code and analysis projects among
        programmers, data scientists, and researchers.
> >   - Free and open source.
> >   - GitHub allows you to share your project with the world and accept
        contributions from outside collaborators.
> {: .solution}
{: .challenge}

> ## Some more about remotes
>
> In this episode and the previous one, our local repository has had
> a single "remote", called `origin`. A remote is a copy of the repository
> that is hosted somewhere else, that we can push to and pull from, and
> there's no reason that you have to work with only one. For example,
> on some large projects you might have your own copy in your own GitHub
> account (you'd probably call this `origin`) and also the main "upstream"
> project repository (let's call this `upstream` for the sake of examples).
> You would pull from `upstream` from time to
> time to get the latest updates that other people have committed.
>
> Remember that the name you give to a remote only exists locally. It's
> an alias that you choose - whether `origin`, or `upstream`, or `fred` -
> and not something intrinstic to the remote repository.
>
> The `git remote` family of commands is used to set up and alter the remotes
> associated with a repository. Here are some of the most useful ones:
>
> * `git remote -v` lists all the remotes that are configured (we already used
> this in the last episode)
> * `git remote add [name] [url]` is used to add a new remote
> * `git remote remove [name]` removes a remote. Note that it doesn't affect the
> remote repository at all - it just removes the link to it from the local repo.
> * `git remote set-url [name] [newurl]` changes the URL that is associated
> with the remote. This is useful if it has moved, e.g. to a different GitHub
> account, or from GitHub to a different hosting service. Or, if we made a typo when
> adding it!
> * `git remote rename [oldname] [newname]` changes the local alias by which a remote
> is known - its name. For example, one could use this to change `upstream` to `fred`.
{: .callout}

## Bonus
_[Back to top](#contents)_

- [Exploring History](#exploring-history)

### Exploring history

We can refer to commits by their identifiers shown in `log`. You can also refer
to the _most recent commit_ of the working directory by using the identifier
`HEAD`.

We've been adding one line at a time to `notes.txt`, so it's easy to track our
progress by looking, so let's do that using our `HEAD`s.  Before we start,
let's make a change to `notes.txt`, adding yet another line.

```
$ nano notes.txt
$ cat notes.txt
```
{: .language-bash}

```
We plotted life expectancy over time.
Each point represents a country.
Continents are grouped by color.
An ill-considered change.
```
{: .output}

Now, let's see what we get.

```
$ git diff HEAD notes.txt
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index b36abfd..0848c8d 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1,3 +1,4 @@
 We plotted life expectancy over time.
 Each point represents a country.
 Continents are grouped by color.
+An ill-considered change.
```
{: .output}

which is the same as what you would get if you leave out `HEAD` (try it).  The
real goodness in all this is when you can refer to previous commits.  We do
that by adding `~1`
(where "~" is "tilde", pronounced [**til**-d*uh*])
to refer to the commit one before `HEAD`.

```
$ git diff HEAD~1 notes.txt
```
{: .language-bash}

If we want to see the differences between older commits we can use `git diff`
again, but with the notation `HEAD~1`, `HEAD~2`, and so on, to refer to them:

```
$ git diff HEAD~3 notes.txt
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index df0654a..b36abfd 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1 +1,4 @@
 We plotted life expectancy over time.
+Each point represents a country.
+Continents are grouped by color.
+An ill-considered change
```
{: .output}

We could also use `git show` which shows us what changes we made at an older commit as
well as the commit message, rather than the _differences_ between a commit and our
working directory that we see by using `git diff`.

```
$ git show HEAD~3 notes.txt
```
{: .language-bash}

```
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Riley Shor <Riley.Shor@fake.email.address>
Date:   Thu Aug 22 09:51:46 2020 -0400

    Make a change that I'll regret later

diff --git a/notes.txt b/notes.txt
new file mode 100644
index 0000000..df0654a
--- /dev/null
+++ b/notes.txt
@@ -0,0 +1 @@
+We plotted life expectancy over time.
```
{: .output}

In this way,
we can build up a chain of commits.
The most recent end of the chain is referred to as `HEAD`;
we can refer to previous commits using the `~` notation,
so `HEAD~1`
means "the previous commit",
while `HEAD~123` goes back 123 commits from where we are now.

We can also refer to commits using
those long strings of digits and letters
that `git log` displays.
These are unique IDs for the changes,
and "unique" really does mean unique:
every change to any set of files on any computer
has a unique 40-character identifier.
Our first commit was given the ID
`f22b25e3233b4645dabd0d81e651fe074bd8e73b`,
so let's try this:

```
$ git diff f22b25e3233b4645dabd0d81e651fe074bd8e73b notes.txt
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index df0654a..93a3e13 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1 +1,4 @@
 We plotted life expectancy over time.
+Each point represents a country.
+Continents are grouped by color.
+An ill-considered change
```
{: .output}

That's the right answer,
but typing out random 40-character strings is annoying,
so Git lets us use just the first few characters (typically seven for normal size projects):

```
$ git diff f22b25e notes.txt
```
{: .language-bash}

```
diff --git a/notes.txt b/notes.txt
index df0654a..93a3e13 100644
--- a/notes.txt
+++ b/notes.txt
@@ -1 +1,4 @@
 We plotted life expectancy over time.
+Each point represents a country.
+Continents are grouped by color.
+An ill-considered change
```
{: .output}

All right! So
we can save changes to files and see what we've changed. Now, how
can we restore older versions of things?
Let's suppose we change our mind about the last update to
`notes.txt` (the "ill-considered change").

`git status` now tells us that the file has been changed,
but those changes haven't been staged:

```
$ git status
```
{: .language-bash}

```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   notes.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
{: .output}

We can put things back the way they were
by using `git checkout`:

```
$ git checkout HEAD notes.txt
$ cat notes.txt
```
{: .language-bash}

```
We plotted life expectancy over time.
Each point represents a country.
Continents are grouped by color.
```
{: .output}

As you might guess from its name,
`git checkout` checks out (i.e., restores) an old version of a file.
In this case,
we're telling Git that we want to recover the version of the file recorded in `HEAD`,
which is the last saved commit.
If we want to go back even further,
we can use a commit identifier instead:

```
$ git checkout f22b25e notes.txt
```
{: .language-bash}

```
$ cat notes.txt
```
{: .language-bash}

```
 We plotted life expectancy over time.
```
{: .output}

```
$ git status
```
{: .language-bash}

```
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   notes.txt

```
{: .output}

Notice that the changes are currently in the staging area.
Again, we can put things back the way they were
by using `git checkout`:

```
$ git checkout HEAD notes.txt
```
{: .language-bash}

> ## Don't Lose Your HEAD
>
> Above we used
>
> ```
> $ git checkout f22b25e notes.txt
> ```
> {: .language-bash}
>
> to revert `notes.txt` to its state after the commit `f22b25e`. But be careful!
> The command `checkout` has other important functionalities and Git will misunderstand
> your intentions if you are not accurate with the typing. For example,
> if you forget `notes.txt` in the previous command.
>
> ```
> $ git checkout f22b25e
> ```
> {: .language-bash}
> ```
> Note: checking out 'f22b25e'.
>
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>
>  git checkout -b <new-branch-name>
>
> HEAD is now at f22b25e Make a change that I'll regret later
> ```
> {: .error}
>
> The "detached HEAD" is like "look, but don't touch" here,
> so you shouldn't make any changes in this state.
> After investigating your repo's past state, reattach your `HEAD` with `git checkout master`.
{: .callout}

It's important to remember that
we must use the commit number that identifies the state of the repository
*before* the change we're trying to undo.
A common mistake is to use the number of
the commit in which we made the change we're trying to discard.
In the example below, we want to retrieve the state from before the most
recent commit (`HEAD~1`), which is commit `f22b25e`:

![Git Checkout]({{ page.root }}/fig/git/git-checkout.svg)

We have now reverted our current file and commit to the latest version without the bug. But we have kept the commit and history from the commit that had the error.

> ## Simplifying the Common Case
>
> If you read the output of `git status` carefully,
> you'll see that it includes this hint:
>
> ```
> (use "git checkout -- <file>..." to discard changes in working directory)
> ```
> {: .language-bash}
>
> As it says,
> `git checkout` without a version identifier restores files to the state saved in `HEAD`.
> The double dash `--` is needed to separate the names of the files being recovered
> from the command itself:
> without it,
> Git would try to use the name of the file as the commit identifier.
{: .callout}

The fact that files can be reverted one by one
tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction
without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.

> ## Recovering Older Versions of a File
>
> Jennifer has made changes to the Python script that she has been working on for weeks, and the
> modifications she made this morning "broke" the script and it no longer runs. She has spent
> ~ 1hr trying to fix it, with no luck...
>
> Luckily, she has been keeping track of her project's versions using Git! Which commands below will
> let her recover the last committed version of her Python script called
> `data_cruncher.py`?
>
> 1. `$ git checkout HEAD`
>
> 2. `$ git checkout HEAD data_cruncher.py`
>
> 3. `$ git checkout HEAD~1 data_cruncher.py`
>
> 4. `$ git checkout <unique ID of last commit> data_cruncher.py`
>
> 5. Both 2 and 4
>
>
> > ## Solution
> >
> > The answer is (5)-Both 2 and 4.
> >
> > The `checkout` command restores files from the repository, overwriting the files in your working
> > directory. Answers 2 and 4 both restore the *latest* version *in the repository* of the file
> > `data_cruncher.py`. Answer 2 uses `HEAD` to indicate the *latest*, whereas answer 4 uses the
> > unique ID of the last commit, which is what `HEAD` means.
> >
> > Answer 3 gets the version of `data_cruncher.py` from the commit *before* `HEAD`, which is NOT
> > what we wanted.
> >
> > Answer 1 can be dangerous! Without a filename, `git checkout` will restore **all files**
> > in the current directory (and all directories below it) to their state at the commit specified.
> > This command will restore `data_cruncher.py` to the latest commit version, but it will also
> > restore *any other files that are changed* to that version, erasing any changes you may
> > have made to those files!
> > As discussed above, you are left in a *detached* `HEAD` state, and you don't want to be there.
> {: .solution}
{: .challenge}


## Glossary

Commands:
- `init` - creates a new git repository in your current working directory
- `status` -

Terms:
- branch -
