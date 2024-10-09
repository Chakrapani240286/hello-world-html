# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy your HTML page into the Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 9090 to the outside world
EXPOSE 9090

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
