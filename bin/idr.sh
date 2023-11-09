#!/bin/sh
#conda deactivate || true
singularity exec --bind /n/data1 /n/app/singularity/containers/ld32/idr_2.0.2.sif idr $@ 2>&1  >> /home/ld32/idr.out

