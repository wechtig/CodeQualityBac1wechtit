Suggestion: Before using this template load the master-thesis.tex file in
your LaTeX editor, compile it and compare the resulting PDF file with the
one included with this ZIP package (a second run and/or Biber invocation
may be required).

In the top directory you find scripts which automate the compiling process
on a Unix-like system (*BSD, Linux, MacOS X; don't forget to set the
"executable" bit). The result is a tmp/ folder containing the final PDF
file and all temporary files. When encountering strange errors (or if just
ensuring a clean environment for the first start) this folder, as well as
Biber's cache, can be removed with the script 9_cleanup.sh.

Note: This package was created on a Linux system, so you might encounter
"missing" line breaks. This depends on your editor and can usually be fixed
within its configuration.
_____________________________________________________________________________

Structure
===================================================
master-thesis.tex is the main file which includes the chapters as files
(one file per chapter). View the file introduction.tex that shows how to
use this proposal:
Start the chapter with the command \chapter{...}, add a label (as a suggestion)
and then the command \chapterstart. At the end of chapter write the command
\chapterend (these two commands are defined in the preamble).

The titlepages.tex file, apart from the actual title, contains the abstract,
the required formal declaration and an "Acknowledgements" section.

Notes on bibliography
===================================================
The more recent biblatex package should be considered. This still works with
BibTeX entries but uses a newer backend for compilation (named "Biber") and
offers more configuration options. Documentation is available at
http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf.

In order to properly compile your TeX files using Biblatex/Biber observe
the following hints:
1. Do not use the "natbib" package (incompatible)
2. \usepackage{csquotes} (documentation at http://www.ctan.org/pkg/csquotes)
3. \usepackage[options...] {biblatex} (for options see below)
4. \addbibresource{references.bib} to add your BibTeX references file (.bib
   must not be omitted)
5. (near the end of your document) \printbibliography (you may give it a
   title: \printbibliography[title=Resources])

Proposed options can be found in the preamble of the master file.


According to FH guidelines a URL must show the date when visited. This date
is stored in the key "urldate" in the .bib file. So we must redefine the
variable "urlseen" for Biblatex (see preamble of main file).

For this bibliography style to work properly you must use the "url" and the
"urldate" keys for your references in the .bib file.


Biblatex/Biber:
Depending on the LaTeX editor you use you might encounter difficulties related
to the degree Biber is integrated or supported.

* If the .bbl file does not exist you must call Biber from a command line:
  biber master-thesis.bcf
* In case of errors that cannot be solved easily (e.g. you don't get a
  bibliography at all) delete the master-thesis.bbl file and rerun Biber.
* In TeXstudio I found that I had to run Biber after every change in the
  bibliography file (references.bib). I am still investigating this problem,
  and I am pretty sure that someone from the community already has a solution.

Important:
It turned out that an error might occur when first invoking Biber. If this is
the case then remove the temporary files cached by Biber (this is also done by
the script 9_cleanup.sh mentioned at the top):
1. Find the folder where Biber stores these files, with the command
	biber --cache
2. Remove the folder whose name starts with "par-"
See http://texwelt.de/wissen/fragen/3272/biber-data-source-not-found,
http://tex.stackexchange.com/questions/140814/biblatex-biber-fails-with-a-strange-error-about-missing-recode-data-xml-file
_____________________________________________________________________________

Diethard Ohrt
FH JOANNEUM, DAI
diethard.ohrt@fh-joanneum.at
