FROM ruby:2.7-alpine3.13

ARG ALPINE_SERVER=""

WORKDIR /app

COPY Gemfile* ./

RUN set -eux \
    &&  if [[ -n "${ALPINE_SERVER}" ]]; then \
          sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_SERVER}/" /etc/apk/repositories; \
        fi \
    &&  apk add --no-cache mariadb-connector-c \
    &&  apk add --no-cache --virtual .build-deps \
          autoconf \
          bison \
          bzip2 \
          bzip2-dev \
          ca-certificates \
          coreutils \
          dpkg-dev dpkg \
          gcc \
          gdbm-dev \
          glib-dev \
          libc-dev \
          libffi-dev \
          libressl \
          libressl-dev \
          libxml2-dev \
          libxslt-dev \
          linux-headers \
          make \
          ncurses-dev \
          procps \
          readline-dev \
          ruby \
          tar \
          xz \
          yaml-dev \
          zlib-dev \
          mariadb-dev \
    &&  bundle update --bundler \
    &&  bundle install \
    &&  apk del .build-deps

COPY config/ ./config
COPY lib/ ./lib
COPY public/ ./public
COPY test/ ./test
COPY views/ ./views
COPY config.ru ./
COPY main.rb  ./
COPY Rakefile ./

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN ["chmod", "+x", "/usr/local/bin/entrypoint.sh"]

ENTRYPOINT ["entrypoint.sh"]

CMD ["puma", "config.ru"]

