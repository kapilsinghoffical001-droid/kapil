FROM ubuntu:24.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y apache2 wget unzip

# Remove default files
RUN rm -rf /var/www/html/*

# Download and setup your repo (MASTER branch)
RUN wget https://github.com/kapilsinghoffical001-droid/kapil/archive/refs/heads/master.zip && \
    unzip master.zip && \
    cp -r kapil-master/* /var/www/html/ && \
    rm -rf master.zip kapil-master

# Expose port
EXPOSE 80

# Run Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
