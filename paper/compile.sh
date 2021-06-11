#!/bin/bash

pandoc \
    --filter pandoc-citeproc \
    --bibliography=paper.bib \
    --variable papersize=a4paper \
    -s paper.md -o paper.pdf \
    --lua-filter=scholarly-metadata.lua \
    --lua-filter=author-info-blocks.lua \
    --pdf-engine=xelatex \
    -V geometry:margin=1in
