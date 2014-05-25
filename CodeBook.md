CodeBook for Run Analysis
========================================================

# Variable Descriptions
* **fileUrl** - download URL for location of zip for project. 
* **destfileName** - Destination file name for downloaded file.
* **homeDir** - Home directory of train and test data.
* **col_names** - Column names from featrues.
* **columns** - Determines columns based on "mean" or "std"
* **activity_indx** - Activity index for either train or test, reading activity_labels.txt.
* **activities** - Activies occuring for either train or test.
* **s** - Temporary variable used to store subjects.
* **t** - Temorary variable used to merge data.frames.
* **tTrain** - Data.frame of training data.
* **tTest** - Data.frame of test data.

# Transformations
Read each data set, subjects, and activites. Merge the data data frames into
a single data.frame.  Melt the merge data.frame by variables of subjects and activites.
Dcast the over subjects and activites for means. Then output the data to a text file.

# R Libraries
* **reshape2** - Reshape lets you flexibly restructure and aggregate data using just two functions: melt and cast. 

`URL` - http://cran.r-project.org/web/packages/reshape2/index.html
