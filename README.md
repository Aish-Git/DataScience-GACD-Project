---
title: "GETTING AND CLEANING DATA - COURSE PROHECT | README FILE"
author: "Aish Varadhan"
date: "July 19, 2015"
---

This is a README file for the data cleaning and collation script 'run_analysis.R' that transforms and tidies the wearables data set that has been downloaded to the local disk based off the data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

How to Run the Script?
```{r}
1. Clone the <https://github.com/Aish-Git/DataScience-GACD-Project> repo to your local disk
2. Ensure that you have run_analysis.R file downloaded to the local disk
3. Source the file 'run_analysis.R' and you should see a function called process_data() loaded
4. If the data is in the working directory under the default folder titled 'UCI HAR Dataset'
  a. Execute process_data() with no arguments as the script uses defaults
  b. The script will send informational messages to the console and finish up with a "Done!"
  c. A filed called 'tidy_data.txt' should be created under the 'UCI HAR Dataset' folder
4. If the data is in a diferent directory and called differently,
  a. Execute process_data() by specifying the following
      working_dir: the location to your working dir (if the script is in a diff location)
      data_root_dir: the relative path (MUST BE RELATIVE TO working_dir) to the data folder
  b. The script will send informational messages to the console and finish up with a "Done!"
  c. A filed called 'tidy_data.txt' should be created under the specified data_root_dir folder
5. Enjoy!
```

Thank you!
Aish Varadhan