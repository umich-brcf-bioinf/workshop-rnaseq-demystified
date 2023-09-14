---
title: "Exercise 03 Solution"
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

## Transfer MultiQC Report With `scp` Exercise

<br>

**15 Minutes**

<br>

We just tried two new variations of our MultiQC command, one pointed at the directory of our trimmed FastQC results, and another at the whole project directory. For convenience, we've included these reports in the zipped folder you downloaded at the beginning of the class. However, it's also useful to know how to transfer data to/from a remote instance. We'll explore how to use `scp` in this exercise.

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

- Make sure that you are viewing your local terminal. The `scp` command should be run from your own machine.
- Use `scp` to transfer the comprehensive multiQC report from the AWS machine to your personal computer.
- Confirm that you've received the report

<br>

> Hint: The command format is:
>
> ~~~
> scp source destination
> ~~~
>
> You will need to provide your ssh login information to complete the transfer

<br>

### Solution - Transfer MultiQC Report With `scp` Exercise

> Helper Hint: By default, any multiQC reports will have identical filenames `multiqc_report.html`. It is helpful to specify a more descriptive destination filename for the transfer below, so that multiple MultiQC reports can be easily differentiated (and don't overwrite one another).

<br>

> Helper Hint: Users must know that they should run `scp` from their **local** computer, not from the AWS instance.

<br>

```
# Transfer the full report
scp <username>@bfx-workshop01.med.umich.edu:~/RSD_Shell/analysis/out_multiqc_all/multiqc_report.html ~/rsd-workshop/multiqc_report_all.html
```

<br>
