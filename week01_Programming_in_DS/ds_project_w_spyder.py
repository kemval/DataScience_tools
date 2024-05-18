import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset from 'property_data.txt' and convert it into a CSV file
df = pd.read_csv('/Users/kiki/Desktop/property_data.txt')
df.to_csv('property_data.csv', index=False)

# View the first 5 rows of the dataset
print("First 5 rows of the dataset:")
print(df.head())

# View the last 5 rows of the dataset
print("\nLast 5 rows of the dataset:")
print(df.tail())

# Obtain summary statistics for the dataset
print("\nSummary statistics of the dataset:")
print(df.describe())

# Create a scatter plot to visualize the correlation between square footage and housing price
plt.scatter(df['sq_ft'], df['housing_price'])
plt.title('Correlation between Square Footage and Housing Price')
plt.xlabel('Square Footage')
plt.ylabel('Housing Price')
plt.show()

# Focus on 'distance_to_city' and 'housing_price' columns and create a pairplot
df_reduced = df[['distance_to_city', 'housing_price']]
sns.pairplot(df_reduced)
plt.show()
