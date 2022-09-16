#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

PROKKA_DIR=${GENOMES_DATA}/3_prokka
STRAIN_LIST=${GENOMES_DATA}/6_final/__filtered_strains__.txt

# ------------------------------------------------------------------------
# Grab gene sequences
# ------------------------------------------------------------------------

echo 1>&2 '# Grab gene sequences'

rm -rf ${SEQS}
mkdir -p ${SEQS}

for GENE in ${GENES} ; do
    echo 1>&2 "## $GENE: extracting"
    
    (
	set +o pipefail
	cat ${STRAIN_LIST} | \
	    while read STRAIN ; do
		grep -F -h "Name=${GENE};" ${PROKKA_DIR}/${STRAIN}_prokka/output.gff \
		    | ${PIPELINE}/scripts/gff2fna -c ${PROKKA_DIR}/${STRAIN}_prokka/output.fna \
		    | sed -e 's/>.*/>'${STRAIN}'/'
	    done
    ) > ${SEQS}/${GENE}.fasta
    echo 1>&2 "## $GENE: found:" $(grep '^>' ${SEQS}/${GENE}.fasta | wc -l)

done


# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

