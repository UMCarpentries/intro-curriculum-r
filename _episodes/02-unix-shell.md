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
- Add outputs (see hello world example)
- Tree structure / navigating files and directories.


```
echo "Hello World"
```
{: .language-bash}

```
Hello World
```
{: .output}

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

If you’re not there, `cd` to the correct place.

Next, let’s remind ourselves what files are in this directory:

```
ls
```
{: .language-bash}

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

How can we check to see if there’s anything in the `code` directory?

```
ls code
```
{: .language-bash}

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

`plotting.R` is no longer there! Where did it go? Let’s check the code directory, where we moved it to:

```
ls code
```
{: .language-bash}

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
Mkdir figures
```
{: .language-bash}

Next, let’s see how we can use a wildcard to list only certain files:

```
ls *.pdf
```
{: .language-bash}

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

As you can see, all of the files are now in the right place!

TODO: Add exercise about wildcards.

## Viewing Files

To view and navigate the contents of a file we can use the command `less`. This will open a full screen view of the file. To navigate, press `spacebar` to scroll to the next page and `b` to scroll up to the previous page. You can also use the up and down arrows to scroll line-by-line. Note that `less` defaults to line wrapping, meaning that any lines longer than the width of the screen will be wrapped to the next line, (to disable this use the option `-S` when running `less`, ex `less -S file.txt`). To exit less, press the letter `q`. 

## Man and Help

Now that we know how to view files with `less`, we can learn how to look up the manual pages for unix shell commands. If you want to learn more about a command we can use `man` to look up its manual page which will open with `less`. We can navigate the man page to view the description of a command and its options. For example, if you want to know more about the navigation options of `less` you can type `man less` on the command line

```
man less
```
{: .language-bash} 

Another way to get more information about a command is to run the command with the option `-h or --help` which will print brief documentation for the command.

```
less -h
less --help
```
{: .language-bash}

## Editing Files

Beyond viewing the content of files, we may want to be able to edit or write files on the command line. There are many different text editors you can use to edit files on the command line, but we will talk about `nano` since it is a bit easier to learn. To edit a file with nano type `nano file.txt`. If the file exists, it will open the file in a nano window, if the file does not exist it will be created. One nice feature of nano is that it has a cheat sheet along the bottom with some common commands you’ll need. When you are ready to save (write) your file, you type `ctrl-o`. Along the bottom will appear a prompt for the file name to write to. The current name of the file will appear here, to keep the name as it is hit `enter` otherwise you can change the name of the file then hit `enter`. To exit nano, press `ctrl-x`. If you forget to save before exiting, no worries nano will prompt you to first save the file.

Since we moved around files when we organized our project directory we will have to update our R script. The path we use to read in our dataset is no longer correct. We will use nano to update the path to our new 

TODO use nano to edit the path to read in gapminder data. Add exercise to change paths to write out figures

```
nano <name of rscript>
```
{: .language-bash}


## Glossary of terms

- less
- man
- -h/--help
- nano

