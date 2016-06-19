rm(list=ls())

setwd(paste0(getwd(),"/rcourse_lesson1"))
      
## LOAD PACKAGES ####
library(dplyr)
library(ggplot2)


## READ IN DATA AND ORGANIZE ####
# Read in data
data = read.table("data/rcourse_lesson1_data.txt", header=T, sep="\t")

# Look at dimension of data
dim(data)
# Look at first few rows of data
head(data)
# Look at final few rows of data
tail(data)
# Look at number of data points in each group
xtabs(~group, data)

# Subset out bilinguals
data_bl = data %>%
  # Filter to only include bilinguals
  filter(group == "bilingual")

# Look at make-up of data (dimension, first and final few rows)
dim(data_bl)
head(data_bl)
tail(data_bl)

# Look at number of data ponits by 1) group and 2) type for just bilinguals
xtabs(~group, data_bl)
xtabs(~type, data_bl)

