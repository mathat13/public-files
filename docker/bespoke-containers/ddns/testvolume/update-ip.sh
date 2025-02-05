#!/bin/bash
# Maybe allow new records to be created
# Add default values for PROXIED and TTL

function get_dns_record_id() {
    # return dns record id to outside variable
    echo $(curl -sS -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
        -H "Authorization: Bearer $GET_KEY" \
        -H "Content-Type: application/json" | jq -r '.result[] | select(.name == "'"$NAME"'" and .type == "A") | .id')
}

function get_dns_ip() {
    # return IP to outside variable
    echo $(curl -sS -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
        -H "Authorization: Bearer $GET_KEY" \
        -H "Content-Type: application/json" | jq -r '.result[] | select(.name == "'"$NAME"'" and .type == "A") | .content')
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

# Get the external IP of the web server and the IP stored on the DNS record on cloudflare.
CURRENT_IP=$(curl -s http://checkip.amazonaws.com)
LAST_IP=$(get_dns_ip)

# Get the dns record id from the record name dynamically just in case the dns record is 
# accidentally deleted and the dns name gets a new dns record id.
DNS_ID=$(get_dns_record_id)

# Compare the current IP with the last known IP and update on cloudflare if it has changed.
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo -e "\e[33mIP has changed from $LAST_IP to $CURRENT_IP.\n\e[0m"
  update_dns_record $CURRENT_IP
  echo -e "\e[33mIP updated to $CURRENT_IP, response above.\n\e[0m"
else
  echo -e "\e[33mIP has not changed.\n\e[0m"
fi
