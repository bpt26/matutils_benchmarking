# matUtils Benchmarking

This repository contains all files used for comparing the performance of matUtils to related tools. We first purchased a google cloud compute server following the n2d-standard-16 type with 16 vCPUs and 64 GB of memory. We used the following commands to install conda and thereby all other programs tested in this project:

```
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh  
bash Anaconda3-2021.05-Linux-x86_64.sh  
conda create -n usher-env  
source activate usher-env  
conda config --add channels defaults  
conda config --add channels bioconda  
conda config --add channels conda-forge  
conda install usher  
conda install -c bioconda newick_utils  
conda install -c bioconda bcftools  
conda install -c bioconda phast  
conda install -c bioconda R  
```

We then ran the command `bash timer.sh` on the server to test each command. This script, as well as all other scripts it calls, can be found in this repository. Several scripts take inputs additional to the base protobuf file -- these can be found xz-compressed in the CLADE_BATCHES subdirectory.
