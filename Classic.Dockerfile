FROM nginx:alpine

ADD https://raw.githubusercontent.com/scaccogatto/vue-nginx/master/conf/classic.conf /etc/nginx/nginx.conf

COPY dist /usr/share/nginx/html

EXPOSE 8080