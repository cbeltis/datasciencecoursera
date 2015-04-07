#Ensure working dir is correct and contains Samsung data

getwd()

#Merge training and test into one dataset for each table

tempA <- read.table("train/X_train.txt")
tempB <- read.table("test/X_test.txt")
X <- rbind(tempA, tempB)

tempA <- read.table("train/subject_train.txt")
tempB <- read.table("test/subject_test.txt")
S <- rbind(tempA, tempB)

tempA <- read.table("train/y_train.txt")
tempB <- read.table("test/y_test.txt")
Y <- rbind(tempA, tempB)

#Gets measurements on the mean and sd

features <- read.table("features.txt")
meansdfeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, meansdfeatures]
names(X) <- features[meansdfeatures, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

#Create titles for activities using descriptive activity names

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

#Labels dataset w/ descriptive activity names

names(S) <- "subject"
cleanData <- cbind(S, Y, X)
write.table(cleanData, "cleanData.txt")

#Creates tidy data set

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleanData)[2]
result = cleanData[1:(numSubjects*numActivities), ]

rowind = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    temp1 <- cleanData[cleanData$subject==s & cleanData$activity==activities[a, 2], ]
    result[rowind, 3:numCols] <- colMeans(temp1[, 3:numCols])
    rowind = rowind+1
  }
}
write.table(result, "tidyData.txt")
