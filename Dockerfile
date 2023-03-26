FROM alpine:edge

RUN apk add -u --no-cache autoconf automake bash cmake coreutils curl file fortify-headers git gpg patch pkgconf libtool make perl linux-headers ttf-freefont graphviz re2c

ARG TARGET
ARG BASE_URL
ARG NINJA_URL

ENV CHOST=${TARGET}
ENV CC=${TARGET}-gcc
ENV CXX=${TARGET}-g++
ENV AR=${TARGET}-ar

RUN curl -Lo toolchain.tar.xz "${BASE_URL}/${TARGET}.tar.xz" \
	&& tar -xvf toolchain.tar.xz --strip-components=1 -C /usr/local \
	&& rm -rf toolchain.tar.xz \
	&& cd /usr/local/bin \
	&& (for f in ${TARGET}-*; do ln -s "$f" "${f#${TARGET}-}"; done) \
	&& curl -Lo /usr/local/bin/ninja "${NINJA_URL}" \
	&& chmod +x /usr/local/bin/ninja
