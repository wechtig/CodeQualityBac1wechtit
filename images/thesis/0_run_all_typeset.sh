#!/bin/sh
mkdir -p tmp/chapters
./1_run_pdflatex.sh && ./2_run_biber.sh && ./1_run_pdflatex.sh
# append for MacOS X: && open tmp/*.pdf
