#!/bin/bash

# Number of days since epoch for today's date
let T_DAYS=$(date +%s)/86400

# Snag all usernames and password ages from shadow file
while read LINE; do
  set -- $(echo $LINE | awk -F: '{print $1, $3;}')
  user=$1
  # Calc age as days from epoch to today minus days from epoch to last password change
  age=$(($T_DAYS-$2))
  echo "$user - $age days"
done < /etc/shadow
