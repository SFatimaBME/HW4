library(dplyr)
#use this library from class lectures 

#Summary of the data:
#total 30 volunteers 
#perfomred 6 activities 
#measured 3 axial linear accelleration and velocity 
#2 total data sets : in two different data sets 
#training set 70% of the sample 
#test set 30 % of data 

#LOAD YOUR DATA INTO R TO START: using read.table() STORE INTO VARIABLES 

#load TRAINING data both the X and Y
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#load TEST data both the X and Y 
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#load data description variables + activity labels and store into 
#the descriptive variable names 
varNames <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#MERGE the training and the test sets to create one data set.using the 
#rbind(), that combines the data frames by the rows so its keeping 
#measurements in the right coloumn but just putting data for all 30 
#volunteers in one table 
Xtotal <- rbind(Xtrain, Xtest)
Ytotal <- rbind(Ytrain, Ytest)
Sub_total <- rbind(Sub_train, Sub_test)

#ECTRACT  mean and standard dev by using the grep() that pulls the parts
#that are tagged as the mean and std frm the data sets 
selectVar <- varNames[grep("mean\\(\\)|std\\(\\)",varNames[,2]),]
Xtotal <- Xtotal[,selectVar[,1]]

#descriptive activity for the variables are labled 
colnames(Ytotal) <- "activity"
Ytotal$activitylabel <- factor(Ytotal$activity, labels = as.character(activity_labels[,2]))
activitylabelYtotal <- Ytotal[,-1]

#label data set with descriptive names in variables 
colnames(Ytotal) <- varNames[selectVar[,1],2]

#generate a tidy data set with the average of each activity and subject variable 
#so its a neat summary of the data without the individual data values 
colnames(Sub_total) <- "subject"
total <- cbind(Xtotal, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset /tidydata.txt", row.names = FALSE, col.names = TRUE)
 
