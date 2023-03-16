#!/bin/bash

read -p "Please enter City name or Zipcode: " input

api_key="cb366054d7442875a35ee1da791b58a0"


zip() 
{
weather_zip=\
$(curl \
"https://api.openweathermap.org/data/2.5/weather?\
zip=${input}\
&appid=${api_key}&\
units=imperial" | jq -r '.name')

echo "${weather_zip}"
}

city()
{
weather_city=\
$(curl \
"https://api.openweathermap.org/data/2.5/weather?\
q=${input}\
&appid=${api_key}&\
units=imperial" | jq -r '.name, .weather[0].main, .weather[0].description, .main')

echo "${weather_city}"
}

if [[ ${input} =~ ^[0-9]+$ ]]; then
zip
else
city
fi

