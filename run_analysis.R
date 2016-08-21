rm(list=ls())


train <- read.table("X_train.txt",header = FALSE)
test <- read.table("X_test.txt",header = FALSE)

ytest <- read.table("y_test.txt",header = FALSE)
ytrain <- read.table("y_train.txt",header = FALSE)

features <- read.table("features.txt",header = FALSE)

subjecttest <- read.table("subject_test.txt",header = FALSE)
subjecttrain <- read.table("subject_train.txt",header = FALSE)

activity <- read.table("activity_labels.txt",header = FALSE)

# Assemble datasets with identifiers
train_complete <- cbind(subjecttrain,ytrain,train)
names(train_complete)[1:2] <- c("subject","activity")
names(train_complete)[3:ncol(train_complete)] <- as.character(features[,2])
test_complete <- cbind(subjecttest,ytest,test)
names(test_complete)[1:2] <- c("subject","activity")
names(test_complete)[3:ncol(test_complete)] <- as.character(features[,2])

# Consolidate data sets
complete <- rbind(train_complete,test_complete)
 
# Extract means and SDs
complete <- cbind(complete[,1:2],complete[,union(names(complete)[grepl("mean\\(\\)",names(complete))],names(complete)[grepl("std\\(\\)",names(complete))])])

# Apply activity labels
for (i in 1:nrow(activity)){
  complete[complete$activity==activity[i,1],"activity"] <- as.character(activity[i,2])
}

# Creates new data set
newdata <- unique(complete[,1:2])
for (i in 1:66){
  newdata <- cbind(newdata,rep(NA,nrow(newdata)))
  names(newdata)[ncol(newdata)] <- names(complete)[i+2]
}

for (i in 1:nrow(newdata)){
  for (j in 3:ncol(newdata)){
    newdata[i,j] <- mean(complete[complete$activity==newdata$activity[i] & complete$subject==newdata$subject[i],j])
  }
}

write.table(newdata,"Output.txt",row.names=FALSE)
