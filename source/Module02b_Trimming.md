---
title: "Trimming"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
            toc: true
            toc_depth: 4
            toc_float: true
            number_sections: false
            fig_caption: true
            markdown: GFM
            code_download: true
---
<style type="text/css">
body{ /* Normal  */
      font-size: 14pt;
  }
pre {
  font-size: 12pt
}
</style>

In this module we will learn:

* about the cutadapt software and its uses
* how to use the cutadapt tool for quality trimming
* how to trim all of our samples using a bash variable
* how to further use fastqc to evaluate trimming success

# Differential Expression Workflow

As a reminder, our overall differential expression workflow is shown below. In this lesson, we will go over the highlighed portion of the workflow.

![](images/wayfinder/wayfinder-Trimming.png)
<br>
<br>
<br>
<br>

# Cutadapt

[Cutadapt](https://cutadapt.readthedocs.io/en/stable/) is a very widely used read trimming and fastq processing software, cited several thousands of times. It's written in python, and is user-friendly and reasonably fast.

It is used for removing adapter sequences, primers, and poly-A tails, for trimming based on quality thresholds, for filtering reads based on characteristics, etc.

It can operate on both FASTA and FASTQ file formats, and it supports compressed or raw inputs and outputs.

Notably, cutadapt's error-tolerant adapter trimming likely contributed greatly to its early popularity. We will use it to quality trim our reads. Similar to earlier, we'll discuss the details of cutadapt's functionality and input/output files, before proceeding to an exercise where we can try running the software ourselves.


## Cutadapt details

Cutadapt's input and output files are simple to understand given its stated purpose. Both input and output are fastq files - the input being the fastq files that need processing, and output being the fastq files after they've been processed. Depending on the parameters, chosen outputs often have shorter read lengths due to trimming processes and fewer total reads due to filtering.


    # Given the single-end input file:
    reads/sample_A_R1.fastq.gz
    # Suitable output filename/paths:
    out_trimmed/sample_A_R1.trimmed.fastq.gz


As mentioned above, cutadapt has many capabilities. Depending on the parameters given, we can invoke different functionalities. Given our results from the previous QC module, we know that we need to quality trim the reads in our fastq files.


## Cutadapt Exercise

1. Create a directory for our trimmed reads
2. View the help page of the cutadapt tool
3. Construct a cutadapt command to trim the reads in `sample_A_R1.fastq.gz`
4. View the output of cutadapt, and verify that it's correct

```
# Create a directory for the trimmed reads
mkdir out_trimmed
# View the help page of Cutadapt
cutadapt --help

# Construct a cutadapt command to trim our reads
cutadapt -q 30 -m 20 -o out_trimmed/sample_A_R1.trimmed.fastq.gz ../reads/sample_A_R1.fastq.gz
# View the output of cutadapt, (verify presence of output files and peek into the files)
```

At this point, we've run cutadapt on one of our samples. We could construct a series of similar commands by altering the sample names. However, there's an easier way. For this, we'll use a bash variable.

<br>
<br>

## Cutadapt All Samples Exercise

Before starting our cutadapt exercise, we should make sure that we are on the same page. Follow the link below:

[Link to Cutadapt exercise](Module02b_breakout01_sol.html)

<br>
<br>

Now that we've run cutadapt and trimmed our reads, we will quickly re-run FastQC on these trimmed read FASTQs. This will confirm that we've successfully trimmed the low quality sequence, and we'll see that our FASTQ files are ready for sequencing. Since we've discussed the FastQC input/output and functionality in the previous module, we'll go next to an exercise re-running FastQC on the trimmed read data

## Re-running FastQC Exercise:

1. Construct and execute FastQC command to evaluate trimmed read FASTQ files
2. View the output (filenames)

```
# We'll have to create an output directory first
mkdir out_fastqc_trimmed
# Construct the fastqc command
fastqc -o out_fastqc_trimmed out_trimmed/*.fastq.gz
# Execute the command
# Then verify that the output files are present
ls -l out_fastqc_trimmed
```

<br>

Opening the HTML report, we see it is organized by the same modules and each plot has all samples for which FastQC was run. We can see the report confirms that the low quality bases have been trimmed from our sequence.

<br>

---

These materials have been adapted and extended from materials created by the [Harvard Chan Bioinformatics Core (HBC)](http://bioinformatics.sph.harvard.edu/). These are open access materials distributed under the terms of the [Creative Commons Attribution license (CC BY 4.0)](http://creativecommons.org/licenses/by/4.0/), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.

<br/>
<br/>
<hr/>
| [Previous lesson](Module02a_Sequence_QC.html) | [Top of this lesson](#top) | [Next lesson](Module03a_Reference_Genomes.html) |
| :--- | :----: | ---: |
