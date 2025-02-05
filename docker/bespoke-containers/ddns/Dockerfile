# Use the lightweight Alpine base image
FROM alpine:latest

# Install required tools: bash, curl, jq, and dcron (cron daemon for Alpine)
RUN apk add --no-cache bash curl dcron jq

# Set a working directory
WORKDIR /app

# Copy the script into the container
COPY update-ip.sh /app/update-ip.sh

# Make the script executable
# Change to just make script executable
RUN chmod +x /app/update-ip.sh

# Create a cron job file to run the script every 5 minutes
RUN echo "*/1 * * * * /app/update-ip.sh > /proc/1/fd/1 2>&1" > /etc/cron.d/dns-updater

# Start cron and keep it running
CMD ["crond", "-f", "-l", "2"]