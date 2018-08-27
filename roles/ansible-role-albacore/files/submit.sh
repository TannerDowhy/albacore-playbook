#!/bin/bash

sbatch --output="$2"/slurm_out/basecall.out --account="$7" basecall.sh "$1" "$2" "$3" "$4" "$5" "$6";

exit 0;
