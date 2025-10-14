#1
#This first step uses the plyr package to get the average grade for each gender after 
#loading a student dataset from a CSV file. A new text file called gender_mean.txt is then created using the summary table that is produced, 
#which includes each gender and the matching average grade.

student6 <- read.csv(file.choose(), header = TRUE)

#Load
library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

#Write grouped means to a text file

write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

#2 The original dataset is filtered in this step to group only the students with the letter "i" in their names.
#The names are then written to a new CSV file named i_students.csv after the Name column from this filtered data is extracted.

i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)


#extract the names containing i
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

#3  this step stores all of the data for the students whose names contain the letter "i" into a new CSV file using the whole dataset for those students
#who were filtered in the previous step. All of the original columns for this particular
#selection of students are included in the file i_students_full.csv.

write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)
