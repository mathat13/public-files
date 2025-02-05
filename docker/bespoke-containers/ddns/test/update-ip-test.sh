#!/bin/bash

function get_dns_ip() {
    NAME="cabanaca.com"
    TYPE="A"
    ZONE_ID="7eb84f2418e606ae8b113ff78b2286c5"
    KEY="QGxzEng2qO2O8gneE25YBT5sM5zOYhU8PbhoWiP2"

    echo $(curl -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" | jq -r '.result[] | select(.name == "'"$NAME"'" and .type == "'"$TYPE"'") | .content')
}

function get_dns_ip_and_dns_id() {
    NAME="cabanaca.com"
    TYPE="A"
    ZONE_ID="7eb84f2418e606ae8b113ff78b2286c5"
    KEY="QGxzEng2qO2O8gneE25YBT5sM5zOYhU8PbhoWiP2"

    echo $(curl -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" | jq -r '.result[] | select(.name == "'"$NAME"'" and .type == "'"$TYPE"'") | .content, .id')
}

function get_dns_ip_nameref() {
    local -n outvar=$1
    NAME="cabanaca.com"
    TYPE="A"
    ZONE_ID="7eb84f2418e606ae8b113ff78b2286c5"
    KEY="QGxzEng2qO2O8gneE25YBT5sM5zOYhU8PbhoWiP2"

    outvar=$(curl -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" | jq -r '.result[] | select(.name == "'"$NAME"'" and .type == "'"$TYPE"'") | .content')
}

function add_color_to_echo() {
    echo -e "\e[36mSimply add the surrounding expression to echo with -e for color!\e[0m"
}

function global_variable_test() {
    echo "The IP is: $IP"
}

# Echo return example
# IP=$(get_dns_ip)
# echo "$IP"

# Nameref return example, doesn't actually save any subprocesses spawning here.
# var="a"
# get_dns_ip_nameref var
# echo "${var}"

# Use a global variable inside function
# global_variable_test

# Return and extract 2 variables from JSON
IPANDID=$(get_dns_ip_and_dns_id)
    
ip=$(echo $IPANDID | awk '{print $1}')
id=$(echo $IPANDID | awk '{print $2}')
echo -e "$ip\n$id"
