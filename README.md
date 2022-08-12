# musl-cross-make (mcm) custom builds

Multiarch Musl cross build toolchains to use with Alpine Linux based on https://git.zv.io/toolchains/musl-cross-make which delivers the builds on this website http://musl.cc

The `config.mak` file [here](https://github.com/userdocs/qbt-musl-cross-make/blob/main/config.mak) is used to build all items [defined in this list](https://git.zv.io/toolchains/musl-cross-make/-/blob/master/scripts/triples.txt)


[Here is the action](https://github.com/userdocs/qbt-musl-cross-make/blob/main/.github/workflows/matrix-mcm-build-and-release.yml)

These builds are targeted to be in sync with Alpine by setting these gcc options when compiling the cross toolchain.

https://git.alpinelinux.org/aports/tree/main/gcc/APKBUILD#n284

```bash
armhf: "--with-arch=armv6zk --with-tune=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-abi=aapcs-linux"
armv7: "--with-arch=armv7-a --with-tune=generic-armv7-a --with-fpu=vfpv3-d16 --with-float=hard --with-abi=aapcs-linux --with-mode=thumb"
aarch64: "--with-arch=armv8-a --with-abi=lp64"
```