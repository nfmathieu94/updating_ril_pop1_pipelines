# Data Contract (formats + coordinate conventions)

## Coordinate conventions
- BED: 0-based, end-exclusive (unless explicitly stated otherwise in a script)
- VCF/BCF: 1-based positions
- Chromosome naming: must be consistent across steps (e.g., Chr1 vs 1). Any normalization must be documented.

## Common file types
### FASTQ
- gzip-compressed fastq accepted (.fastq.gz)

### BAM/CRAM
- sorted, indexed
- duplicates marked if required by downstream steps

### VCF/BCF
- must include GT
- DP/AD presence depends on calling method; scripts must declare required FORMAT tags

## Rule
Any script that consumes a file must validate the minimal expected columns/tags before running.
