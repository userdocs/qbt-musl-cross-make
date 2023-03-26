# qbt-musl-cross-make 

qbt-mcm custom builds

Multiarch Musl cross make build toolchains to use with Alpine Linux derived from https://git.zv.io/toolchains/musl-cross-make, which delivers the builds on this website http://musl.cc

The `config.mak` file [here](https://github.com/userdocs/qbt-musl-cross-make/blob/main/custom/config.mak) is used to build all items [defined in this list](https://git.zv.io/toolchains/musl-cross-make/-/blob/master/scripts/triples.txt)

[Here is the action](https://github.com/userdocs/qbt-musl-cross-make/blob/main/.github/workflows/matrix-mcm-build-and-release.yml)

These builds are targeted to be in sync with Alpine by setting these gcc options when compiling the cross toolchain.

https://git.alpinelinux.org/aports/tree/main/gcc/APKBUILD#n282

```bash
aarch64-linux-musl="--with-arch=armv8-a --with-abi=lp64"
arm-linux-musleabi="--with-arch=armv5te --with-tune=arm926ej-s --with-float=soft --with-abi=aapcs-linux"
arm-linux-musleabihf="--with-arch=armv6zk --with-tune=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-abi=aapcs-linux"
armv6-linux-musleabihf="--with-arch=armv6zk --with-tune=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-abi=aapcs-linux"
armv7l-linux-musleabihf="--with-arch=armv7-a --with-tune=generic-armv7-a --with-fpu=vfpv3-d16 --with-float=hard --with-abi=aapcs-linux --with-mode=thumb"
mips-linux-muslsf="--with-arch=mips32 --with-mips-plt --with-float=soft --with-abi=32"
mips64-linux-musl="--with-arch=mips3 --with-tune=mips64 --with-mips-plt --with-float=soft --with-abi=64"
mips64el-linux-musl="--with-arch=mips3 --with-tune=mips64 --with-mips-plt --with-float=soft --with-abi=64"
mipsel-linux-muslsf="--with-arch=mips32 --with-mips-plt --with-float=soft --with-abi=32"
powerpc-linux-muslsf="--enable-secureplt --enable-decimal-float=no"
powerpc64le-linux-musl="--with-abi=elfv2 --enable-secureplt --enable-decimal-float=no --enable-targets=powerpcle-linux"
s390x-linux-musl="--with-arch=i586 --with-tune=generic --enable-cld"
s390x="--with-arch=z196 --with-tune=zEC12 --with-zarch --with-long-double-128 --enable-decimal-float"
riscv64-linux-musl="--with-arch=rv64gc --with-abi=lp64d --enable-autolink-libatomic"
```