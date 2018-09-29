FROM nginx:alpine

ADD default.conf /tmp/default.conf
ADD mustache.sh /usr/local/lib/mustache.sh
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
