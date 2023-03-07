#!/bin/bash

AWS_ACCESS_KEY="AKIAVUS6SMNPNWMXVDO4"
AWS_SECRET_KEY="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"


TO="Email To <info@ezhajjandumrahtours.com>"
FROM="Email From <info@ezhajjandumrahtours.com>"
SUBJECT="<testing>"
MESSAGE="<test123>"

date="$(date +"%a, %d %b %Y %H:%M:%S %Z")"
priv_key="$AWS_SECRET_KEY"
access_key="$AWS_ACCESS_KEY"
signature="$(echo -n "$date" | openssl dgst -sha256 -hmac "$priv_key" -binary | base64 -b 0)"
auth_header="X-Amzn-Authorization: AWS3-HTTPS AWSAccessKeyId=$access_key, Algorithm=HmacSHA256, Signature=$signature"
endpoint="https://email.us-west-2.amazonaws.com/"

action="Action=SendEmail"
source="Source=$FROM"
to="Destination.ToAddresses.member.1=$TO"
subject="Message.Subject.Data=$SUBJECT"
message="Message.Body.Text.Data=$MESSAGE"

#curl -vvv -X POST -H "Date: $date" -H 
"$auth_header" 
--data-urlencode "$message" 
--data-urlencode "$to" 
--data-urlencode "$source" --data-urlencode "$action" --data-urlencode "$subject" "$endpoint"

curl -vvv -X POST --aws-sigv4 "aws:amz:west-2:es" --user "$AWS_ACCESS_KEY:$AWS_SECRET_KEY" ${endpoint} --data-urlencode "$message" 
