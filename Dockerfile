# Stage 1: Build (optional)
FROM ubuntu:24.04 as builder

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/kapilsinghoffical001-droid/kapil.git /app

# Stage 2: Production
FROM ubuntu:24.04

RUN apt-get update && apt-get install -y apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/www/html/*

COPY --from=builder /app /var/www/html

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
