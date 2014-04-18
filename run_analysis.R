#
#Merges the training and the test sets to create one data set.
Xtest<-read.table("./test/X_test.txt")
Ytest<-read.table("./test/y_test.txt")
Stest<-read.table("./test/subject_test.txt")
Xtrain<-read.table("./train/X_train.txt")
Ytrain<-read.table("./train/y_train.txt")
Strain<-read.table("./train/subject_train.txt")
Activities<-rbind(Ytest,Ytrain)
Subjects<-rbind(Stest,Strain)
Xall<-as.data.frame(rbind(Xtest,Xtrain))
features<-read.table("./features.txt")
names(Xall)<-as.character(features[[2]])
Xall<-cbind(Activities,Xall)
names(Xall)[1]<-"Activities"
Xall<-cbind(Subjects,Xall)
names(Xall)[1]<-"Subjects"

#Extracts only the measurements on the mean and standard deviation for each measurement. 
m<-"mean\\(\\)"
s<-"std\\(\\)"
raw<-Xall[,1:2]
raw<-cbind(raw,Xall[,grepl(m,colnames(Xall[]))|grepl(s,colnames(Xall[]))])

#Uses descriptive activity names to name the activities in the data set
tasks<-read.table("./activity_labels.txt")

#Appropriately labels the data set with descriptive activity names. 
raw$Activities<-tasks[tidy1[,1],2]


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

tidy<-aggregate(raw[,3] ~ Activities + Subjects, data = raw, FUN = mean)
names(tidy)[3]<-names(raw)[3]
for(i in 4:68){res<-aggregate(raw[,i] ~ Activities + Subjects, data = raw, FUN = mean);tidy<-cbind(tidy,res[,3]);names(tidy)[i]<-names(raw)[i]}
write.table(tidy,"./tidy.txt")


