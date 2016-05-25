## Introduction

The script run_analysis.R utilizes the UCI HAR Dataset to create a tidy dataset describing the mean value of a set of 66 variables by group, which is defined by subject number and activity level.  For each of the 180 groups, the average of each of 66 variables is reported in a text file named "AvgHARData.txt".

## Requirements

To run the script, you need the unzipped UCI HAR Dataset in your working directory.  Additionally, the package plyr must be installed for proper analysis.

## Output

The script run_analysis.R will output a text file named "AvgHARData.txt", separated by spaces, which contains 180 rows and 68 columns.  The rows correspond to groups, which are a combination of subject number and activity level.  The other 66 variables are defined in the Codebook.md.