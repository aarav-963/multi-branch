FROM ubuntu:latest

# Install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy index.html from Jenkins workspace
COPY index.html /var/www/html/index.html

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
