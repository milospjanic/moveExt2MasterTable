#! /bin/bash

# Find all files with extension $1 in subfolders and copy them into the current folder with changing the name of the file to their last subfolder plus .file ext

find -name *$1 | xargs -I % sh -c ' fileName=$(basename %); \
filePath=$(dirname %); \
lastDir=$(basename $filePath); \
echo copying $fileName to $(pwd)/$lastDir.file; \
cp % $lastDir.file \
;'

# Find all files with .file extension and cut the first and $2 column, save it as .cut file

find -name '*.file' | xargs -I % sh -c 'cut -f 1,'$2' %  > %.cut1;'

# remove header
find -name '*.file.cut1' | xargs -I % sh -c 'tail -n+2 % > %.cut2;'

# download fileMulti2TableMod1.awk

wget https://raw.githubusercontent.com/milospjanic/fileMulti2TableMod1/master/fileMulti2TableMod1.awk

# Find .file.cut files and call fileMulti2TableMod1.awk script to create master table

filescut=$(ls *.file.cut1.cut2) 
awk -f fileMulti2TableMod1.awk $(echo $filescut)> mastertable

# add header to mastertable

files=$(ls *.file) 
echo ${files} | sed 's/.file//g' > header
awk '{$1=" "$1}1' header > header2
cat header2 mastertable > mastertable.2

mv mastertable.2 mastertable

# remove .cut files
rm *.file.cut1
rm *.file.cut1.cut2

# remove fileMulti2TableMod1.awk
rm fileMulti2TableMod1.awk

#remove header
rm header
rm header2
