#transform data using package dplyr 
#installation and loading
packages_needed <- c("dplyr")

for (pkg in packages_needed) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    install.packages(pkg)                   # runs only if not installed
    library(pkg, character.only = TRUE)
  }
}

# reading data of data/transformSample.csv as dataframe
data_frame_transform <- read.table(
  file   = "data/transformSample.csv",
  header = T,
  sep = ",",
  stringsAsFactors = F
)

# printing data
print(data_frame_transform)

# to see structure of dataframe
str(data_frame_transform)

1. ############ filter Function #############
#subset a data frame,keeping all rows that satisfy the conditions you'll specify
#doesnot affect main data_frame_transform though
cat("The Filter function")
filter(data_frame_transform,Age<35)

filter(data_frame_transform,Age<35,Residence == "Boston")

filter(data_frame_transform,Age<35,Residence == "Boston" | Residence == "Middletown")
#optimized code 
filter(data_frame_transform,Age<35,Residence %in% c("Boston","Middletown") )
#equivalent code without filter
data_frame_transform[(data_frame_transform$Age<35 & data_frame_transform$Residence=="Boston"),]

2. ############ Select Function #############
#picks variable by their name
cat("The Select function")
select(data_frame_transform,Age)
#when You are unsure about column name
select(data_frame_transform,Age,starts_with("Resi"))
#usually to keep all other variables when reordering with select(). 
select(data_frame_transform,Active,everything())
#first column is Weights and all other remaining is displayed
select(data_frame_transform,Weights,everything())

##Renaming the name of column
names(data_frame_transform)[3]<- "Address"
data_frame_transform

#OR
rename(data_frame_transform, "Opinion"="Result")

# Rename Names according to function
rename_with(data_frame_transform,toupper)
rename_with(data_frame_transform,toupper,starts_with("A"))

#Whats the age of people whose status is true 
cat("the age of people whose status is true are:")
select(filter(data_frame_transform,Active==T),Age)

#ALternatively, You can also use pipe operator
filter(data_frame_transform,Active ==T) %>% select(Age)

3. ############ Arrange Function #############
#sorts the rows of a data frame by one or more columns.
cat("The arrange function")

cat("The data arrangement by age is:\n")
arrange(data_frame_transform,Age)
#Ordering by age Descending order
arrange(data_frame_transform,desc(Age))

#multiple arrange ties
# sort rows first by Address, then by Age within each Address
arrange(data_frame_transform,Address,Age)

4. ############ Mutate Function #############
# adds new columns or changes existing columns in a data frame, using values calculated from other columns.
#Here lets create a column named BMI(Body Mass Index); BMI = Weights/Heights^2
mutate(data_frame_transform, BMI = Weights/ Heights^2)

mutate(data_frame_transform, Email= paste0(Name,"@gmail.com"))

#paste0 function is used for concatination without leaving space while paste concatinates leaving space in-between

# Keep function allows you to decide what functions u want to keep after mutate is done,by default it keeps all of the col
#You can specify explicitly
cat("Keep function")
mutate(data_frame_transform, BMI = Weights/ Heights^2 , .keep = "all")
mutate(data_frame_transform, BMI = Weights/ Heights^2 , .keep = "none") #only keeps new col,drops all other existing columns
mutate(data_frame_transform, BMI = Weights/ Heights^2 , .keep = "used") # used =col used to calculate mutate,rest are unused
