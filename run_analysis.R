# Load packages.
require(data.table)
require(reshape2)
require(knitr)
require(markdown)

setwd("~/R/Project/")
path <- file.path(getwd(), "UCI HAR Dataset")

# ====================================================================================
# Read and Concatenate the subject files.
# ====================================================================================
dtSubjectTrain <- fread(file.path(path, "train", "subject_train.txt"))
dtSubjectTest  <- fread(file.path(path, "test" , "subject_test.txt" ))

dtSubject      <- rbind(dtSubjectTrain, dtSubjectTest)
setnames(dtSubject, "Subject.Id")

# Remove intermediate objects to free memory
remove(dtSubjectTrain)
remove(dtSubjectTest)

# ====================================================================================
# Read and Concatenate the activity files
# ====================================================================================
dtActivityTrain <- fread(file.path(path, "train", "Y_train.txt"))
dtActivityTest  <- fread(file.path(path, "test" , "Y_test.txt" ))

dtActivity      <- rbind(dtActivityTrain, dtActivityTest)
setnames(dtActivity, "Activity.Id")

# Remove intermediate objects to free memory
remove(dtActivityTrain)
remove(dtActivityTest)

# ====================================================================================
# Read and Concatenate the data files.
# ====================================================================================
dfDataTrain <- read.table(file.path(path, "train", "X_train.txt"))
dfDataTest  <- read.table(file.path(path, "test" , "X_test.txt" ))
dfData      <- rbind(dfDataTrain, dfDataTest)

dtData <- data.table(dfData)

# Remove intermediate objects to free memory
remove(dfDataTrain)
remove(dfDataTest)
remove(dfData)

# ====================================================================================
# Merge the training and the test sets
# ====================================================================================
dtSubAct <- cbind(dtSubject, dtActivity)
dtData   <- cbind(dtSubAct, dtData)

# Remove intermediate objects to free memory
remove(dtSubAct)
remove(dtSubject)
remove(dtActivity)

# ====================================================================================
# Read the features file.
# ====================================================================================
dtFeatures <- fread(file.path(path, "features.txt"))
setnames(dtFeatures, c("FeatureId", "Feature"))
dtFeatures$FeatureId <- paste0("V", dtFeatures$FeatureId)

# ====================================================================================
#
# ====================================================================================
setnames(dtData, c("Subject.Id", "Activity.Id", as.character(dtFeatures$Feature)))

dtFeatures.Mean <- subset(dtFeatures, grepl("mean\\(\\)", Feature, ignore.case=T))
dtFeatures.SD   <- subset(dtFeatures, grepl("std\\(\\)" , Feature, ignore.case=T))

dtData.Mean <- dtData[, c("Subject.Id", "Activity.Id", dtFeatures.Mean$Feature), with=FALSE]
dtData.SD   <- dtData[, c("Subject.Id", "Activity.Id", dtFeatures.SD$Feature)  , with=FALSE]

remove(dtData)
remove(dtFeatures)

# ====================================================================================
#
# ====================================================================================
colNames <- gsub("-mean\\(\\)", ""                      , as.character(dtFeatures.Mean$Feature))
colNames <- gsub("BodyBody"   , "Body"                  , colNames) # Maybe an error in the features file
colNames <- gsub("Jerk"       , "Jerk "                 , colNames)
colNames <- gsub("BodyAcc"    , "Body Acceleration "    , colNames)
colNames <- gsub("GravityAcc" , "Gravity Acceleration " , colNames)
colNames <- gsub("BodyGyro"   , "Body Angular Velocity ", colNames)
colNames <- gsub("Mag"        , "(Magnitude)"           , colNames)
colNames <- gsub("-X"         , "(X axis)"              , colNames)
colNames <- gsub("-Y"         , "(Y axis)"              , colNames)
colNames <- gsub("-Z"         , "(Z axis)"              , colNames)

setnames(dtData.Mean, c("Subject.Id", "Activity.Id", colNames))
setnames(dtData.SD,   c("Subject.Id", "Activity.Id", colNames))

# ====================================================================================
# Reshape data from short and wide to tall and narrow format
# ====================================================================================
dtDataMelt.Mean <- melt(dtData.Mean, c("Subject.Id", "Activity.Id"),
                        variable.name="Feature", value.name="Mean")
dtDataMelt.SD   <- melt(dtData.SD,   c("Subject.Id", "Activity.Id"),
                        variable.name="Feature", value.name="SD")

dtDataMelt <- cbind(dtDataMelt.Mean, dtDataMelt.SD$SD)
setnames(dtDataMelt, "V2", "SD")

dtDataMelt$Signal.Domain <- ifelse(grepl("^t", dtDataMelt$Feature, ignore.case=T), "Time", "Freq") 
dtDataMelt$Feature <- gsub("^[ft]", "", dtDataMelt$Feature)

setnames(dtDataMelt, "Feature", "Measurement")

# Remove intermediate objects to free memory
remove(dtData.SD)
remove(dtData.Mean)
remove(dtDataMelt.SD)
remove(dtDataMelt.Mean)

# ====================================================================================
#
# ====================================================================================
# Read descriptive activity names
# -----------------------------------------------------------------
dtActivityLabels <- fread(file.path(path, "activity_labels.txt"))
setnames(dtActivityLabels, c("Activity.Id", "Activity"))

# Merge activity labels
dtDataMelt <- merge(dtDataMelt, dtActivityLabels, by="Activity.Id", all.x=TRUE)
dtDataMelt <- dtDataMelt[, c(2, 7, 6, 3:5), with=FALSE]

# 
dtDataMelt$Subject.Id    <- factor(dtDataMelt$Subject.Id)
dtDataMelt$Activity      <- factor(dtDataMelt$Activity)
dtDataMelt$Signal.Domain <- factor(dtDataMelt$Signal.Domain)
dtDataMelt$Measurement   <- factor(dtDataMelt$Measurement)

setkey(dtDataMelt, Subject.Id, Activity, Signal.Domain, Measurement)

# ====================================================================================
#
# ====================================================================================
dtTidy <- dtDataMelt[, list("#Measurements"=.N, "Mean.Average"=mean(Mean),
                            "SD.Average"=mean(SD)), by=key(dtDataMelt)]

write.table(dtTidy, "HAR_TIDY_DATASET.txt", sep=",", quote=FALSE, row.names=FALSE)

# ====================================================================================
#
# ====================================================================================
knit("CodeBook.Rmd", output="CodeBook.md", encoding="ISO8859-1", quiet=TRUE)
markdownToHTML("CodeBook.md", "CodeBook.html")
