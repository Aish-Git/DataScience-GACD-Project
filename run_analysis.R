process_data <- function(working_dir=getwd(), data_root_dir="UCI HAR Dataset") {
  # -------------------------------------------
  # Getting and Cleaning Data - Course Project
  # Aish Varadhan, July 17, 2015
  # -------------------------------------------
  
  # load all required libraries
  library(stringr) 
  library(dplyr)
  
  # Check to see if default of current working dir is overridden by specifying a NULL arg
  if (str_trim(str_length(working_dir),side = "both") == 0) {
    return("ERROR!Invalid working directory or valid directory not specified")
  }
  
  # Assign vars for test and train data dirs
  root_dir <- getwd()
  test_dir <- paste(working_dir,data_root_dir,"test", sep = "/")
  train_dir <- paste(working_dir,data_root_dir,"train", sep = "/")
  
  # Read all the column names from root/features.txt - 1st column is row num (or col num in data set) and 2nd is var name or col name
  print("Extracting information on features from ~\features.txt")
  features <- read.table(paste(working_dir,data_root_dir,"features.txt",sep = "/"))
  
  # Extract only mean and std i.e. filter where 2nd column contains mean() and std()
  print("Finalizing feature list based on mean() and std() variables only")
  features_mean <- filter(features, grepl("mean()",V2))
  features_std <- filter(features, grepl("std()",V2))
  
  # rbind mean and std together and offset col num by 2
  features_meanstd <- rbind(features_mean,features_std)
  features_meanstd <- mutate(features_meanstd,V1=V1+2)
  #print(features_meanstd)
  
  # Since we need to account for the 1st two columns in the data set to be Subject & Activity, add these
  # to the features_meanstd data frame as a set of all columns. Also offset the 1st col by 2 i.e. add 2 as Subject and Activity
  # are first and 2nd columns
  tmp_Subject <- data.frame(1,"Subject")
  names(tmp_Subject) <- c("V1","V2")
  tmp_Activity <- data.frame(2,"Activity")
  names(tmp_Activity) <- c("V1","V2")
  features_meanstd <- rbind(tmp_Subject,tmp_Activity,features_meanstd)
  #print(features_meanstd)
  
  # Read the subject, Activity and X_* data for train and  test independently
  print("Extracting information on activity labels from ~\activity_labels.txt")
  activity_data <- read.table(paste(working_dir, data_root_dir, "activity_labels.txt", sep = "/"))
  # Change column headers for later join with master_data_meanstd
  names(activity_data) <- c("Activity","Activity_Label")
  
  # Read test data and combine subject information and activity information
  print("Loading test data X_test.txt and merging with subject_test.txt and y_test.txt")
  test_data <- cbind(
    read.table(paste(test_dir,"subject_test.txt", sep = "/")),
    read.table(paste(test_dir,"y_test.txt", sep = "/")),
    read.table(paste(test_dir,"X_test.txt", sep = "/"))
  )
  
  # Read train data and combine subject information and activity information
  print("Loading train data X_train.txt and merging with subject_train.txt and y_train.txt")
  train_data <- cbind(
    read.table(paste(train_dir,"subject_train.txt", sep = "/")),
    read.table(paste(train_dir,"y_train.txt", sep = "/")),
    read.table(paste(train_dir,"X_train.txt", sep = "/"))
  )
  
  # Merge the test and train data sets
  print("Merging test and train data sets")
  master_data <- rbind(test_data,train_data)
  
  # Subset the data based on features_meanstd$V1 (col numbers) to only get mean and std measurements
  print("Subsetting merged data set by features for mean() and std() measurements")
  master_data_meanstd <- master_data[,features_meanstd$V1]
  
  # Assign colnames to master_data_meanstd based on features_meanstd$V2
  colnames(master_data_meanstd) <- features_meanstd$V2
  
  # Use descriptive names for activity by joining with master_data_meanstd with activity_data$Activity
  print("Preparing merged data set with descriptive activity labels")
  master_data_meanstd <- master_data_meanstd %>% left_join(activity_data, by = "Activity")
  
  # Mutate the data set to replace Activity by Activity_label
  master_data_meanstd <- mutate(master_data_meanstd, Activity = Activity_Label)
  
  # Select all but Activity_Label column
  master_data_meanstd <- select(master_data_meanstd, -Activity_Label)
  
  # Group master_data_meanstd by Activity and Subject
  print("Preparing tidy data set by grouping merged data by Activity and Subject")
  master_data_meanstd_grpd <- group_by(master_data_meanstd, Activity, Subject)
  
  # Summarize the master_data_meanstd_grpd by calculating mean of all columns - since we need a summary of all colums, use summarize_each
  print("Finalizing tidy data set by summarizing mean() of all variables")
  tidy_data <- summarise_each(master_data_meanstd_grpd, funs(mean))
  
  # Write the tidy_data to a file
  print(paste("Writing tidy data to ", working_dir,"/",data_root_dir,"/tidy_data.txt",sep = ""))
  write.table(tidy_data,file = paste(working_dir,data_root_dir,"tidy_data.txt",sep = "/"),row.names = FALSE)
  
  # Return message indicating completion of function
  return("Done!")
}