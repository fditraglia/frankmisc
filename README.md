frankmisc
=========

An R package containing miscellaneous functions that I use all the time.

This is my first attempt to create an R package after many shameful years spent cutting and pasting. This is still a work in progress since I'm still a beginner at creating R packages, but it's not as difficult as I thought it would be. 

##References
I was inspired to try this out after reading a post on [Hilary Parker's blog](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/). Two other valuable resources for R package creation are Hadley Wickham's [Advanced R Programming]("http://adv-r.had.co.nz/") and the documentation for [roxygen2]("https://github.com/klutometis/roxygen#roxygen2"). One of these days I'm going to get around to reading the definitive documentation contained in [Writing R Extensions]("http://cran.r-project.org/doc/manuals/R-exts.html#Creating-R-packages").

##Package Workflow
The basic workflow for creating and updating a package is as follows. If they're not installed already, install the packages `devtools` and `roxygen2` and then load them
```
install.packages("devtools")
library("devtools")
devtools::install_github("klutometis/roxygen")
library(roxygen2)
```
To create a new package in a new directory do the following:
```
setwd("parent_directory")
create("your_package_here")
```
This creates a number of files and directories. One of them is the R directory. Put your R code here, and see the `roxygen2` help files for how to add documentation comments. To process the documentation, go to the package directory and run the command `document()`
```
setwd("./your_package_here")
document()
```
To install the package, go the the *parent directory* and use the `install` command
```
setwd("parent_directory")
install("your_package_here")
```
To install directly from a Github repo, do the following:
```
install_github("your_package_here", "github_username")
```
For example, to install `frankmisc` make sure that `devtools` is loaded and then run
```
install_github("frankmisc", "fditraglia")
```
Finally, use `library` as per usual to load the package.
```
library(frankmisc)
```

##Mistakes I made and things I'm still trying to figure our
I initially failed to include an `@export` statement in the `roxygen2` documentation comments. Without this, I was able to install the package locally, but installed from Github only allowed me to view the documentation: the functions themselves couldn't be found. Then I started getting this weird error:
```
Error in fetch(key) : lazy-load database '�' is corrupt
```
Still not sure what's going on. See [here]("https://support.rstudio.com/hc/communities/public/questions/200477576-Strange-interaction-between-devtools-and-my-own-package") and [here]("http://stackoverflow.com/questions/18080303/rd-files-with-different-encoding")
Aha! It seems that you have to restart R if you want to run the command `install` again. After re-starting, everything just worked. Not sure exactly why.