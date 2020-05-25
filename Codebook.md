This is a codebook for Getting and Cleaning Data course project. The output of this project is a tidy data set stored in a file named TidyDataSet.txt.

You should create one R script called run_analysis.R that does the following.



3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


1. Merges the training and the test sets to create one data set.


2. Extracts only the measurements on the mean and standard deviation for each measurement

ExtractData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, codeand the measurements on the mean and standard deviation (std) for each measurement.


3. Uses descriptive activity names to name the activities in the data set

Entire numbers in code column of the ExtractData replaced with corresponding activity taken from second column of the activities variable.


4. Appropriately labels the data set with descriptive variable names

"Acc"  in column’s of Tidy replaced by Accelerometer
"Gyro" in column’s of Tidy  replaced by Gyroscope
"Mag" in column’s of Tidy  replaced by Body
"^t"   in column’s of Tidy  replaced by TimeDomain
"^f"   in column’s of Tidy  replaced by FrequencyDomain
"BodyBody"  in column’s of Tidy  replaced by Body
"tBoby" in column’s of Tidy  Timebody
"angel" in column’s of Tidy Angle
"gravity"  in column’s of Tidy Gravity

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


Export Tidt into Tidy.txt file.
 
