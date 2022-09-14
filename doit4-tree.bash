#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Run FastTreeMP
# ------------------------------------------------------------------------

echo 1>&2 '# Run FastTreeMP'

rm -rf ${TREE}
mkdir -p ${TREE}

(
    export OMP_NUM_THREADS=${THREADS}
    FastTreeMP -nt < ${MASTER}/__master__.afa > ${TREE}/tree.phy
)

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

