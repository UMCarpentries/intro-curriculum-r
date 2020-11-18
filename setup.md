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

### Option 1 - Using the Windows Subsystem for Linux (WSL)

If your version of Windows supports it, using the WSL will make the
installation of the tools needed easier. Instructions to install Linux
distributions from Windows 10/Windows Server are available from the
Microsoft article [Windows Subsystem for Linux Installation Guide for
Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

We recommend that you install Ubuntu.

If you install a distribution other than Ubuntu, you will need to adjust
the commands that install the packages.
TODO:  Outline installing R and Git
TODO:  If WSL is used, then probably you want to still use the native
       R and RStudio applications.  So, if people install R in WSL, there
       is some chance they will be different versions.  I suspect that
       installing an X desktop may be beyond the scope of this workshop?

> ### Installing Bash
>
> Software Carpentry provides this video that walks through the process of
> installing Git Bash 
>
> Steps outlined
>
> 1. Download the [Git for Windows installer](https://git-scm.com/download/win).
> 
> 2. Run the installer and follow the steps below:
> 
>    * Click on `Next` to get through the license screen.
>
>    * Click on `Next` to accept the default installation path of
>    `C:\Program Files\R/R-4.0.3`.
>    * On the Select Components screen, you may wish to check the box to
>    create Desktop icons.  Please do not change the other selections.
>    Click `Next`.
>    * Click on `Next` to accept `Git` as the name of the Start Menu folder.
>    * 
>    * On the "Choosing the default edit used by Git" panel, please select
>    * from the dropdown menu "Use the nano editor by default" -- you may
>    need to scroll _up_ in the list to find it.  Click on `Next`.
> 
>    * Ensure that "Git from the command line and also from 3rd-party
>    software" is selected and click on "Next". (If you don't do this Git
>    Bash will not work properly, requiring you to remove the Git Bash
>    installation, re-run the installer and to select the "Git from the
>    command line and also from 3rd-party software" option.)
>
>    * Keep the OpenSSH option if it gives you an option to change that.
> 
>    * Ensure that "Use the native Windows Secure Channel library" is
>    selected and click on "Next".
> 
>    * Ensure that "Checkout Windows-style, commit Unix-style line endings"
>    is selected and click on "Next".
> 
>    * Ensure that "Use Windows' default console window" is selected and
>    click on "Next".
>
>    * Choose the default behavior of git pull to be Default (fast-forward
>    or merge).
>
>    * From Choose a credential manager, choose Git Credential Manager Core
>
>    * Ensure that Enable file system caching is selected
>
>    * Do _NOT_ enable experimental support for pseudo consoles.  Clicking
>    Next here shuld start the installation with no further selection
>    screens.
> 
>    * This should bring you to a screen where you can click `Finish`.
>    Unless you are really interested, you should uncheck the box to view
>    the release notes.
> 
> 3. If your `HOME` environment variable is not set (or you don't know
>    what this is):
> 
>     * Open command prompt (Open Start Menu then type cmd and press [Enter])
>     * Type the following line into the command prompt window exactly as shown:
>     ```
>     setx HOME "%USERPROFILE%"
>     ```
>     * Press [Enter], you should see SUCCESS: Specified value was saved.
>     * Quit command prompt by typing exit then pressing [Enter]
> 
> Completing those steps will provide you with both Git and Bash in the Git
> Bash program.
{: .solution}

> ### Installing R
>
> Download the R installer. [Link to the
installer](https://cran.r-project.org/bin/windows/base/release.htm)
> Run the downloaded file.  When prompted, you do want to allow it to make
> changes to your system.
> Please accept the default installation location of
> `C:\Program Files\R\R-4.0.3`.  Subsequent steps will use that installation
> path to make R avaiable from the command line, which you will need.
> Accepting all of the default choices and clicking Next at each choice will
> result in a working R.

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
