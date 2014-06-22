
## Reading Training data
x_train <- read.table("c:/LearningR/Getting and Cleaning Data/Project/train/X_train.txt", sep="", header=FALSE) 
## Create a sequential variable Seqnum that numbers the data from first to last observation
x_train$Seqnum <-c(1:nrow(x_train))

# Read in the y_train.txt file
y_train <- read.table("c:/LearningR/Getting and Cleaning Data/Project/train/y_train.txt", sep="", header=FALSE)
## Create a sequential variable Seqnum that numbers the data from first to last observation
y_train$Seqnum <-c(1:nrow(y_train))
colnames(y_train)[1] <- "Y"


# Read the subject train data
subject_train <- read.table("c:/LearningR/Getting and Cleaning Data/Project/train/subject_train.txt", sep="", header=FALSE)
## Create a sequential variable Seqnum that numbers the data from first to last observation
subject_train$Seqnum <-c(1:nrow(y_train))
colnames(subject_train)[1] <- "Subject"


# Merge the Subject train to y_train by sequence number to create Subject Y
SubjectY <- merge(subject_train, y_train, by = "Seqnum", all = TRUE)

# Merge the Subject Y to X_train to finalize putting together the Train files
SubjectYXtrain <- merge(SubjectY, x_train, by = "Seqnum", all = TRUE)
#SubjectYXtrain$Category <- "Train"

# Check the Train dataset to make sure it looks fine
head(SubjectYXtrain)


## Reading the test data
# First, we read in the X test datafile
x_test <- read.table("c:/LearningR/Getting and Cleaning Data/Project/test/X_test.txt", sep="", header=FALSE) 
## Create a sequential variable Seqnum that numbers the data from first to last observation
x_test$Seqnum <-c(1:nrow(x_test))

# Read in the Y test variable
y_test <- read.table("c:/LearningR/Getting and Cleaning Data/Project/test/y_test.txt", sep="", header=FALSE)

# Create a sequential variable Seqnum that numbers the data from first to last observation
y_test$Seqnum <-c(1:nrow(y_test))
colnames(y_test)[1] <- "Y"


# Read the subject test data

subject_test <- read.table("c:/LearningR/Getting and Cleaning Data/Project/test/subject_test.txt", sep="", header=FALSE)
subject_test$Seqnum <-c(1:nrow(y_test))
colnames(subject_test)[1] <- "Subject"

# Merge Subject Test to Y test
SubjectY <- merge(subject_test, y_test, by = "Seqnum", all = TRUE)

# Finally merge Subject Y to X test to complete merging all test files
SubjectYXtest <- merge(SubjectY, x_test, by = "Seqnum", all = TRUE)

## Combine Training and Test datafiles
Alldata <- rbind(SubjectYXtrain, SubjectYXtest)


# Read in the variables names from the features file
var_names <- read.csv("c:/LearningR/Getting and Cleaning Data/Project/features.csv")
names <-  subset(var_names, select = c(seqnum, new_names, old_names))

# Find the first column in the combine dataset
n <- names(Alldata)[-1]   

# In this step, the names from combined data (V1,V2,...) are replaced with meaningful names from the Features file
names(Alldata) <- c("seqnum", as.character(names$new_names)[match(n, names$old_names)])

# Check here to ensure that the process of assigning meaningful names worked fine for all columns
head(Alldata)

# Use grep to extract columns with Mean or STD in their names
MeanAndStd <- Alldata[grep("mean|std",names(Alldata))]  #Extrac the mean and standard dev

#Check to make sure that the resulting data has only means and standard deviations columns
head(MeanAndStd)

#Create a comma separated text file with the tidy data that will be submitted
write.csv(MeanAndStd, "c:/LearningR/Getting and Cleaning Data/Project/finaltidy.csv", row.names=FALSE)
