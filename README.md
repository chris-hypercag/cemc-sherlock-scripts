# cemc-sherlock-scripts
Sbatch scripts for submitting cryo-EM jobs on Stanford's Sherlock compute cluster.
## RELION Directory
Contained within the `relion` directory are Slurm sbatch scripts for common RELION job runs. These scripts are tailored to their particular RELION job and with the information provided in the tables below insure reasonable runtimes in Sherlock's normal and owners partitions. The values you enter into the RELION GUI under the running tabs will populate the variables within the sbatch script you select.  

Please feel free to modify these slurm sbatch scripts to fit your personal requirements. If you what to tailor a Slurm sbatch script to your specifications, the `standard-relion.sh` script is a basic script to copy and make changes to. 

### standard-relion.sh


### motioncorrell-relion.sh
The table below contains several combinations of MPI and thread values and the estimated runtime for 1000 micrographs. The estimated runtime was calculated for Micrographs 

| MPI Procs | Threads/Procs | Total CPUS | Memory/CPU | Est. Runtime per 1000 Micrographs |
|:---------:|:-------------:|:----------:|:----------:|:---------------------------------:|
|     6     |       4       |     24     |     3G     |              03:30:00             |
|     12    |       4       |     48     |     3G     |              02:00:00             |
|     24    |       4       |     96     |     3G     |              00:45:00             |

### class2D-gpu-relion.sh
When running the 2D classification job step, under the `Running` tab add --gpus=*value* and --gpus-per-node=*value* to the `Additional sbatch option` fields. In place of *value* put the number of GPUS you plan to run on. Remove any spaces when typing out the sbatch option. On the `Compute` tab, leave the `Which GPUs to use` field blank, Slurm will allocate the requested resources automatically.

If the number of particles in your particles.star file number in the tens of thousands, the fastest runtimes are achived by selecting `Pre-read all particle into RAM?` and `Use GPU acceleration?` in the `Compute` tab. If, however, the number of particles numbers in the hundereds of thousands, pre-reading all particles into RAM may not be possible, in which case select `Copy Particles to scratch directory` and provide the pathway to your scratch directory (e.g. /scratch/users/*your username*). 


## MTF Files
Modular transfer function (MTF) curves for the Gatan K3 and Thermo Fisher Falcon 4 for 200kV and 300kV are located in the `mtf` directory. The MTF files are used during the RELION import job step. The K3 cameras are attached to the Glacios 200kV in Fairchild and Krios G2 300kV (TEM) at SLAC. The Falcon 4i camera is attached to the Glacios 200kV in Chem-H and Krios G2 300kV (TEM) at SLAC. 
