---
title: "Intro to Git & GitHub"
teaching: 0
exercises: 0
questions:
- "Why use version control?"
- "How do I share my changes with others on the web?"
objectives:
- "Explain what version control is and why it's useful."
- "Push to or pull from a remote repository."
keypoints: ""
---

Contents:
1. [Background](#background)
1. [Basic Workflow](#basic-workflow)
1. [Intro to GitHub](#intro-to-github)
1. [Collaborating with GitHub](#collaborating-with-github)

## Background

## Config

## Basic Workflow

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

![git-basics-flow-01-opt1](../fig/git-basics/20201117-git-01-opt1.png)  

```
git init
```
{: .language-bash}

NOTE (from RD): if starting from a working directory that is not empty (which is likely the case when we get to this part on the basis of R plotting materials)

![git-basics-flow-01-opt2](../fig/git-basics/20201117-git-01-opt2.png)  


```
git init
```
{: .language-bash}

NOTE (from RD): use this image if initiating an empty directory

![git-basics-flow-02](../fig/git-basics/20201117-git-02.png)

NOTE (from RD): Make edits to the initiated directory, or initiating from an existing, non-empty directory. I personally use a lot of `git status` to show changes and progresses and they are not necessary.

```
git status
```
{: .language-bash}

![git-basics-flow-03](../fig/git-basics/20201117-git-03.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-04](../fig/git-basics/20201117-git-04.png)

```
git commit
git status
```
{: .language-bash}

![git-basics-flow-05](../fig/git-basics/20201117-git-05.png)

NOTE (from RD): this two diagrams are optional. I used to emphasize 1) the `.git` directory is changed but not the working directory and 2) the committed changes are "official" in the git "memory" at this point if presenting in-person

![git-basics-flow-06](../fig/git-basics/20201117-git-06.png)

![git-basics-flow-07](../fig/git-basics/20201117-git-07.png)

NOTE (from RD): usually between this two diagrams, I would walk through adding another edits to the directory (e.g. adding another line in a text file) so that we can repeat the `git status`, `git add`, and `git commit` to familiarize the usage of these three specific commands. (Because in my opinion they are the most frequently used commands. This part can be adjusted accordingly.) Since we usually take a "detour" to make edits that are not directly relevant to `git`, I have included a repeated image below to pick up from where we are before the editing.

![git-basics-flow-08](../fig/git-basics/20201117-git-08=05.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-09](../fig/git-basics/20201117-git-09.png)

```
git diff
```
{: .language-bash}

![git-basics-flow-10](../fig/git-basics/20201117-git-10.png)

NOTE (from RD): just an optional reprise of diagram before the showing the differences.

![git-basics-flow-11](../fig/git-basics/20201117-git-11=9.png)

```
git add
git status
```
{: .language-bash}

![git-basics-flow-12](../fig/git-basics/20201117-git-12.png)

```
git commit
git status
```
{: .language-bash}

![git-basics-flow-13](../fig/git-basics/20201117-git-13.png)

NOTE (from RD): an optional reprise of the effects of committing

```
git log
git shortlog
```
{: .language-bash}

![git-basics-flow-14](../fig/git-basics/20201117-git-14.png)

```
git diff <commit>..<commit>
```
{: .language-bash}

![git-basics-flow-15](../fig/git-basics/20201117-git-15.png)

NOTE (from RD): an optional reprise. This exists only because I personally like to pause and touch base on some of the "theory" or backgound info or best practices (e.g. writing informative and concise commit messages) and therefore need to pick up again.

![git-basics-flow-16](../fig/git-basics/20201117-git-16=13.png)

```
git remote add
```
{: .language-bash}

![git-basics-flow-17](../fig/git-basics/20201117-git-17.png)

```
git push -u origin master
```
{: .language-bash}

![git-basics-flow-18](../fig/git-basics/20201117-git-18.png)

NOTE (frome RD): this might be a good place to add some collaborative contents too. If needed can reuse the figure above for a refresher.

![git-basics-flow-19](../fig/git-basics/20201117-git-19.png)

```
git remote update
git status
```
{: .language-bash}

![git-basics-flow-20](../fig/git-basics/20201117-git-20.png)

![git-basics-flow-21](../fig/git-basics/20201117-git-21=19.png)

```
git pull
git status
```
{: .language-bash}

![git-basics-flow-22](../fig/git-basics/20201117-git-22.png)

NOTE (from RD): I used to show the log again and emphasize on the difference in user names if the new edits are collaborative, or just to show that the history can pick up edits done "somewhere else".

```
git log
git status
```
{: .language-bash}

![git-basics-flow-23](../fig/git-basics/20201117-git-23.png)

NOTE (from RD): the next 4 images (i.e. 24 to 27) were made for a third round of `git add`, `commit`, `status`, now also `push` for a small exercise for practicing themselves.

![git-basics-flow-24](../fig/git-basics/20201117-git-24=22.png)

![git-basics-flow-25](../fig/git-basics/20201117-git-25.png)

![git-basics-flow-26](../fig/git-basics/20201117-git-26.png)

![git-basics-flow-27](../fig/git-basics/20201117-git-27.png)

NOTE (from RD): final remark on the importance of having a remote backup of the work and how keeping history can help reproducing the work.

![git-basics-flow-28](../fig/git-basics/20201117-git-28.png)

## Intro to GitHub

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

![Creating a Repository on GitHub (Step 1)](../fig/git/github-create-repo-01.png)

Name your repository `umswc-project` and then click `Create Repository`.

Note: Since this repository will be connected to a local repository, it needs to be empty. Leave
"Initialize this repository with a README" unchecked, and keep "None" as options for both "Add
.gitignore" and "Add a license." See the "GitHub License and README files" exercise below for a full
explanation of why the repository needs to be empty.

![Creating a Repository on GitHub (Step 2)](../fig/git/github-create-repo-02.png)

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository:

![Creating a Repository on GitHub (Step 3)](../fig/git/github-create-repo-03.png)

This effectively does the following on GitHub's servers:

```
$ mkdir umswc-project
$ cd umswc-project
$ git init
```
{: .language-bash}

If you remember back to the earlier [lesson](../04-changes/) where we added and
committed our earlier work on `mars.txt`, we had a diagram of the local repository
which looked like this:

![The Local Repository with Git Staging Area](../fig/git/git-staging-area.svg)

Now that we have two repositories, we need a diagram like this:

![Freshly-Made GitHub Repository](../fig/git/git-freshly-made-github-repo.svg)

Note that our local repository still contains our earlier work on `mars.txt`, but the
remote repository on GitHub appears empty as it doesn't contain any files yet.

The next step is to connect the two repositories.  We do this by making the
GitHub repository a [remote]({{ page.root}}{% link reference.md %}#remote) for the local repository.
The home page of the repository on GitHub includes the string we need to
identify it:

![Where to Find Repository URL on GitHub](../fig/git/github-find-repo-string.png)

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

![GitHub Repository After First Push](../fig/git/github-repo-after-first-push.svg)

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
> > can do the same thing with ```git diff```. In particular, ```git diff ID1..ID2``` where ID1 and
> > ID2 are commit identifiers (e.g. ```git diff a3bf1e5..041e637```) will show the differences
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

> ## GitHub Timestamp
>
> Create a remote repository on GitHub. Push the contents of your local
> repository to the remote. Make changes to your local repository and push these
> changes. Go to the repo you just created on GitHub and check the
> [timestamps]({{ page.root }}{% link reference.md %}#timestamp) of the files. How does GitHub
> record times, and why?
>
> > ## Solution
> > GitHub displays timestamps in a human readable relative format (i.e. "22 hours ago" or "three
> > weeks ago"). However, if you hover over the timestamp, you can see the exact time at which the
> > last change to the file occurred.
> {: .solution}
{: .challenge}

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

## More Commands
