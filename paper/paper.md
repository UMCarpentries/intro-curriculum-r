---
title: 'A project-based workshop curriculum teaching computational skills for reproducible research'
tags:
  - reproducible research
  - data science
  - R
  - git
  - unix shell
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
    affiliation:
  - name: Catherine Barnier
    orcid:
    affiliation: 1
  - name: Matthew Flickinger
    orcid:
    affiliation:
  - name: Jule Krüger
    orcid:
    affiliation:
  - name: Courtney Armour
    orcid:
    affiliation: 2
  - name: Maya Lapp
    orcid:
    affiliation:
  - name: Jason Tallant
    orcid:
    affiliation:
  - name: Rucheng Diao
    orcid:
    affiliation: 1
  - name: Bennet Fauber
    orcid:
    affiliation:
  - name: Shelly Johnson
    orcid:
    affiliation:
  - name: Morgan Oneka
    orcid:
    affiliation: 1
  - name: Sarah Tomkovich
    orcid:
    affiliation: 2
  - name: Jacqueline Moltzau
    orcid:
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
date: 2021
bibliography: paper.bib
---

TODO: revisit the title after we draft the manuscript.

# Summary

TODO

# Statement of need

The University of Michigan instance of Software Carpentry has taught workshops
using the curriculum created by the Software Carpentry organization since 2015.
In that time, our instructors have found several advantages and disadvantages to
using the Software Carpentry curriculum.
Some advantages that we found are:
1. it is modular, so workshop organizers can choose any programming language
lesson (e.g. R or Python) to pair with lessons on the unix shell and version
control;
1. it has been refined over years by many contributors and taught at workshops
around the world; and
1. it demonstrates good pedagogy for teaching beginner data science
practitioners.

However, we found that the curriculum did not meet all of our needs.
The disadvantages that we found are:
1. the modular nature of the curriculum means that each lesson is independent
from the others, so it is not apparent to learners how to integrate all of the
skills together for reproducible research projects;
1. there is too much content for the time allotted in a two-day workshop, so
workshops contain inconsistent content depending on who teaches, and new
instructors face an overwhelming amount of work to prepare for their first
workshop; and
1. some lessons include niche content that we do not use ourselves in our
research projects.

We sought to create a new curriculum that would
teach computational skills in an integrated manner to demonstrate the
reproducible research workflows we use in our own work,
utilize the same inclusive pedagogy refined by the Carpentries,
and contain an appropriate amount of content to deliver consistent workshops
and reduce the burden for new instructors to get involved.

# Collaborative Curriculum Development

We drew on the expertise of the vibrant Software Carpentry community at the
University of Michigan to develop a custom curriculum that would meet the needs
of our learners.
We planned a two day sprint, where members of our community worked
collaboratively to create an initial draft of the content.
During the sprint, we met virtually to discuss our goals, then broke up into
teams to work on individual lessons before coming back together to review our
progress.
We hosted the curriculum in a public GitHub repository to facilitate
collaborative work and peer review using issues, branches, and pull requests.
Under this model, a team member creates or edits content in a new branch to
resolve an issue,
then creates a pull request and asks for review from another team member,
who finally merges the changes into the default branch.
GitHub pages automatically uses the default branch to build a website which
hosts the polished curriculum.
This model ensures that at least two pairs of eyes view the changes before they
can be included the curriculum, which reduces mistakes and contributes to better
quality content.

Following the sprint, contributors finalized edits and continued to review each
others' pull requests to complete the alpha version of our curriculum.
Next, we hosted a workshop for instructors to pilot the curriculum.
We collected feedback from the learners and instructors at the end of the pilot
workshop, then held a smaller half day sprint to revise the curriculum based on
the feedback.
Community members continue to create issues, make edits, and review pull
requests for the ongoing refinement of the curriculum.
We have plans to teach more workshops with instructors who did not develop the
curriculum in order to gather even more feedback.

![The curriculum development framework.](development-framework.png)

# Curriculum

Our curriculum is tailored to people with no prior coding experience who want to
learn how to use programming perform data analysis.
We aim to teach our learners not only the basics of performing data analysis,
but also provide them with a framework to perform rigorous reproducible research
that can easily be shared with others.

![Curriculum overview.](curriculum-overview.png)

## Learning Objectives

The key learning objectives for our curriculum are:

1. Create clear and informative data visualizations in R, starting with unclean data.
1. Perform version control using the unix shell and git.
1. Create reproducible reports using R markdown.
1. Share code with others on GitHub.

We believe these skills provide a foundation off of which learners can teach
themselves additional coding skills that they will need in the future.

## Course Content

Our curriculum consists of modules that cover setup, data analysis and
visualization, version control, and writing reports.
We also provide a goal for the workshop: to create a report for the United
Nations on the relationship between gross domestic product (GDP), life
expectancy, and CO2 emissions.
The modules are:

0. Setup
1. Welcome
1. R for plotting
1. The Unix shell
1. Git and GitHub
1. R for data analysis
1. Writing reports in R markdown
1. Group practice exercises
1. Where to go from here

Each exercise builds off of the previous exercises.
The unix shell, git, and GitHub are introduced using the files generated in the
R for plotting lesson.
The lesson content for subsequent modules is then intermittently committed to
git and pushed to GitHub.
The written report combines all of the skills learned previously to write a
report to share with the United Nations.
Then, the learners have a chance to put everything they have learned into
practice by working in small groups on practice problems that cover the course
content.
Finally, we end with a short module recapping what the workshop covered and how
learners can continue to get help and learn more after the workshop ends.

## Instructional Design
<!-- teaching philosophy / pedagogy -->

Our modules and instructor suggestions are developed in the style of the Carpentries:

1. Each module contains learning objectives at the beginning of each lesson and a summary of key points.
1. The five core modules (3 to 7) are designed to be taught via live coding of the content to learners.
This is a core feature of Carpentries lessons, and we believe it is an excellent way to learn how to program because it requires learners to follow along and encounter errors that they must debug along the way, fostering additional questions about the course content.
1. We incorporate formative assessments in the form of short practice exercises throughout each lesson so that learners can practice what they have learned an instructors can gauge learner understanding of the material.

We also incorporate a few additional key components into the curriculum:

1. We developed the curriculum in such a way that it could be taught throught an in person or virtual workshop.
1. We require learners to install all software before the workshop (as the Carpentries also requires), and have them run an example script that tests whether everything is installed correctly.
They must send screenshots of the script output to the workshop lead prior to the workshop so that any issues that arise can be addressed before the workshop begins.
1. An extensive small group practice module towards the end of the workshop allows learners to more independently pratice the skills they have learned throughout the workshop.
1. The workshop concludes with a recap of what was covered and resources available for learners to continue learning and getting help after the workshop concludes.

## Pilot Workshop
<!-- experience of use -->

# Acknowledgements

We thank the Carpentries organization for their workshop protocols and
open-source Software Carpentry curriculum, upon which this curriculum is based.

We thank Victoria Alden and Scott Martin for assisting us in organizing and
advertising our workshop.
We thank the learners who participated in the workshop.

# Funding

Salary support for PDS came from NIH grant 1R01CA215574.
KLS received support from the NIH Training Program in Bioinformatics (T32
GM070449).
ZL received support from the National Science Foundation Graduate Research
Fellowship Program under Grant No. DGE 1256260.
Any opinions, findings, and conclusions or recommendations expressed in this
material are those of the authors and do not necessarily reflect the views of
the National Science Foundation.

# Author contributions

ZL and KLS contributed equally. ZL is first among the co-first authors because
KLS threatened to reject all pull requests where ZL put KLS first.

PDS supervised the project.
ZL and KLS organized the initial sprint, led the development of the curriculum,
and drafted the manuscript.
ZL, KLS, JK, and ML instructed at the first pilot workshop
while CA, JM, ST, SKL, SJ, and CB assisted learners.
All authors contributed to the development of the curriculum.

# Conflicts of interest

None.

# References
