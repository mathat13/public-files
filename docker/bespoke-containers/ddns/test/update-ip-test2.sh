#!/bin/bash
# Maybe allow new records to be created
# Add default values for PROXIED and TTL

function get_dns_record() {
    # return dns record id to outside variable
    echo $(curl -sS -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
        -H "Authorization: Bearer $GET_KEY" \
        -H "Content-Type: application/json" | jq '.result[] | select(.name == "'"$NAME"'" and .type == "A")'
        )
}

function get_record_attribute() {
    # JSON object containing DNS Record information.
    local DNS_RECORD="$1"
    # Attribute to be extracted from JSON.
    local ATTRIBUTE="$2"
    echo -e "Attribute: $ATTRIBUTE\nRECORD: $DNS_RECORD"
    local outvar=$(echo "$DNS_RECORD" | jq -r '.id')
    echo "$outvar"
    # echo $(echo "$DNS_RECORD" | jq --arg x "$ATTRIBUTE" -r '[$x]')
}

function update_dns_record() {
    # IP expected.
    local CONTENT=$1
    local PROXIED="true"
    local TTL="120"

    # Type is hard-coded due to only being able to create an A record for this to work.
    local response=$(curl -sS -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_ID" \
        -H "Authorization: Bearer $PUT_KEY" \
        -H "Content-Type: application/json" \
        --data '{"type":"A","name":"'"$NAME"'","content":"'"$CONTENT"'","proxied":'"$PROXIED"',"ttl":'"$TTL"'}' | jq)
    
    echo -e "Response:\n$response\n"
}

# Environment
NAME=${DNS_RECORD_NAME}
GET_KEY=${GET_KEY}
PUT_KEY=${PUT_KEY}
ZONE_ID=${DNS_ZONE_ID}

# Start script execution
echo -e "\e[93mRunning update-ip.sh script at $(date)\e[0m"

# Get the external IP of the web server
CURRENT_IP=$(curl -s http://checkip.amazonaws.com)

# Get the JSON associated with the DNS record name.
DNS_RESPONSE=$(get_dns_record)

# Get the dns record id and the ip currently assigned to the record dynamically.
LAST_IP=$(get_record_attribute $DNS_RESPONSE "content")
DNS_ID=$(get_record_attribute $DNS_RESPONSE "id")
echo -e "DNSID: $DNS_ID\nIP: $LAST_IP"
# Compare the current IP with the last known IP and update on cloudflare if it has changed.
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo -e "\e[33mIP has changed from $LAST_IP to $CURRENT_IP.\n\e[0m"
  update_dns_record $CURRENT_IP
  echo -e "\e[33mIP updated to $CURRENT_IP, response above.\n\e[0m"
else
  echo -e "\e[33mIP has not changed.\n\e[0m"
fi
