FROM nginx:latest

# Remove ALL default NGINX configs
RUN rm -f /etc/nginx/conf.d/*

# Copy custom nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Copy website content
COPY html/ /usr/share/nginx/html/

# Copy SSL certificates
RUN mkdir -p /etc/nginx/ssl
COPY ssl/server.crt /etc/nginx/ssl/server.crt
COPY ssl/server.key /etc/nginx/ssl/server.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
