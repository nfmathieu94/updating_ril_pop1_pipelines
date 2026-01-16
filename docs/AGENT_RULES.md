# Agent Rules (OpenCode)

## Hard constraints
1. Treat `rice_RILs_mPing_original_code/` as READ-ONLY. Do not modify files there.
2. All refactored code must go under `fixed_pipelines/` (or `env/`, `docs/`).
3. Do not delete or overwrite user data. Write all generated outputs under `runs/` (or `fixed_pipelines/*/runs/`).

## Evidence-first inference policy
Infer inputs/outputs/thresholds ONLY from:
- the original scripts in `rice_RILs_mPing_original_code/`
- the paper text in `docs/2020_pnas_ril_paper.txt`
- empirical inspection of `test_input/pop1`

If anything is not explicitly supported by those sources:
- record it in `docs/ASSUMPTIONS.md`
- mark it as an assumption
- do not use it for full dataset runs without approval

## Approvals required
The agent MUST ask before:
- running `sbatch` or `srun` jobs that are not clearly “test_input/pop1”
- running any analysis on Pop2/Pop3 or non-test datasets
- changing default thresholds in a way that affects scientific conclusions
- using destructive commands (rm/mv) outside `runs/` or temporary scratch

## Allowed file inspection commands (no approval needed)
`ls`, `find`, `head`, `tail`, `wc -l`, `sed -n`, `grep`, `awk`, `bcftools view -h`,
`bcftools query -l`, `bcftools stats`, `samtools view -H`, `samtools flagstat`,
`samtools idxstats`, `samtools quickcheck`.

## Environment requirement
All runnable scripts must source the cluster toolchain:
- `source env/bootstrap.sh <toolchain>`
and should fail fast if required tools are missing.

