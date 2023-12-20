#!/bin/bash
#SBATCH --job-name=cs-master
#SBATCH --dependency=singleton
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4G
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=end,fail


# load cryosparc from local module
module load cryosparc/4.1.4

# set CRYOSPARC_LOG_DIR to the pathway where you want to save the cryosparc
# master server log
#
CRYOSPARC_LOG_DIR="$GROUP_HOME"
mkdir -p $CRYOSPARC_LOG_DIR
LOG_FILE="$CRYOSPARC_LOG_DIR/cs-master.log"

date -R >> $LOG_FILE
cryosparcm restart >> $LOG_FILE

timeout 24h tail -f --pid=$(cryosparcm status | awk '/command_core.*pid/ {print $4}' | tr -d ',')

date -R >> $LOG_FILE
cryosparcm stop >> $LOG_FILE

echo "$(date): re-queuing job $SLURM_JOBID for next execution"
scontrol requeue $SLURM_JOBID
