#!/bin/bash

# Set the maximum size in bytes (10 GB)
MAX_BYTES=$((10 * 1024 * 1024 * 1024))

# Find BAM and FASTQ files recursively
find . -type f \( -name "*.bam" -o -name "*.fastq" -o -name "*.fastq.gz" \) | while read -r F; do
  DIR=$(dirname "$F")
  BASE=$(basename "$F")
  EXT="${BASE##*.}"

  # Handle BAM files
  if [[ "$F" == *.bam ]]; then
    OUT_FASTQ="${F%.bam}.fastq.gz"
    if [[ ! -f "$OUT_FASTQ" ]]; then
      echo "Converting $F to FASTQ"
      samtools fastq "$F" | gzip > "$OUT_FASTQ"
    else
      echo "FASTQ already exists for $F"
    fi
    F="$OUT_FASTQ"  # Reset to newly created FASTQ
    BASE=$(basename "$F")
  fi

  # Now sample the FASTQ
  SAMPLED_FASTQ="${F%.fastq*}_samp.fastq.gz"
  if [[ ! -f "$SAMPLED_FASTQ" ]]; then
    echo "Sampling up to 10GB from $F → $SAMPLED_FASTQ"
    seqkit head -s "$MAX_BYTES" "$F" > "$SAMPLED_FASTQ"
  else
    echo "Sampled file already exists: $SAMPLED_FASTQ"
  fi
done
