#!/bin/bash

display_usage() {
	echo "Description: Download NCBI samples by accession numbers"
	echo -e "\nUsage: ./download_metagenomic_samples.sh SRR1234567 SRR1234568 SRR1234569
"
}
	if [[ $@ == "--help" || $@ == "-help" || $@ == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

# Set the NCBI base URL
NCBI_BASE_URL="https://ftp.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/"

# Loop over all the accession numbers provided as command-line arguments
for ACCESSION in "$@"
do
    # Get the first six characters of the accession number
    ACCESSION_PREFIX="${ACCESSION:0:6}"
    
    # Construct the download URL for the sample
    SAMPLE_URL="${NCBI_BASE_URL}${ACCESSION_PREFIX}/${ACCESSION}/${ACCESSION}.sra"
    
    # Download the sample using the NCBI SRA Toolkit
    prefetch ${ACCESSION}
    fastq-dump --outdir . --gzip --skip-technical --readids --read-filter pass --dumpbase --split-files ${ACCESSION}.sra
done
