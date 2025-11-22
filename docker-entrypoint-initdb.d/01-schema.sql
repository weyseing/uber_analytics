CREATE TABLE `uber_rides_2024` (
    `booking_date` DATE NOT NULL,
    `booking_time` TIME NOT NULL,
    `booking_id` VARCHAR(20) NOT NULL,
    `booking_status` VARCHAR(50) NOT NULL,
    `customer_id` VARCHAR(20) NOT NULL,
    `vehicle_type` VARCHAR(30),
    `pickup_location` VARCHAR(100),
    `drop_location` VARCHAR(100),
    `avg_vtat` DECIMAL(5,2) NULL,
    `avg_ctat` DECIMAL(5,2) NULL,
    `cancelled_by_customer` TINYINT(1) NULL,
    `customer_cancel_reason` VARCHAR(100) NULL,
    `cancelled_by_driver` TINYINT(1) NULL,
    `driver_cancel_reason` VARCHAR(100) NULL,
    `incomplete_ride` TINYINT(1) NULL,
    `incomplete_reason` VARCHAR(100) NULL,
    `booking_value` DECIMAL(10,2) NULL,
    `ride_distance` DECIMAL(7,2) NULL,
    `driver_rating` DECIMAL(3,1) NULL,
    `customer_rating` DECIMAL(3,1) NULL,
    `payment_method` VARCHAR(30) NULL,
    PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- index
CREATE INDEX idx_booking_date ON uber_rides_2024(booking_date);
CREATE INDEX idx_customer_id ON uber_rides_2024(customer_id);
CREATE INDEX idx_vehicle_type ON uber_rides_2024(vehicle_type);
CREATE INDEX idx_pickup_location ON uber_rides_2024(pickup_location);
CREATE INDEX idx_drop_location ON uber_rides_2024(drop_location);
CREATE INDEX idx_date_vehicle ON uber_rides_2024(booking_date, vehicle_type);
