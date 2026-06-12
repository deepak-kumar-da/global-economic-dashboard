import requests
import pandas as pd
import numpy as np

# Extract GDP data from World Bank API
all_data = []
for page in range(1, 5):
    url = f"https://api.worldbank.org/v2/country/all/indicator/NY.GDP.MKTP.CD?format=json&per_page=5000&page={page}"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data and len(data) > 1:
            all_data.extend(data[1])
    else:
        print(f"Error: {response.status_code} on page {page}")

# Convert the data to a DataFrame
if all_data:
    df = pd.DataFrame(all_data)
    cleaned_df = pd.DataFrame({
        'country': df['country'].apply(lambda x: x['value']),'ISO3_Code':df['countryiso3code'],'year': df['date'],'gdp': df['value']    })
    print(cleaned_df.head())
    print(cleaned_df.shape)   
    cleaned_df = cleaned_df.fillna(0) 
cleaned_df.to_csv('bronze.gdp.csv',sep=';',index=False)
print("Data saved to bronze.gdp.csv")    