Coursera::DataScience::GettingData course project
========================================================
yuriyo,2014

Course project requirements


```{r}
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

```

Steps that are need to do for using script


```{r fig.width=7, fig.height=6}
1. Download data files and unzip them
2. Locate source code scripts .R into one folder
3. Configure defaults.R parameters
  - `datapath` is required to be configured correctly to data files location
  - all other paramters can be used defaults, if you don''t change file names
4. setwd to source folder with R scripts
5. run script with `source("run_analysis.R")`

Result stored into configured `file.output` file name. Default to `tidydata.txt`
```

Dependencies
```{r}
R : >2.0.0
R used during development : 3.1.0
  
  
Packages: plyr

Data files: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

```
