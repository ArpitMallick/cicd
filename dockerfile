RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all

# Create directory for website files
WORKDIR /var/www/html

# Download website files from the specified URL and unzip
RUN wget -O carvilla.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip && \
    unzip carvilla.zip && \
    rm carvilla.zip

# Copy the contents of the unzipped directory to the workdir
RUN mv carvilla-v1.0/* . && \
    rm -rf carvilla-v1.0

# Expose port 80 for accessing the Apache server
EXPOSE 80

# Start httpd service with daemon off
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
