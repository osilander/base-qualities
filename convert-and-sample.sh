#!/bin/bash
set -euo pipefail

MAX_GB=10
MAX_BYTES=$((MAX_GB * 1024 * 1024 * 1024))
COMP_RATIO=2.5
SAMPLED_BYTES=$((MAX_BYTES / COMP_RATIO))

echo "🔍 Scanning for BAM and FASTQ files..."

# Step 1: Convert BAMs to gzipped FASTQ (assume single-end)
find . -type f -name "*.bam" | while read -r BAM; do
  OUT_FASTQ="${BAM%.bam}.fastq.gz"
  if [[ ! -f "$OUT_FASTQ" ]]; then
    echo "💥 Converting $BAM → $OUT_FASTQ"
    samtools fastq "$BAM" | gzip > "$OUT_FASTQ"
  else
    echo "✅ Already converted: $OUT_FASTQ"
  fi
done

# Step 2: Find all FASTQ/_1.fastq and sample
find . -type f \( -name "*.fastq" -o -name "*.fastq.gz" \) | while read -r FQ; do
  BASE=$(basename "$FQ")
  DIR=$(dirname "$FQ")

  # skip _2.fastq if paired — only process _1
  if [[ "$BASE" =~ _2\.fastq$ || "$BASE" =~ _2\.fastq\.gz$ ]]; then
    continue
  fi

  # Check if this is a paired-end _1 file
  if [[ "$BASE" =~ _1\.fastq$ ]]; then
    PAIR1="$FQ"
    PAIR2="${FQ/_1.fastq/_2.fastq}"
  elif [[ "$BASE" =~ _1\.fastq\.gz$ ]]; then
    PAIR1="$FQ"
    PAIR2="${FQ/_1.fastq.gz/_2.fastq.gz}"
  else
    PAIR1=""
    PAIR2=""
  fi

  if [[ -n "$PAIR2" && -f "$PAIR2" ]]; then
    # Paired-end sampling
    OUT1="${PAIR1%.fastq*}_samp.fastq.gz"
    OUT2="${PAIR2%.fastq*}_samp.fastq.gz"
    if [[ -f "$OUT1" && -f "$OUT2" ]]; then
      echo "✅ Sampled pair already exists: $OUT1 + $OUT2"
    else
      echo "👫 Sampling paired-end: $PAIR1 + $PAIR2 → ~${MAX_GB}GB total"
      seqkit sample -s 42 -m "$SAMPLED_BYTES" -p "$PAIR1" "$PAIR2" \
        --out-file1 "$OUT1" --out-file2 "$OUT2"
    fi
  else
    # Single-end sampling
    OUT="${FQ%.fastq*}_samp.fastq.gz"
    if [[ -f "$OUT" ]]; then
      echo "✅ Sampled SE already exists: $OUT"
    else
      echo "🎯 Sampling single-end: $FQ → ~${MAX_GB}GB"
      seqkit sample -s 42 -m "$SAMPLED_BYTES" "$FQ" -o "$OUT"
    fi
  fi
done
