# libraries
library(tidyverse)  
library(forcats)   

# Load dataset
mall_customers <- read.csv("Mall_Customers.csv")
# first 5 rows of the dataset
print(head(mall_customers, 5))

# missing values
num_missing_values <- sum(is.na(mall_customers))
cat("The number of missing values in the dataset is:", num_missing_values, "\n")

# categorical variables in the dataset and encode them
# Assuming 'Genre' is a categorical variable. Encoding it.
mall_customers$Genre <- as.factor(mall_customers$Genre)

# create a new feature called Age_Category
mall_customers$Age_Category <- cut(mall_customers$Age,
                                   breaks = c(-Inf, 30, 40, 50, Inf),
                                   labels = c("0-30", "31-40", "41-50", "50+"))

# distribution of Spending Score
ggplot(mall_customers, aes(x = Spending.Score..1.100.)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Spending Score",
       x = "Spending Score",
       y = "Frequency")

# comparison of Annual Income across different Genres
ggplot(mall_customers, aes(x = Genre, y = Annual.Income..k.., fill = Genre)) +
  geom_boxplot() +
  labs(title = "Comparison of Annual Income across Genres",
       x = "Genre",
       y = "Annual Income (k$)") +
  theme_minimal()

# showing the count of customers in different Age_Category groups based on Genre
ggplot(mall_customers, aes(x = Age_Category, fill = Genre)) +
  geom_bar(position = "dodge") +
  labs(title = "Count of Customers by Age Category and Genre",
       x = "Age Category",
       y = "Count") +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal()

