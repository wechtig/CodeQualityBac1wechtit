#!/bin/sh
#Note: demo.bcf REQUIRED
# (created by pdflatext with a *.tex input containing
# ...
# \usepackage[
#    backend=biber,
# ...
# ]{biblatex}
biber tmp/thesis.bcf
