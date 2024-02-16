FROM amazonlinux:latest
# Update package repository and install required packages
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all
# Set up Apache server
RUN systemctl start httpd && \
    systemctl enable httpd
# Create directory for website files and set it as the working directory
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
# Download website files
RUN wget -O carvilla.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip && \
    unzip carvilla.zip && \
    rm carvilla.zip
# Expose port 80 for accessing the Apache server
EXPOSE 80
# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
