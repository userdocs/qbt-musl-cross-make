FROM alpine:edge

ARG TARGETPLATFORM
ARG URL
ARG ARCH
ARG BASE_URL

ENV CHOST=${ARCH}
ENV CC=${ARCH}-gcc
ENV CXX=${ARCH}-g++
ENV AR=${ARCH}-ar

RUN case "$TARGETPLATFORM" in \
        "linux/amd64") URL_PREFIX="x86_64-" ;; \
        "linux/arm64") URL_PREFIX="aarch64-" ;; \
        *) URL_PREFIX="" ;; \
    esac \
    && apk add -u --no-cache \
        autoconf automake bash cmake coreutils curl \
        file fortify-headers git gpg patch pkgconf \
        libtool make perl linux-headers ttf-freefont \
        graphviz re2c xz ninja-build ninja-is-really-ninja sudo \
    && curl -Lo- "${BASE_URL}/${URL_PREFIX}${ARCH}.tar.xz" | tar xJf - --strip-components=1 -C /usr/local \
    && cd /usr/local/bin \
    && for f in ${ARCH}-*; do ln -s "$f" "${f#${ARCH}-}"; done

RUN adduser -h /home/username -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/username

RUN adduser -h /home/github -Ds /bin/bash -u 1001 github \
	&& printf '%s' 'github ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

USER github
VOLUME /home/github
VOLUME /home/username
WORKDIR /home/github
