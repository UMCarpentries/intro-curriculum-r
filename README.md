# U-M SWC Curriculum

This is the custom curriculum developed by the University of Michigan Software Carpentry instance.
It is under active development and is not yet ready to be used to teach a workshop.

## Layout

1. Top level files:

    - `index.md` - The home page.
    - `reference.md` - Reference for learners.
    - `setup.md` - Setup instructions for learners.
    - `AUTHORS` - Plain text list of the lesson authors.
    - `CITATION` - Plain text citation instructions.

1. Lesson episodes:

    - `_episodes/` - Source files in markdown. Episode order is determined by the filename.
    - `_episodes_rmd/` - Source files in R Markdown. A lesson should be written in one or the other markdown style, not both. To convert R Markdown files to markdown episodes, run `make lesson-rmd`.

1. Figures are stored in `fig/`, data sets in `data/`, source code in `code/`, and miscellaneous files in `files/`.

1. `_extras/`:

    - `about.md` - General notes about the lesson.
    - `discussion.md` - For learners who would like to learn more.
    - `guide.md` - The instructor's guide for the lesson.

## Helpful links

- How to format lesson files: https://carpentries.github.io/lesson-example/04-formatting/index.html
- How to write lessons in R Markdown: https://carpentries.github.io/lesson-example/05-rmarkdown-example/index.html
- Style guide: https://carpentries.github.io/lesson-example/06-style-guide/index.html