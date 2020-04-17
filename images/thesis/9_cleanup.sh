#!/bin/sh
# remove the local tmp dir
rm -rf tmp/
# remove the biber cache files
# Select one of these below:
#biber --cache | xargs rm -rf
# ... or shorter:
rm -r `biber --cache`
# ... or "more modern":
#rm -r $(biber --cache)
