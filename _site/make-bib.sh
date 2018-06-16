#!/bin/bash

# Bring in bibliography file for ultrasound project
cp ../bibliography/ultrasound.bib .

# Insert the YAML header files needed
sed -i '' '5i\
---\
---\
' ultrasound.bib

# Delete first 4 Mendeley lines
sed -i '' 1,4d ultrasound.bib

# Replace the bibtex issues for jekyll-scholar
sed -i '' 's/{{/{/g' ultrasound.bib
sed -i '' 's/}}/}/g' ultrasound.bib
