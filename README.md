# musl-cross-make (mcm) custom builds

Multiarch Musl cross build toolchains to use with Alpine Linux based on https://git.zv.io/toolchains/qbt-musl-cross-make which delivers the builds on this website http://musl.cc

The `config.mak` file [here](https://github.com/userdocs/qbt-musl-cross-make/blob/main/config.mak) is used to build all items [defined in this list](https://git.zv.io/toolchains/musl-cross-make/-/blob/master/scripts/triples.txt)


[Here is the action](https://github.com/userdocs/qbt-musl-cross-make/blob/main/.github/workflows/matrix-mcm-build-and-release.yml)

These builds are targeted to be in sync with Alpine by setting these gcc options when compiling the cross toolchain.

https://git.alpinelinux.org/aports/tree/main/gcc/APKBUILD#n276

```bash
aarch64="--with-arch=armv8-a --with-abi=lp64"
armv5="--with-arch=armv5te --with-tune=arm926ej-s --with-float=soft --with-abi=aapcs-linux"
armv6="--with-arch=armv6zk --with-tune=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-abi=aapcs-linux"
armv7="--with-arch=armv7-a --with-tune=generic-armv7-a --with-fpu=vfpv3-d16 --with-float=hard --with-abi=aapcs-linux --with-mode=thumb"
mips="--with-arch=mips32 --with-mips-plt --with-float=soft --with-abi=32"
mips64="--with-arch=mips3 --with-tune=mips64 --with-mips-plt --with-float=soft --with-abi=64"
mips64el="--with-arch=mips3 --with-tune=mips64 --with-mips-plt --with-float=soft --with-abi=64"
mipsel="--with-arch=mips32 --with-mips-plt --with-float=soft --with-abi=32"
powerpc="--enable-secureplt --enable-decimal-float=no"
powerpc64="--with-abi=elfv2 --enable-secureplt --enable-decimal-float=no --enable-targets=powerpcle-linux"
i486="--with-arch=i486 --with-tune=generic --enable-cld"
i586="--with-arch=i586 --with-tune=generic --enable-cld"
s390x="--with-arch=z196 --with-tune=zEC12 --with-zarch --with-long-double-128 --enable-decimal-float"
riscv64="--with-arch=rv64gc --with-abi=lp64d --enable-autolink-libatomic"
```