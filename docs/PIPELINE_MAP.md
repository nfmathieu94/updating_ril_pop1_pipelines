# Pipeline Map (PNAS 2020 RIL mPing burst)

Goal: document how each original pipeline maps to refactored code, including:
- inputs
- outputs
- thresholds
- upstream dependencies

## Pipelines (original)
- Preprocess_reads_and_genotype_parental_SNPs
- Construction_of_recombination_bin_and_linkage_map
- Identification_of_excision_events
- Identification_of_mPing_Ping_Pong_insertions
- Discovery_of_structural_variations_associated_with_mPing

## Execution order (initial hypothesis)
1) Preprocess reads (parents + RILs) and call/genotype SNPs
2) Build recombination bin map / linkage map from diagnostic SNPs
3) Phase haplotypes at parental mPing loci (bins)
4) Identify candidate excisions (empty site on parental haplotype)
5) Confirm excisions from read alignments + footprint signatures

(Agent must verify/adjust order based on original scripts + paper.)
