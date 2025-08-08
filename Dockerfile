FROM alpine:edge@sha256:115729ec5cb049ba6359c3ab005ac742012d92bbaa5b8bc1a878f1e8f62c0cb8

ARG TARGETPLATFORM
ARG ARCH
ARG BASE_URL
ARG QBT_CROSS_NAME

ENV CHOST=${ARCH}
ENV CC=${ARCH}-gcc
ENV CXX=${ARCH}-g++
ENV AR=${ARCH}-ar
ENV QBT_MCM_DOCKER="YES"
ENV QBT_MCM_TARGET="${ARCH}"
ENV QBT_CROSS_NAME="${QBT_CROSS_NAME}"

RUN case "$TARGETPLATFORM" in \
        "linux/amd64") URL_PREFIX="x86_64" ;; \
        "linux/arm64") URL_PREFIX="aarch64" ;; \
        *) URL_PREFIX="" ;; \
    esac \
    && apk add -u --no-cache \
        autoconf automake bash cmake coreutils curl \
        file fortify-headers git gpg patch pkgconf \
        libtool make perl python3-dev \
        py3-numpy py3-numpy-dev libc-dev musl-dev \
        sudo nano linux-headers ttf-freefont \
        graphviz re2c xz ninja-build ninja-is-really-ninja \
    && curl -Lo- "${BASE_URL}/${URL_PREFIX}-${ARCH}.tar.xz" | tar xJf - --strip-components=1 -C /usr/local \
    && cd /usr/local/bin \
    && for f in ${ARCH}-*; do ln -s "$f" "${f#${ARCH}-}"; done

RUN adduser -h /home/username -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/username

RUN adduser -h /home/gh -Ds /bin/bash -u 1001 gh \
	&& printf '%s' 'gh ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gh

VOLUME /home/username
VOLUME /home/gh
