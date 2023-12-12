# cemc-sherlock-scripts
Sbatch scripts for submitting cryo-EM jobs on Stanford's Sherlock compute cluster.
## RELION Directory
Contained within the `relion` directory are slurm sbatch scripts for common RELION job runs. These scripts are hardcoded with resource values (e.g. ntasks, cpus-per-task, and mem-per-cpu, etc.) to insure resonable wait and run times in the Sherlock normal and owners partitions.

If you what more control over the resources you request, or are running from a PI's partition and need to tailor your resource request, the `Standard-relion.sbatch` script will use the values you enter in the RELION GUI. 

Please feel free to modify these slurm sbatch scripts to fit your personal requirements. 
### Standard-relion.sbatch
## MTF Files
Modular transfer function (MTF) curves for the Gatan K3 and Thermo Fisher Falcon 4 are located in the `mtf` directory. The MTF files are used in during the RELION import job step. The K3 camera attached to the Glacios in Fairchild and the Falcon 4 camera is attached to the Glacios in Chem-H.
