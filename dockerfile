# Base image with Debian
FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install nginx + nodejs + npm
RUN apt-get update && \
    apt-get install -y nginx nodejs npm && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove default nginx site
RUN rm -rf /var/www/html/*

# Copy your static files
COPY index.html /var/www/html/index.html

# Expose HTTP port
# EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]