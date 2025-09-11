# Load libraries
library(ggplot2)

#1
#Define vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

#Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)


#Inspect structure and preview data
str(df_polls)
head(df_polls)

#2
#Compute summary statistics
mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll", "CBS_poll")])

#Add column for difference between CBS and ABC
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

#3
#Plot with ggplot2
plot <- ggplot(df_polls, aes(x = Name, y = Diff, fill = Name)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Poll Differences (CBS - ABC)",
       x = "Candidate",
       y = "Difference in Poll Scores")

# Save plot
ggsave("poll_diff_plot.png", plot = plot, width = 6, height = 4, dpi = 300)

# Display plot 
print(plot)

