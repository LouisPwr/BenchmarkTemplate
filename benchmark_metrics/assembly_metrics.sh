#!/bin/bash

# Set the input and reference file paths
input_path="path/to/input/files/*.fasta"
reference_path="path/to/reference/files/*.fasta"

# Run QUAST to evaluate the quality of the assemblies
quast.py $input_path -r $reference_path -o quast_output

# Print the QUAST summary file to the console
cat quast_output/transposed_report.tsv
