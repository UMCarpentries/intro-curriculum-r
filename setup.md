---
title: Setup
---

## Requirements

* A Unix shell
* A [GitHub](https://github.com/) account
* [Git](https://git-scm.com/), software for tracking changes in source code (i.e. version control)
* A recent version of [R](https://www.r-project.org/) (>=4.0)
* [RStudio](https://rstudio.com/), an integrated development environment for R

## Windows installations

Each of the following sections contains installation instructions.  Click the
triangle to unfold each section as you get to it.

### Installing Bash

Software Carpentry provides this video that walks through the process of
installing Git Bash [SWC install Git Bash and SWC Installer on
Windows](https://www.youtube.com/watch?v=339AEqk9c-8)

#### Installation steps

1. Download the [Git for Windows installer](https://git-scm.com/download/win).

2. Run the installer and follow the steps below:

   * Click on `Next` to get through the license screen.

   * Click on `Next` to accept the default installation path of
   `C:\Program Files\Git`. (If a new version has been released,
   the number may change.)

   * On the Select Components screen, you may wish to check the box to
   create Desktop icons.  Please do not change the other selections.
   Click `Next`.

   * Click on `Next` to accept `Git` as the name of the Start Menu folder.

   * On the **Choosing the default edit used by Git** panel, please select

   * from the dropdown menu **Use the nano editor by default** -- you may
   need to scroll _up_ in the list to find it.  Click on `Next`.

   * Ensure that **Git from the command line and also from 3rd-party
   software** is selected and click on `Next`. (If you don't do this Git
   Bash will not work properly, requiring you to remove the Git Bash
   installation, re-run the installer and to select the **Git from the
   command line and also from 3rd-party software** option.)

   * Keep the OpenSSH option if it gives you an option to change that.

   * Ensure that **Use the native Windows Secure Channel library** is
   selected and click on `Next`.

   * Ensure that **Checkout Windows-style, commit Unix-style line endings**
   is selected and click on `Next`.

   * Ensure that **Use Windows' default console window** is selected and
   click on `Next`.

   * Choose the **Default behavior of git pull** to be **Default (fast-forward
   or merge)**.

   * From **Choose a credential manager**, choose **Git Credential Manager
   Core**.

   * Ensure that **Enable file system caching** is selected

   * Do _NOT_ enable experimental support for pseudo consoles.  Clicking
   `Next` here should start the installation with no further selection
   screens.

   * This should bring you to a screen where you can click `Finish`.
   Unless you are really interested, you should uncheck the box to view
   the release notes.

3. If your `HOME` environment variable is not set (or you don't know
   what this is), then

    * Open command prompt (Open Start Menu then type cmd and press [Enter])

    * Type the following line into the command prompt window exactly as shown:
    ```
    setx HOME "%USERPROFILE%"
    ```

    * Press `Enter`, you should see output that indicates
    ```
    SUCCESS: Specified value was saved.
    ```

    * Quit command prompt by typing `exit` then pressing `Enter`

Completing those steps will provide you with both Git and Bash in the Git
Bash program.

### Installing R

Download the R installer. [Link to the
installer](https://cran.r-project.org/bin/windows/base/release.htm)

Run the downloaded file.  When prompted, you do want to allow it to make
changes to your system.

Please accept the default installation location for R; for version 4.0.3
that will be `C:\Program Files\R\R-4.0.3`.  Subsequent steps will use that
installation path to make R avaiable from the command line, which you
will need.

Accepting all of the default choices and clicking `Next` at each choice will
result in a working R.

### Installing RStudio

Note that you _must_ install R before RStudio.

Please see the
<a href="https://rstudio.com/products/rstudio/download/#download">download
page at the RStudio web site</a>.  There is only one Windows installercw
available for Windows 10, 8, and 7 as of 19 Nov, 2020.  You should be
able to run it once downloaded and it will install properly.

## macOS

### The Unix Shell

The shell is a program that enables us to send commands to the computer and receive output. It is 
also referred to as the terminal or command line.  For a Mac computer running macOS Mojave or 
earlier releases, the default Unix Shell is Bash.  For a Mac computer running macOS Catalina or 
later releases, the default Unix Shell is Zsh. 

Your default shell is available via the Terminal program within your Utilities folder.  To open 
Terminal, try one of the following:

* In Finder, select the Go menu, then select Utilities. Locate Terminal in the Utilities folder and open it.
* Use the Mac ‘Spotlight’ computer search function. Search for: Terminal and press Return.

To see which Unix shell your Mac is running, type echo $SHELL in your terminal window.

### Installing Git

Git is a version control system that lets you track who made changes to what when and has options 
for easily updating a shared or public version of your code on github.com. You will need a [supported web 
browser](https://help.github.com/articles/supported-browsers/).

You will need an account at [GitHub](https://github.com/) for parts of the Git lesson. Basic GitHub 
accounts are free. We encourage you to create a GitHub account if you don't have one already. Please 
consider what personal information you'd like to reveal. For example, you may want to review these 
[instructions for keeping your email address private](https://help.github.com/articles/keeping-your-email-address-private/)
provided at GitHub.

Git may be installed on Macs as part of XCode.  To check whether git is installed, type
`which git` in a Terminal and hit enter.  If installed, the installation path will print on the 
next line in your terminal.  The default installation path for Apple installed git is `/usr/bin/git`.

If git is installed, you can see which version is installed by typing `git --version` into the 
terminal and hitting enter.  If you receive an error regarding an `invalid active developer path`,
you may need to (re-)install XCode.  Try doing this by typing `xcode-select --install` and enter
in the Terminal.  The `git --version` command should then return the number of the installed
version of git.

You should have git version >=2.24.  If not, please install the latest
version of Git for Mac by downloading and running the most recent "mavericks" installer from 
[this list](http://sourceforge.net/projects/git-osx-installer/files/).  Because this installer is 
not signed by the developer, you may have to right click (control click) on the .pkg file, click Open, 
and click Open on the pop up window. After installing Git, there will not be anything in your 
/Applications folder, as Git is a command line program. For older versions of OS X (10.5-10.8) use the 
most recent available installer labelled "snow-leopard" [available here](http://sourceforge.net/projects/git-osx-installer/files/).

### Installing R
[R](https://www.r-project.org/) is a programming language that is especially powerful for data 
exploration, visualization, and statistical analysis. You will need a recent version of R (>= 4.0).
Install R by downloading and running [this .pkg file](https://cran.r-project.org/bin/macosx/R-latest.pkg)
from [CRAN](https://cran.r-project.org/index.html).

Once the package is installed, open a terminal and type `which R` to see the installation location.
Typing `R --version` will print the installed version number.

### Installing RStudio

To interact with R, we use RStudio.  RStudio is an integrated development environment for R.
To install [RStudio](https://rstudio.com/products/rstudio/download/#download).  Click the
DOWNLOAD RSTUDIO FOR MAC button. Double-click the downloaded installer.  It will open a window with
the Applications folder and an icon for the RStudio app.  Drag the RStudio icon into the
Applications folder.

### Download the data and validation scripts

Get the zip file.  Save to Desktop and unzip, will create a new folder called `un-report`.

TODO:  Create the zip file, add URL and other instructions.

## Linux

### Installing R

In a Terminal window, the following will install R on Ubuntu/Debian Linux.

~~~
sudo apt-get install r-base
~~~
{: language-bash}

If you use Fedora, then the following command should be used

~~~
dnf install git
dnf install R
~~~
{: language-bash}

You will need to install RStudio using the instruction found at the [RStudio
page](https://www.rstudio.com/products/rstudio/download/#download) that are
appropriate for your Linux.

