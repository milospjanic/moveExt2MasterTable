# moveExt2MasterTable

This script can be very handy in case you have performed an experiment, i.e. RNA-Seq and have obtained output in multiple subfolders corresponding to different experimental conditions, where each subfolder will contain the output file of the same name, and the name of the subfolder will be the name of the experimental condition. This is the usual output you get from various sequencing facilities. creating a master table may be a complicated task, so I made a script to automatize this process, moveExt2MasterTable.

# Usage

In case you want to utilize all files located in various subfoder that have a **tsv** extension and create a master table using first column (ID) and 5th column (e.g. where you have RPKM values) call script with two parameters extension name and column number
<pre>
chmod 775 moveExt2MasterTable.sh
./moveExt2MasterTable.sh tsv 5
</pre>

