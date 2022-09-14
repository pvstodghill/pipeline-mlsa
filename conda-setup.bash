#! /bin/bash

set -e

CONDA_PREFIX=$(dirname $(dirname $(type -p conda)))
. "${CONDA_PREFIX}/etc/profile.d/conda.sh"

PACKAGES=

PACKAGES+=" muscle" # =3.8.1551

PACKAGES+=" fasttree"
PACKAGES+=" gblocks"
PACKAGES+=" clipkit"

set -x

conda env remove -y --name pipeline-mlsa
conda create -y --name pipeline-mlsa
conda activate pipeline-mlsa

conda install -y ${PACKAGES}
