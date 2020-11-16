# U-M SWC Curriculum

This is the custom curriculum developed by the University of Michigan Software Carpentry instance.
It is under active development and is not yet ready to be used to teach a workshop.

## Repo Layout

1. Top level files

    - `index.md` - The home page.
    - `reference.md` - Reference for learners.
    - `setup.md` - Setup instructions for learners.
    - `AUTHORS` - Plain text list of the lesson authors.
    - `CITATION` - Plain text citation instructions.

1. Lesson episodes

    - `_episodes/` - Source files in markdown. Episode order is determined by the filename.
    - `_episodes_rmd/` - Source files in R Markdown. A lesson should be written in one or the other markdown style, not both. To convert R Markdown files to markdown episodes, run `make lesson-rmd`.

1. Figures are stored in `fig/`, data sets in `data/`, source code in `code/`, and miscellaneous files in `files/`.

1. `_extras/`

    - `about.md` - General notes about the curriculum.
    - `discussion.md` - For learners who would like to learn more.
    - `guide.md` - The instructor's guide for the curriculum.
    - `bonus_exercises.md` - Bonus exercises for learners who want to practice more.

## Lessons

|   | Title | Source File |
|---|-------|------|
| 0 | Welcome to SWC | `_episodes/00-welcome.md` |
| 1 | R for Plotting | `_episodes_rmd/01-r-plotting.Rmd` |
| 2 | The Unix Shell | `_episodes/02-unix-shell.md` |
| 3 | Intro to git & GitHub | `_episodes_rmd/03-intro-git-github.md` |
| 4 | R for Data Analysis | `_episodes_rmd/04-r-data-analysis.Rmd` |
| 5 | R Markdown | `_episodes_rmd/05-r-markdown.Rmd` |
| 6 | Conclusion | `_episodes/05-conclusion.md` |

## Workshop Schedule

For a typical 2-day workshop. Can be modified for different workshop formats.

|   |   |
|---|---|
| **Day 1** |   |
| 09:00 - 09:15 | Welcome to the workshop |
| 09:15 - 10:30 | R for Plotting (Part I) |
| 10:30 - 10:45 | Break |
| 10:45 - 12:00 | R for Plotting (Part II) |
| 12:00 - 13:00 | Lunch Break |
| 13:00 - 14:15 | The Unix Shell |
| 14:15 - 14:30 | Break |
| 14:30 - 16:00 | Intro to git & GitHub
| **Day 2** |   |
| 09:00 - 10:30 | R for Data Analysis (Part I) |
| 10:30 - 10:45 | Break |
| 10:45 - 12:00 | R for Data Analysis (Part II) |
| 12:00 - 13:00 | Lunch Break |
| 13:00 - 14:30 | R Markdown |
| 14:30 - 14:45 | Break |
| 14:45 - 15:30 | Collaborative Exercise |
| 15:30 - 15:50 | Conclusions |
| 15:50 - 16:00 | Exit Survey |

## Helpful links

- Already-established SWC curricula: https://github.com/swcarpentry/swcarpentry#lesson-repositories
- How to format markdown lesson files: https://carpentries.github.io/lesson-example/04-formatting/index.html
- How to format R Markdown lesson files: https://carpentries.github.io/lesson-example/05-rmarkdown-example/index.html
- Style guide: https://carpentries.github.io/lesson-example/06-style-guide/index.html
