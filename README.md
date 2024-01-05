# cemc-sherlock-scripts
Sbatch scripts for submitting cryo-EM jobs on Stanford's Sherlock compute cluster.

## RELION directory
Contained within the `relion` directory are Slurm sbatch scripts for common RELION job runs. These scripts are tailored to their particular RELION job and with the information provided in the tables below insure reasonable runtimes in Sherlock's normal and owners partitions. The values you enter into the RELION GUI under the running tabs will populate the variables within the sbatch script you select.  

Please feel free to modify these slurm sbatch scripts to fit your requirements. If you what to tailor a Slurm sbatch script to your specifications, the `standard-relion.sh` script is a basic script to copy and make changes to. 

### relion-environment.sh
A bash script for sourcing additional RELION environment variables. Primarily, it tells RELION to use `sbatch` when submitting new jobs to the queue, and creates five additional fields under the running tab of most jobs. The first two fields are for runtime and mem-per-cpu, which are necessary for submitting jobs on Sherlock. The three remaining fields are for the user to invoke additional Slurm sbatch options.

To work, both the name of the option and its value must be included in the field (no spaces), and the variable name tied to the field must be included in the user's sbatch script (i.e. XXXextra3XX, XXXextra4XX, XXXextra5XX). Some useful sbatch options include: --gpus=*value*, --gpus-per-node=*value*, --gres=*value*. The field can also be left blank. 

To enable these environment variables, the script must be sourced after loading the RELION module, but before opening the RELION GUI. For example, within your RELION project directory: 
```
$ ml biology relion/4.0.1 
$ source relion-environment.sh
$ relion &
```
### standard-relion.sh
The most generic slurm script for running RELION on Sherlock. 

### motcorrel-relion.sh
The table below contains several combinations of MPI and thread values and the estimated runtime for 1000 micrographs.

| MPI Procs | Threads/Procs | Total CPUS | Memory/CPU | Est. Runtime per 1000 Micrographs |
|:---------:|:-------------:|:----------:|:----------:|:---------------------------------:|
|     6     |       4       |     24     |     3G     |              03:30:00             |
|     12    |       4       |     48     |     3G     |              02:00:00             |
|     24    |       4       |     96     |     3G     |              00:45:00             |

### ctffind-relion.sh
The tables below contain the estimated runtime for a `CTF estimation` job with 1000 micrographs for several MPI values. The runtimes were obtained using CTFFIND-4.1 and are split between whether an exhaustive search was perfomed. 

`Use exhaustive search?`: no
| MPI Procs | Memory/CPU | Est. Runtime per 1000 Micrographs |
|:---------:|:----------:|:---------------------------------:|
|     1     |     250M   |              00:14:00             |
|     6     |     250M   |              00:03:00             |

`Use exhaustive search?`: yes
| MPI Procs | Memory/CPU | Est. Runtime per 1000 Micrographs |
|:---------:|:----------:|:---------------------------------:|
|     1     |     250M   |              01:50:00             |
|     2     |     250M   |              01:10:00             |
|     4     |     250M   |              00:35:00             |
|     6     |     250M   |              00:25:00             |

### class2D-gpu-relion.sh
When running the 2D classification job step, under the `Running` tab add --gpus=*value* and --gpus-per-node=*value* to the `Additional sbatch option` fields. In place of *value* put the number of GPUS you plan to run on. Remove any spaces when typing out the sbatch option. Set `Number of MPI procs` equal to 1 plus the number of GPUs requested. The additional MPI process serves to distribute work between the GPUs. Set `Number of threads` equal to 1, adding additional threads does not speed up the computation. On the `Compute` tab, you may leave the `Which GPUs to use` field blank, Slurm will allocate the requested resources automatically.

If the number of particles in your particles.star file number in the tens of thousands, the fastest runtimes are achived by selecting `Pre-read all particle into RAM?` and `Use GPU acceleration?` in the `Compute` tab. If, however, the number of particles numbers in the hundereds of thousands, pre-reading all particles into RAM may require too much memory, in which case select `Copy Particles to scratch directory` and provide the pathway to your scratch directory (i.e. /lscratch/*username*). 

Runtimes can vary significantly depending on the number of particles, the number of iterations, and whether the particles are pre-loaded into RAM or scratch. Anywhere from 30+ minutes for smaller pre-loaded jobs to 12+ hours for large scratch jobs. Just remember, that if your resource allocation expires before the job is complete, you can always continue the run from any previously completed iteration by specifying the *_optimiser.star file in the `I/O` tab.

## CRYOSPARC directory
Not much to see here yet. Just a sbatch script for starting and restarting the master instance. 

Instructions for installing cryoSPARC on Sherlock can be found [here](https://github.com/jnoh2/cryosparc-install/blob/main/README.md)

## MTF directory
Modular transfer function (MTF) curves for the Gatan K3 and Thermo Fisher Falcon 4 for 200kV and 300kV are located in the `mtf` directory. The MTF files are used during the RELION import job step. The K3 cameras are attached to the Glacios 200kV in Fairchild and Krios G2 300kV (TEM) at SLAC. The Falcon 4i camera is attached to the Glacios 200kV in Chem-H and Krios G2 300kV (TEM) at SLAC.
