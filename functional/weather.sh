#!/bin/bash

input=$1
api_key=""

if [ $# -eq 0 ]; then
  echo "Error: No input provided." 
  echo "Please input name of city or zipcode."
  exit 1
fi

zip() 
{
weather_zip=\
$(curl -s \
"https://api.openweathermap.org/data/2.5/weather?zip=${input}\
&appid=${api_key}&units=imperial" \
| jq -r '"Location:\n" + .name, "\nWeather:\n" + .weather[0].main, 
.weather[0].description, (.main | del(.pressure)), (.wind | del(.deg))')

echo "${weather_zip}"
}

city()
{
weather_city=\
$(curl -sS \
"https://api.openweathermap.org/data/2.5/weather?q=${input}\
&appid=${api_key}&units=imperial" \
| jq -r '"Location:\n" + .name, "\nWeather:\n" + .weather[0].main,
.weather[0].description, (.main | del(.pressure)), (.wind | del(.deg))')

echo "${weather_city}"
}


if [[ ${input} =~ ^[0-9]+$ ]]; then
zip
else
city
fi

