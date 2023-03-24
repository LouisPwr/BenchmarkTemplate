# Load necessary libraries
library(ggplot2)
library(tidyr)

# Read in the QUAST results file
quast_data <- read.delim("path/to/quast/results/file")

# Convert the data to a tidy format
tidy_quast <- pivot_longer(quast_data, cols=c("Assembly", "Reference"),
                            names_to="Type", values_to="Value")

# Create the ggplot object
ggplot(tidy_quast, aes(x=Type, y=Value, fill=Assembly)) +
  geom_bar(stat="identity", position="dodge") +
  facet_wrap(~Reference, scales="free_y") +
  labs(x="Metric", y="Value", title="QUAST Results") +
  theme_bw()
