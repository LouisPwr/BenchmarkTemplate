#!/bin/bash

# Set the parameters for the Gargammel simulator
genome_size=1000000
read_length=150
coverage=1
error_rate=0.02
mean_fragment_size=200
fragment_size_sd=20
base_quality=30

# Set the output file prefix
output_prefix="simulated_ancient_metagenome"

# Set the path to the reference genome file
reference_file="path/to/reference/genome.fasta"

# Set the path to the Gargammel simulator binary
gargammel_bin="path/to/gargammel/bin"

# Set the path to the Gargammel configuration file
config_file="path/to/gargammel/config.xml"

# Generate the simulated reads
$gargammel_bin -c $config_file -p genome_size=$genome_size,read_length=$read_length,coverage=$coverage,error_rate=$error_rate,mean_fragment_size=$mean_fragment_size,fragment_size_sd=$fragment_size_sd,base_quality=$base_quality -o $output_prefix $reference_file

# Compress and concatenate the simulated read files
gzip -c $output_prefix"_1.fq" > $output_prefix"_1.fq.gz"
gzip -c $output_prefix"_2.fq" > $output_prefix"_2.fq.gz"

# Remove the uncompressed files
rm $output_prefix"_1.fq"
rm $output_prefix"_2.fq"

