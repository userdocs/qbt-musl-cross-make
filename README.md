# musl-cross-make custom builds

Multiarch Musl cross build toolchains to use with Alpine Linux based on https://git.zv.io/toolchains/musl-cross-make which delivers the builds on this website http://musl.cc

The `config.mak` file [here](https://github.com/userdocs/musl-cross-make/blob/main/config.mak) is used to build all items [defined in this list](https://git.zv.io/toolchains/musl-cross-make/-/blob/master/scripts/triples.txt)


[Here is the action](https://github.com/userdocs/musl-cross-make/blob/main/.github/workflows/matrix-musl-cross-make-and-release.yml)

Docker images are also published and are available here - https://hub.docker.com/repository/docker/userdocs/mcm

```docker
userdocs/mcm:tagname
```

[All available tags](https://git.zv.io/toolchains/musl-cross-make/-/raw/master/scripts/triples.txt)