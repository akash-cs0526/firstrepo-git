FROM centos:7

LABEL maintainer="parttimewarrior34@gmail.com"

# Install required packages
RUN yum -y update && \
    yum install -y httpd unzip && \
    yum clean all

# Apache document root
WORKDIR /var/www/html

COPY photogenic/ /var/www/html/

RUN chown -R apache:apache /var/www/html

# Expose Apache port
EXPOSE 80

# Run Apache in foregroud
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
