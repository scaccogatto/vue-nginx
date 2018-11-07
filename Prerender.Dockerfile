FROM nginx:alpine

ENV PRERENDER_SERVER=prerender:3000
ENV PRERENDER_RESOLVER="127.0.0.1:53 ipv6=off"

ADD https://raw.githubusercontent.com/scaccogatto/vue-nginx/master/conf/prerender.conf /etc/nginx/nginx.conf.template

COPY dist /usr/share/nginx/html

EXPOSE 8080

CMD ["sh", "-c", "envsubst '${PRERENDER_SERVER},${PRERENDER_RESOLVER}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]