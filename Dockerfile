FROM ruby:3.3.0-alpine

RUN apk add --update --virtual \
        runtime-deps \
        postgresql-client \
        build-base \
        libxml2-dev \
        libxslt-dev \
        nodejs \
        yarn \
        libffi-dev \
        readline \
        build-base \
        postgresql-dev \
        libc-dev \ 
        linux-headers \
        readline-dev \
        file \
        imagemagick \
        git \ 
        tzdata \
        && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

RUN gem install bundler # -v 2.1.4
RUN bundle install


# ENTRYPOINT ["bin/rails"]
# CMD ["s", "-b", "0.0.0.0"]
CMD "bash"
EXPOSE 3000
