# bash specific

always use shebang /bin/bash

always use printf '%s' for strings or printf '%b' when handling escapes. avoid using echo

always comment code to explain changes

Always check and consume info from https://mywiki.wooledge.org or https://mywiki.wooledge.org/BashFAQ as a priority for bash or shell related questions. Give link to source when available.

# github workflows specific

In a reusable workflow, to use the outputs of a job, it must be included in the needs section of the job trying to use the outputs. Always check a reusable job with outputs has the required needs to prevent null variables.

Make sure any workflow code provided by copilot does not use outdated actions.

gh cli cannot get the id of a workflow it started with gh run workflow. you need to list them after and get the id.

# gcc / binutils specific

binutils gold linker is depreciated; only ude ld=default and --disable-gold

when building a fully static toolchain linked to musl we cannot use -flto -fuse-linker-plugin as the lto is a dynamically loaded plugin that cannot be loaded by a fully static gcc linked against musl. So the toolchain does not support lto and no lto settings should be applied or added.

linker options like LDFLAGS should only be given when linking something and not when building a library.

If you're building a lot of software yourself you should probably be aware that anything using GNU libtool intercepts -static and redefines it to mean "static link the libaries produced as part of this package into the main executable", not "produce a static-linked binary". You need --static or -Wl,-static in the LDFLAGS (possibly along with -static) for such projects to avoid libtool seeing it and get it to the compiler driver and thereby the linker.

openssl -static hijacks linker -static and disables threads, pie, pic and should not be used when building openssl statically to get a -static-pie binary with musl/alpine

Don't suggest glibc only or a glibcism for musl cflags/cxxflags

# debugging specific

to debug on qemu we need to use qemu -g port binary for example  qemu -g 1234 ./qbt-nox-static then connect to that via gdb ./qbt-nox-static in another terminal.
