#Reads in the data sets in the files
features<-read.csv("UCI HAR Dataset/features.txt", header = F, sep = " ", fill = TRUE)
activities<-read.table("UCI HAR Dataset/activity_labels.txt", header = F)
inputfolder<-"./UCI HAR Dataset/train"
files_list <- list.files(inputfolder, pattern="*txt")
object_names <- gsub(".txt", "", files_list)
for (i in 1:length(files_list)){
  f1 <- read.table(paste(inputfolder, "/",files_list[i], sep=""), header = F, stringsAsFactors = TRUE)

  assign(paste(object_names[i]), f1)
}
remove("f1","files_list","object_names")

inputfolder<-"./UCI HAR Dataset/test"
files_list <- list.files(inputfolder, pattern="*txt")
object_names <- gsub(".txt", "", files_list)
for (i in 1:length(files_list)){
  f1 <- read.table(paste(inputfolder, "/",files_list[i], sep=""), header = F, stringsAsFactors = TRUE)
  
  assign(paste(object_names[i]), f1)
}
remove("f1","files_list","object_names")

# 1.    Merges the training and the test sets to create one data set.

x<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)
y$id=1:nrow(y)
feats<-t(features[,2])
subject<-rbind(subject_train,subject_test)
colnames(subject)<-'subject'
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

cols<-grepl("std|mean",feats)
colnames(x)<- feats
x<-x[,cols]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
activ<-merge(y,activities,by.x="V1",by.y="V1")
activ<-activ[order(activ$id),]
activity<-activ$V2
data<-cbind(subject,activity,x)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
means<- aggregate(data,list(data$subject,data$activity), mean)
output<- means
output[3:4]<-list(NULL)
write.table(output, "output.txt", sep="\t") 
