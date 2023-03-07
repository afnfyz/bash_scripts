#!/bin/bash

# Set the email content
EMAIL_CONTENT="This is automated draft mail"

# Set the email address for the recipient
TO_EMAIL="gduser1@workspacesamples.dev"

# Set the email address for the sender
FROM_EMAIL="gduser2@workspacesamples.dev"

# Set the email subject
SUBJECT="Automated draft"

# Construct the email message
EMAIL=$(cat <<EOF
From: ${FROM_EMAIL}
To: ${TO_EMAIL}
Subject: ${SUBJECT}
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

${EMAIL_CONTENT}
EOF
)

# Base64 encode the email message
EMAIL_ENCODED=$(echo -n "${EMAIL}" | base64 -w 0)

# Send the email using the Gmail API
curl \
  --request POST \
  --url "https://www.googleapis.com/gmail/v1/users/me/messages/send" \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"raw\": \"$EMAIL_ENCODED\"}"

