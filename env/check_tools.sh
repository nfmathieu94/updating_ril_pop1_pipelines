#!/usr/bin/env bash
set -euo pipefail
source env/bootstrap.sh "${1:-default}"

req_common=(awk sed grep sort uniq wc head tail find)
req_bcftools=(bcftools bgzip tabix)
req_samtools=(samtools)

missing=0
for t in "${req_common[@]}"; do
  command -v "$t" >/dev/null 2>&1 || { echo "MISSING: $t" >&2; missing=1; }
done

for t in "${req_bcftools[@]}"; do
  command -v "$t" >/dev/null 2>&1 || { echo "MISSING: $t" >&2; missing=1; }
done

# samtools is commonly needed; warn but don't hard-fail if your step doesn't need it yet
for t in "${req_samtools[@]}"; do
  command -v "$t" >/dev/null 2>&1 || echo "WARN: missing: $t"
done

[[ "$missing" -eq 0 ]] || exit 1
echo "OK: required tools found"
