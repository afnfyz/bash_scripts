#!/bin/bash

# Set the email content
EMAIL_CONTENT=$(cat ./email_body.txt)

# Set the email address for the recipient
TO_EMAIL="dev.afoyez@gmail.com"

# Set the email address for the sender
FROM_EMAIL="dev.afoyez@gmail.com"

# Set the email subject
SUBJECT="Automated test"

# Construct the email message
EMAIL=$(cat <<EOF
From: ${FROM_EMAIL}
To: ${TO_EMAIL}
Subject: ${SUBJECT}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

${EMAIL_CONTENT}
EOF
)

# Base64 encode the email message as URL-safe
EMAIL_ENCODED=$(echo -n "${EMAIL}" | base64 -b 0)

# Set the permanent refresh token and client ID/secret
REFRESH_TOKEN=
CLIENT_ID=
CLIENT_SECRET=

# Get a new access token with the refresh token
ACCESS_TOKEN=$(curl -s \
  --request POST \
  --data 
"client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&refresh_token=$REFR$
  https://oauth2.googleapis.com/token | jq -r .access_token)

# Send the email using the Gmail API
curl \
  --request POST \
  --url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send' \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"raw\":\"$EMAIL_ENCODED\"}"

