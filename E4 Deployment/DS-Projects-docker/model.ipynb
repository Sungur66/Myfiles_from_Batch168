import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import Lasso
from sklearn.preprocessing import OneHotEncoder
import joblib


# 1. Load the dataset
df = pd.read_csv("car_price_prediction.csv")

# 2. Data Preprocessing
# Rename columns
new_columns = {
    'Prod. year': 'Produced_year',
    'Gear box type': 'Gear_type',
    'Fuel type': 'Fuel_type'
}
df = df.rename(columns=new_columns)

# Handling potential missing values (you can change the strategy if needed)
df.dropna(inplace=True)  # Drop rows with missing values

# Define features and target
X = df.drop('Price', axis=1)
y = df['Price']

# Define numeric and categorical columns
numeric_features = ['Produced_year']
categorical_features = ['Manufacturer', 'Model', 'Category','Fuel_type', 'Gear_type']

# Create transformers
numeric_transformer = StandardScaler()
categorical_transformer = OneHotEncoder(handle_unknown='ignore', drop='first')


# 3. Split the data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 4. Define and train the model
# Use ColumnTransformer to apply the transformations to the correct columns
preprocessor = ColumnTransformer(
    transformers=[
        ('num', numeric_transformer, numeric_features),
        ('cat', categorical_transformer, categorical_features)
    ])

# Create a pipeline that first applies the column transformer and then fits the model
lasso_model = Pipeline([
    ('preprocessor', preprocessor),
    ('regressor', Lasso(alpha=1.0))
])

# Train the model
lasso_model.fit(X_train, y_train)

# 5. Save the model
joblib.dump(lasso_model, 'lasso_model.pkl')
# Save the processed dataframe
df.to_csv("car_price_prediction_edit.csv", index=False)





