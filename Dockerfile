FROM alpine:edge

RUN apk add -u --no-cache file fortify-headers patch make

ARG TARGET
ARG BASE_URL

ENV CHOST=${TARGET}
ENV CC=${TARGET}-gcc
ENV CXX=${TARGET}-g++
ENV AR=${TARGET}-ar

RUN wget -O toolchain.tar.xz "${BASE_URL}/${TARGET}.tar.xz" \
	&& tar -xzvf toolchain.tar.xz --strip-components=1 -C /usr/local \
	&& rm -rf toolchain.tar.xz \
	&& cd /usr/local/bin \
	&& (for f in ${TARGET}-*; do ln -s $f $(echo $f | sed "s/${TARGET}-//"); done)
