#!/bin/bash

# Clean house
rm *.bib

# Bring in bibliography files that are clinically appropriate
cp ../bibliography/medicine.bib .

# Trim headers off of all files
sed -i '' 1,5d *.bib

# Move files into a tmp compilation
cat *.bib > tmp

# Insert the YAML header files needed
sed -i '' '1i\
---\
---\
\
' tmp

# Remove old bib files
rm *.bib

# Rename new bibfile
mv tmp bibfile.bib

# Replace the bibtex issues for jekyll-scholar
sed -i '' 's/{{/{/g' bibfile.bib
sed -i '' 's/}}/}/g' bibfile.bib

