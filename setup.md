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
> Git typically comes installed on Macs.  To confirm that git is installed, type
> `which git` in a Terminal and hit enter.  The installation path where *git* is installed
> will print on the next line in your terminal.  The default installation path is
> `/usr/bin/git`.
>
> To see which version of git is installed, type `git --version` into the terminal and hit
> enter. 
>
> GRRR.  I encountered an error (not uncommon, apparently) due to OS update.  
> Need to "Install the Xcode toolkit! Even if you had it installed before, you might have to 
> re-register it or update it to the latest version."
> `xcode-select --install`
>
> You will need a recent version of R (>= 4.0). To install R on your Mac, follow instructions at 
> the following link [R](https://cloud.r-project.org/bin/macosx/).  Click the link for the 
> installer file, this is the file with the .pkg extension (e.g. R-4.0.3.pkg), to download it to 
> your computer.  Once downloaded, double-click the installer file to install and follow the 
> guided instructions.
>
> which R
> R --version
>
>
> To install [RStudio](https://rstudio.com/products/rstudio/download/#download).  Click the
> DOWNLOAD RSTUDIO FOR MAC button. Double-click the downloaded installer.  It will open a window with
> the Applications folder and an icon for the RStudio app.  Click the RStudio app and drag it into the
> Applications folder.
> 
> Get the zip file.  Save to Desktop and unzip, will create a new folder called un-report.
> RStudio (`which RStudio` and `rstudio --version` do not work on a Mac) 
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
