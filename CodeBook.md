# code book for run_analysis.R #
######This code book describes the variables, the data, and any transformations or work that I performed to clean up the data ######

DataSet:
* test
	1. **testSubjectData**: dataset loaded from *subject_test.txt* with subject variable name defined as **subjectID**
	2. **testXData**: dataset loaded from *X_test.txt*
	3. **testYData**: dataset loaded from *Y_test.txt* with activity variable name definded as **activityID**
	4. **testData**: merged dataset with **testSubjectData**, **testXData**, and **testYData**
* train
	1. **trainSubjectData**: dataset loaded from *subject_train.txt* with subject variable name defined as *subjectID* 
	2. **trainXData**: dataset loaded from *X_train.txt*
	3. **trainYData**: dataset loaded from *Y_train.txt* with activity variable name definded as **activityID**
	4. **trainData**: 
	
Variables:
	1. numFeature: total number of features
	
