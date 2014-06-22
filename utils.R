#######################################################################################
# 
# coursera::datascience::gettingdata course
#
# suplementary utils and common functions
#
# 06/22/2014
# @yuriyo
#
#######################################################################################

# Function:
# load full data set into list of objects
#
# param: features - vector characters names of features 
# param: dataset - dataset suffix to build filename for readig data files
# param: file.x  - filename of x subset of data with substition of variable parameters, when they used
# param: file.y  - filename of y subset of data. substited with variable parameters
# param: file.subject - filename of subset of subject data. substituted
#
# substitute parameters:
#    $dataset$ - data set parameter to the function
#
# Returns: data.frame of variables combined to full data set ( subject, activity, data )
#
loadData <- function( dataset, features,
                     file.x="$dataset$/X_$dataset$.txt", 
                     file.y="$dataset$/y_$dataset$.txt", 
                     file.subject = "$dataset$/subject_$dataset$.txt") {
  # do substitution of parameters
  file.x <- gsub("$dataset$",dataset, file.x, fixed=TRUE)
  file.y <- gsub("$dataset$",dataset, file.y, fixed=TRUE)
  file.subject <- gsub("$dataset$",dataset, file.subject, fixed=TRUE)
  
  # read files with corresponding types and names
  cols <- ifelse(features == "NULL", "NULL", "numeric")
  data.x <- read.table(file.x, col.names=features, check.names=FALSE, colClasses=cols)
  data.y <- read.table(file.y, sep = " ", col.names=c("activityCode"), colClasses="numeric")
  data.subject <- read.table(file.subject, sep = " ", col.names=c("subject"), colClasses="numeric")
  
  # combine into one dataset
  data <- cbind( data.subject, data.y, data.x)
  
  # result
  data
}