# scripts/readCsv.R

# 1. Check current working directory (should be project root: ggplot)
getwd()

# 2. Read the sample file from data/ folder
read_sample <- read.table(
  file = "data/readSample.csv",
  header= TRUE, #This means first row of file contains column names,not data.”
  sep = ",",  # values separated by commas (CSV); use "\t" for tab-separated (TSV)
  stringsAsFactors= FALSE # keep text columns as characters (not factors)
)

# 3. Inspect the data
str(read_sample)
head(read_sample)

# 4. Optional: write a cleaned version to output/ folder
write.table(
  read_sample,
  file      = "output/tables/readSample_clean.txt",
  sep       = ",",
  quote     = FALSE,
  row.names = FALSE
)