install.packages("plotly")

# Load the tidyverse package for data manipulation and visualization
library(tidyverse)

# Load the dataset
cars <- read.csv("Cars.csv")

# Handle missing values
# Assuming missing values should be filled with the mean of their columns
cars <- cars %>%
  mutate(across(where(is.numeric), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Create a new variable 'fuel_efficiency'
cars$fuel_efficiency <- (cars$citympg + cars$highwaympg) / 2

# Obtain summary statistics for key numerical variables
summary_stats <- cars %>%
  select(displacement, co2emissions, cylinders, citympg, highwaympg, fuel_efficiency) %>%
  summary()

print(summary_stats)

# Explore the distribution of the 'class' variable
class_distribution <- cars %>%
  count(class) %>%
  ggplot(aes(x = class, y = n, fill = class)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Distribution of Car Classes", x = "Class", y = "Count")
class_distribution

# Plot the relationship between displacement and co2emissions
ggplot(cars, aes(x = displacement, y = co2emissions)) +
  geom_point() +
  labs(title = "Displacement vs. CO2 Emissions", x = "Displacement", y = "CO2 Emissions")

# Visualize the distribution of co2emissions based on the number of cylinders
ggplot(cars, aes(x = as.factor(cylinders), y = co2emissions, fill = as.factor(cylinders))) +
  geom_boxplot() +
  labs(title = "CO2 Emissions by Number of Cylinders", x = "Number of Cylinders", y = "CO2 Emissions")

# Interactive plot with Plotly
library(plotly)

# Assuming the relationship between fuel_efficiency and co2emissions might be interesting
plot_ly(cars, x = ~fuel_efficiency, y = ~co2emissions, type = 'scatter', mode = 'markers',
        marker = list(size = 10, color = 'rgba(255, 182, 193, .9)', line = list(color = 'rgba(152, 0, 0, .8)', width = 2))) %>%
  layout(title = "Fuel Efficiency vs. CO2 Emissions",
         xaxis = list(title = "Fuel Efficiency"),
         yaxis = list(title = "CO2 Emissions"))

