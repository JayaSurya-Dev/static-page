# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Remove the default Nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your static HTML file to Nginx's default directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
