FROM alpine:edge

ARG TARGET
ARG BASE_URL

ENV CHOST=${TARGET}
ENV CC=${TARGET}-gcc
ENV CXX=${TARGET}-g++
ENV AR=${TARGET}-ar

RUN apk add -u --no-cache autoconf automake bash cmake coreutils curl file fortify-headers git gpg patch pkgconf libtool make perl linux-headers ttf-freefont graphviz re2c xz ninja-build ninja-is-really-ninja \
	&& curl -Lo- "${BASE_URL}/${TARGET}.tar.xz" | tar xJf - --strip-components=1 -C /usr/local \
	&& cd /usr/local/bin \
	&& (for f in ${TARGET}-*; do ln -s "$f" "${f#${TARGET}-}"; done)
