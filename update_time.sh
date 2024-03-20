#!/bin/bash

# Function to check the system version
check_system_version() {
    if [ -f /etc/redhat-release ]; then
        echo "Red Hat based system detected."
        return 0
    elif [ -f /etc/debian_version ]; then
        echo "Debian based system detected."
        return 1
    else
        echo "Unsupported system detected."
        exit 1
    fi
}

# Update package lists and install ntpdate
if check_system_version; then
    yum -y update
    yum -y install ntp
else
    apt-get -y update
    apt-get -y install ntpdate
fi

# Update system time using Google's NTP server
ntpdate -u time.google.com
