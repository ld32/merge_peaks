#!/bin/sh
singularity exec --bind /n/data1 /n/app/singularity/containers/ld32/eclip_0.7.0_python.sif bed_to_narrowpeak.py $@

