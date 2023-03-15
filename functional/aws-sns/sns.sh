#!/bin/bash

# Define variables
phone_number="<phone_number>"
message="<message>"

# Publish message
message_id=$(aws sns publish \
--phone-number "${phone_number}" \
--message "${message}" | jq -r '.MessageId')

# Check if message was published succesfully
if [ -n "${message_id}" ]; then
    echo "Published message to ${phone_number}. Message ID: ${message_id}"
else
    echo "Failed to publish message to ${phone_number}."
fi

