---
title: “The Unix Shell”
teaching: 1hr15min
exercises: n
questions:
- “What is a command shell and why would I use one?”
- “How can I move around on my computer?”
- “How can I see what files and directories I have?”
- “How can I specify the location of a file or directory on my computer?”
- “How can I create, copy, and delete files and directories?”
- “How can I edit files?”
objectives:
- “Explain how the shell relates to users’ programs.”
- “Explain when and why command-line interfaces should be used instead of graphical interfaces.”
- “Construct absolute and relative paths that identify specific files and directories.”
- “Demonstrate the use of tab completion and explain its advantages.”
- “Create a directory hierarchy that matches a given diagram.”
- “Create files in the directory hierarchy using an editor or by copying and renaming existing files.”
- “Delete, copy, and move specified files and/or directories.”
Keypoints:
- “A shell is a program whose primary purpose is to read commands and run other programs.”
- “Tab completion can help you save a lot of time and frustration.”
- “The shell’s main advantages are its support for automating repetitive tasks and its capacity to access network machines.”
- “Information is stored in files, which are stored in directories (folders).”
- “Directories nested in other directories for a directory tree.”
- “`cd [path]` changes the current working directory.”
- “`ls [path]` prints a listing of a specific file or directory.”
- “`ls` lists the current working directory.”
- “`pwd` prints the user’s current working directory.”
- “`/` is the root directory of the whole file system.”
- “A relative path specifies a location starting from the current location.”
- “An absolute path specifies a location from the root of the file system.”
- “Directory names in a path are separated with `/` on Unix, but `\` on Windows.”
- “`..` means ‘the directory above the current one’; `.` on its own means ‘the current directory’.
- “`cp [old] [new]` copies a file.”
- “`mkdir [path]` creates a new directory.”
- “`mv [old] [new]` moves (renames) a file or directory.”
- “`rm [path]` removes (deletes) a file.”
- “`*` matches zero or more characters in a filename.”
- “The shell does not have a trash bin - once something is deleted, it’s really gone.”
---

TODOs: 
- Potentially concicify questions, objectives, key points (and make them non-redundant with the glossary)
- Add outputs / fix paths
- Tree structure / navigating files and directories.


## Introducing the Shell 

## Motivation

Usually you move around your computer and run programs through graphical user interfaces (GUIs). 
For example, Finder for Mac and Explorer for Windows. 
These GUIs are convenient because you can use your mouse to navigate to different folders and open different files. 
However, there are some things you simply can’t do from these GUIs.

The Unix Shell (or the command line) allows you to do everything you would do through Finder/Explorer, and a lot more. 
But it’s so scary! I thought so at first, too. 
Since then, I’ve learned that it’s just another way to navigate your computer and run programs, and it can be super useful for your work. 
For instance, you can use it to combine existing tools into a pipeline to automate analyses, you can write a script to do things for you and improve reproducibility, you can interact with remote machines and supercomputers that are far away from you, and sometimes it’s the only option for the program you want to run.

We’re going to use it to:
1. Organize our R code and plots from the R plotting lesson (**LINK**).
1. Perform version control using git during the rest of the workshop.

## What the Shell looks like

When you open up the terminal for the first time, it can look pretty scary - it’s basically just a blank screen. 
Don’t worry - we’ll take you through how to use it step by step.

The first line of the shell shows a prompt - the shell is waiting for an input. 
When you’re following along in the lesson, don’t type the prompt when typing commands. 
To make the prompt the same for all of us, run this command:

```
PS1=’$ ‘
```
{: .language-bash}

## Tree Structure

The first thing we need to learn when using the shell is how to get around our computer.
The shell folder (directory) structure is the same file structure as you're used to.
We call the way that different directories are nested the "directory tree".
You start at the root directory (`/`) and you can move "up" and "down" the tree. Here's an example:

TODO - update the file structure of this tree after we know where things will actually be.
<img src="https://github.com/UMSWC/curriculum/blob/unix-shell/fig/unix-shell/directory_tree_blank.png"/>

Now that we understand directory trees a bit, let's check it out from the command line. 
We can see where we are by using the command `pwd` which stands for "print working directory", or the directory we are currently in:

```
pwd
```
{: .language-bash}

```
/home/USERNAME/
```
{: .output}

Congrats! You just ran your first command from the command line.
The output is a file path to a location (a directory) on your computer.

The output will look a little different depending on what operating system you're using:
- Mac: `/Users/USERNAME`
- Linux: `/home/USERNAME`
- Windows: `C:\Users\USERNAME` (or maybe `/mnt` for Windows 10 -- TODO: check)

Usually you start in your home directory, but for Unix subsystem for Windows, it's a bit different.

Let's check to see what's in your home directory using the `ls` command, which lists all of the files in your working directory:

```
ls
```
{: .language-bash}

```
TODO: Add example output?
```
{: .output}

If you're using the Unix subsystem for Windows, you'll probably see unfamiliar things. If you're using a Mac or git bash, you should see some files and directories you're familiar with such as `Documents` and `Desktop`. 

Next, let's move to our Desktop. To do this, we use `cd` to change directories.

On Mac or git bash, run the following command:

```
cd Desktop
```
{: .language-bash}

On Unix subsystem for Windows, run: 
```
cd /mnt/c/USERNAME/Desktop
```
{: .language-bash}

Let's see if we're in the right place:

```
pwd
```
{: .language-bash}

```
/home/USERNAME/Desktop/my_project
```
{: .output}

We just moved _down_ the directory tree into the `Desktop` directory. 

What files and directories do you have on your Desktop? How can you check?
```
ls
```
{: .language-bash}

```
TODO: Example output?
```
{: .output}

Next, we want to get to the folder that we worked in for the R plotting lesson. 
Is the `my_project` directory listed on your Desktop?

How can we get into the `my_project` directory?

```
cd my_project
```
{: .language-bash}

We just went _down_ the directory tree again.

Let's see what files are in `my_project`:
```
ls
```
{: .language-bash}

```
TODO: Example output?
```
{: .output}

Is it what you expect? Are the files you made in the R plotting lesson there?

Now let's move back _up_ the directory tree. First, let's try this command:

```
cd my_project
```
{: .language-bash}

```
TODO: Add error
```
{: .output}

This doesn't work because the `my_project` directory is not within the directory that we are currently in. 

To move up the directory tree, you can use `..`, which is the parent of the current directory:
```
cd ..
pwd
```
{: .language-bash}

```
/home/USERNAME/Desktop
```
{: .output}

Everything that we've been doing is working with file paths. We tell the computer where we want to go using `cd` plus the file path. We can also tell the computer what files we want to list by giving a file path to `ls`:

```
ls my_project
```
{: .language-bash}

```
TODO: Example output?
```
{: .output}


```
ls ..
```
{: .language-bash}

```
TODO: Example output?
```
{: .output}

What happens if you just type `cd` without a file path?

```
cd
pwd
```
{: .language-bash}

```
/home/USERNAME
```
{: .output}

It takes you back to your home directory! (Or for Unix subsytem for Windows, your `/mnt` directory. 

To get back to your projects directory you can use the following command:

Mac/git-bash:

```
cd Desktop/my_project
```
{: .language-bash}


Unix subsystem for Windows:
```
cd c/USERNAME/Desktop/my_project
```
{: .language-bask}

We have been using _relative paths_, meaning you use your current location to get to where you are.
You can also use the _absolute path_, or the entire path tfrom the root directory. What's listed when you use the `pwd` command is the absoute path:

```
pwd
```
{: .language-bash}

You can also use `~` for the path to your home directory:

```
cd ~
pwd
```
{: .language-bash}

```
/home/USERNAME
```
{: .output}

Exercise: 
TODO: copy-paste from here (haven't found code yet)
https://swcarpentry.github.io/shell-novice/02-filedir/index.html
/Users/amanda/data....home dir exercise

## Working with files and directories

Now that we know how to move around your computer using the command line, our next step is to organize the project that we started in the R plotting lesson (**LINK**). 
You might ask: why would I use the command line when I could just use the GUI? 
My best response is that if you ever need to use a high-performance computing cluster (such as Great Lakes at the University of Michigan), you’ll have no other option. 
You might also come to like it more than clicking around to get places once you get comfortable, because it’s a lot faster! 

First, let’s make sure we’re in the right directory (the `my_project` directory; TODO: change name of directory):

```
pwd
```
{: .language-bash}

```
/home/USERNAME/Desktop/my_project
```
{: .output}

If you’re not there, `cd` to the correct place.

Next, let’s remind ourselves what files are in this directory:

```
ls
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

You can see that right now all of our files are in our main directory. 
However, it can start to get crazy if you have too many different files of different types all in one place! 
We’re going to create a better project directory structure that will help us organize our files. This is really important, particularly for larger projects. 
If you’re interested in learning more about structuring computational biology projects in particular, [here](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424) is a useful article.

What do you think good would be a good way to organize our files?

One way is the following (TODO: fix names):
```
.
├── code
│   └── plotting.R
├── data
│   └── gapminder.csv
└── figures
    ├── fig1.pdf
    └── fig2.pdf
```
{: .language-bash}

The R script goes in the code directory, the gapminder dataset goes in the data directory, and the figures go in the figures directory. 
This way, all of the files are organized into a clearer overall structure. 

A few notes about naming files and directories:
- Don’t use whitespaces because they’re used to break arguments on the command line, so it makes things like moving and viewing files more complicated. 
Instead you can use a dash (`-`) or an underscore (`_`).
- Don’t start names with a dash (`-`) because the shell will interpret it incorrectly.
- Stick with letters, numbers, periods, dashes, and underscores, because other symbols (e.g. `^`, `&`) have special meanings.
- If you have to refer to names of files or directories with whitespace or other special characters, use double quotes.

So how do we make our directory structure look like this?

First, we need to make a new directory. Let’s start with the `code` directory. To do this, we use the command `mkdir` plus the name of the directory we want to make:

```
mkdir code
```
{: .language-bash}


Now, let’s see if that directory exists now:

```
ls
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}


How can we check to see if there’s anything in the `code` directory?

```
ls code
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

Nothing in there yet, which is expected since we just made the directory.

The next step is to move the `.R` file into the code directory. To do this, we use the `mv` command. The first argument after `mv` is the file you want to move, and the second argument is the place you want to move it:

```
mv `plotting.R` `code`
```
{: .language-bash}

Okay, let’s see what’s in our current directory now:

```
ls
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

`plotting.R` is no longer there! Where did it go? Let’s check the code directory, where we moved it to:

```
ls code
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

There it is! 

Great, now for an exercise:

> ## Creating directories and moving files
> 
> Create a `data` directory and move `gapminder.csv` into the newly created `data` directory.
> > From the `my_project` directory:
> >  ```
> > mkdir data
> > mv gapminder.csv data
> > ```
> {: .solution}
{: .challenge}

Okay, now we have the code and data in the right place. 
Next, we have to move the figures. But we have so many figures! It’d be annoying to move them one at a time. 
Thankfully, we can use a _wildcard_ to move them all at once. 

First, let’s make a `figures` directory:

```
mkdir figures
```
{: .language-bash}

Next, let’s see how we can use a wildcard to list only certain files:

```
ls *.pdf
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

See how only the files ending in `.pdf` were listed? The shell expands the wildcard to create a list of matching file names before running the commands. Can you guess how we move all of these files at once to the figures directory? 

```
mv *.pdf figures
```
{: .language-bash}

We can also use the wildcard to list all of the files in all of the directories:

```
ls *
```
{: .language-bash}
```
TODO: Add files!
```
{: .output}

As you can see, all of the files are now in the right place!

TODO: Add exercise about wildcards.

## Viewing Files

To view and navigate the contents of a file we can use the command `less`. This will open a full screen view of the file. 

TODO: maybe add screenshot of less?

To navigate, press `spacebar` to scroll to the next page and `b` to scroll up to the previous page. You can also use the up and down arrows to scroll line-by-line. Note that `less` defaults to line wrapping, meaning that any lines longer than the width of the screen will be wrapped to the next line, (to disable this use the option `-S` when running `less`, ex `less -S file.txt`). To exit less, press the letter `q`. 

We should note that not all file types can be viewed with `less`. While we can open PDFs and excel spreadsheets easily with programs on our computer, `less` doesn't render them well on the command line. For example, if we try to less a .pdf file we will see a warning.

```
less file.pdf
```
{: .language-bash}
```
file.pdf may be a binary file.  See it anyway?
```
{: .output}

If we say "yes", less will render the file but it will appear as a seemingly random display of characters that wont make much sense to us. 

TODO: maybe add screenshot of less on a .pdf?

## Man and Help

Now that we know how to view files with `less`, we can learn how to look up the manual pages for unix shell commands. If you want to learn more about a command we can use `man` to look up its manual page which will open with `less`. We can navigate the man page to view the description of a command and its options. For example, if you want to know more about the navigation options of `less` you can type `man less` on the command line.

```
man less
```
{: .language-bash} 

TODO: maybe add screenshot of man page?

Another way to get more information about a command is to run the command with the option `-h or --help` which will print brief documentation for the command.

```
less -h
less --help
```
{: .language-bash}

TODO: maybe add screenshot of help output?

## Editing Files

Beyond viewing the content of files, we may want to be able to edit or write files on the command line. There are many different text editors you can use to edit files on the command line, but we will talk about `nano` since it is a bit easier to learn. To edit a file with nano type `nano file.txt`. If the file exists, it will open the file in a nano window, if the file does not exist it will be created. One nice feature of nano is that it has a cheat sheet along the bottom with some common commands you’ll need. When you are ready to save (write) your file, you type `ctrl-o`. Along the bottom will appear a prompt for the file name to write to. The current name of the file will appear here, to keep the name as it is hit `enter` otherwise you can change the name of the file then hit `enter`. To exit nano, press `ctrl-x`. If you forget to save before exiting, no worries nano will prompt you to first save the file.

Since we moved around files when we organized our project directory we will have to update our R script. The path we use to read in our dataset is no longer correct. We will use nano to update the path to our new directory structure. 

```
TODO use nano to edit the path to read in gapminder data
```
{: .language-bash}

Great! Now as an exercise we can change the paths to write out figures. 

TODO: add exercise to change figure output paths.

## Glossary of terms

- `pwd`: Print working directory - prints the _absolute path_ from the _root_ directory to the directory where you currently are.
- `ls`: List files - lists files in the current directory. You can provide a path to list files to another directory as well (`ls [path]`).
- `cd [path]`: Change directories to another folder.
- less
- man
- -h/--help
- nano

