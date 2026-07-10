# Problem

Currently on a home network and plan to self-host a web server.  My home router is ISP provided and doesn't support routing to another DNS server nor customization of it's own server.  Unfortunately, when the router restarts, the public IP of the home network changes, and so the DNS record of anything within the home network is no longer correct, meaning external users cannot reach internal services any longer without manual intervention.

# Motivation

- Current solutions are either too much effort or cost money
- I would like to learn how to perform DDNS manually for learning purposes
- I would like to learn how to containerize an application and put it on DockerHub
- I would like to provide a solution to the world that simplifies something that can be seen as complex

# Constraints

- The less money the better
- Must be as simple as possible for the user to set up
- Must be set-and-forget, that is user configures once and it then works

# Vision

Dynamic updating of external DNS records without any intervention from oneself, improving internal service reliability for the external world and consequently, user experience.

# Target Audience

Home Lab entusiasts that want a way to keep their home network public IP synchronized with external DNS without having to buy a custom router.

# Idea

A service that automatically detects changes to the home's public IP address and updates external DNS records accordingly.