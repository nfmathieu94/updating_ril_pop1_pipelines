# Purpose

My goal is to update and get several old pipelines working using `opencode` agents.
The original pipelines are used to evaluate a transposable element (mPing) burst
in a rice RIL population using Illumina short read sequencing.

## Background Biology

The implimentation of the pipeline can be read about in the following file:
`./docs/2020_pnas_ril_paper.txt`

## Old Pipelines

All of the original code that I want to refactor and get working again are 
found in the head directory `./rice_RILs_mPing_original_code`

Each subdirectory under the head directory is a different pipeline where some 
are independent and others rely on the outputs or inputs of others. Here are
all of the pipelines in no particular order:

- `./rice_RILs_mPing_original_code/Identification_of_excision_events`
- `./rice_RILs_mPing_original_code/Preprocess_reads_and_genotype_parental_SNPs`
- `./rice_RILs_mPing_original_code/Construction_of_recombination_bin_and_linkage_map`
- `./rice_RILs_mPing_original_code/Discovery_of_structural_variations_associated_with_mPing`
- `./rice_RILs_mPing_original_code/Identification_of_mPing_Ping_Pong_insertions/`


## Test Inputs

This diretory: `./test_input/pop1` contains raw paired end short read 
sequencing files for 3 RILs that were previously examined with these old 
pipelines as a part of the research paper mentioned above 
(`./docs/2020_pnas_ril_paper.txt`). 

The `./test_input/pop1` directory also contains raw fastq files for the parents 
of the RIL population (NB and HEG4). The parental fastq files will be needed for 
some of the pipelines.

Since we know the results from these specific RILs we can use the results 

## Goals

Work through each pipeline individually
- Create a context for how the script works, what inputs are needed, etc.
- Refactor code to use python3 and make minimal changes so that the code is functional
- Run the pipeline on test inputs to make sure that propper type of output is generated.
