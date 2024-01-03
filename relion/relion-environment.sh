#!/bin/bash

# Bash script for creating five additional fields under the running tab on most RELION jobs. 
# The first two fields are for time and mem-per-cpu, these are necessary for submitting jobs on Sherlock

# This script needs to be sourced after loading the RELION module but before opening the RELION GUI. 
# $ ml biology relion/4.0.1 
# $ source relion-environment.sh
# $ relion &

export RELION_QSUB_TEMPLATE=""
export RELION_QUEUE_NAME=""
export RELION_QSUB_COMMAND="sbatch"
export RELION_QSUB_EXTRA_COUNT=5

export RELION_QSUB_EXTRA1=Time
export RELION_QSUB_EXTRA1_DEFAULT=0-1:00:00
export RELION_QSUB_EXTRA1_HELP="Enter estimated runtime to reserve from schedular. Format: D-hh:mm:ss. Use variable XXXextra1XXX in your standard submission script."

export RELION_QSUB_EXTRA2=Memory-per-cpu
export RELION_QSUB_EXTRA2_DEFAULT=3G
export RELION_QSUB_EXTRA2_HELP="Enter estimated memory requirements for each cpu. Format: <size>[units] (e.g. 1000M or 1G etc.). Use variable XXXextra2XXX in your slurm sbatch script."

export RELION_QSUB_EXTRA3="Additional sbatch option"
export RELION_QSUB_EXTRA3_DEFAULT=""
export RELION_QSUB_EXTRA3_HELP="Use this field to envoke additional Slurm sbatch options. Include both the name of the option and its value in the field. Use the variable XXXextra3XXX in your sbatch script to pass the option from RELION to the script. Examples of useful sbatch options include: --gpus=<value>, --gpus-per-nodes=<value>, --gres=<value>. The field can also be left blank."

export RELION_QSUB_EXTRA4="Additional sbatch option"
export RELION_QSUB_EXTRA4_DEFAULT=""
export RELION_QSUB_EXTRA4_HELP="Use this field to envoke additional Slurm sbatch options. Include both the name of the option and its value in the field. Use the variable XXXextra4XXX in your sbatch script to pass the option from RELION to the script. Examples of useful sbatch options include: --gpus=<value>, --gpus-per-nodes=<value>, --gres=<value>. The field can also be left blank."

export RELION_QSUB_EXTRA5="Additional sbatch option"
export RELION_QSUB_EXTRA5_DEFAULT=""
export RELION_QSUB_EXTRA5_HELP="Use this field to envoke additional Slurm sbatch options. Include both the name of the option and its value in the field. Use the variable XXXextra5XXX in your sbatch script to pass the option from RELION to the script. Examples of useful sbatch options include: --gpus=<value>, --gpus-per-nodes=<value>, --gres=<value>. The field can also be left blank."
