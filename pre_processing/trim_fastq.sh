#!/bin/bash

display_usage() {
	echo "Description: Run Trimmomatic all fastq files in a directory, and output to directories sorted by input sample file name."
	echo -e "\nUsage: ./trim_fastq.sh path/to/input/fastq/files path/to/output/trimmed/fastq/files path/to/trimmomatic.jar "ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36"

"
}
	if [[ $@ == "--help" || $@ == "-help" || $@ == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

# Set the input directory and output directory
INPUT_DIR="path/to/input/fastq/files"
OUTPUT_DIR="path/to/output/trimmed/fastq/files"

# Set the Trimmomatic path and options
TRIMMOMATIC="path/to/trimmomatic.jar"
TRIM_OPTIONS="ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36"

# Loop over all the input FASTQ files in the input directory
for INPUT_FILE in ${INPUT_DIR}/*.fastq.gz
do
    # Get the sample name from the input file name
    SAMPLE_NAME=$(basename "${INPUT_FILE}" .fastq.gz)
    
    # Create the output directory for the sample
    OUTPUT_SAMPLE_DIR="${OUTPUT_DIR}/${SAMPLE_NAME}"
    mkdir -p "${OUTPUT_SAMPLE_DIR}"
    
    # Set the output file names
    OUTPUT_FILE1="${OUTPUT_SAMPLE_DIR}/${SAMPLE_NAME}_trimmed_1.fastq.gz"
    OUTPUT_FILE2="${OUTPUT_SAMPLE_DIR}/${SAMPLE_NAME}_trimmed_2.fastq.gz"
    
    # Trim the input FASTQ file using Trimmomatic
    java -jar "${TRIMMOMATIC}" PE -phred33 "${INPUT_FILE}" "${OUTPUT_FILE1}" /dev/null "${OUTPUT_FILE2}" /dev/null "${TRIM_OPTIONS}"
done
