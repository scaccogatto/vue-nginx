FROM nginx:alpine

ENV PRERENDER_SERVER=http://prerender

ADD https://raw.githubusercontent.com/scaccogatto/vue-nginx/master/conf/prerender.conf /etc/nginx/nginx.conf.template
ADD conf/prerender.conf /etc/nginx/nginx.conf.template

COPY dist /usr/share/nginx/html

CMD ["sh", "-c", "envsubst '${PRERENDER_SERVER}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]