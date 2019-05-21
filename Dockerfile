FROM registry.access.redhat.com/rhscl/php-72-rhel7

USER root

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install php-xmlrpc module from RHSCL repo 
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms; yum install -y rh-php72-php-xmlrpc; yum clean all

# Might want to refine this (something more specific than $APP_DATA)
RUN chgrp -Rf root $APP_DATA && chmod -Rf g+w $APP_DATA

USER 1001010000
RUN umask 002

USER 1001
