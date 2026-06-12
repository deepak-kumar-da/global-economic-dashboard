import requests
import pandas as pd

all_indicators = []
page = 1

while True:
    url = f"https://api.worldbank.org/v2/indicator?format=json&per_page=1000&page={page}"

    response = requests.get(url)
    data = response.json()

    metadata = data[0]
    indicators = data[1]

    all_indicators.extend(indicators)

    print(f"Downloaded page {page}")

    if page >= metadata["pages"]:
        break

    page += 1

df = pd.DataFrame([
    {
        "id": item["id"],
        "name": item["name"]
    }
    for item in all_indicators
])

print(df.head())

# Save locally
df.to_csv("worldbank_indicators.csv", index=False)