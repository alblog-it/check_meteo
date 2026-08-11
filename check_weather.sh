#!/bin/sh
# Nagios plugin by Alberto AlBlog Leoni
# you have to install jq and, if missing, also curl

LAT="${1:-45.46}"      # Latitude  - parameter number 1 or, if missing, the one of Milan
LON="${2:-9.19}"       # Longitude - parameter number 2 or, if missing, the one of Milan

RESULT=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,wind_speed_10m,precipitation,relative_humidity_2m,apparent_temperature")
rc=$?

if [ "$rc" -eq 0 ]; then
  VALUE_TEMP=$(printf '%s' "$RESULT" | jq -r '.current.temperature_2m')
  VALUE_WIND=$(printf '%s' "$RESULT" | jq -r '.current.wind_speed_10m')
  VALUE_PREC=$(printf '%s' "$RESULT" | jq -r '.current.precipitation')
  VALUE_HUMI=$(printf '%s' "$RESULT" | jq -r '.current.relative_humidity_2m')
  VALUE_ATEM=$(printf '%s' "$RESULT" | jq -r '.current.apparent_temperature')
  echo "Temperature: $VALUE_TEMP Wind: $VALUE_WIND Precipitation: $VALUE_PREC Humidity: $VALUE_HUMI Apparent temperature: $VALUE_ATEM |temp=$VALUE_TEMP wind=$VALUE_WIND prec=$VALUE_PREC humi=$VALUE_HUMI atem=$VALUE_ATEM"
else
  echo "Error during command execution"
  exit 3
fi
