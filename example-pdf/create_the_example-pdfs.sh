#!/bin/bash

cd ..

echo "Backup of original thesis"
cp thesis.tex thesis.tex.tmp

echo "We set defaults (to IMS) in English"
sed -i.bak "s/study{ITM}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{SWD}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{IRM}/study{IMS}/g" thesis.tex
sed -i.bak "s/yourLanguage{german}/yourLanguage{english}/g" thesis.tex
sed -i.bak "s/title{<Title of Your Thesis>}/title{Solving a Zero World Problem}/g" thesis.tex
sed -i.bak "s/subtitle{<The subtitle.>}/subtitle{Improving conditions to foster innovation targeting human beings.}/g" thesis.tex
# demo student with demo thesis
sed -i.bak "s/yourName{<your name>}/yourName{Julia Feelgood}/g" thesis.tex
sed -i.bak "s/yourIdentifier{<1700000017>}/yourIdentifier{198419841984}/g" thesis.tex
sed -i.bak "s/yourPlace{<place>}/yourPlace{Kapfenberg}/g" thesis.tex
sed -i.bak "s/submissionDate{<date>}/submissionDate{`date +'%B %Y'`}/g" thesis.tex
sed -i.bak "s/yourAdvisor{<firstname lastname>}/yourAdvisor{T. Truth}/g" thesis.tex

echo "Version for IMS in English"
./0_run_all_typeset.sh
mv tmp/thesis.pdf example-pdf/thesis_ims.pdf

# IMS -> ITM

echo "Version for ITM in English"
sed -i.bak s/study{IMS}/study{ITM}/g thesis.tex
./0_run_all_typeset.sh
mv tmp/thesis.pdf example-pdf/thesis_itm_en.pdf

# ITM -> SWD

echo "Version for SWD in English"
sed -i.bak s/study{ITM}/study{SWD}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf example-pdf/thesis_swd_en.pdf

# SWD -> IRM

echo "Version for IRM in English"
sed -i.bak s/study{SWD}/study{IRM}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf example-pdf/thesis_irm_en.pdf


# english -> german

echo "Now we switch to german!"

# TODO switch title/subtitle to german
# restore the original file:
cp thesis.tex.tmp thesis.tex
echo "We set defaults to IRM in German"
sed -i.bak "s/study{ITM}/study{IRM}/g" thesis.tex
sed -i.bak "s/study{SWD}/study{IRM}/g" thesis.tex
sed -i.bak "s/study{IRM}/study{IRM}/g" thesis.tex
sed -i.bak "s/yourLanguage{english}/yourLanguage{german}/g" thesis.tex
sed -i.bak "s/title{<Title of Your Thesis>}/title{Erfindungen der nahen Zukunft}/g" thesis.tex
sed -i.bak "s/subtitle{<The subtitle.>}/subtitle{Durch innovative Traumdeutungen dem Klimawandel entgegenwirken.}/g" thesis.tex
# demo student with demo thesis
sed -i.bak "s/yourName{<your name>}/yourName{Markus Wunderlich}/g" thesis.tex
sed -i.bak "s/yourIdentifier{<1700000017>}/yourIdentifier{198419841984}/g" thesis.tex
sed -i.bak "s/yourPlace{<place>}/yourPlace{Kapfenberg}/g" thesis.tex
sed -i.bak "s/submissionDate{<date>}/submissionDate{` LC_ALL='de_AT.UTF-8' date +'%B %Y'`}/g" thesis.tex
sed -i.bak "s/yourAdvisor{<firstname lastname>}/yourAdvisor{E. Klar}/g" thesis.tex

echo "Version for IRM in German"
./0_run_all_typeset.sh && mv tmp/thesis.pdf example-pdf/thesis_irm_ge.pdf

# IRM -> SWD

echo "Version for SWD in German"
sed -i.bak s/study{IRM}/study{SWD}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf example-pdf/thesis_swd_ge.pdf

# SWD -> ITM

echo "Version for ITM in German"
sed -i.bak s/study{SWD}/study{ITM}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf example-pdf/thesis_itm_ge.pdf


# restore the original file:
cp thesis.tex.tmp thesis.tex # && rm thesis.tex.bak
