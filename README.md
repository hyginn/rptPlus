# `rptPlus`

#### (**R** **P**ackage **T**emplate **Plus**)
[![DOI](https://zenodo.org/badge/157482801.svg)](https://zenodo.org/badge/latestdoi/157482801)

&nbsp;

###### [Boris Steipe](https://orcid.org/0000-0002-1134-6758),
###### Department of Biochemistry and Department of Molecular Genetics,
###### University of Toronto
###### Canada
###### &lt;boris.steipe@utoronto.ca&gt;

----

This README contains detailed information about how to work with this package.
The associated Vignette can be previewed [here](http://htmlpreview.github.io/?https://github.com/hyginn/rptPlus/blob/master/doc/rptPlusVignette.html). The package can be installed from GitHub with `devtools::install_github("hyginn/rptPlus", build_opts = c("--no-resave-data", "--no-manual"))`
however this is not likely to be very useful, this repository is meant to be
downloaded (as an RStudio project) and modified.

----

**If any of this information is ambiguous, inaccurate, outdated, or incomplete,
please check the [most recent version](https://github.com/hyginn/rptPlus) of the
package on GitHub and 
[file an issue](https://github.com/hyginn/rptPlus/issues).**

----

<!-- TOCbelow -->
1. About this package:<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 1.1 What it is ...<br/>
2. Details ...<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.1. A new GitHub project<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.2. A new RStudio project<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.3. Download the `rptPlus` files<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.4. Customize the core<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.4.1. Getting attribution right<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.5. Save, check, commit, and push<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 2.6. Configuring your enhanced modules<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.1. Development vs. deployment<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.2. `NEWS`<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.3. `CITATION`<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.4. Packaged Data Files <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.5. Adding a Vignette<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.6. Importing Bioconductor Packages<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.7. A Secure Approach to Credentials<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.8. Compiled `C++` code<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.9. A Shiny App<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.10. Considerations for Reproducible Research<br/>
3. Develop<br/>
4. What's in the box ...<br/>
5. FAQ<br/>
6. Notes<br/>
7. Further reading<br/>
8. Acknowledgements<br/>
<!-- TOCabove -->

----

# 1 About this package:

## 1.1 What it is ...

The [`rpt` package](https://github.com/hyginn/rpt) an RStudio project that contains all the assets required in a simple R package. [**`rptPlus`**](https://github.com/hyginn/rptPlus) builds on `rpt` and contains assets for more advanced topics and enhanced functionality: building a vignette, including compiled code, deploying a [shiny app](https://shiny.rstudio.com/), and more. The package loosely follows the principles outlined in Hadley Wickham's [**R Packages** book](http://r-pkgs.had.co.nz/), is compatible with the [**CRAN** manual on writing R-extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) and the [Bioconductor package guidelines](https://www.bioconductor.org/developers/package-guidelines/), and it embodies principles of Reproducible Research . This is the architecture and standard I require for student-built packages in projects and courses at the University of Toronto and elsewhere.<sup id="af1">[1](#f1)</sup> `rpt` will get you started with a standard setup of:

* an R Studio project on your local machine,
* which is version controlled,
* and shared on GitHub,
* and contains the directory structures and files for a CRAN compatible R package,
* and contains automated testing code,
* and can be installed by others from GitHub using standard tools,
* and includes detailed instructions how to setup and use your code.

[`rptPlus`] adds to this:

* a way to have your project behave differently during development and after deployment;
* package information in `NEWS` and `CITATION` files;
* a sample "Vignette";
* installing Bioconductor packages;
* packaged data files;
* a secure approach to credentials;
* compiled `C++` code;
* a `shiny` app;
* considerations for reproducible research.

&nbsp;

## 1.2 Who needs it ...

The assets packaged  in `rptPlus` support R users and developers at all levels who wish to go beyond the most basic package-development needs.

&nbsp;

## 1.3 How it works ...

**First, explore the basics by building a sample package based on `rpt`. Then, create an empty project, linked to an empty GitHub repository. Fill it with the files from `rptPlus`. Then start developing.**

This is all it takes, but the details take care. You will go through the following steps:

1. Define your package name and create a new GitHub project;
2. Make a new RStudio project on your local machine that is linked to your GitHub project;
3. Download a ZIP archive of `rptPlus` and copy all the core files over to your project folder;
4. Customize your files;
5. Save, check, commit, and push to GitHub;
6. Start developing.

That's all. Steps 1 to 3 are identical to the process you have used with `rpt`. Each step is described in detail below.

----

# 2 Details ...

&nbsp;

**Go through these instructions carefully, step by step.**

&nbsp;

## 2.0 Prerequisites

You need a current installation of [**R**](https://www.r-project.org/) and [**RStudio**](https://www.rstudio.com/products/rstudio/download/), `git`, and a [**GitHub**](https://github.com/) account that **has been set up to connect to your RStudio projects**. If any of this is new to you (or if you wish to brush up on the details), head over to Jenny Bryan's superb tutorial [**Happy Git and GitHub with R**](http://happygitwithr.com/). You should also download the `devtools` and `testthat` packages from CRAN. In the RStudio console type:

```R
install.packages(c("devtools", "testthat"))
```

&nbsp;

## 2.1 A new GitHub project

Create a new, empty repository on GitHub and give it your package name.

- First you need to decide on a [**name**](http://r-pkgs.had.co.nz/package.html#naming) for your package. Take care to define it well. Short, memorable, lower-case, and not in conflict with current names on CRAN or Bioconductor. Head over to [the taskviews on CRAN](https://cran.r-project.org/web/views/) and browse to see good examples.
- Next, log into your GitHub account.
- Click on the **(+)** in the top menu bar and select _New repository_.
- Enter your package name as the repository name.
- _Check_ to **Initialize this repository with a README** (the README will be overwritten later, but you need at least one file as a placeholder in your repository.)
- Don't add a `.gitignore` file or a license (these will come from `rptPlus`).
- Click **Create repository**.
- Finally, copy the URL of your repository to your clipboard, it should look like `https://github.com/<your-GitHub-user-name>/<your-package-name>` <sup id="af2">[2](#f2)</sup>.

&nbsp;

## 2.2 A new RStudio project

Create a new RStudio project on your local machine that is linked to your GitHub repository and account.

- In RStudio, choose **File** ▷ **New Project...**, select **Version Control** ▷ **Git**. Enter the **Repository URL** you copied in the preceding step, hit your `tab` key to autofill the **Project directory name** (it should be the same as your package name), and **Browse...** to a parent directory in which you want to keep your RStudio project. Then click **Create Project**.

The project directory will be created, the repository file will be downloaded, a new RStudio session will open in your directory, and R's "working directory" should be set to here.

**Validate:**

1. In the console, type `getwd()`. This should print the correct directory.
2. Make a small change to the `README.md` file, commit it and push it back to the remote repository: 
    1. In the files pane, click on `README.md` to open the file in the editor. Make a small change (e.g. add the word "test"). Save the file.
    2. Click on the _Version control icon_ in the editor window menu and choose **Commit...**, or choose **Tools** ▷ **Version Control** ▷ **Commit...** from the menu.
    3. In the version control window, check the box next to `README.md` to "stage" the file, enter "test" as your "Commit message" and click **Commit**. This commits your edits to your local repository.
    4. Click the green **Push** up-arrow. This synchronizes your local repository with your remote repository on GitHub.
    5. Navigate to your GitHub repository, reload the page, and confirm that your edit has arrived in the `README.md` file in your GitHub repository.

Congratulate yourself if this has all worked. If not - don't continue. You need to fix whatever problem has arisen. In my experience, the most frequent issue is that someone has skipped a step that they thought was not important to them. Check carefully whether you have followed all the steps. In particular, if the problem is associated with `git` on your machine, or connecting RStudio to your GitHub repository, work through Jenny Bryan's [**Happy Git...**](http://happygitwithr.com/) first.

&nbsp;

## 2.3 Download the `rptPlus` files

Download a ZIP archive of `rptPlus` and copy all the files over to your project folder.

- Navigate to the GitHub repository for `rptPlus` at (<https://github.com/hyginn/rptPlus>).
- Click on the green **Clone or download** button and select **Download ZIP**. This will package the `rptPlus` folder into a ZIP archive which will contain all files, (without the actual repository database, you don't need that), and download it to your computer.
- Find the ZIP archive in your download folder and unpack it. This will create a folder called `rptPlus-master` which contains all of the `rptPlus` files. (Note:  the creation date of the folder is not today's date, so if your download folder lists files by date, the unzipped folder will not be at the top.)
- Move all of the files and folders within `rpt-master` into your project directory, overwriting any of the files that are already there. You can then delete `rpt-master` and the ZIP archive.

**Validate**

In RStudio, open the `./dev` directory. Open the file `rptTwee.R` and click on  **Source** to load the function. Then type `rptTwee()` into the console. You should get a directory tree that looks approximately like this.

```
 --<your-package-name>/
   |__.gitignore
   |__.Rbuildignore
   |__.Rprofile
   |__data/
      |__rptGC.RData
   |__DESCRIPTION
   |__dev/
      |__checkEnds.R
      |__functionTemplate.R
      |__makeMD5.R
      |__rptTwee.R
   |__doc/
      |__rptPlusVignette.html
      |__rptPlusVignette.R
      |__rptPlusVignette.Rmd
   |__inst/
      |__CITATION
      |__extdata/
         |__test_lseq.dat
      |__scripts/
         |__benchmarkCodons.R
         |__scriptTemplate.R
      |__shiny-scripts/
         |__rptApp/
            |__app.R
   |__LICENSE
   |__man/
      |__cpp_codonSplitCpp.Rd
      |__lseq.Rd
      |__makeSeq.Rd
      |__rptGC.Rd
      |__rptPlus.Rd
      |__runRptApp.Rd
   |__MD5
   |__Meta/
      |__vignette.rds
   |__NAMESPACE
   |__NEWS
   |__R/
      |__lseq.R
      |__makeSeq.R
      |__RcppExports.R
      |__rptGC.R
      |__rptPlus.R
      |__runRptApp.R
      |__zzz.R
   |__README.md
   |__<your-package-name>.Rproj
   |__rptPlus.Rproj
   |__src/
      |__codonSplitCpp.cpp
      |__RcppExports.cpp
   |__tests/
      |__testthat.R
      |__testthat/
         |__helper-functions.R
         |__test_lseq.R
   |__vignettes/
      |__.gitignore
      |__rptPlusVignette.Rmd
```

If directories or files are missing, figure out where you went wrong.

&nbsp;

## 2.4 Customize the core

The following steps customize the "core" files of your package in a way that is common to basically all packages. Items that are specific to the added "modules" of `rptPlus` are described in the next sections, with instructions on how to remove these modules if you don't need them. But remember: you can't commit empty directories, so make sure to keep a placeholder file in each directory until you replace it with your own. 

&nbsp;

#### `DESCRIPTION`

Modify the `DESCRIPTION` file as follows:

```diff
-      Package: rptPlus
+      Package: <your-package-name>

Type: Package

-      Title: R Package Template - enhanced
+      Title: <a title for your package>

-      Version: 1.0.0
+      Version: 0.1.0

-      Date: 2018-12-26
+      Date: <today-in-YYYY-MM-DD-format>

Authors@R: c(
-    person("Boris", "Steipe", email = "boris.steipe@utoronto.ca", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-1134-6758"))
+     person("Boris", "Steipe", email = "boris.steipe@utoronto.ca", role = c("aut"), comment = c(ORCID = "0000-0002-1134-6758")),
+     person("<your-given-name>", "<your-family-name>", email = "<your-email-address>", role = c("aut","cre"), comment = c(ORCID = "<your-ORCID-ID>"))
    )

-      Description: A template for an RStudio project of an R package ...
+      Description: {A short description of the purpose of your package}

-      URL: https://github.com/hyginn/rptPlus
+      URL: https://github.com/<your-github-user-name>/<your-package-name>

License: file LICENSE
[...]

```

&nbsp;

### 2.4.1 Getting attribution right

Giving credit is the currency of the FOSS (Free and Open Source Software) world which makes all of our work possible, licensing keeps it free. Take the time to get your attributions and licenses right; even if you think you don't really need this immediately it's good practice for good habits. Don't think you don't have to care: you automatically have a copyright to everything you write, and if you don't license it, no one can legally re-use it. Unfortunately, the common practices for attributing R package authorship are not consistent wherever there is more than one author (which is usually the case in academia). `rptPlus` adopts a consistent approach that is backward compatible with earlier practice.

Attribution and licensing only appear to be related. They serve distinct requirements and require distinct and specific mechanisms.

Credible attribution needs to identify **who** authored **what** in a way that that information is conveniently accessible.

Credible licensing needs to identify **who** has a copyright to **what**, and under **which license** it is released, in a standard document.

- **Who**: all persons referenced in attributions or licenses - whether authors (`aut`), contributors (`ctb`), or other copyright holders (`cph`) - must be unambiguously identified. Since people's names are not unique, there is really only one good way to do this: associate everyone with their ORCID (Open Researcher and Contributor Identifier) ID. ORCID IDs are unique and stable. If you don't already have a (free!) [**ORCID ID**](https://orcid.org), now is a good time to get one - unless you don't identify as one who "participates in research, scholarship and innovation" at all. The common alternative of identifying persons by their e-mail is unique, but not stable. All authors and contributors are referenced in the `DESCRIPTION` file and the R packaging system uses standard methods to give credit. For details, in particular what the `aut` (author), `cre` (creator/maintainer), and `ctb` (contributor) roles mean, and which other fields might be important to you, see the [Package metadata chapter](http://r-pkgs.had.co.nz/description.html) in Hadley Wickham's book, and the [DESCRIPTION section](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#The-DESCRIPTION-file) of the CRAN "Writing R Extensions" manual.

- **What**: in any multi-author situation you need to specify exactly which files have been authored by whom. For **attribution**, add an `@author` tag to the Roxygen header of every source code item. For **licensing**, both the copyright and the licensed contents needs to be identified in the `LICENSE` file, and it must include the date (year), since copyright eventually expires. Yes, this is wordy and duplicates information. No, there's no obvious way to avoid that and still be compliant.

- **Which license**: There are many reasons to favour the MIT license over other FOSS licenses, `rptPlus` uses MIT. If you wish to use a different license, or need to include a different license because you are incorporating code that is differently licensed, then add the license, the contents it applies to, and the licensors' details into a clearly separated section of your LICENSE file.   

- **In practice**: I am the author (`aut`) and maintainer (`cre`) of the `rptPlus` package and this is reflected in the `DESCRIPTION` file. I have licensed `rptPlus` under the MIT license, and the MIT license requires that this information remains associated with the package. Therefore my information is listed both in the `DESCRIPTION` file, which feeds various mechanisms to document authorship, and the `LICENSE` file, which defines how others may modify, distribute and use the code. My package is however only a template for your own, you normally would not actually be _using_ the code I wrote. Therefore, the first thing you do is to add yourself as a `person`, and give yourself the `aut` and `cre` roles as author and maintainer, respectively. I am not a co-author even though I have contributed code initially: therefore my role changes to `ctb`. Over time you remove and replace my contributions with your own work, and at some point you can remove my attributions and copyright claims, while possibly adding attributions for other authors of code you use in your package, and collaborators. During this process, both the `DESCRIPTION` and the `LICENSE` file may contain more than one author and/or licensor. A common case is that you want to use a single function from a large package, or functions from a package that are not on CRAN. If this code is published under one of the FOSS licenses, you can simply copy the code, include it in your package, add the author to `Authors@R` - typically in a `ctb` role - and add their copyright information to the LICENSE file. Check the `DESCRIPTION` file, the `LICENSE` file, and the function headers for examples.

Having that considered, continue customising your files.

&nbsp;

#### `rptPlus.Rproj`

You already have a `<your-package-name>.Rproj` configuration file for RStudio in the main directory. You can either overwrite that with the options defined in `rptPlus.Rproj`, or set the options individually under **Tools** ▷ **Project options...** and delete `rptPlus.Rproj`. `rptPlus.Rproj` sets the following (significant) project options:

- A We **don't** save or restore the Workspace and we don't save History.<sup id="af3">[3](#f3)</sup> 
- B We use **two spaces** for indentation, not tabs.<sup id="af4">[4](#f4)</sup>
- C We use **UTF-8** encoding, always. There is no excuse not to.
- D The "BuildType" of the project is a **Package**. Once this is defined in the project options, the _Environment_ pane will include a tab for **Build** tools.

To implement these options:
- In the _Files_ pane, select `<your-package-name>.Rproj` and click on **Delete**.
- Select `rpt.Rproj` and **Rename** it to `<your-package-name>.Rproj`.
- Choose **File** ▷ **Recent Projects...** ▷ **&lt;your-package-name&gt;** and reload your project.

**Validate**

The _Environment_ pane should now have a **Build** tab.

&nbsp;

## 2.5 Save, check, commit, and push

It's time to complete the first development cycle: save, check, commit, and push to the `master` branch on GitHub.

1. **Save** all modified documents.
2. **Check** your package. Click on the **Build** tab, then click on the **Check** icon. This runs package checking code that confirms that all required files are present and correctly formatted, and all tests pass. See below.
3. Once your package check has passed without any errors, warnings or notes, click on the _Version control icon_ in the editor window menu and choose **Commit...**, or choose **Tools** ▷ **Version Control** ▷ **Commit...** from the menu.
4. In the version control window, check the box next to all changed files to "stage" them, enter "Initial Commit" as your "Commit message" and click **Commit**. 5. Click the green **Push** up-arrow to synchronize your local repository with GitHub.
6. Navigate to your GitHub repository, reload the page, and confirm that your edited files have arrived.


**Your package check must pass without errors, warnings or notes.** `rpt` passes the checks, and nothing you have done above should have changed this, if it was done correctly. Therefore something is not quite right if the checking code finds anything to complain about. Fix it now. You need a "known-good-state" to revert to, for debugging, in case problems arise later on.

**Validate**

Install your package from github and confirm that it can be loaded. In the console, type:

```R
devtools::install_github("<your-user-name>/<your-package-name>")
library(<your-package-name>)
citation("<your-package-name>")
?lseq
```

This should install your package, and load the library. Attaching the library runs the `.onAttach()` function in `./R/zzz.R` and displays the updated package name and authors.<sup id="af5">[5](#f5)</sup> The `citation()` function creates a package citation from information it finds in the `CITATION` file - we haven't updated that yet, so the .The final command accesses the help page for the `lseq()` sample function that came with `rptPlus`, via R's help system. By confirming that this works, you are exercising functionality that is specific to the way R loads and manages packages and package metadata, none of which would work from information that has merely been left behind in your Workspace during development.

&nbsp;

## 2.6 Configuring your enhanced modules

### 2.6.1 Development vs. deployment

You might want to work with a function that you use for development, but that should not become part of your deployed package. Or you might want to load packages to support your development needs that are not needed for your package functions. The `.Rprofile` file makes this easy: it can load libraries and `source()` files in your `./dev` directory, but it has been added to `.Rbuildignore` so it will not be included in your package. Indeed, `.Rprofile` should NOT be used to manage package behaviour. Package startup and unload behaviour is managed from `./R/zzz.R` instead.

For example, my [R style guide](http://steipe.biochemistry.utoronto.ca/abc/index.php/RPR-Coding_style) dictates that every source file needs to include a comment `# [END]` as the last line, to verify that the file has been completely transmitted whenever it is shared. Of course, this only works if **all** files follow this convention, if some are forgotten then those appear to be incomplete. Therefore I use a function `checkEnds()` which is defined in `./dev/checkEnds.R`. The function is `source()`ed from `.Rprofile` so I have it available when I am writing code, but it is not part of the actual package objectives so I don't deploy it in the package. Both the `./dev` directory and the `.Rprofile` file are mentioned in `.Rbuildignore`, so both are not included in the final package. 

This is especially useful for loading packages. Since I usually need to run checks for Bioconductor compatibility, I also load the `BiocCheck` package. That's convenient, but obviously does not need to be included in the package itself. Also, there are a number of `Suggests:` packages mentioned in the `DESCRIPTION` file. Since these are not required for the actual package function, the package installer does not download them. But we do need them e.g. for building a vignette. Thus we chack and warn from `.Rprofile` if they are not already present on your machine.

On startup, you will see a few messages about installed packages, these come from `.Rprofile`.

Verify that `checkEnds()` is listed as a function in your RStudio project's "Environment" pane. If it is missing, either you don't have an `.Rprofile` file, or something caused `source()`ing the file to be aborted during startup.

**To add this functionality to your package:**

- Keep the source code for any utility function that you use only for development to the `./dev` directory;
- add a line `source("./dev/<your-function>.R")` to `.Rprofile` for each such function to load it every time you open your project.
- add code to `.Rprofile` to load any library that is only needed for development.

**To remove this functionality from your package:**

- Comment out the contents of the `.Rprofile` file  - or
- delete the `.Rprofile` file and remove `^\.Rprofile$` from `.Rbuildignore`.

&nbsp;

### 2.6.2 `NEWS`

A `NEWS` file contains condensed information on significant changes to your code for every release. It is a standard convenience for users and a requirement of Bioconductor guidelines. CRAN allows a plain-text `./NEWS` or `./inst/NEWS` files or `./inst/NEWS.md` in markdown format (using [the **CommonMark** markdown specification](https://commonmark.org/)), but [Bioconductor requires](http://bioconductor.org/developers/package-guidelines/#news) release information to be provided in `./NEWS`.

**To keep this functionality in your package:**

- continuously edit `./NEWS` with your release information. It is good practice to [tag your releases](https://git-scm.com/book/en/v2/Git-Basics-Tagging) with `git`, then you can review your commit messages to figure out what was added when and condense that information into your `./NEWS` file. 

**Validate**
- In the **Build** pane, choose **More** ▷ **Clean and Rebuild**. Then  type `utils::news(package = "<your-package-name>")` into the console. Your `NEWS` file should open in the **Help** pane.

<!-- ToDo: once R 3.6 with the new tools functions has been released, update with validation: tools:::.build_news_db_from_package_NEWS_md("./inst/NEWS.md"). It's a good idea to be able to include references. -->

**To remove this functionality from your package:**

- Delete `./NEWS`.

&nbsp;

### 2.6.3 `CITATION`

Basic package citation information can be extracted from your `DESCRIPTION` file, but if a `CITATION` file is present, it supersedes the autogenerated information. You need a `CITATION` file if your package is published, for example if you submit your package to [Zenodo](https://zenodo.org/) (see under "Reproducible Research" below), or if your package forms part of a published manuscript, in both these cases your `CITATION` includes information that is not part of the package ` DESCRIPTION`. The sample file `./inst/CITATION` file contains two citations: one to the package's GitHub repository, the other to the archived Zenodo version (which includes a `doi:`), 

**To keep this functionality in your package:**

- edit `./inst/CITATION` with the citation information for your package. The `meta$` variables are populated from the `DESCRIPTION` file - don't hardcode, and don't use the output of `packageDescription()` instead - because that assumes the package has been installed. For valid `bibtype`s and entry fields, see the help page at `?bibentry`.

**To remove this functionality from your package:**

- Delete `./inst/CITATION`. In this case `citation("rptPlus")` will pull information from the `DESCRIPTION` file.

&nbsp;

### 2.6.4 Packaged Data Files 

`rptPlus` contains an example of exported data file, and an example of non-exported data.

#### 2.6.4.1 Exported Data

Exported data is kept in the `./data` directory as an `.RData` file. It is made available to the user through a `load` operation and then exists in the package namespace, much like the package's loaded functions. However, it also needs to be documented, and to produce the required documentation requires a file in the `./R` directory. To produce the file, create a file with a valid `Roxygen2` header, just like a function script, that describes the data. Name it with `<name-of-your-data-object>.R`, make sure you have an `@export` field. The actual script body is just a `NULL` statement.

**To use exported data in your package:**

This is the workflow I have used to create the exported genetic code dataset `rptGC`. Adapt it for your own purposes and copy/rename/edit `./R/rptGC.R`.

- Create the desired object in memory:
```R
nuc <- c("A", "G", "C", "T")
rptGC <- character()
for (c1 in nuc) {
  for (c2 in nuc) {
    for (c3 in nuc) {
      codon <- paste0(c1, c2, c3)
      rptGC[codon] <- Biostrings::GENETIC_CODE[codon]
    }
  }
}
```
- `save()` the object as one single object per file, named with the object name:
```R
save(rptGC, file="./data/rptGC.RData")
```
- describe the object in its associated file `./R/rptGC.R`. 

**Validate** Update the documentation to produce the `.Rd` file in the `./man/` directory, then re-build and re-install the package. Type:

``` R
?rptGC
```
... to open the help page, then try the examples.


**To remove exported data from your package:**

- Delete the `./data` directory;
- delete the example data description file `./R/rptGC.R`;
- delete `./man/rptGC.Rd`.


#### 2.6.4.2 Non-exported Data

**To use non-exported data in your package:**

Place non-exported data in `./inst/extdata`. You can access it with `system.file()`. For example I have provided `./inst/extdata/test-lseq.dat`, a text file that contains five numbers that are used in the test-code for the `lseq()` sample function, the test code fetches it with:
```R
system.file("extdata",
            "test-lseq.dat",
            package = "rptPlus",
            mustWork = TRUE)
```

Since such data files do not normally contain enough descriptive information, do yourself a favour and place the script that produced the dataset in `./inst/scripts`!

**To remove exported data from your package:**

- Delete the `./inst/extdata` directory. Warning: this will break the test for the `lseq()` function and your package check will fail. Do this only if you are removing the test as well.

&nbsp;

### 2.6.5 Adding a Vignette

Packages must contain documentation about the purpose of a package, what its use cases are and how they support the greater context of a user's needs. Simply collating the help files of a package's functions **is not credible documentation**. Great examples for vignettes are included with the `Rcpp` package. Vignettes are optional for CRAN packages, but required for Bioconductor. `rptPlus` contains a Bioconductor-compatible Vignette. It is built:

* using sources contained in the `./vignettes` folder,
* by including `knitr` in the `Suggests` and `VignetteBuilder` fields of the `DESCRIPTION` file;
* from R markdown code in the `./vignettes/rptPlusVignette.Rmd` file.

You can open the Vignette source in `./vignettes/rptPlusVignette.Rmd` and explore the syntax.

**To add a Vignette to your package:**

Follow this workflow to add a Vignette to your package:

1. Make a copy of `./vignettes/rptPlusVignette.Rmd` and edit it following the instructions in the Vignette itself. At first, edit only the header information and metadata, then continue with the installation steps below, to verify that you have a "known-good-state" to continue from. 
2. "knit" your Vignette with (`Cmd + Shift + K`, or by clicking the **Knit** icon at the top of the edit pane) to verify what you are doing, and/or check the result by pasting the URL to `knitr`'s output from the **R Markdown** tab of the console into your normal browser;
3. When you are satisfied with your Vignette, build it with `devtools::build_vignettes()`. This builds your Vignettes and the Vignette index, and moves the html output as well as a copy of the Vignette source into the `./doc` folder. (To repeat: you edit the source in the `./vignettes` folder, it gets built and distributed via the `./doc` folder.).

**Validate the Vignette Index**
`vignette(package = "rptPlus", lib.loc = "..")` opens the index in a viewer for the "local" library. It should contain the original `rptPlusVignette` and your own Vignette.

4. Install your package: in order for `browseVignettes()` or `vignette(<vignette-name>) to work, your package needs to be installed in the default R library path. You can do this by typing `devtools::install(build_vignettes = TRUE)` in the console. (**Note**: To properly build vignettes when installing from GitHub with `devtools::install_github()`, you need to turn the default `--no-build-vignettes` argument for the build options off. Issue the command: `devtools::install_github("<your-repository>", build_opts = c("--no-resave-data", "--no-manual"))`.<sup id="af6">[6](#f6)</sup>)

**Validate your Vignette installation**

All of the following should work:

- `vignette(package = "rptPlus")` opens the Vignette index viewer (pointed to the default R library path);
- `browseVignettes(package = "rptPlus")` shows vignettes of the package in your browser, clicking on HTML should load the Vignette;
- both `vignette(topic = "rptPlusVignette", package = "rptPlus")` and `vignette("rptPlusVignette")` should load the Vignette in the **Help** pane.

**Note:** one does not *package* a Vignette with the R package distribution, rather Vignettes are dynamically built after downloading the package. Thus it makes no sense to add the html-rendered Vignette to your `git` repository: on your local machine you are simply rendering the output of your `.Rmd` file, and the package user does not need it. Normally the directories `doc` and `inst/doc` are therefore mentioned in the `.Gitignore` file and not committed to your repository. However, I am committing an updated version of the Vignette from revision to revision, to hold the html file on GitHub so that users of the `rptPlus` package can preview the result. To view `.html` files from a GitHub repository, use the preview function at `https://htmlpreview.github.io/`: the `rptPlusVignette` page thus can be accessed at <http://htmlpreview.github.io/?https://github.com/hyginn/rptPlus/blob/master/doc/rptPlusVignette.html>. You might add `doc` and `inst/doc` to your `.Gitignore` file for your own development purposes however to keep the size of your local repository reasonably small.

**To remove Vignette support from your package**

- Delete the `./vignettes` folder and all of its contents;
- Delete any Vignette-related files from the `./doc` folder (remove it if it is empty);
- Remove from `.Rprofile` the functions checking for and loading:
    - `BiocManager`
    - `BiocStyle`
    - `knitr`
    - `rmarkdown`

- Modify the `DESCRIPTION` file as follows:

```diff
Suggests:
-    testthat,
+    testthat
-    BiocStyle,
-    knitr,
-    rmarkdown
```


### 2.6.6 Importing Bioconductor Packages

CRAN and Bioconductor are the two curated repositories from which we usually install trusted software. In the life-sciences world, we can't live without using both. However, while CRAN-hosted packages mentioned in the `Imports:` field of `DESCRIPTION` are automatically installed from CRAN, merely mentioning a Bioconductor package is not itself sufficient to install from Bioconductor. The trick to install them is surprising and simple: you merely need to add a [`biocViews:`](https://www.bioconductor.org/packages/devel/BiocViews.html) field to `DESCRIPTION`. Such a [field with keywords](https://bioconductor.org/developers/how-to/biocViews/) that define how a package fits into the Bioconductor project is required for all Bioconductor packages. But here we simply use it for its side-effect of directing the package installer to search Bioconductor as well as CRAN for packages, it is just a placeholder.


**To be able to import Bioconductor packages in addition to CRAN packages:**

- Leave the following line intact in `DESCRIPTION` (or [add to it](https://bioconductor.org/developers/how-to/biocViews/)) if you are actually developing a Bioconductor package).

```
biocViews: Software, Infrastructure
```


**To remove Bioconductor installation support:**

- Change the `DESCRIPTION` file as follows:

```diff
LazyData: true
-   biocViews: Software, Infrastructure
Imports:
-       Biostrings,
    shiny,
    Rcpp
LinkingTo: Rcpp
```

### 2.6.7 A Secure Approach to Credentials

Any software that needs to connect to private assets such as databases or restricted-access Websites, sooner or later needs login credentials in code. These are typically strings like username/password combinations, or access tokens. You **really** don't want those credentials to appear in plaintext on GitHub, for everyone to see, forever. Here is how to keep your secrets secret.

- **NEVER** put credentials in code that is under version control. Your credentials will be accessible from the git repository forever.
- **NEVER EVER** push code that contains credentials to GitHub. Your credentials will be publically accessible forever. There are bots that harvest AWS credentials and then rack up charges to the hapless user while mining bitcoin.
- **DON'T EVEN** type your credentials into the RStudio console during testing or whatever, they may remain visible in your `.RHistory` file.

The proper way to handle credentials from R scripts is to keep them in a separate file outside of your project directory: filenames `../.credentials` or `~/.credentials` are good choices. Load your secrets from a utility function at the moment they are needed. Your credentials file can be encrypted (see the further reading below), but it doesn't need to be, for general use cases. 

For example: I could use a `~/.credentials` file that is structured like this:

```
myAsset    dbadmin    quasitransconcillipurgination
myOtherAsset    testUser    ponytale
```

A function to get credentials could be published with my code: 
```r
getCredentials <- function(asset, getUser = FALSE, getPass = FALSE) {
  x <- readLines("~/.credentials")
  x <- x[grepl(asset, x)]
  x <- strsplit(x, "\\s+")[[1]][2:3]
  return(x[c(getUser, getPass)])
}
```

The function could be used in code like this:

```r
mydb <-  RMySQL::dbConnect(RMySQL::MySQL(),
                           user =     getCredentials("myAsset", getUser = TRUE),
                           password = getCredentials("myAsset", getPass = TRUE),
                           dbname = "myDBAsset")
```

Some more things I would consider:
- Don't rely on a `.gitignore` file to keep your secrets secret - it might inadvertently break.
- Dont use `.Renviron` for your secrets and load them with `Sys.getenv()`, the file might accidentally get posted.
- Don't keep your secrets in global options, you might inadvertently include them in a `save()`d `.RData` file.

For more in-depth discussion and alternatives:
- [Securely storing your secrets in R code](https://blog.revolutionanalytics.com/2015/12/securely-storing-your-secrets-in-r-code.html) (Andrie de Vries, 2015)
- [Managing secrets](https://cran.r-project.org/web/packages/httr/vignettes/secrets.html) (Hadley Wickham, `httr` Vignette)
- [Securing Credentials](https://db.rstudio.com/best-practices/managing-credentials/) (RStudio, Databases using R - Best Practices)

### 2.6.8 Compiled `C++` code

Using `C++` code in your package has been made easy with the `Rcpp` package. What you need to do is to run `Rcpp::sourceCpp("<your-function-name>.cpp")` to compile and link your code, and then call it with `cpp_<your-function-name>()`. However, *distributing* compiled `C++` code with your package is a bit more involved, you need assets that are included here:

* a `./src` directory to hold your `C++` sources;
* a `DESCRIPTION` file that includes the `Rcpp` package in the `Imports` field and has a `LinkingTo:` field that defines `Rcpp`;
* A script that contains the `Roxygen2` tags that cause information about linking behaviour to be added to the `NAMESPACE` file. Here it is `.R/rptPlus.R`; 
* a `.gitignore` file that removes binary intermediates from version control.

The source for a minimal sample function (`./src/codonSplitCpp,cpp`) is included and documented with the package framework, its use is demonstrated in the sample script `./inst/scripts/benchmarkCodons.R`. Once everything is set up, the process of compiling and linking the code is handled automaticaly by the RStudio build tools. Thus the development process is:

* write your source-code and save it in the `./src` directory;
* follow the header structure in the example, in particular note the roxygen-like comments that will get copied into the exported R file. If you don't have that, your function won't get exported.
* update the documentation to have `Roxygen2` update the `NAMESPACE` file (`Cmd + Shift + D`);
* reload the library, then check to make sure all is correct.

Additional reading:
* Hadley Wickham's "R-packages" chapter on [Compiled Code](http://r-pkgs.had.co.nz/src.html)
* Hadley Wickham's "Advanced R" chapter on [Rcpp](http://adv-r.had.co.nz/Rcpp.html)
* The vignettes that are distributed with the `Rcpp` package:
** `vignette("Rcpp-introduction")`
** `vignette("Rcpp-attributes")`
** `vignette("Rcpp-package")`

**To use C++ code in your package:**

Read Hadley Wickham's "R-packages" chapter on [Compiled Code](http://r-pkgs.had.co.nz/src.html). Then rename the files that are distributed with `rptPlus` to reflect your package name. Build, document and install. Then validate by working through `./inst/scripts/benchmarkCodons.R`. This brings you to a "known-good-state". After that, copy, edit and develop. Make sure to save frequently: bugs in your C++ code **will** crash your RStudio session.


**To remove C++ code support from your package:**

- Delete the `./src` directory and its contents;
- Edit the `DESCRIPTION` as follows:
```diff
Imports:
    Biostrings,
-      shiny,
-      Rcpp
+      shiny

-   LinkingTo: Rcpp

Suggests: ...
```

- Delete `.R/rptPlus.R` and `.R/RcppExports.R`. 


### 2.6.9 A Shiny App

Shiny apps are great for two purposes: as a part of package documentation they can give your (potential) user a hands-on view into what your package can do. And if you are supporting users who don't code, you can make the workflow of your package available through a GUI.


In order to distribute a Shiny app with your package:
* Add the `shiny` package as a dependency into the `DESCRIPTION` file. In `rptPlus` I have included `shiny` under the `Imports:` heading; in case you consider the functionality of your Shiny app to be optional, you can move it under the `Suggests:` heading.

* The package contains a folder `shiny-scripts` in the `./inst` folder. Put a folder for each shiny script of your package into that one. I have included a shiny app called `rptApp` in this template package. Find its associated files in `./inst/shiny-scripts/rptApp/`.

* There is a function called `runRptApp.R` in the `R` folder. All the function does is to launch the app (and provide a `Roxygen2` header for the man page.) To demo the app, type `runRptApp()`.

* This is only meant to provide a template for the general layout of files and functions in your package. For contents examples and code references see the [RStudio Shiny Tutorial](http://shiny.rstudio.com/tutorial/).

**To include a shiny app in your package:**

- Edit `./R/runRptApp.R`: 
    - change the function name `runRptApp` to `run<your-shiny-app-name>`.
    - change `package = "rptPlus"` in the `system.file()` call to `package = "<your-package-name>"`;
    - change `"rptApp"` in the `system.file()` call to `"<your-shiny-app-name>"`;
    - Also change all mentions of `rptPlus` in the header to `<your-package-name>`.
- Rename `./R/runRptApp.R` to `./R/run<your-shiny-app-name>.R`.
- Rename `./inst/shiny-scripts/rptApp` to `./inst/shiny-scripts/<your-shiny-app-name>`.

Check, build, document, and install.

**Validate** run `run<your-shiny-app-name>()` in the console. This should open the app in the viewer.

This is your "known-good-state". [Learn about shiny options](http://shiny.rstudio.com/tutorial/), develop, and save and test frequently. Note that a good purpose of your app is as a quickstart into your package's functions. Make sure you are loading defaults when the app loads so it shows something interesting, and explain your parameters, proposing reasonable defaults.


**To remove shiny support from your package:**

- Edit `./DESCRIPTION` as follows

```diff
Imports:
    Biostrings,
-    shiny,
    Rcpp
```
- Delete `./inst/shiny-scripts` and its contents
- Delete `./R/runRptApp`


### 2.6.10 Considerations for Reproducible Research

The label "Reproducible Research" summarizes best practice that derives from the principles of the _scientific method_. Even though this means different things to different scientists (see below), a broad consensus includes

- documenting **that** your analysis works;
- documenting **how** your analysis works; and
- documenting **why** your analysis works.

Building a package along the principles laid out in `rptPlus` supports these goals in multipe ways.

#### Documenting THAT your analysis works ...

This is the essential beginning: is your code **correct**, and is your analysis **valid**? Correct code can be supported by unit- and integration tests using the testing infrastructure mapped out in the package. Aim to cover all of your code with tests and test after every change. Keeping a tight link between writing tests and writing code goes a long way towards arriving at well structured, maintainable software; this principle has given rise to [test-driven development methods](https://en.wikipedia.org/wiki/Test-driven_development). Showing that the analysis is valid requires a bit more than showing that your code is correct. Essentially you need to minimally show that your analysis can recover the correct parameters from a dataset. Since the correct parameters are virtually never known in real-world examples, you **must** provide synthetic data, constructed with known properties. The package structure of `rptPlus` gives you 
- ways to document such data as internal and exported datasets, 
- a place to store the scripts that generate your data and your model analysis (in `./inst/scripts`),
- and a way to communicate this part of the analysis, in a Vignette.

#### Documenting HOW your analysis works ...

This is often taken to include exact reproducibility, but the importance of this may be overstated. Obviously the packages you import need to be explicitly defined. The command `sessionInfo()` in the Vignette documents the loaded packages and versions. If your package critically depends on the exact version of packages, consider using [`packrat`](https://rstudio.github.io/packrat/rstudio.html) for a distributable, self-contained, everything-included project. But it is more important to make it easy to understand what exactly you are doing. Having all the files available (the reason we build this package in the first place), and being able to document what change was made by whom at what time (that's why we use `git`) is a prerequisite. But that does not really explain how everything fits together. For this, a hierarchical approach will help, that combines a high-level summary (perhaps a shiny app or workflow diagram), a mid-level detailed description (in a Vignette or other `R markdown` "literate program"), and at the finest-level, the actual code that produced the analysis (in a script included in `./inst/scripts`). All of the code. **Releasing** your code snapshot in a known-good-state is a crucial part of the "how". E.g. you might release the project when a manuscript was submitted, or when revisions were accepted, as a [GitHub release](https://help.github.com/articles/creating-releases/) and/or deposit it on the excellent CERN-backed [**Zenodo**](http://help.zenodo.org/) platform.

Zenodo has the good side-effect of getting you a stable, citable `doi` for your package which makes it easy to include it in your professional CV. For detailed instructions how to connect your GitHub release to Zenodo, see [here](https://genr.eu/wp/cite/). In brief:
- link your GitHub account to Zenodo simply by logging into this [Zenodo page](https://zenodo.org/account/settings/github/) with your github account;
- once the accounts are linked, you will see a list of repositories you can deposit to Zenodo. Switch your project to "ON";
- on your Github project page, click on **releases** and on **Draft a new release**;
- enter your release information: this should be a "known-good-state", with an appropriate [semantic version number](https://semver.org/) (standard practice is `v1.0.0` for your first release), make sure the same version number appears in your `./DESCRIPTION`;
- Click on **Publish release**. This will make an archived version of the repository available on Github, and it will automatically upload to Zenodo.
- Back on Zenodo, refresh the list of repositories. Your linked repositories appear at the top of the list, and if a release has been deposited to Zenodo, a "doi badge" will appear with it.
- Click on the badge to obtain the `markdown` code for the badge. Put it into your `./README.md`. The badge will always link to the latest release, thus you don't need to update it.  
- Follow the link to your Zenodo record. It has a list of Versions in the sidebar. There is one `doi` which can link to all versions, and there is another `doi` for each specific version. You will probably want to put the "universal" `doi` into your `./inst/CITATION` file for the package itself, since it always links to the latest version. Specific citations, e.g. to manuscripts, get the `doi` for the version at the time of publication.
- Since you have made changes to `./README.md` and possibly other files, you need to create a maintenance release. Update `./DESCRIPTION` with a new version that simply increments the patch level (the last digit, eg. `v1.0.1`). Commit all your changes. **Push** to GitHub and create a new release, call it "Maintenance". You can _describe_ that you have added `doi` information. Then **Publish release**.

Your Zenodo record will now contain two releases with specific `doi`s, the latest release has the actual `doi` information that others can use, and your "doi badge" will link to the latest release. (Note: it might take a little while for the `doi` to get activated.) Everything is automatic from this point on.


#### Documenting WHY your analysis works ...

The "why" is the hardest part because it can't be expressed in schemata and templates. It is also the most important part of your documentation, the reason why your project exists in the first place. If your project is about analysis, you need to interpret the significance of what you found to your peers. If your project is about data, you need to outline the value of what can be discovered in the data to the potential analysts. If your project is about tools, you need to share your vision of what can be accomplished with it with your potential users. **Data does not explain itself. Analyses are not self-evident. Tools don't make insight dispensible.** Leaving a project at the state of the mere provision of resources is a wasted opportunity. But if you weave your vision throughout the structure of your package project, for yourself just as much as for your community, you contribute to the win-win proposition of reproducible, open science.

&nbsp;

# 3 Develop

You are done with configuring your project. `rptPlus` should have been transformed into your own package project, and your edits should have left it in a "known-good-state" to work from. 

- `rptPlus` passes `R CMD check` without errors, warnings or notes. 
- `BiocCheck` passes without errors, but warns about the presence of `set.seed()` in a function (this is an intentional use that is correct for the context), and that `Biostrings` is not included in NAMESPACE (that is intentional and correct for the context: `Biostrings` has been added to `Imports:` in the `DESCRIPTION` to verify that package installation from Bioconductor works. But the package does not need to be imported in a function. NAMESPACE is however autogenerated by `Roxygen2` and does not generate import statements for packages that are not imported in specific function headers.) `BiocCheck` also generates notes about long lines (these are in the vignette source and are appropriately formatted), and about 4-space indents (this is not the preferred, modern coding style).

**Check** your package frequently during development, and fix all errors right away. Package check errors have a way of interacting with each other that makes them hard to debug, it is best to address each one immediately when it occurs. Also, commit frequently and use meaningful commit messages. Your sanity will thank you. If you want to keep template files for reference, move them to the `./dev` directory so they will not be included in the package build. Finally, whenever you add new contents, reference it in the `LICENSE` file. Whenever you remove one of the original files, remove it from the `LICENSE` file. And whenever you modify a function, add your name to any existing authors.

&nbsp;

----
Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`
* Build Vignettes            `devtools::build_vignettes()`

&nbsp;

# 3.1 Update MD5

The home directory contains an MD5 file with the checksums of all packaged files. There is a script provided with the package to update this file. Open `.dev\makeMD5.R` and `source()` the script to load the function `makeMD5()`. Read what the function does. Then you should be able to simply type the following:

```R
makeMD5()
tools::checkMD5sums("", getwd())
```

The first command will generate the `./MD5` file that will be included with your package. The second command will return `TRUE` or tell you what went wrong. Everyone who downloads your package can then simply check the integrity of the files against your version before executing the code. However: there is one limitation. `tools::checkMD5sums()` will only check the files that are listed in `./MD5`. It will let you know if files are missing that are mentioned in `./MD5`. *But it will not complain if additional files have been added to your package.* 

&nbsp;

# 4 What's in the box ...

Here is a list of assets provided with `rptPlus` and why they are included. You can delete everything you don't need, but note: you can't push empty directories to your repository. Make sure you keep at least one file in every directory that you want to keep during development.
 
```
.gitignore                     <- defines files that should not be committed to the repository
.Rbuildignore                  <- defines files that should not be included in the package
.Rprofile                      <- optional: runs code during startup
data/rptGC.RData               <- optional: sample exported data set
DESCRIPTION                    <- the metadata file for your package
dev                            <- optional: see (Note 1)
dev/checkEnds.R                <- optional: see (Note 1)
dev/functionTemplate.R         <- optional: see (Note 1)
dev/makeMD5.R                  <- optional: see (Note 1)
dev/rptTwee.R                  <- optional: see (Note 1)
doc/                           <- compiled vignettes: autogenerated, don't edit
inst/                          <- optional: see (Note 2)
inst/CITATION                  <- optional: citation information for the package
inst/extdata/                  <- optional: see (Note 3)
inst/extdata/test-lseq.dat     <- optional: see (Note 3)
inst/scripts/                  <- optional: see (Note 4)
inst/scripts/benchmarkCodons.R <- optional: see (Note 4)
inst/scripts/scriptTemplate.R  <- optional: see (Note 4)
inst/shiny-scripts/rptApp/app.R <- optional: a shiny app
LICENSE                        <- License(s)
man/                           <- help files, generated by Roxygen2: don't edit
Meta/                          <- the Vignette database. Autogenerated, don't edit
NAMESPACE                      <- lists exported functions and data. Generated by Roxygen2: don't edit
NEWS                           <- optional: package release progress
R/                             <- Contains the code for exported functions
R/lseq.R                       <- a sample function
R/makeSeq.R                    <- a function used in the benchmarking sample script
R/RcppExports.R                <- autogenerated for compiled C++ code
R/rptGC.R                      <- documentation header sample for an exported data set
R/rptPlus.R                    <- documentation header to include compiled code directives in NAMESPACE
R/runRptApp.R                  <- function to run the sample shiny app
R/zzz.R                        <- three functions for package management
README.md                      <- see (Note 5)
rptPlus.Rproj                  <- project options. Rename to <your-package-name>.Rproj
src/                           <- optional: folder for C++ code
src/codonSplitCpp.cpp          <- a sample C++ program
src/RcppExports.cpp            <- autogenerated to link compiled code. Do not edit.
tests                          <- see (Note 6)
tests/testthat                 <- contains scripts for tests to be run
tests/testthat/helper-functions.R <- a helper function that infers the package name
tests/testthat/test_lseq.R     <- a test script for ./R/lseq.R
tests/testthat.R               <- the script that runs the tests
vignettes/rptPlusVignette.Rmd  <- the sample Vignette included with rptPlus

```

- **(Note 1)** The `./dev` directory. I use this directory to keep all files and assets that I need for development, but that should not be included and distributed in the final package. The directory is mentioned in `.Rbuildignore`. In `rptPlus` it contains `./dev/functionTemplate.R`, a template file for writing R functions with a Roxygen2 header, `./dev/rptTwee.R`, which was discussed above, `./dev/checkEnds.R` which scans R-scripts for `# [END]` markers, and `./dev/makeMD5.R` which produces your package MD5 file.

- **(Note 2)** The `./inst` directory. Files in this directory are installed, and end up one level "higher" after installation. E.g. the contents of `./inst/extdata` is in the folder `./extdata/` of an installed package.

- **(Note 3)** The `./inst/extdata` directory. This directory commonly contains "extra" data that is used in tests and examples. (Actual package data goes into a top-level `./data` directory and needs to be "exported".) Here it contains `inst/extdata/test-lseq.dat`, a sample data set used in the test for `lseq()`.

- **(Note 4)** The `./inst/scripts` directory. Many packages contain sample scripts in addition to the functions they share. Such  scripts go into this directory. `rptPlus` provides `./inst/scripts/scriptTemplate.R`, a template file to illustrate how to structure an R script and `./inst/scripts/benchmarkCodons.R` a benchmarking exercise sample script that includes the use of compiled  C++ code.

- **(Note 5)** The file you are reading is the `README.md` file for the `rptPlus` package. `README` files explain what a package (or directory) contains, `.md` is the extension for [markdown](https://guides.github.com/features/mastering-markdown/) formatted text files. Replace the contents of this file with your own (you can keep using the [original on GitHub](https://github.com/hyginn/rpt/blob/master/README.md) as a reference); a nice template for structuring a markdown file is [here](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).

- **(Note 6)** The `./tests` directory contains directories and assets for tests. For details see the [**Testing**](http://r-pkgs.had.co.nz/tests.html) chapter of Hadley Wickham's book. 

&nbsp;

----

# 5 FAQ

##### TBC
...

&nbsp;

# 6 Notes
- Syntax for footnotes in markdown documents was suggested by _Matteo_ [on Stackoverflow](https://stackoverflow.com/questions/25579868/how-to-add-footnotes-to-github-flavoured-markdown). (Regrettably, the links between footnote references and text don't work on GitHub.)

----

<b id="af1">1</b> A good way to begin your development journey is to build a minimal package based on [`rpt`](https://github.com/hyginn/rpt), and then extend the package with assets you find in `rptPlus` in the context of an actual project [↩](#a1).

<b id="af2">2</b> Empty repositories by convention have a `.git` extension to the repository name, repositories with contents have no extension: the name indicates the repository directory and that directory contains the `.git` file. Therefore your package should **NOT** be named `<package>.git` although links to your repository on GitHub seem to be correctly processed with both versions. For more discussion, see [here](https://stackoverflow.com/questions/11068576/why-do-some-repository-urls-end-in-git-while-others-dont) [↩](#a2)

<b id="af3">3</b> Among the R development "dogmas" that have been proven again and again by experience are:  "_Don't work in the console, always work in a script._" and "_Never restore old Workspace. Recreate your Workspace from a script instead._" Therefore my projects don't save history, and don't save (or restore) Workspace either. You don't have to follow this advice, but trust me: it's better practice. [↩](#a3)

<b id="af4">4</b> A commonly agreed on coding style is to use 80 character lines or shorter. That's often a bit of a challenge when you use spaces around operators, expressive variable names, and 4-space indents. Of those three, the 4-space indents are the most dispensable; using 2-space indents works great and helps keep lines short enough. There seems to be a recent trend towards 2-spaces anyway. As for tabs vs. spaces: I write a lot of code that is meant to be read and studied, thus I need more control over what my users see. Therefore I use spaces, not tabs. YMMV, change your Project Options if you feel differently about this. [↩](#a4)

<b id="af5">5</b> Displaying the startup message (as of this writing) works only once per session due to a long-standing bug in RStudio. (cf. [here](https://github.com/r-lib/devtools/issues/1442)). To display the message, choose **File** ▷ **Recent Projects...** ▷ **&lt;your-package-name&gt;** to reload your project, then type `library(<your-package-name>)` into the cosole. [↩](#a5)

<b id="af6">6</b>Caution: the parameters for `install()` and `install_github` are surprisingly different. See [here](https://github.com/r-lib/devtools/issues/1896).[↩](#a6)

&nbsp;

# 7 Further reading

**R packages**
- [Hadley Wichham's **R Packages** book](http://r-pkgs.had.co.nz/)
- The [**CRAN** manual on writing R-extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)
- The [**Bioconductor** package guidelines](https://www.bioconductor.org/developers/package-guidelines/)

**Development**
- [**Writing good software** (software carpentry)](http://swcarpentry.github.io/r-novice-gapminder/16-wrap-up/index.html)

**Reproducible Research**
- The [**rOPenSci** project](https://ropensci.org/) 
- The [**rOpenSci project's** package collection](https://ropensci.org/packages/) 
- The excellent [rOpenSci **reproducibility guide** ](https://ropensci.github.io/reproducibility-guide/) 
- The [**Software Carpentry** project](https://software-carpentry.org/)
- The [**FAIR** data management principles](https://www.nature.com/articles/sdata201618) 
- PLOS Computational Biology: Ten simple rules [**... for Reproducible Computational Research**](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285) (2013)

&nbsp;

# 8 Acknowledgements

Thanks to my students, especially the BCB410 (Applied Bioinformatics) class of 2018, whose hard work on R packages revealed the need for this template. [Yi Chen](https://orcid.org/0000-0003-1624-2760)'s careful proofreading helped make many points more specific. 

&nbsp;

&nbsp;

<!-- END -->
