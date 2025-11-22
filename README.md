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

# SQL Analytics
```sql
-- 1. Daily Completed Rides and Average Distance by Vehicle Type
SELECT booking_date, vehicle_type, 
       COUNT(*) AS completed_rides, 
       ROUND(AVG(ride_distance),2) AS avg_distance
FROM uber_rides_2024
WHERE booking_status = 'Completed'
GROUP BY booking_date, vehicle_type
ORDER BY booking_date, completed_rides DESC;

-- 2. Daily Cancellation Count by Vehicle Type
SELECT booking_date, vehicle_type, COUNT(*) AS cancellations
FROM uber_rides_2024
WHERE cancelled_by_customer = 1
GROUP BY booking_date, vehicle_type
ORDER BY cancellations DESC
LIMIT 10;

-- 3. Vehicle Type Performance: Avg Ratings vs Avg Booking Value
SELECT vehicle_type, 
       ROUND(AVG(driver_rating),2) AS avg_driver_rating,
       ROUND(AVG(customer_rating),2) AS avg_customer_rating,
       ROUND(AVG(booking_value),2) AS avg_booking_value
FROM uber_rides_2024
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY avg_booking_value DESC;

-- 4. Peak Hour Analysis: Most Booked Hours
SELECT HOUR(booking_time) AS hour_of_day, COUNT(*) AS total_rides
FROM uber_rides_2024
GROUP BY hour_of_day
ORDER BY total_rides DESC
LIMIT 10;

-- 5. Cancellation Reasons Breakdown by Vehicle Type
SELECT vehicle_type, customer_cancel_reason, COUNT(*) AS cancellations
FROM uber_rides_2024
WHERE cancelled_by_customer = 1 AND customer_cancel_reason IS NOT NULL
GROUP BY vehicle_type, customer_cancel_reason
ORDER BY vehicle_type, cancellations DESC;

-- 6. Revenue Contribution by Payment Method and Vehicle Type
SELECT vehicle_type, payment_method, 
       COUNT(*) AS num_rides,
       ROUND(SUM(booking_value),2) AS total_revenue,
       ROUND(AVG(booking_value),2) AS avg_revenue_per_ride
FROM uber_rides_2024
WHERE booking_status = 'Completed'
GROUP BY vehicle_type, payment_method
ORDER BY total_revenue DESC;
```