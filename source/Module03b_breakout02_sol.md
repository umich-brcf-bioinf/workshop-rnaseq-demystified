---
title: "Exercise 02 Solution"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
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

<br>

## Aligning All Samples Exercise

<br>

**15 Minutes**

<br>

We just learned about how to use RSEM & STAR, but now we need to align all of the rest of our samples to the reference genome. In this breakout exercise, we'll build upon some concepts we've learned previously.

<br>

### Instructions:

<br>

- Work independently in the main room, posting any questions that arise to slack.
- Recommendations for writing your own code:
  - Read function documentation
  - Test out ideas - it's okay to make mistakes and generate errors
  - Use a search engine to look up errors or recommended solutions using keywords
- We'll review possible solutions after time is up as a group.

<br>

- Review what we've learned about running RSEM + STAR, to determine an appropriate command for aligning our samples.
- Using what we've learned previously, create a script using this command to quickly and easily align the rest of our samples.
- Run the script, view the output, and verify that we have the files we need.

<br>

### Solution - Aligning All Samples Exercise

<br>

Based on our earlier breakout exercise, using a for-loop with our bash variable would look something like this:

    for SAMPLE in sample_B sample_C sample_D sample_E sample_F
    do
        rsem-calculate-expression --star --num-threads 1 --star-gzipped-read-file \
        --star-output-genome-bam --keep-intermediate-files \
        out_trimmed/${SAMPLE}_R1.trimmed.fastq.gz \
        ../refs/GRCm38.102.chr19reduced \
        out_rsem/${SAMPLE}
    done

Place the appropriate code into a file using the `nano` editor to create the script, then execute the script.

    # Use the nano editor to create a script
    nano aligning_B-F.sh # Insert commands into editor, then close the file
    # Run the script
    bash aligning_B-F.sh

Optional: Add execute permissions to the script before executing.

If going this route, you can call the script directly, without calling bash.

Note that since the script is in the current directory, you'll have to provide that additional contextual information when calling it (e.g. `./` to represent the current directory).

    # Add execute permissions
    chmod +x aligning_B-F.sh
    # Run the script
    ./aligning_B-F.sh

<br>

> Helper Hints: When using a for-loop approach, it can be helpful to slowly build up to the end result, sometimes using a "dry-run" command as a test case, to get learners to be more cognizant of what their code will do.
>
>    - Echoing filenames is an easy place to start.
>    - Iterating over a single sample might also be helpful when testing.

> Example echoing filenames:

    for SAMPLE in sample_B sample_C sample_D sample_E sample_F
    do
        echo "in_file: out_trimmed/${SAMPLE}_R1.trimmed.fastq.gz"
        echo "out_prefix: out_rsem/${SAMPLE}"
    done

> Example iterating over a single sample (sample_A, which we've already aligned prior to the breakout exercise)

    for SAMPLE in sample_A
    do
        rsem-calculate-expression --star --num-threads 1 --star-gzipped-read-file \
        --star-output-genome-bam --keep-intermediate-files \
        out_trimmed/${SAMPLE}_R1.trimmed.fastq.gz \
        ../refs/GRCm38.102.chr19reduced \
        out_rsem/${SAMPLE}
    done

<br>
