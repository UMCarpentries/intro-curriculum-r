## TODO collate these diagrams from Rucheng with the text in Basic Workflow

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
git diff <commit>{{ page.root }}<commit>
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


```
git revert
```
{: .language-bash}

NOTE (from RD): these first two diagrams for `git revert` essentially is just the second (i.e. diagram #30). I separated the two to indicate a step of inferring that since the bug / unintended change has been committed, it would be part of the .git history.

![git-basics-flow-29](../fig/git-basics/20201117-git-29.png)

![git-basics-flow-30](../fig/git-basics/20201117-git-30.png)

![git-basics-flow-31](../fig/git-basics/20201117-git-31.png)

![git-basics-flow-32](../fig/git-basics/20201117-git-32.png)

NOTE (from RD): I added a box in the diagram to emphasize how git does not deletion information while reverting. No new operation for this step.

![git-basics-flow-33](../fig/git-basics/20201117-git-33.png)

```
git restore
git checkout <file>
```
{: .language-bash}

![git-basics-flow-34](../fig/git-basics/20201117-git-34.png)

![git-basics-flow-35](../fig/git-basics/20201117-git-35.png)

