# scripts/readDataFrame.R

# Read the CSV file from the data/ folder into a data frame
read_data_frame <- read.table(
  file   = "data/readSample.csv",  # path to the input CSV (relative to project root)
  header = TRUE,                   # first row contains column names
  sep    = ",",                    # values are separated by commas (CSV format)
  stringsAsFactors = FALSE         # keep text columns as character, not factors
)

#Print full data frame in Console 
cat("The data frame is:\n")
print(read_data_frame)


