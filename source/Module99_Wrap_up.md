---
title: "RNA-seq Demystified Workshop"
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
            code_download: false
---

<style type="text/css">

body, td {
   font-size: 18px;
}
code.r{
  font-size: 12px;
}
pre {
  font-size: 12px
}

</style>

## Wrapping up

We hope you now have more familiarity with key concepts, data types, tools, and how they all
connect to enable gene expression analysis from bulk RNA-Seq data.

![](images/wayfinder/wayfinder-Wrap_up.png)

---

## Housekeeping

- Please take our optional [post-workshop survey](https://forms.gle/JQg4tn1B4jAVxkz29){target="_blank"} (5-10 minutes)

- We will email you a link to the final session recordings next week.

- The website/notes for this workshop will be available.

- The [UM Bioinformatics Core Workshop Slack channel](https://umbioinfcoreworkshops.slack.com){target="_blank"} will be available for 90 days.

---

## Looking ahead

#### Workshop environment
- BASH/RStudio workshop compute environment will be available until 8/31.
  - _Please save all your R scripts now_ so that we can "right-size" the compute environment immediately following today's workshop session.
- You can download files from the workshop environment from your terminal/command line window as below. 
  (You will need to substitute your actual workshop username and type workshop password when prompted.)
  ```
  mkdir rnaseq-demystified-workshop
  cd rnaseq-demystified-workshop
  scp -r YOUR_USERNAME@bfx-workshop01.med.umich.edu:"RSD*" .
  ```
  - Note that the full download is about 2-4Gb, so depending on your internet 
    speeds it could take while.

---

#### Installing software locally
  - You can install necessary programs to run programs locally. Note
    that for typical data, the compute intensive steps (Day 1) assume your 
    computer has powerful compute (many CPUs and lots of RAM) and sizable 
    storage capacity. (i.e. It may not be practical to run these on your laptop.) 
    Also, Installing bioinformatics software is non-trivial and comprehensive
    instructions to setup a complete compute environment are outside the scope
    of this workshop. For the intrepid:
    - For UM folks interested in learning more about the GreatLakes HPC and 
    more advanced software installation approaches, see our workshop lessons on 
    [Reproducible Computing](https://umich-brcf-bioinf.github.io/workshop-reproducible-computing/main/html/){target="_blank"}
    - Instructions on [Installing Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html#regular-installation). And the command to create a similar Conda environment:
      `conda create -n rsd -c conda-forge -c bioconda multiqc fastqc cutadapt star rsem numpy pandas`
    - Instructions on [setting up R/R-Studio](workshop_setup/setup_instructions_advanced.html)

---

## University of Michigan Resources
- [UM CoderSpaces "office hours"](https://datascience.isr.umich.edu/events/coderspaces/){target="_blank"} and UM CoderSpaces Slack workspace. _(See "Useful Resources" section in CoderSpaces page for instructions on how to join and access the CoderSpaces Slack workspace.)_
- Upcoming [UM Advanced Research Computing workshops](https://arc.umich.edu/events/){target="_blank"}.
- Advanced Research Computing (ARC) at University of Michigan hosts a
  high-performance computing (HPC) platform called _Great Lakes_ which combines
  high-end computers, fast/resilient storage, and pre-installed software.
  GreatLakes may be a good resource for folks who need to run the more compute
  intensive steps and a substantial block of compute and storage is subsidized
  by ARC making it essentially free to many researchers.
  - About [Great Lakes HPC](https://arc.umich.edu/greatlakes/){target="_blank"}.
  - About the ARC [Research Computing Package](https://arc.umich.edu/umrcp/){target="_blank"}.
  - Videos on [getting started with Great Lakes](https://www.mivideo.it.umich.edu/channel/ARC-TS%2BTraining/181860561/){target="_blank"}. (available to UM folks)


#### Training and support
  - Learning bioinformatic analyses more like a process than a task. Resources 
    to consider:
    - UM Bioinformatics Core links to <a href="https://brcf.medicine.umich.edu/cores/bioinformatics-core/training/" target="_blank">training resources/workshops</a>
    - Notes on Bash and R from the recent <a href="https://umich-brcf-bioinf.github.io/workshop-computational-foundations/main/html/" target="_blank">Computational Foundations Workshop</a>.<br/>
    - For more intro lessons and workshops in Bash / Git / R / Python : <a href="https://software-carpentry.org/lessons/" target="_blank">Software Carpentry</a> and the <a href="https://umcarpentries.org/" target="_blank">UM Software Carpentry Group</a>.
    - For more info on NGS analysis, we can highly recommend training materials from the <a href="https://hbctraining.github.io/main/" target="_blank">Harvard Chan Bioinformatics Core</a>.

---

## Thank you

![Sponsors](images/Module00_Introduction/sponsor_logos.png)

## Thank you to/from the workshop team
| ![](images/Module00_Introduction/headshots/headshot_cgates.jpg) | ![](images/Module00_Introduction/headshots/headshot_mbradenb.jpg) | ![](images/Module00_Introduction/headshots/headshot_trsaari.jpg) |
|:-:|:-:|:-:|:-:|
| **Chris** | **Marci** | **Travis** |
![](images/Module00_Introduction/headshots/headshot_damki.jpg) | ![](images/Module00_Introduction/headshots/headshot_rcavalca.jpg) |
| **Dana** | **Raymond** |

<br/>



Thank you for participating in our workshop. We welcome your questions and feedback now and in the future.

Bioinformatics Workshop Team

[bioinformatics-workshops@umich.edu](mailto:bioinformatics-workshops@umich.edu) <br/>
[BRCF Bioinformatics Core](https://medresearch.umich.edu/office-research/about-office-research/biomedical-research-core-facilities/bioinformatics-core)
