#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   source env/bootstrap.sh <toolchain>
# Toolchains: bcftools, align, python, bedtools, default

TOOLCHAIN="${1:-default}"

# Reduce module conflicts (safe on most clusters)
module purge >/dev/null 2>&1 || true

case "$TOOLCHAIN" in
  default|bcftools)
    module load bcftools/1.22
    module load htslib/1.22.1 || true
    module load samtools || true
    ;;
  align)
    module load bwa || true
    module load samtools || true
    ;;
  bedtools)
    module load bedtools || true
    ;;
  python)
    # If you use conda, customize this block.
    # This will not fail if conda isn't configured.
    if [[ -f "$HOME/.bashrc" ]]; then source "$HOME/.bashrc"; fi
    if command -v conda >/dev/null 2>&1; then
      conda activate ril_mping_py311 2>/dev/null || true
    fi
    ;;
  *)
    echo "ERROR: unknown toolchain: $TOOLCHAIN" >&2
    exit 1
    ;;
esac

echo "=== TOOLCHAIN: $TOOLCHAIN ==="
for t in bcftools samtools bgzip tabix bwa bedtools python; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "OK: $t -> $(command -v "$t")"
  else
    echo "NA: $t"
  fi
done
