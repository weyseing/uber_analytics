#!/bin/bash
set -e

echo "Waiting for MySQL to start..."
sleep 20

echo "Starting CSV import..."

mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" <<EOF
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/datasets/ncr_ride_bookings.csv'
INTO TABLE uber_rides_2024
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(booking_id, booking_date, booking_time, booking_status, customer_id,
 vehicle_type, pickup_location, drop_location, avg_vtat, avg_ctat,
 cancelled_by_customer, customer_cancel_reason, cancelled_by_driver,
 driver_cancel_reason, incomplete_ride, incomplete_reason,
 booking_value, ride_distance, driver_rating, customer_rating,
 payment_method);
EOF

echo "CSV import completed!"
