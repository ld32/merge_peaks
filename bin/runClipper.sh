#!/bin/sh
conda deactivate || true
source activate /n/data1/cores/bcbio/eclip/clipperEnv
clipper $@

