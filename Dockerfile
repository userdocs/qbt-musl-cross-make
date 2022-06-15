FROM alpine:edge

RUN apk add -u --no-cache file fortify-headers patch make

ARG TARGET
ARG BASE_URL

ENV CHOST=${TARGET}
ENV CC=${TARGET}-gcc
ENV CXX=${TARGET}-g++
ENV AR=${TARGET}-ar

RUN wget -O toolchain.tar.gz "${BASE_URL}/${TARGET}.tar.gz" \
    && tar -xzvf toolchain.tar.gz --strip-components=1 -C /usr/local \
    && rm -rf toolchain.tar.gz \
    && cd /usr/local/bin \
    && (for f in ${TARGET}-*; do ln -s $f $(echo $f | sed "s/${TARGET}-//"); done)