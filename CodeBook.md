Codebook 
========

Data source
-----------

Raw data are obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The dataset contains data from experiments carried out with a group of 30 volunteers wearing Samsung Galaxy smartphone with embedded accelerometer, capable of capturing 3-axial linear acceleration and 3-axial angular velocity. The experiment was video-recorded and data were manually labeled. The dataset was diveded into 2 parts - training and test data, which are situated in  test and train folders of the archive. Only files 
subject_test.txt, X_test.txt, y_test.txt from those folders were used to produce tidy dataset.
Dataset variable values were normalized, so there is no unit of measure.
File activity_labels.txt contains the codes of activities which are used in y_test.txt files.


Feature Selection
-----------------
README.txt, features.txt and features_info.txt in [dataset archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) contain detailed description of source dataset variables and their meaning. 

According to assignment, only the measurements on the mean and standard deviation were extracted:

* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()       
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()         
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAccMag-mean()
* fBodyAccMag-std()          
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()  
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()     
* fBodyBodyGyroJerkMag-mean() 
* fBodyBodyGyroJerkMag-std() 


Transformations
---------------

In order to get tidy dataset, files subject_test.txt, X_test.txt and y_test.txt in test and train folders were binded together.

Descriptive variable names were assigned to combined dataset columns based on feature.txt file:
* Time.Domain.Body.Acceleration.Magnitude.Mean
* Time.Domain.Body.Acceleration.Magnitude.Standard.Deviation
* Time.Domain.GravityAcceleration.Magnitude.Mean
* Time.Domain.GravityAcceleration.Magnitude.Standard.Deviation
* Time.Domain.Body.Acceleration.Jerk.Signal.Magnitude.Mean
* Time.Domain.Body.Acceleration.Jerk.Signal.Magnitude.Standard.Deviation
* Time.Domain.Body.Gyroscope.Magnitude.Mean
* Time.Domain.Body.Gyroscope.Magnitude.Standard.Deviation
* Time.Domain.Body.Gyroscope.Jerk.Signal.Magnitude.Mean
* Time.Domain.Body.Gyroscope.Jerk.Signal.Magnitude.Standard.Deviation
* Fast.Fourier.Transformation.Body.Acceleration.Magnitude.Mean
* Fast.Fourier.Transformation.Body.Acceleration.Magnitude.Standard.Deviation
* Fast.Fourier.Transformation.Body.Acceleration.Jerk.Signal.Magnitude.Mean
* Fast.Fourier.Transformation.Body.Acceleration.Jerk.Signal.Magnitude.Standard.Deviation
* Fast.Fourier.Transformation.Body.Gyroscope.Magnitude.Mean
* Fast.Fourier.Transformation.Body.Gyroscope.Magnitude.Standard.Deviation
* Fast.Fourier.Transformation.Body.Gyroscope.Jerk.Signal.Magnitude.Mean
* Fast.Fourier.Transformation.Body.Gyroscope.Jerk.Signal.Magnitude.Standard.Deviation

From intermediate dataset aggregated data set was produced, which contains averaged variable values for each activity and each subject.

The aggregated dataset was written to result.txt file with header line by write.table function without row numbers.

