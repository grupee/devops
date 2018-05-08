FROM nginx:1.12.2

COPY ./html/* /usr/share/nginx/html/

#EXPOSE 80