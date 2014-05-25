#-- COURSE:     COURSERA : GETTING & CLEANNING DATA
#-- CREATED:    2014-05-22 21:22:40 EDT
#-- UPDATED:		
#-- PROGRAMMER:		BERTRAM LEVELS (BLL)
#-- COMPANY:		
#-- APPLICATION:	R STUDIO
#-- DESCRIPTION:	  
#-- SYSTEM:         WINDOWS 7 64BIT
#--  	PLATFORM       X86_64-W64-MINGW32          
#--		ARCH           X86_64                      
#--		OS             MINGW32                     
#--		SYSTEM         X86_64, MINGW32             
#--		STATUS                                     
#--		MAJOR          3                           
#--		MINOR          0.3                         
#--		YEAR           2014                        
#--		MONTH          03                          
#--		DAY            06                          
#--		SVN REV        65126                       
#--		LANGUAGE       R                           
#--		VERSION.STRING R VERSION 3.0.3 (2014-03-06)
#--		NICKNAME       WARM PUPPY   


##-- VERSION HISTORY --##
##--       XX.XXX      YYYYMMDD  Author   Description
#     ver<-"01.000"   #:20140522 (BLL)  initial version, framework

#if(!file.exists("./data")){dir.create("./data")}
#fileUrl ="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destfileName <- "./data/uichar.zip"
#download.file(fileUrl,destfile=destfileName)

# Merges the training and the test sets to create one data set.

  
# Set Home Directory
homeDir <-"UCI HAR Dataset"
trainDir <-"train"
xTrain <- "./train/X_train.txt"
testDir <- "test"
# Read Features
wd <- paste("./data",homeDir,sep="/")
setwd(wd)

# Read Column Names
col_names <-unlist(read.table("features.txt")[,2])
# Determine columns based on "mean" or "std"
columns <-c(grep(glob2rx('*mean*'),col_names, grep(glob2rx('*std*'),col_names)))

# Read Activities index
activity_indx <-read.table("activity_labels.txt", col.names=c("ID","ACTIVITY"))
# Read Train Activities
activities <-read.table("./train/y_train.txt",col.names="ID")

#Read Train Subjects
s <- read.table("./train/subject_train.txt", col.names="Subject")
# Merge Train Activities to Activity Index
t <-merge(activities, activity_indx, by="ID")

# Read & Merge Train data
tTrain <-read.table("./train/X_train.txt",header=FALSE,col.names=col_names)[columns]
tTrain <-cbind(t,tTrain)
tTrain <-cbind(s,tTrain)


# Read Test Activities
activities <-read.table("./test/y_test.txt",col.names="ID")
#Read Test Subjects
s <- read.table("./test/subject_test.txt", col.names="Subject")
# Merge Test Activities to Activity Index
t <-merge(activities, activity_indx, by="ID")

# Read & Merge Test data
tTest <-read.table("./test/X_test.txt",header=FALSE,col.names=col_names)[columns]
tTest <-cbind(t,tTest)
tTest <-cbind(s,tTest)


rm(s,t,col_names,columns,activity_indx,activities)
# Merge two data set Train & Test
t <-merge(tTrain, tTest,all.x=T, all.y=T)

require(reshape2)
t<-melt(t,id=c("Subject","ACTIVITY"))
t<-dcast(t, Subject + ACTIVITY ~ variable,mean)
write.csv(t,"Output.csv")



