---
title: "Exercise 04"
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

## Conda Create Exercise

<br>

**15 Minutes**

<br>

We've covered the basics of Conda, including how to create environments, as well as activate and deactivate them. We'll use those same ideas in this exercise to create a conda environment with all of the software that we've used so far.

<br>

In this exercise, we'll use a special tool that enhances Conda, called Mamba. It is used for environment creation, so you will use it in place of `conda create` in this exercise.

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

- When a solution is found **DO NOT** have all users create the environment. Instead, choose only a subset of interested learners to complete this exercise. We do not want to overwhelm the AWS instance.

<br>

- Use `mamba` to create an environment with all of the software that we used today:
    - cutadapt
    - fastqc
    - multiqc
    - star
    - rsem
- Use two channels when building the environment:
    - `conda-forge`
    - `bioconda`

<br>

> Hint: The tool `mamba` is a drop-in replacement for `conda create` and similar commands.
> It is powerful and fast, which allows us to easily replicate our whole environment from today.
> `conda create` can be very slow or uncooperative when creating environments with certain
> software combinations, and `mamba` helps us get around that in this case.
> The command is exactly the same as a `conda create` command, e.g.:
>
> ~~~
> mamba create -n <env-name> -c <channel> <package1> ...
> ~~~

<br>
