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

############ filter Function #############
#subset a data frame,keeping all rows that satisfy the conditions you'll specify
#doesnot affect main data_frame_transform though
filter(data_frame_transform,Age<35)

filter(data_frame_transform,Age<35,Residence == "Boston")

filter(data_frame_transform,Age<35,Residence == "Boston" | Residence == "Middletown")
#optimized code 
filter(data_frame_transform,Age<35,Residence %in% c("Boston","Middletown") )
#equivalent code without filter
data_frame_transform[(data_frame_transform$Age<35 & data_frame_transform$Residence=="Boston"),]

############ Select Function #############
#picks variable by their name
select(data_frame_transform,Age)
