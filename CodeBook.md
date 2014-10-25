# Code book for run_analysis.R written on Oct 26, 2014 #
##This code book describes the variables, the data, and any transformations or work that I performed to clean up the data ##

###### Dataset uploaded as a txt file: *avrSubjectActivity.txt* with header but without row names for course project #######
Dataset is a tidy data set with the average of each variable for each activity (total 6 activitities) and each subject (total 30 subject).
* dataset has total 563 variables with subject, activity and 561 features
* dataset has total 180 records capture average measurement for combination of 6 activities and 30 subjects :walking: :running:

###### Step 1 ######
DataSet:
* test
	1. **testSubjectData**: dataset loaded from *subject_test.txt* with subject variable name defined as **subjectID**
	2. **testXData**: dataset loaded from *X_test.txt*
	3. **testYData**: dataset loaded from *Y_test.txt* with activity variable name definded as **activityID**
	4. **testData**: cbind dataset with **testSubjectData**, **testXData**, and **testYData**
* train
	1. **trainSubjectData**: dataset loaded from *subject_train.txt* with subject variable name defined as **subjectID** 
	2. **trainXData**: dataset loaded from *X_train.txt*
	3. **trainYData**: dataset loaded from *Y_train.txt* with activity variable name definded as **activityID**
	4. **trainData**: cbind dataset with **trainSubjectData**, **trainXData**, and **trainYData**
	
* All
	1. **totalData**: rbind datset with **testData** and **trainData**	

###### Step 2 ######	
DataSet:
* Other
	1. **feature**: dataset loaded from *features.txt*
	
Variables:
* Related with dataset dimensions
	1. **numFeature**: total number of features
	2. **featureNames**: all feature names 
	3. **meanFeatures**: Extract feature names have "mean()", later on meanFreq features need to be removed
	4. **meanfreqFeatures**: Extract feature names have "meanFreq"
	5. 
	
