Peer-graded assignment, getting and cleaning data course project

--Study design--
The data was collected through experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years-old. Each person performed six types of activity (i.e. walking, walking upstairs, walking downstairs, sitting, standing, and laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration (tAcc-XYZ) and 3-axial angular velocity (tGyro-XYZ) at a constant rate of 50Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
These signals were used to estimate variables of the feature vector for each pattern*:  
•	tBodyAcc-XYZ
•	tGravityAcc-XYZ
•	tBodyAccJerk-XYZ
•	tBodyGyro-XYZ
•	tBodyGyroJerk-XYZ
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag
* Prefixes 't' and 'f' to denote time and frequency domain signals respectively.

A video of the experiment including an example of the 6 recorded activities with on of the participants can be seen in the following link: https://www.youtube.com/watch?v=XOEN9W05_4A

**Code book**
The set of variables that were estimated from these signals are:
•	mean(): Mean value
•	std(): Standard deviation
•	mad(): Median absolute deviation 
•	max(): Largest value in array
•	min(): Smallest value in array
•	sma(): Signal magnitude area
•	energy(): Energy measure. Sum of the squares divided by the number of values. 
•	iqr(): Interquartile range 
•	entropy(): Signal entropy
•	arCoeff(): Autorregresion coefficients with Burg order equal to 4
•	correlation(): correlation coefficient between two signals
•	maxInds(): index of the frequency component with largest magnitude
•	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
•	skewness(): skewness of the frequency domain signal 
•	kurtosis(): kurtosis of the frequency domain signal 
•	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
•	angle(): Angle between to vectors.
