---
title: Setup
---

## Requirements

* A GitHub account
* A working [Python 3.4+](https://www.python.org) environment to run the lesson initialization
  script
* (Optional) A local install of [bundler](https://bundler.io/) which will require the Ruby
  language to be installed.

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
> Placeholder
{: .solution}

### Linux (Ubuntu)

> ## Installing 
> sudo apt-get install ruby ruby-dev build-essential libxml2-dev
> {: .solution}


### For Everyone

### For R-based lessons

You will need a recent version of R (>= 3.5.0). Installation instructions are available from the [CRAN website](https://cran.r-project.org).

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
