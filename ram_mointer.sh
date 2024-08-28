#!/bin/bash

# Set the threshold percentage for RAM usage (e.g., 80%)
THRESHOLD=80

# Get the current RAM usage as a percentage
RAM_USAGE=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')

# Check if the RAM usage exceeds the threshold
if [ "$RAM_USAGE" -gt "$THRESHOLD" ]; then
    # Define email parameters
    SUBJECT="RAM Usage Alert: ${RAM_USAGE}%"
    TO="admin@example.com"
    FROM="server@example.com"
    MESSAGE="Warning: Server running low on memory ${RAM_USAGE}%. Please take necessary action."

    # Send the email
    echo "$MESSAGE" | mail -s "$SUBJECT" -r "$FROM" "$TO"
fi

