---
title: 'Developing and deploying an integrated workshop curriculum teaching computational skills for reproducible research'
tags:
  - reproducible research
  - data science
  - R
  - git
  - Unix shell
authors:
  - name: Zena Lapp^[co-first author]
    orcid: 0000-0003-4674-2176
    affiliation: 1
  - name: Kelly L. Sovacool^[co-first author]
    orcid: 0000-0003-3283-829X
    affiliation: 1  
  - name: Nick Lesniak
    orcid:
    affiliation: 2
  - name: Dana King
    orcid:
    affiliation: 3
  - name: Catherine Barnier
    orcid:
    affiliation: 1
  - name: Matthew Flickinger
    orcid:
    affiliation: 3
  - name: Jule Krüger
    orcid:
    affiliation: 3
  - name: Courtney Armour
    orcid:
    affiliation: 2
  - name: Maya M. Lapp
    orcid: 0000-0002-8249-1186 
    affiliation: 4
  - name: Jason Tallant
    orcid:
    affiliation: 3
  - name: Rucheng Diao
    orcid: 0000-0002-2932-6755
    affiliation: 1
  - name: Shelly Johnson
    orcid:
    affiliation: 3
  - name: Morgan Oneka
    orcid:
    affiliation: 1
  - name: Sarah Tomkovich
    orcid:
    affiliation: 2
  - name: Jacqueline Moltzau Anderson
    orcid: 0000-0003-1398-5980
    affiliation: 2
  - name: Sarah K. Lucas
    orcid:
    affiliation: 2
  - name: Patrick D. Schloss^[corresponding author]
    orcid: 0000-0002-6935-4275
    affiliation: 2
affiliations:
  - name: Department of Computational Medicine & Bioinformatics, University of Michigan
    index: 1
  - name: Department of Microbiology & Immunology, University of Michigan
    index: 2
  - name: TODO
    index: 3
  - name: Independent educator
    index: 4
date: 27 Apr. 2021
bibliography: paper.bib
---

# Summary

Inspired by well-established material and pedagogy provided by The Carpentries
[@wilson_software_2016], we developed a two-day workshop curriculum that teaches
introductory R for plotting and data analysis, the Unix shell, version control
with git, and GitHub.
While the official Software Carpentry curriculum is extensive, we found
that it contains too much content for the time allotted in a two-day workshop,
and the independent nature of the lessons leaves learners confused about how to
integrate the skills together in their own work.
The new curriculum we developed, which is hosted on GitHub
(https://umcarpentries.org/intro-curriculum-r/),
aims to teach novices how to implement reproducible research practices to
perform data analysis.
It emphasizes the iterative nature of coding and data analysis through
integrated live coding lessons and practice exercises.
Furthermore, this curriculum provides a succinct resource for learners to reference both during and after
the workshop, and lowers the barrier to entry for new instructors as they do not
have to develop their own curriculum or sift through extensive content.
We developed this curriculum during a two-day sprint,
successfully used the curriculum to host a two-day virtual workshop,
and updated the material based on instructor and learner feedback.
We hope that this curriculum will be useful to other instructors interested in
teaching workshops with similar learning objectives.

# Statement of Need

The University of Michigan instance of The Carpentries has taught workshops
using the curriculum created by The Carpentries organization since 2015.
In that time, our instructors have found several advantages and disadvantages to
using the Software Carpentry curriculum in particular.
Some advantages are that any programming language lesson (e.g. R or
Python) can be paired with lessons on the Unix shell and version control;
the lessons have been refined over years by many contributors and taught at
workshops around the world; and
the instructional design demonstrates good pedagogy for teaching beginner data
science practitioners.

However, we found that the curriculum did not meet all of our needs.
First, the modular nature of the curriculum means that each lesson is independent
from the others, so it is not apparent to learners how to integrate all of the
skills together for reproducible research projects.
Additionally, The Carpentries material is more of a reference than a lesson plan as
there is too much content for the time allotted in a two-day workshop.
Therefore, workshops contain inconsistent content depending on who teaches, and new
instructors face an overwhelming amount of work to prepare for their first
workshop.
Finally, some lessons include niche content that we do not feel is necessary to teach
beginners as we do not use it ourselves in our research projects.

We sought to create a new curriculum that would
teach computational skills in an integrated manner to demonstrate the
reproducible research workflows we use in our own work,
utilize the same inclusive pedagogy refined by The Carpentries,
and contain an appropriate amount of content to deliver consistent workshops
and reduce the burden for new instructors to get involved.

# Collaborative Curriculum Development

We drew on the expertise of The Carpentries community at the
University of Michigan to develop a custom curriculum that would meet the needs
of our learners (Figure 1).
We planned a two-day sprint, where members of our community worked
collaboratively to create an initial draft of the content.
During the sprint, we met virtually to discuss our goals, then broke up into
teams to work on individual lessons before coming back together to review our
progress.
We hosted the curriculum in a public GitHub repository
(https://github.com/umcarpentries/intro-curriculum-r) to facilitate
collaborative work and peer review using issues, branches, and pull requests.
Under this model, a team member creates or edits content in a new branch to
resolve an issue,
then creates a pull request and asks for review from another team member,
who finally merges the changes into the default branch.
GitHub pages automatically uses the default branch to build a website which
hosts the polished curriculum (https://umcarpentries.org/intro-curriculum-r/).
This model ensures that at least two pairs of eyes view the changes before they
can be included in the curriculum, which reduces mistakes and contributes to
better quality content.

Following the sprint, contributors finalized edits and continued to review each
others' pull requests to complete the alpha version of our curriculum.
Next, we hosted a workshop for instructors to pilot the curriculum.
We collected feedback from the learners and instructors at the end of the pilot
workshop, then held a smaller half-day sprint to revise the curriculum based on
the feedback.
Community members continue to create issues, make edits, and review pull
requests for the ongoing refinement of the curriculum.
We have plans to teach more workshops with instructors who did not develop the
curriculum to gather even more feedback.

![The curriculum development framework.](development-framework.png)

# Curriculum

Our curriculum is tailored to people with no prior coding experience who want to
learn how to use programming to perform data analysis (Figure 2).
We aim to teach our learners not only the basics of performing data analysis,
but also to provide them with a framework to perform rigorous reproducible
research that can easily be shared with others.

![Curriculum overview.](curriculum-overview.png)

## Learning Objectives

The key learning objectives for our curriculum are:

1. Create clear and informative data visualizations in R, starting with messy data.
1. Perform version control using the Unix shell and git.
1. Create reproducible reports using R markdown.
1. Share code with others on GitHub.

We believe these skills provide a solid foundation from which learners can teach
themselves any additional coding skills that they will need in the future.

## Course Content

Our curriculum consists of modules that cover setup, data analysis and
visualization, version control, and writing reports.
We also provide a goal for the workshop: to create a fictitious report for the
United Nations on the relationship between gross domestic product (GDP), life
expectancy, and CO~2~ emissions.
The modules are:

0. Setup
1. Welcome
1. R for plotting (uses the tidyverse R package [@wickham_welcome_2019])
1. The Unix shell
1. Git and GitHub
1. R for data analysis (uses the tidyverse R package [@wickham_welcome_2019])
1. Writing reports in R markdown (uses the rmarkdown R package [@xie_r_2018])
1. Group practice exercises
1. Where to go from here

Each lesson builds on the previous lessons.
The Unix shell, git, and GitHub are introduced using the files generated in the
R for plotting lesson.
The lesson content for subsequent modules is then intermittently committed and
pushed to GitHub.
The written report combines all of the skills learned previously to write a
report that one could share with the United Nations.
Then, the learners have a chance to put everything they have learned into
practice by working in small groups on practice problems that cover the course
content.
Finally, we end with a short module recapping what the workshop covered and how
learners can continue to get help and learn more after the workshop ends.

## Instructional Design
<!-- teaching philosophy / pedagogy -->

Our modules and instructor suggestions are developed in the style of [Software Carpentry](https://software-carpentry.org/):

1. Each module contains learning objectives at the beginning of each lesson and
a summary of key points.
1. The five core modules (2 to 6) are designed to be taught via live coding of
the content to learners.
This is a central feature of Carpentries lessons, and we believe it is a great
way to learn how to program because it requires learners to follow along and
encounter errors that they must debug along the way, fostering additional
questions about the course content.
1. We incorporate formative assessments in the form of short practice exercises
throughout each lesson so that learners can practice what they have learned and
instructors can gauge learner understanding of the material.

We also incorporate a few additional key components into the curriculum:

1. Each lesson builds off of others, with the goal of creating a final report
that can be shared with others.
1. We structured the curriculum such that it could be taught through an
in-person or virtual workshop.
1. We require learners to install all software before the workshop (as the
Carpentries also requires), and ask them to run an example script that tests
whether everything is installed correctly.
Learners must send screenshots of the script output to the workshop lead in
advance in order to attend. This insures that any installation issues can be
addressed before the workshop begins.
1. An extensive small group practice module towards the end of the workshop
allows learners to more independently practice the skills they have learned
throughout.
1. The workshop concludes with a recap of what was covered and resources
available for learners to continue learning and getting help as their skills
develop.

## Pilot Workshop
<!-- experience of use -->

We piloted our curriculum during a virtual two-day Software Carpentry workshop.
In line with The Carpentries style, we had four instructors and six helpers at
the workshop to assist with learner questions and technical issues.
We also used the "sticky note" system where learners can indicate their progress
on exercises and requests for help by using different colored sticky notes.
As the workshop was virtual, we used Zoom reaction icons as sticky notes.
We had thirty-nine learners of various skill levels from several different
countries, all of whom provided very positive reviews of the workshop.

<!-- TODO: follow-up with SWC on whether we can use our surveys -->

### Virtual Workshop Reflection

We credit the success of our first virtual workshop in large part due to the
curriculum structure and content, as well as the instructors and helpers
involved.
However, we also believe that the following helped make the workshop as
smooth as possible:

1. We suggested that learners have Zoom and RStudio (or the Unix shell) open side-by-side on their computer to minimize toggling between different panels.
1. We used Slack for communication among instructors and helpers, as well as between helpers and learners.
Learners asked questions in a group Slack channel where helpers could respond.
1. When a learner needed more help than was possible on Slack, a helper and the
learner entered a breakout room together to troubleshoot.
However, we tried to minimize this option as then the learner misses content
covered in the main room.

# Acknowledgements

We thank The Carpentries organization for their workshop protocols and
open-source Software Carpentry curriculum, upon which this curriculum is based.

We thank Victoria Alden and Scott Martin for assisting us in organizing and
advertising our workshop.
We thank the learners who participated in the workshop.

# Funding

Salary support for PDS came from NIH grant R01CA215574.
KLS received support from the NIH Training Program in Bioinformatics (T32
GM070449).
ZL received support from the National Science Foundation Graduate Research
Fellowship Program under Grant No. DGE 1256260.
Any opinions, findings, and conclusions or recommendations expressed in this
material are those of the authors and do not necessarily reflect the views of
the National Science Foundation.

# Author Contributions

ZL and KLS contributed equally. ZL is first among the co-first authors because
KLS threatened to reject all pull requests where ZL put KLS first. :)

PDS supervised the project.
ZL and KLS organized the initial sprint, led the development of the curriculum,
and drafted the manuscript.
ZL, KLS, JK, and MML instructed at the first pilot workshop
while CA, JMA, ST, SKL, SJ, and CB assisted learners.
All authors contributed to the development of the curriculum.

# Conflicts of Interest

None.

# References
