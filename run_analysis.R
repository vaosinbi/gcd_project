# source file url
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# download file using curl because of https
download.file( file_url, destfile="./data/datasets.zip", method="curl")

# keep download datetime of dataset 
download_date <- date()

unzip ("./data/datasets.zip")

# set data path
path <- "./UCI HAR Dataset"

# set working directory to data path
setwd (path)

# read feature list
df_features <- read.table( "features.txt", col.names = c("id","name"))

# read activity labels
df_activity_labels <- read.table("activity_labels.txt", col.names = c("id","name"))

# read test data
df_X_test <- read.table("./test/X_test.txt")

# read test labels
df_y_test <- read.table("./test/y_test.txt", col.names = c("activity_type"))

# convert to factor
df_y_test$activity_type <- factor(df_y_test$activity_type, levels = df_activity_labels$id, labels=df_activity_labels$name)

# read test subjects
df_subject_test <- read.table("./test/subject_test.txt", col.names = c("subject"), colClasses=c("factor"))

# combine test dataset
df_test <- cbind(df_X_test, df_y_test, df_subject_test)


# read train data
df_X_train <- read.table("./train/X_train.txt" )

# read train labels
df_y_train <- read.table("./train/y_train.txt", col.names = c("activity_type"))

# convert to factor
df_y_train$activity_type <- factor(df_y_train$activity_type, levels = df_activity_labels$id, labels=df_activity_labels$name)

# read train subjects
df_subject_train <- read.table("./train/subject_train.txt", col.names = c("subject"), colClasses=c("factor"))

# combine train dataset
df_train <- cbind(df_X_train, df_y_train, df_subject_train)

# rowbind
df_comb_data <- rbind(df_test, df_train)

# extract only the features which ends with mean() and std() 
eligible_features <- as.vector ( df_features$id[ grep("mean[(][)]$|std[(][)]$", df_features$name)] )

filtered_dataset <- df_comb_data[, c(eligible_features, 562, 563)] 

feature_descriptions <-
    gsub("^t", "Time.Domain." ,
    gsub("^f", "Fast.Fourier.Transformation.",
    gsub("Gyro", "Gyroscope.", 
    gsub("Acc","Acceleration.",
    gsub("Mag", "Magnitude.",
    gsub("[-]std[(][)]", "Standard.Deviation",
    gsub("[-]mean[(][)]", "Mean",
    gsub("Jerk", "Jerk.Signal.",
    gsub("Body(Body)?","Body.",
         df_features$name[eligible_features])))))))))

# change variable names to extended description
names(filtered_dataset) <- c(feature_descriptions,"Activity.Type","Subject.No")

# Calculate average values of all variables grouped by activity and subject
agg_result <- aggregate(filtered_dataset[,feature_descriptions], by = filtered_dataset[c("Activity.Type","Subject.No")], FUN = mean)
    
# write aggregated dataset to file
write.table(x=agg_result, file="./../result.txt", row.names=F)
