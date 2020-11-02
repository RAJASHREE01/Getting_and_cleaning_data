x_train <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/train/Y_train.txt",header=FALSE)
s_train <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_test <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/test/Y_test.txt",header=FALSE)
s_test <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
s <- rbind(s_train,s_test)

features <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/features.txt")
names(features) <- c('f_id','f_name')
index_features <- grep("-mean()|-std()", features$f_name)
x <- x[,index_features]
names(x) <- gsub("(|)","",(features[index_features,2]))

activities <- read.table("D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("a_id","a_name")
y[,1] <- activities[y[,1],2]
names(y) <- "Activity"
names(s) <- "Subject"

tidy <- cbind(s,y,x)
t <- tidy[,3:dim(tidy)[2]]
tidy_avg <- aggregate(t, list(tidy$Subject, tidy$Activity), mean)

names(tidy_avg)[1] <- "Subject"
names(tidy_avg)[2] <- "Activity"

write.table(tidy,"D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/tidy.csv")
write.table(tidy_avg, "D:/R/getting and cleaning data_3/week4/peer/Getting_and_cleaning_data/tidyavgdataset.txt",row.names = FALSE)
