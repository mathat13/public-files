# Use the lightweight Alpine base image
FROM alpine:latest

# Install required tools: bash, curl, jq, and dcron (cron daemon for Alpine)
RUN apk add --no-cache bash curl dcron jq

# Set a working directory
WORKDIR /app

# Copy the  ip update script into the container
# and make script executable
COPY update-ip.sh /app/update-ip.sh
RUN chmod +x /app/update-ip.sh

# Add entrypoint script for updating update frequency
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]