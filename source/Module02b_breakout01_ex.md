---
title: "Exercise 01"
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

## Cutadapt All Samples Exercise

<br>

**15 Minutes**

<br>

Now that we've learned the basics of running Cutadapt, we need to trim all the rest of our samples. If you remember from the Computational Foundations course, we learned about using bash variables. Let's try an exercise where we use a bash variable to trim each one of our FASTQ files.

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

- Review Cutadapt's help page and choose the proper arguments for our Cutadapt command(s).
- Use a bash variable along with Cutadapt to trim all remaining FASTQ files.
- Confirm that we have all of our expected output files.

<br>

> Hint: Using a bash variable allows us to quickly change some arguments in a repeated command, e.g. :
>
> ~~~
> noun="World"
> echo "Hello, $noun!"
> noun="Class"
> echo "Hello, $noun!"
> ~~~
