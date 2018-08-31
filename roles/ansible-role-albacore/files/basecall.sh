#!/bin/bash

#SBATCH --time=1:00:00
#SBATCH --job-name=basecalling
#SBATCH --mem=12G
#SBATCH --nodes=1
#SBATCH --tasks-per-node=32

module load singularity;
if [ $6 = '0' ]
then
  singularity exec "$2"/TannerDowhy-albacore-playbook-master-latest.simg read_fast5_basecaller.py -i "$1" -r -t "$3" -s output -f "$4" -k "$5" -o fastq,fast5 --disable_filtering --disable_pings; 
else
  singularity exec "$2"/TannerDowhy-albacore-playbook-master-latest.simg read_fast5_basecaller.py -i "$1" -r -t "$3" -s scratch/basecalling/output -f "$4" -k "$5" -o fastq,fast5 --disable_filtering --disable_pings --barcoding;
fi

exit 0;
