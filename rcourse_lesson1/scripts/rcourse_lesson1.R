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


## MAKE FIGURES ####
# By group
data.plot = ggplot(data, aes(x = group, y = rt)) +
  # Make the figure a boxplot, fill says to what the color should correspond to,
  # here it is the same as the x variable
  geom_boxplot(aes(fill = group)) +
  # Add a title
  ggtitle("Reaction Times by Group") +
  # Customize the x-axis label
  xlab("Group") +
  # Customize the y-axis label
  ylab("Reaction times in ms") +
  # Remove dark background
  theme_classic() +
  # These are extras to make the figure (in my opinion) prettier,
  # look up each command to learn more
  theme(text=element_text(size=18), title=element_text(size=18),
        legend.position="none")

# Write figure to a pdf in the 'figures' folder
pdf("figures/data.pdf")
# Call plot
data.plot
# Close pdf call
dev.off()

