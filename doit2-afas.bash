#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash


# ------------------------------------------------------------------------
# Align sequences
# ------------------------------------------------------------------------

echo 1>&2 '# Align sequences'

rm -rf ${AFAS}
mkdir -p ${AFAS}

# v-- this is needed for multi-threading
export OMP_NUM_THREADS=${THREADS}

for GENE in ${GENES} ; do
    echo 1>&2 "## $GENE"
    #      v-- this is not required for multi-threading
    muscle -threads ${THREADS} -align ${SEQS}/${GENE}.fasta -output ${AFAS}/${GENE}.afa
done

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

