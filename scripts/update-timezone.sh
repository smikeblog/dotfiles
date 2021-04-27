#!/bin/sh

echo "your current location! is: "
echo "$(curl --fail https://ipapi.co/timezone)"

echo "----------- Commands to update timezone to current locations: ----------"
echo '# sudo timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)" '
echo '# sudo ntpd -s -d '
echo "------------------------------"

