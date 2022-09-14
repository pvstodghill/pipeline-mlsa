#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Trim alignments
# ------------------------------------------------------------------------

echo 1>&2 '# Trim alignments'

rm -rf ${MASTER}
mkdir -p ${MASTER}

TRIMMED_AFAS=
for GENE in ${GENES} ; do
    echo 1>&2 "## $GENE"
    clipkit -o ${MASTER}/${GENE}.afa ${AFAS}/${GENE}.afa
    TRIMMED_AFAS+=" ${MASTER}/${GENE}.afa"
done

# ------------------------------------------------------------------------
# Make master alignment
# ------------------------------------------------------------------------

echo 1>&2 '# Make master alignment'

${PIPELINE}/scripts/concat-afas.pl ${TRIMMED_AFAS} > ${MASTER}/__master__.afa

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'
