FROM alpine:edge

RUN apk add -u --no-cache curl git file fortify-headers patch make

ARG TARGET
ARG BASE_URL

ENV CHOST=${TARGET}
ENV CC=${TARGET}-gcc
ENV CXX=${TARGET}-g++
ENV AR=${TARGET}-ar

RUN curl -Lo toolchain.tar.xz "${BASE_URL}/${TARGET}.tar.xz" \
	&& tar -xvf toolchain.tar.xz --strip-components=1 -C /usr/local \
	&& rm -rf toolchain.tar.xz \
	&& cd /usr/local/bin \
	&& for f in ${TARGET}-*; do ln -s "$f" "${f#${TARGET}-}"; done
