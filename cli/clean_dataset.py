import csv

input_file = 'datasets/ncr_ride_bookings.csv'
output_file = 'datasets/ncr_ride_bookings_clean.csv'

# Max rows to process (set None for all rows)
MAX_ROWS = 10000

# Columns that are numeric (decimals or integers)
numeric_cols = [
    'Avg VTAT', 'Avg CTAT', 'Cancelled Rides by Customer', 'Cancelled Rides by Driver',
    'Incomplete Rides', 'Booking Value', 'Ride Distance', 'Driver Ratings', 'Customer Rating'
]

# Set to track unique Booking IDs
seen_booking_ids = set()
row_count = 0

with open(input_file, 'r', newline='', encoding='utf-8') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:

    reader = csv.DictReader(infile)
    writer = csv.writer(outfile)

    for row in reader:
        if MAX_ROWS and row_count >= MAX_ROWS:
            break

        booking_id = row['Booking ID'].replace('"', '').replace("'", "").strip()

        # Skip duplicate Booking IDs
        if booking_id in seen_booking_ids:
            continue
        seen_booking_ids.add(booking_id)

        cleaned_row = []
        for col, val in row.items():
            val = val.strip() if val else ''
            # Remove extra quotes
            val = val.replace('"', '').replace("'", "")
            # Convert empty or 'null' numeric fields to MySQL NULL
            if col in numeric_cols and (val.lower() == 'null' or val == ''):
                val = 'NULL'
            # Convert empty text fields to NULL as well
            elif val == '':
                val = 'NULL'
            cleaned_row.append(val)
        
        writer.writerow(cleaned_row)
        row_count += 1

print(f"Cleaned CSV written to {output_file} ({len(seen_booking_ids)} unique rows, max {MAX_ROWS}).")
