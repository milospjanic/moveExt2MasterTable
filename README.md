# moveExt2MasterTable

This script can be very handy in case you have performed an experiment, i.e. RNA-Seq and have obtained output in multiple subfolders corresponding to different experimental conditions, where each subfolder will contain the output file of the same name, and the name of the subfolder will be the name of the experimental condition. This is the usual output you get from various sequencing facilities. creating a master table may be a complicated task, so I made a script to automatize this process, moveExt2MasterTable.

# Usage

In case you want to utilize all files located in various subfoder that have a **tsv** extension and create a master table using first column (ID) and 5th column (e.g. where you have RPKM values) call script with two parameters extension name and column number
<pre>
chmod 775 moveExt2MasterTable.sh
./moveExt2MasterTable.sh tsv 5
</pre>

# Dependencies

Script will connect to GitHub and download another script from the raw URL https://raw.githubusercontent.com/milospjanic/fileMulti2TableMod1/master/fileMulti2TableMod1.awk

# Output

Output will be master table in a file mastertable, in addition all the files will be copied to the current folder from subfolder, and have .file extension

# Example

Here is an example of a .tsv file lcoated in subfolders 

<pre>
target_id       length  eff_length      est_counts      tpm
ENST00000456328.2       1657    1478    14.0122 0.181189
ENST00000450305.2       632     453     0       0
ENST00000488147.1       1351    1172    250.598 4.0865
ENST00000619216.1       68      3.2997  0.936144        5.42212
ENST00000473358.1       712     533     0       0
ENST00000469289.1       535     356     0       0
ENST00000607096.1       138     6.64697 0       0
ENST00000417324.1       1187    1008    0.0151873       0.000287953
ENST00000461467.1       590     411     12.054  0.560521
ENST00000606857.1       840     661     0       0
ENST00000492842.1       940     761     0       0
ENST00000335137.3       918     739     0       0
ENST00000466430.5       2748    2569    33.7062 0.250753
ENST00000477740.5       491     312     0       0
ENST00000471248.1       629     450     0       0
ENST00000610542.1       723     544     0       0
ENST00000453576.2       336     157     0       0
ENST00000495576.1       1319    1140    17.672  0.296266
ENST00000442987.3       3812    3633    113.034 0.594629
</pre>

You want to extract 5 column to create master table

Run:

<pre>
./moveExt2MasterTable.sh tsv 5
</pre>

Output will be the following master table with all the samples combined:

<pre>
 071_2_E7_24h_TAG 071_2_E7_72h_TAG 071_2_E8_24h_TAG 071_2_E8_72h_TAG 334_1_E7_24h_TAG 334_1_E7_72h_TAG 334_1_E8_24h_TAG 334_1_E8_72h_TAG 756_3_E7_24h_TAG 756_3_E7_72h_TAG 756_3_E8_24h_TAG 756_3_E8_72h_TAG 835_1_E7_24h_TAG 835_1_E7_72h_TAG 835_1_E8_24h_TAG 835_1_E8_72h_TAG H1_E7_24h_TAG H1_E7_72h_TAG H1_E8_24h_TAG H1_E8_72h_TAG H7_E7_24h_TAG H7_E7_72h_TAG H7_E8_24h_TAG H7_E8_72h_TAG
ENST00000610542.1 0 0 0 0 0 0 9.8316e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
ENST00000619216.1 3.33385 2.8217 5.81411 1.82309 5.42212 0 2.62023 1.28491 0 1.78071 0 3.54873 0 0 0 2.10255 0 0 1.56025 1.44704 1.2346 0 4.14966 1.30646
ENST00000450305.2 0 0 0 0 0 0.0804298 0 0 0 0.0357021 0 0 0 0 0 0 0.00802667 0 0 0 0 0 0 0
ENST00000442987.3 1.04805 1.81335 0.324263 0.331067 0.594629 1.13613 0.367012 0.548072 1.01927 1.15806 0.859238 0.715326 1.02043 1.23834 0.580001 0.311195 1.21486 0.718531 0.704979 0.48342 0.981332 1.32601 0.754685 0.717388
ENST00000492842.1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
ENST00000469289.1 0 0 0 0 0 0.0586353 0 0 0.0540325 0.0638736 0 0 0 0 0 0 0 0 0 0 0 0 0 0
ENST00000471248.1 0.2645 0 0 0 0 0.111799 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0763442 0 0 0 0
ENST00000461467.1 0.0471473 0 0.270835 0.245762 0.560521 0 0.198852 0.0859918 0.101713 0.329731 0.612336 0.118115 0.0975844 0.02535 0.133357 0 0.344864 0.142344 0.157868 1.3982 0.348791 0.204793 0 0.185079
ENST00000495576.1 0.308196 0.354407 0.208001 0.192907 0.296266 0.118206 0.127151 0.245715 0.126846 0.116218 0.190281 0.122054 0.257678 0 0.228791 0.0479056 0.249924 0.138056 0.135063 0.216182 0.183194 0.258463 0.140834 0.108693
</pre>
