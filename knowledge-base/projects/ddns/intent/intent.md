# Problem

Currently on a home network and plan to self-host a web server.  My home router is ISP provided and doesn't support routing to another DNS server nor customization of it's own server.  Unfortunately, when the router restarts, the public IP of the home network changes, and so the DNS record of anything within the home network is no longer correct, meaning external users cannot reach internal services any longer without manual intervention.

# Motivation

- Many remote access solutions couple Dynamic DNS with tunnelling or remote access functionality, rather than providing a dedicated IP synchronisation service
- I currently have a container network that could host this service
- I would like to learn how to perform DDNS manually for learning purposes
- I would like to learn how to containerize an application and put it on DockerHub

# Target Audience

Home Lab entusiasts that value simplicity

# Vision

Dynamic updating of external DNS records without any intervention from oneself, improving internal service reliability for the external world and consequently, user experience.

# Constraints

## Assumptions

- Users will already have the infrastructure required to host the service

## Requirements

- Must be set-and-forget, that is, user configures once and it then works

## Preferences

- The less money the better
- Solution optimized for useability
- Solution is implemented via docker containers

# Idea

A service ran inside the home network that automatically detects changes to the home's public IP address and updates external DNS records accordingly