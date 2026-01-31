FROM centos:7

LABEL maintainer="parttimewarrior34@gmail.com"

# Install required packages
RUN yum -y update && \
    yum install -y httpd unzip && \
    yum clean all

# Apache document root
WORKDIR /var/www/html

RUN curl -L -o photogenic.zip \
    https://freehtml5.co/photogenic-free-bootstrap-portfolio-website-template/

RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose Apache port
EXPOSE 80

# Run Apache in foregroud
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
