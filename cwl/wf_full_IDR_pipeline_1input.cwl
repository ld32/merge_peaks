#!/usr/bin/env cwltool

doc: |
  The main workflow that:
   produces two reproducible peaks via IDR given two eCLIP samples (1 input, 1 IP each).
   runs the 'rescue ratio' statistic
   runs the 'consistency ratio' statistic

cwlVersion: v1.0
class: Workflow


requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement


inputs:
  
  rep1_name:
    type: string
  rep1_clip_bam_file:
    type: File
  rep1_peaks_bed_file:
    type: File
    
  rep2_name:
    type: string  
  rep2_clip_bam_file:
    type: File
  rep2_peaks_bed_file:
    type: File
    
  input_bam_file:
    type: File

  species:
    type: string

  # FINAL OUTPUTS
  merged_peaks_bed:
    type: string
  merged_peaks_custombed:
    type: string

  split_peaks_bed:
    type: string
    default: "temp_split_IDR_peaks.bed"
  split_peaks_custombed:
    type: string
    default: "temp_split_IDR_peaks.custombed"

  rep1_merged_peaks_bed_from_cc:
    type: string
    default: "rep1_split_reproducible_peaks.bed"
  rep1_merged_peaks_custombed_from_cc:
    type: string
    default: "rep1_split_reproducible_peaks.custombed"
  rep2_merged_peaks_bed_from_cc:
    type: string
    default: "rep2_split_reproducible_peaks.bed"
  rep2_merged_peaks_custombed_from_cc:
    type: string
    default: "rep2_split_reproducible_peaks.custombed"

outputs:


  ## MAPPED READ NUMBERS ##

  wf_full_IDR_pipeline_1input_rep1_clip_read_num:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_clip_read_num
  wf_full_IDR_pipeline_1input_rep2_clip_read_num:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_clip_read_num
  wf_full_IDR_pipeline_1input_rep1_input_read_num:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_input_read_num
  wf_full_IDR_pipeline_1input_rep2_input_read_num:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_input_read_num


  ## INPUT NORMALIZATION 1 ##

  wf_full_IDR_pipeline_1input_rep1_input_normed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_input_normed_bed
  wf_full_IDR_pipeline_1input_rep2_input_normed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_input_normed_bed
  wf_full_IDR_pipeline_1input_rep1_input_normed_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_input_normed_full
  wf_full_IDR_pipeline_1input_rep2_input_normed_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_input_normed_full
  wf_full_IDR_pipeline_1input_rep1_compressed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_compressed_bed
  wf_full_IDR_pipeline_1input_rep2_compressed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_compressed_bed


  ## ENTROPY FILES ##

  wf_full_IDR_pipeline_1input_rep1_entropy_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_entropy_full
  wf_full_IDR_pipeline_1input_rep2_entropy_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_entropy_full
  wf_full_IDR_pipeline_1input_rep1_entropy_excess_reads:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_entropy_excess_reads
  wf_full_IDR_pipeline_1input_rep2_entropy_excess_reads:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_entropy_excess_reads
  wf_full_IDR_pipeline_1input_rep1_entropy_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_entropy_bed
  wf_full_IDR_pipeline_1input_rep2_entropy_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_entropy_bed


  ## IDR OUTPUTS ##

  wf_full_IDR_pipeline_1input_idr_output:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_idr_output
  wf_full_IDR_pipeline_1input_idr_output_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_idr_output_bed


  ## ERICS SPLIT-JOIN PEAKS ##

  wf_full_IDR_pipeline_1input_rep1_idr_output_input_normed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_idr_output_input_normed_bed
  wf_full_IDR_pipeline_1input_rep2_idr_output_input_normed_bed:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_idr_output_input_normed_bed
  wf_full_IDR_pipeline_1input_rep1_idr_output_input_normed_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_idr_output_input_normed_full
  wf_full_IDR_pipeline_1input_rep2_idr_output_input_normed_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_idr_output_input_normed_full
  wf_full_IDR_pipeline_1input_rep1_reproducing_peaks_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep1_reproducing_peaks_full
  wf_full_IDR_pipeline_1input_rep2_reproducing_peaks_full:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rep2_reproducing_peaks_full


  ## FINAL OUTPUTS ##

  wf_full_IDR_pipeline_1input_reproducible_peaks:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_reproducible_peaks
  wf_full_IDR_pipeline_1input_rescue_ratio:
    type: File
    outputSource: wf_rescue_ratio_1input/wf_rescue_ratio_1input_rescue_ratio
  wf_full_IDR_pipeline_1input_self_consistency_ratio:
    type: File
    outputSource: wf_self_consistency_ratio/wf_self_consistency_ratio_self_consistency_ratio

steps:
  ## This is already included in the rescue-ratio calculations, but keeping this here in case we want to just re-calculate to be cleaner.
  # wf_get_reproducible_eclip_peaks:
  #   run: wf_get_reproducible_eclip_peaks.cwl
  #   in:
  #     rep1_clip_bam_file: rep1_clip_bam_file
  #     rep1_input_bam_file: rep1_input_bam_file
  #     rep1_peaks_bed_file: rep1_peaks_bed_file
  #     rep2_clip_bam_file: rep2_clip_bam_file
  #     rep2_input_bam_file: rep2_input_bam_file
  #     rep2_peaks_bed_file: rep2_peaks_bed_file
  #     merged_peaks_bed: merged_peaks_bed
  #     merged_peaks_custombed: merged_peaks_custombed
  #   out: [
  #     rep1_clip_read_num,
  #     rep1_input_read_num,
  #     rep1_input_normed_bed,
  #     rep1_input_normed_full,
  #     rep1_compressed_bed,
  #     rep1_entropy_full,
  #     rep1_entropy_excess_reads,
  #     rep1_entropy_bed,
  #     rep2_clip_read_num,
  #     rep2_input_read_num,
  #     rep2_input_normed_bed,
  #     rep2_input_normed_full,
  #     rep2_compressed_bed,
  #     rep2_entropy_full,
  #     rep2_entropy_excess_reads,
  #     rep2_entropy_bed,
  #     idr_output,
  #     idr_output_bed,
  #     rep1_idr_output_input_normed_bed,
  #     rep2_idr_output_input_normed_bed,
  #     rep1_idr_output_input_normed_full,
  #     rep2_idr_output_input_normed_full,
  #     rep1_reproducing_peaks_full,
  #     rep2_reproducing_peaks_full,
  #     merged_peaks_bed_file,
  #     merged_peaks_custombed_file,
  #     reproducing_peaks_count
  #   ]
  wf_rescue_ratio_1input:
    run: wf_rescue_ratio_1input.cwl
    in:
      rep1_name: rep1_name
      rep1_clip_bam_file: rep1_clip_bam_file
      rep1_peaks_bed_file: rep1_peaks_bed_file
      
      rep2_name: rep2_name
      rep2_clip_bam_file: rep2_clip_bam_file
      rep2_peaks_bed_file: rep2_peaks_bed_file
      
      input_bam_file: input_bam_file
      species: species
      merged_peaks_bed: merged_peaks_bed
      merged_peaks_custombed: merged_peaks_custombed
      split_peaks_bed: split_peaks_bed
      split_peaks_custombed: split_peaks_custombed
    out: [
      wf_rescue_ratio_1input_rep1_clip_read_num,
      wf_rescue_ratio_1input_rep2_clip_read_num,
      wf_rescue_ratio_1input_rep1_input_read_num,
      wf_rescue_ratio_1input_rep2_input_read_num,
      wf_rescue_ratio_1input_rep1_input_normed_bed,
      wf_rescue_ratio_1input_rep2_input_normed_bed,
      wf_rescue_ratio_1input_rep1_input_normed_full,
      wf_rescue_ratio_1input_rep2_input_normed_full,
      wf_rescue_ratio_1input_rep1_compressed_bed,
      wf_rescue_ratio_1input_rep2_compressed_bed,
      wf_rescue_ratio_1input_rep1_entropy_full,
      wf_rescue_ratio_1input_rep2_entropy_full,
      wf_rescue_ratio_1input_rep1_entropy_excess_reads,
      wf_rescue_ratio_1input_rep2_entropy_excess_reads,
      wf_rescue_ratio_1input_rep1_entropy_bed,
      wf_rescue_ratio_1input_rep2_entropy_bed,
      wf_rescue_ratio_1input_idr_output,
      wf_rescue_ratio_1input_idr_output_bed,
      wf_rescue_ratio_1input_rep1_idr_output_input_normed_bed,
      wf_rescue_ratio_1input_rep2_idr_output_input_normed_bed,
      wf_rescue_ratio_1input_rep1_idr_output_input_normed_full,
      wf_rescue_ratio_1input_rep2_idr_output_input_normed_full,
      wf_rescue_ratio_1input_rep1_reproducing_peaks_full,
      wf_rescue_ratio_1input_rep2_reproducing_peaks_full,
      wf_rescue_ratio_1input_reproducible_peaks,
      wf_rescue_ratio_1input_rescue_ratio
    ]
  wf_self_consistency_ratio:
    run: wf_self_consistency_ratio.cwl
    in:
      rep1_name: rep1_name      
      rep1_clip_bam_file: rep1_clip_bam_file
      rep1_input_bam_file: input_bam_file
      
      rep2_name: rep2_name
      rep2_clip_bam_file: rep2_clip_bam_file
      rep2_input_bam_file: input_bam_file
      
      species: species
      rep1_merged_peaks_bed: rep1_merged_peaks_bed_from_cc
      rep1_merged_peaks_custombed: rep1_merged_peaks_custombed_from_cc
      rep2_merged_peaks_bed: rep2_merged_peaks_bed_from_cc
      rep2_merged_peaks_custombed: rep2_merged_peaks_custombed_from_cc
    out: [
      wf_self_consistency_ratio_self_consistency_ratio
    ]

