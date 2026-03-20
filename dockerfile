# Use the official Nginx Alpine image
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your index.html to Nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 54321
EXPOSE 54321

# Update Nginx config to listen on 54321
RUN sed -i 's/listen       80;/listen       54321;/' /etc/nginx/conf.d/default.conf

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

# docker build -t gateway-test .
# docker run -p 54321:80 gateway-test