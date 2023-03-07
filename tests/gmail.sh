#!/bin/bash

# Set the email content
EMAIL_CONTENT="testing"

# Set the email address for the recipient
TO_EMAIL="info@ezhajjandumrahtours.com"

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

# Send the email using the Gmail API
ACCESS_TOKEN="ya29.a0AVvZVsp2LKdAJvS2AAEk3XR8vu_j4pG4EFQGJfoigt9E6ObxZVgmcGXx2xJX0IFnImy_DKnJ7X5r4jH66x4zJZyrttpjbysu9UKh7VJuHMu1ITndC7Wmj71WxK4f2q8ggK1xcNR6-fH4DdE_ajp9N_LSi8Tqm9kaCgYKAbQSARESFQGbdwaIVjced9utGT1ej3s58LNKnQ0166"
curl \
  --request POST \
  --url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send' \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"raw\":\"$EMAIL_ENCODED\"}"

