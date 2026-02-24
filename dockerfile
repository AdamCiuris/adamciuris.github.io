# Use the official Nginx Alpine image
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your index.html to Nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 64000
EXPOSE 64000

# Update Nginx config to listen on 64000
RUN sed -i 's/listen       80;/listen       64000;/' /etc/nginx/conf.d/default.conf

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]