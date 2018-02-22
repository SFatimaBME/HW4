# HW4
homework 4 script
Summary of the experiment & data 
total 30 volunteers 
perfomred 6 activities 
measured 3 axial linear accelleration and velocity 
2 total data sets : in two different data sets 
training set 70% of the sample 
test set 30 % of data 

used the dplyr library from class lectures 
1. load your data into R using read.table() store into variables  
a. load TRAINING data both the X and Y
b. load TEST data both the X and Y 

2. load data description variables + activity labels and store into the descriptive variable names 

3. MERGE: the training and the test sets to create one data set using the rbind(), that combines the data frames by the rows so its keeping measurements in the right column but just putting data for all 30 volunteers in one table 

4. EXTRACT: mean and standard dev by using the grep() that pulls the parts that are tagged as the mean and standard deviation from the data sets 

5. descriptive activity for the variables are labeled and label data set with descriptive names in variables 

6. generate a tidy data set with the average of each activity and subject variable so it’s a neat summary of the data without the individual data values 

