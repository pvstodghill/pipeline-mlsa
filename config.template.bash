# directory into which the results are written.
#DATA=.
#DATA=data # default

# ------------------------------------------------------------------------

GENOMES_DATA=.../FIXME-genomes/data

GENES=
GENES+=" gyrB"
GENES+=" rpoB"

# ------------------------------------------------------------------------

# # Uncomment to get packages from HOWTO
# PACKAGES_FROM=howto

# uncomment to use conda
PACKAGES_FROM=conda
CONDA_ENV=pipeline-mlsa

#THREADS=$(nproc --all)

# ------------------------------------------------------------------------
