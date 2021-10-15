---
title: "Welcome to Software Carpentry"
teaching: 15
exercises: 0
questions:
- "What is The Carpentries?"
- "What will the workshop cover?"
- "What else do I need to know about the workshop?"
objectives:
- "Introduce The Carpentries."
- "Go over logistics."
- "Introduce the workshop goals."
keypoints:
- "We follow The Carpentries Code of Conduct."
- "Our goal is to generate a shareable and reproducible report by the end of the workshop."
- "This lesson content is targeted to absolute beginners with no coding experience."
---


## What is The Carpentries / UM Carpentries?

The Carpentries is a global organization whose mission is to teach researchers, and others, the basics of coding so that you can use it in your own work.
We believe everyone can learn to code, and that a lot of you will find it very useful for things such as data analysis and plotting.

Our workshops are targeted to absolute beginners, and we expect that you have zero coding experience coming in.
That being said, you're welcome to attend a workshop if you already have a coding background but want to learn more!

The [Carpentries at the University of Michigan](#umcarpentries.org) is local
group of data and software enthusiasts that regularly present workshops for
UM groups and the community at large. Let us know if you have interest in
hosting a workshop for your group, participating as a helper in a future workshop,
or becoming trained as an instuctor.

## Code of Conduct

To provide an inclusive learning environment, we follow The Carpentries [Code of Conduct](https://docs.carpentries.org/topic_folders/policies/code-of-conduct.html).
We expect that instructors, helpers, and learners abide by this code of conduct, including practicing the following behaviors:

- Use welcoming and inclusive language.
- Be respectful of different viewpoints and experiences.
- Gracefully accept constructive criticism.
- Focus on what is best for the community.
- Show courtesy and respect towards other community members.

You can report any violations to the Code of Conduct by filling out [this form](https://docs.google.com/forms/d/e/1FAIpQLSdi0wbplgdydl_6rkVtBIVWbb9YNOHQP_XaANDClmVNu0zs-w/viewform).

## Introducing the instructors and helpers

Now that you know a little about The Carpentries as an organization, the instructors and helpers will introduce themselves and what they'll be teaching/helping with.

## Using Zoom and Slack

### Arranging your screens
It is important that you can see:

 - Zoom (instructor's shared screen + reactions)
 - Slack
 - R/Studio or terminal/command window

![screen setup]({{ page.root }}/fig/welcome/screen_setup.png)
<br/>
<br/>


### Using Zoom

- Zoom controls are at the bottom of the Zoom window:
![Zoom controls]({{ page.root }}/fig/welcome/zoom_controls.png)

- To minimize distractions, we encourage participants to keep their audio muted
  (unless actively asking a question).
- To maximize engagement, we encourage participants to keep their video on.
- Slack works better than Zoom's Chat function so avoid Zoom Chat for now.
- You can enable transcription subtitles for your view.
- We will be using Breakout Rooms occasionally for ad-hoc 1-1 helper support.
  We will review this in detail together in a few minutes.
- Zoom's "non-verbal controls" are a useful way to interact
  - Depending on your version of Zoom you can access these either
    - in the **Reactions** button on you main Zoom window
    - at the bottom of the **Participant** pane

![Zoom non verbals]({{ page.root }}/fig/welcome/zoom_nonverbals.png)

  - **Raise Hand** to request clarification or ask a question. (Same an in-person workshop.)
  - **Gray chevron [Slow down / Give me a moment]** when you need more time to complete
    an exercise or you would like the instructor to repeat an idea
  - Instructors will use **Green check** and **Red X** to poll the group
    at checkpoints along the way.
<br/>
<br/>

#### Exercise: Use Zoom non-verbals
  - Everyone use Zoom to raise your hand. <img src="{{ page.root }}/fig/welcome//zoom_raise_hand.png" width=50/>
<br/>
<br/>


#### Exercise: Using Zoom Breakout Rooms
Take a moment to briefly introduce yourself (name, dept/lab, area of study) in a
breakout room.

  - Zoom: Click Breakout Rooms
  - Find the room corresponding to the first letter of your first name
  - Hover over the number to the right and click **Join**.
  - When you have completed introductions, you can leave the breakout room to rejoin the main room.

  ![Breakout rooms]({{ page.root }}/fig/welcome/zoom_breakout_rooms.png)
<br/>
<br/>


### Using Slack

- **Slack** can be used to communicate to the group or to individuals and has a
  few features/behaviors that we prefer over Zoom's Chat functionality.

![Posting messages to Slack]({{ page.root }}/fig/welcome/slack_thread.png)

  - Slack messages will be posted to the **2021-october-umswc-workshop** channel.  
    Click on the channel in the left pane (1) to select this channel.
  - You can type in the **message field** (2); click **send** (3) to
    post your message to everyone.
  - Helpers will respond in a Slack thread (or pose the question to the instructor)
  - You can respond in a message thread by hovering over a message to trigger
    the message menu and clicking the **speech bubble** (4).


#### Exercise: Responding in Slack thread
What is one thing you hope to learn today or tomorrow?
<br/>
<br/>


### Review of Key communication patterns

| Syntax | <img src="{{ page.root }}/fig/welcome/zoom_logo.png" alt="Zoom" width=120/> | <img src="{{ page.root }}/fig/welcome/slack_logo.png" alt="Slack" width=120 align="left"/> |
| --- | :-----------: | - |
| "I have an urgent question" | <img src="{{ page.root }}/fig/welcome//zoom_raise_hand.png" width=50/> | <br/> **Post a question** |
| "I have a general question" | <img src="{{ page.root }}/fig/welcome//zoom_raise_hand.png" width=50/> | <br/> **Post a question** |
| "I'm stuck / I need a hand" | | **Post a note** |
| Instructor check-in | <img src="{{ page.root }}/fig/welcome/zoom_green_check.png" width=50/> (OK) <br/> _or_ <img src="{{ page.root }}/fig/welcome/zoom_red_x.png" width=50/> (Wha?)| |
| Instructor Slack question | | **Respond in Slack thread** |

<br/>
<br/>

#### Exercise: Group checkpoint
  - Using Zoom, give me a **green-check** if you feel like you understand
    communication patterns or **red-X** if you need clarification.
<br/>
<br/>



## The "goal" of the workshop

Now that we all know each other, let's learn a bit more about why we're here.
Our goal is to write a report to the United Nations on the relationship between GDP, life expectancy, and CO2 emissions. In other words, we are going to analyze  how countries' economic strength or weakness may be related to  public health status and climate pollution, respectively.

To get to that point, we'll need to learn how to manage data, make plots, and generate reports. The next section discusses in more detail exactly what we will cover.

## What will the workshop cover?

This workshop will introduce you to some of the programs used everyday in
computational _workflows_ in diverse fields:  microbiology,
statistics, neuroscience, genetics, the social and behavioral
sciences, such as psychology, economics,  public health, and many others.

A workflow is a set of steps to read data, analyze it, and produce numerical
and graphical results to support an assertion or hypothesis encapsulated into
a set of computer files that can be run from scratch on the same data to obtain
the same results. This is highly desirable in situations where the same work is
done repeatedly -- think of processing data from an annual
survey, or results from a high-throughput sequencer on a new sample. It is
also desirable for _reproducibility_, which enables you and other people to look at
what you did and produce the same results later on. It is increasingly common for
people to publish scientific articles along with the data and  computer code that
generated the results discussed within them.

The programs to be introduced are:

1. [_R, RStudio_]({{ page.root }}/01-r-plotting/index.html), and [_R Markdown_]({{ page.root }}/05-r-markdown/index.html): a statistical analysis and data management program, a graphical interface to it, and a method for writing reproducible reports.
We'll use it to manage data and make pretty plots!
1. [_Git_]({{ page.root }}/03-intro-git-github/index.html): a program to help you keep track of changes to your programs over time.
1. [_GitHub_]({{ page.root }}/03-intro-git-github/index.html#intro-to-github): a web application that makes sharing your programs and working on them with others much easier. It can also be used to generate a citable reference to your computer code.
1. [_The Unix shell (command line)_]({{ page.root }}/02-unix-shell/index.html): A tool that is extremely useful for managing both data and program files and chaining together discrete steps in your workflow
(automation).

We will not try to make you an expert or even proficient with any of them, but we
hope to demonstrate the basics of controlling your code, automating your
work, and creating reproducible programs. We also hope to provide you with some
fundamentals that you can incorporate in your own work.

At the end, we provide links to resources you can use to learn about these
topics in more depth than this workshop can provide.

## Other miscellaneous things

If you're in person, we'll tell you where the bathrooms are! If you're virtual we hope you know. :)
Let us know if there are any accommodations we can provide to help make your learning experience better!
