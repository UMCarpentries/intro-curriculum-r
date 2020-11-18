---
title: Setup
---

## Requirements

* A Unix shell
* A [GitHub](https://github.com/) account
* [Git](https://git-scm.com/), software for tracking changes in source code (i.e. version control)
* A recent version of [R](https://www.r-project.org/) (>=4.0)
* [RStudio](https://rstudio.com/), an integrated development environment for R

### Windows

For Windows, there are two main ways to setup your system to be able to render the lessons.

- Option 1 relies on the Windows Subsystem for Linux (WSL). WSL allows you to run a Linux
  environment directly from Windows.
- Option 2 relies on using Windows built-in applications.

> ## Option 1 - Using the Windows Subsystem for Linux (WSL)
>
> If your version of Windows supports it, using the WSL will make the installation of the tools
> needed easier. Instructions to install Linux distributions from Windows 10/Windows Server are
> available from the [Microsoft website](https://docs.microsoft.com/en-us/windows/wsl/about).
>
> Once you have installed a Linux distribution, you can follow the installation instructions for
> [Linux](#linux-ubuntu) listed below. If you install a distribution other than Ubuntu, you will
> need to adjust the commands that install the packages.
{: .solution}

> ## Option 2 - Using Windows built-in applications
> Placeholder
{: .solution}

### macOS

> ## Setup for Mac OS
> *Unix Shell*
> The shell is a program that enables us to send commands to the computer and receive output. It is 
> also referred to as the terminal or command line.  For a Mac computer running macOS Mojave or 
> earlier releases, the default Unix Shell is Bash.  For a Mac computer running macOS Catalina or 
> later releases, the default Unix Shell is Zsh. 
>
> Your default shell is available via the Terminal program within your Utilities folder.  To open 
> Terminal, try one of the following:
>
> * In Finder, select the Go menu, then select Utilities. Locate Terminal in the Utilities folder and open it.
> * Use the Mac ‘Spotlight’ computer search function. Search for: Terminal and press Return.
>
> To see which Unix shell your Mac is running, type echo $SHELL in your terminal window.
>
> *Git*
> Git is a version control system that lets you track who made changes to what when and has options 
> for easily updating a shared or public version of your code on github.com. You will need a [supported web 
> browser](https://help.github.com/articles/supported-browsers/).
>
> You will need an account at [GitHub](https://github.com/) for parts of the Git lesson. Basic GitHub 
> accounts are free. We encourage you to create a GitHub account if you don't have one already. Please 
> consider what personal information you'd like to reveal. For example, you may want to review these 
> [instructions for keeping your email address private](https://help.github.com/articles/keeping-your-email-address-private/)
> provided at GitHub.
>
> Git may be installed on Macs as part of XCode.  To check whether git is installed, type
> `which git` in a Terminal and hit enter.  If installed, the installation path will print on the 
> next line in your terminal.  The default installation path for Apple installed git is `/usr/bin/git`.
>
> If git is installed, you can see which version is installed by typing `git --version` into the 
> terminal and hitting enter.  If you receive an error regarding an `invalid active developer path`,
> you may need to (re-)install XCode.  Try doing this by typing `xcode-select --install` and enter
> in the Terminal.  The `git --version` command should then return the number of the installed
> version of git.

> You should have git version >=2.24.  If not, please install the latest
> version of Git for Mac by downloading and running the most recent "mavericks" installer from 
> [this list](http://sourceforge.net/projects/git-osx-installer/files/).  Because this installer is 
> not signed by the developer, you may have to right click (control click) on the .pkg file, click Open, 
> and click Open on the pop up window. After installing Git, there will not be anything in your 
> /Applications folder, as Git is a command line program. For older versions of OS X (10.5-10.8) use the 
> most recent available installer labelled "snow-leopard" [available here](http://sourceforge.net/projects/git-osx-installer/files/).
>
> *R*
> [R](https://www.r-project.org/) is a programming language that is especially powerful for data 
> exploration, visualization, and statistical analysis. You will need a recent version of R (>= 4.0).
> Install R by downloading and running [this .pkg file](https://cran.r-project.org/bin/macosx/R-latest.pkg)
> from [CRAN](https://cran.r-project.org/index.html).
>
> Once the package is installed, open a terminal and type `which R` to see the installation location.
> Typing `R --version` will print the installed version number.
>
> *RStudio*
> To interact with R, we use RStudio.  RStudio is an integrated development environment for R.
> To install [RStudio](https://rstudio.com/products/rstudio/download/#download).  Click the
> DOWNLOAD RSTUDIO FOR MAC button. Double-click the downloaded installer.  It will open a window with
> the Applications folder and an icon for the RStudio app.  Drag the RStudio icon into the
> Applications folder.
>
> *Zip File* 
> Get the zip file.  Save to Desktop and unzip, will create a new folder called *un-report*.
{: .solution}

### Linux (Ubuntu)

> ## Installing 
> sudo apt-get install ruby ruby-dev build-essential libxml2-dev
> {: .solution}


### For Everyone

### For R-based lessons

You will need a recent version of R (>= 4.0). Installation instructions are available from the [CRAN website](https://cran.r-project.org).

We use the [knitr][cran-knitr], and [remotes](https://cran.r-project.org/package=remotes) to format
lessons written in R Markdown and figure out needed packages to execute the code in the lesson. You
will need to install the `remotes` package to build R lessons (and this example lesson), the other
packages will be installed automatically during the rendering of the lesson. You can install this
package by opening an R terminal and typing:

~~~
install.packages('remotes', repos = 'https://cran.rstudio.com')
~~~
{: .language-r}

### Troubleshooting

{% include links.md %}
