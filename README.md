gcd
===

Getting and cleaning data 
# How the script for the accelerometers from the Samsung Galaxy S works #

## General approach for the training dataset files ##

1.  _Read in all variables in the training folder_
2.  _Use SeqNum to number each variable sequentially_
3.  _SeqNum serves as a key for merging files in training folder_
4.  _Merge all variables in the training folder into one file_

## General approach for the test dataset files ##

1.  _Read in all variables in the test folder_
2.  _Use SeqNum to number each variable sequentially_
3.  _SeqNum serves as a key for merging files in the test folder_
4.  _Merge all variables in the test folder into one file_

## Combine the Training dataset to the Test dataset using rbind ##
   _We use rbind function to combine the training and test datasets_
   
## Working with the features.txt file ##
 1. _We added for each of the 261 columns a sequential variable with values V1, V2,...V261_
 2. _The purpose is to facilitate replacing the dummy names V1, V2,..V261 with the real names in features files_
 3. _The real names were called new names, while the dummy names were called old names_
 
 
##  Assigning meaningful names to all columns in the data ##
 1. _We read in the the features files_
 2. _We used the match function to exchange each of the dummy name (V1,V2,..) with meaningful names in features file_
 3. _No looping was required when using the match function in the above approach_
 
 ##  Selecting only the columns with Means and Standard deviations ##
 1. _We use the grep function as well with the logical operator or (|)_
 2. _All columns containing the keyword mean or std where extracted_
 3. _The output of grep was saved into a final datafile_
 
 ##  Writing the finaltidy text data file ##
 1. _We use the function write.csv to output comma delimited text file_
 2. _The tidy data file is then uploaded for evaluation
 3. _The above steps describe in full detail how the script work_
