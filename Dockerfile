FROM registry.access.redhat.com/rhscl/php-72-rhel7

USER root

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install php-xmlrpc module from RHSCL repo 
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms; yum install -y rh-php72-php-xmlrpc; yum clean all

# Might want to refine this (something more specific than $APP_DATA)
RUN chgrp -Rf root $APP_DATA && chmod -Rf go+w $APP_DATA

# Set the default umask to user/group writeable
RUN find /etc/profile -type f -exec sed -i 's/022/002/g' {} \;

USER 1001
