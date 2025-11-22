# Setup Guide
- **Download dataset from Kaggle**
    - https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard?resource=download&select=ncr_ride_bookings.csv
- **Prepare dataset**
    - Place dataset under `datasets` folder
    - Clean dataset
    ```bash
    python cli/clean_dataset.py
    ```
- **Import dataset via PhpMyAdmin**