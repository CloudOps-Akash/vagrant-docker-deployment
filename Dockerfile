FROM ubuntu:latest

# Set the timezone non-interactively
ENV TZ=UTC

# Pre-seed the timezone package
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install Nginx, PHP, and PHP-FPM
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx php apache2 && \
    rm -rf /var/lib/apt/lists/*

# Uncomment the listen directive in PHP-FPM configuration and set it to 127.0.0.1:8080
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8080>/g' /etc/apache2/sites-enabled/000-default.conf

# Copy your PHP application files to the container
COPY html/ /var/www/html/
COPY nginx.conf /etc/nginx/sites-available/mywebapp

# Enable your Nginx configuration
RUN ln -s /etc/nginx/sites-available/mywebapp /etc/nginx/sites-enabled/ && \
    rm /etc/nginx/sites-enabled/default  # Remove the default Nginx configuration

# Expose port 80
EXPOSE 80

# Restart PHP-FPM and Nginx
RUN service nginx restart && service apache2 restart


# Start Nginx and PHP-FPM
CMD service apache2 restart && nginx -g "daemon off;"
