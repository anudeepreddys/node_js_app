# Use the official Nginx image as the base
FROM nginx:latest

# Copy the custom index.html file to the appropriate location
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80