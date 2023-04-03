#!/bin/bash

string=$(curl -Ss https://favqs.com/api/qotd)
author=$(echo $string | jq -r '.quote.author')
quote=$(echo $string | jq  '.quote.body')

echo ""
echo $quote
echo "- ${author}"
echo ""
