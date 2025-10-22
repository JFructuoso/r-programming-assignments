# Loads the 'ChickWeight' dataset from the 'datasets' package
data("ChickWeight", package = "datasets")

# --- 1. Base R Graphics ---

# Plot 1: Scatter plot (Weight vs. Time)
# This gives a general overview of growth.
plot(ChickWeight$Time, ChickWeight$weight,
     main    = "Base: Weight vs. Time",
     xlab    = "Time (days)",
     ylab    = "Weight (gm)",
     pch     = 19, # Use solid circles
     col     = rgb(0, 0, 0, 0.3)) # Use semi-transparent black

# Plot 2: Boxplot (Final Weight Distribution by Diet)
# Create a subset for only the final time point
final_weights <- subset(ChickWeight, Time == 21)

boxplot(weight ~ Diet,
        data = final_weights,
        main = "Base: Final Weight by Diet",
        xlab = "Diet Type",
        ylab = "Final Weight (gm)",
        col  = "lightgreen")


# --- 2. Lattice Graphics ---
# Load the lattice package
library(lattice)

# Conditional scatter plot (small multiples)
# This plots Weight vs. Time, creating a separate panel for each Diet.
# Corrected 'y ~ x | factor(group)'
xyplot(weight ~ Time | factor(Diet),
       data = ChickWeight,
       main = "Lattice: Weight vs. Time by Diet",
       xlab = "Time (days)",
       ylab = "Weight (gm)",
       layout = c(4, 1)) # Arrange panels in 1 row, 4 columns

# Box-and-whisker plot
# This plots the final weights (at Time == 21) by Diet, same as the base R plot.
# Corrected 'z ~ factor(category)' using the 'final_weights' data
bwplot(weight ~ factor(Diet),
       data = final_weights,
       main = "Lattice: Final Weight by Diet",
       xlab = "Diet Type",
       ylab = "Final Weight (gm)",
       col  = "lightblue")


# --- 3. ggplot2 ---
# Load the ggplot2 package
library(ggplot2)


ggplot(ChickWeight, aes(x = Time, y = weight, group = Chick, color = Diet)) +
  geom_line(alpha = 0.8) + # Add lines with slight transparency
  geom_point(size = 1) +   # Add points for each measurement
  facet_wrap(~ Diet) +     # Create a separate panel for each diet
  labs(title = "ggplot2: Chick Growth Trajectories by Diet",
       x = "Time (days)",
       y = "Weight (gm)") +
  theme_bw() +             # Use a clean black & white theme
  theme(legend.position = "none") # Hide legend
