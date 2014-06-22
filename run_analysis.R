#######################################################################################
# 
# coursera::datascience::gettingdata course
#
# Course project:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
# 06/22/2014
# @yuriyo
#
#######################################################################################

# initialization
library(plyr)
WD <- getwd()
source("utils.R")

# read default setting using external script
# all project setting must be changed in defaults.R script using options mechanism
# see @getOption, @options
source("defaults.R")
config <- getOption("analysis")
#
setwd(config["datapath"])
#
# Merges the training and the test sets to create one data set
#

# read
# features list
# Extracts only the measurements on the mean and standard deviation for each measurement.
data.features <- read.table(config["file.features"], 
                            colClasses=c("NULL", "character"), col.names=c("NULL","feature"))
# remove non mean and std measurements
data.features[grep("(mean|std)", data.features$feature, invert=TRUE),"feature"] <- "NULL"

# read activity as list
data.activity <- read.table(config["file.activity_label"], 
                            colClasses=c("numeric", "character"), col.names=c("activityCode","activityName"))

# read sets of data
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# from features names list
# test
data.test <- loadData(config["set.test"], unlist(data.features))
# train
data.train <- loadData(config["set.train"], unlist(data.features))

# merge into one
data.full <- rbind(data.train, data.test)

rm(data.test)
rm(data.train)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
data.tidy <- ddply(data.full, .(subject, activityCode), numcolwise(mean))

# add activityname to frame
data.tidy$activityName <- data.activity[data.tidy$activityCode,]$activityName

# store tidydata file
write.csv(data.tidy, "tidydata.txt", row.names = FALSE)

# finalize script, restore all paths, ...
setwd(WD)