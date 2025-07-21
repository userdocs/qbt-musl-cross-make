# Binutils 2.44 Configuration Reference

This document provides a comprehensive reference for all configuration options available in the Binutils 2.44 build system, organized by component and feature type.

## Table of Contents

- [Common Configuration Options](#common-configuration-options)
- [Component-Specific Options](#component-specific-options)
- [Environment Variables](#environment-variables)
- [Library Dependencies](#library-dependencies)

## Common Configuration Options

### Build System Features

| Option                          | Description                                                       | Default | Components |
| ------------------------------- | ----------------------------------------------------------------- | ------- | ---------- |
| `--enable-silent-rules`         | Less verbose build output (undo: "make V=1")                      | -       | All        |
| `--disable-silent-rules`        | Verbose build output (undo: "make V=0")                           | -       | All        |
| `--enable-maintainer-mode`      | Enable make rules and dependencies not useful to casual installer | -       | All        |
| `--enable-dependency-tracking`  | Do not reject slow dependency extractors                          | -       | Most       |
| `--disable-dependency-tracking` | Speeds up one-time build                                          | -       | Most       |
| `--disable-option-checking`     | Ignore unrecognized --enable/--with options                       | -       | All        |

### Library Build Options

| Option                         | Description                                 | Default | Components |
| ------------------------------ | ------------------------------------------- | ------- | ---------- |
| `--enable-shared[=PKGS]`       | Build shared libraries                      | Varies  | Most       |
| `--enable-static[=PKGS]`       | Build static libraries                      | yes     | Most       |
| `--enable-fast-install[=PKGS]` | Optimize for fast installation              | yes     | Most       |
| `--disable-libtool-lock`       | Avoid locking (might break parallel builds) | -       | Most       |
| `--with-pic`                   | Try to use only PIC/non-PIC objects         | both    | Most       |
| `--with-gnu-ld`                | Assume the C compiler uses GNU ld           | no      | Most       |

### Debug and Development Options

| Option                    | Description                                        | Default | Components                      |
| ------------------------- | -------------------------------------------------- | ------- | ------------------------------- |
| `--enable-checking`       | Enable run-time checks                             | -       | bfd, binutils, gas, ld, opcodes |
| `--enable-werror`         | Treat compile warnings as errors                   | -       | Most                            |
| `--enable-build-warnings` | Enable build-time compiler warnings                | -       | Most                            |
| `--disable-largefile`     | Omit support for large files                       | -       | Most                            |
| `--enable-64-bit-bfd`     | 64-bit support (on hosts with narrower word sizes) | -       | bfd, ld, opcodes                |

### Internationalization

| Option            | Description                           | Default | Components |
| ----------------- | ------------------------------------- | ------- | ---------- |
| `--disable-nls`   | Do not use Native Language Support    | -       | Most       |
| `--disable-rpath` | Do not hardcode runtime library paths | -       | Most       |

## Component-Specific Options

### Main Toolchain Options

| Option                            | Description                                            | Default       |
| --------------------------------- | ------------------------------------------------------ | ------------- |
| `--enable-as-accelerator-for=ARG` | Build as offload target compiler                       | -             |
| `--enable-offload-targets=LIST`   | Enable offloading to devices from comma-separated LIST | -             |
| `--enable-offload-defaulted`      | Silently ignore unconfigured offload compilers         | -             |
| `--enable-bootstrap`              | Enable bootstrapping                                   | yes if native |
| `--enable-pgo-build[=lto]`        | Enable the PGO build                                   | -             |
| `--enable-lto`                    | Enable link time optimization support                  | -             |
| `--enable-year2038`               | Enable support for timestamps past the year 2038       | -             |

### Library Control

| Option                          | Description                             | Default |
| ------------------------------- | --------------------------------------- | ------- |
| `--disable-libquadmath`         | Do not build libquadmath directory      | -       |
| `--disable-libquadmath-support` | Disable libquadmath support for Fortran | -       |
| `--enable-libada`               | Build libada directory                  | -       |
| `--enable-libgm2`               | Build libgm2 directory                  | -       |
| `--enable-libssp`               | Build libssp directory                  | -       |
| `--disable-libstdcxx`           | Do not build libstdc++-v3 directory     | -       |
| `--enable-libdiagnostics`       | Build libdiagnostics shared library     | -       |

### Host and Target Configuration

| Option                            | Description                                 | Default |
| --------------------------------- | ------------------------------------------- | ------- |
| `--enable-host-pie`               | Build position independent host executables | -       |
| `--enable-host-shared`            | Build host code as shared libraries         | -       |
| `--enable-stage1-languages[=all]` | Choose additional languages for stage1      | -       |
| `--enable-stage1-checking[=all]`  | Choose additional checking for stage1       | -       |

### BFD Specific Options

| Option                                 | Description                                         | Default |
| -------------------------------------- | --------------------------------------------------- | ------- |
| `--enable-plugins`                     | Enable support for plugins                          | -       |
| `--enable-targets`                     | Alternative target configurations                   | -       |
| `--enable-64-bit-archive`              | Force 64-bit archives                               | -       |
| `--enable-secureplt`                   | Default to creating read-only plt entries           | -       |
| `--enable-separate-code`               | Enable -z separate-code in ELF linker by default    | -       |
| `--enable-leading-mingw64-underscores` | Enable leading underscores on 64 bit mingw targets  | -       |
| `--enable-install-libbfd`              | Controls installation of libbfd and related headers | -       |

### Binutils Specific Options

| Option                            | Description                                            | Default |
| --------------------------------- | ------------------------------------------------------ | ------- |
| `--enable-deterministic-archives` | ar and ranlib default to -D behavior                   | -       |
| `--disable-default-strings-all`   | strings defaults to --data behavior                    | -       |
| `--enable-f-for-ifunc-symbols`    | Have nm use F and f for ifunc symbols                  | -       |
| `--enable-follow-debug-links`     | Have readelf and objdump follow debug links by default | -       |
| `--enable-colored-disassembly`    | Have objdump use colors in disassembly by default      | -       |
| `--enable-libctf`                 | Handle .ctf type-info sections                         | yes     |

### Gas (Assembler) Specific Options

| Option                                              | Description                                      | Default |
| --------------------------------------------------- | ------------------------------------------------ | ------- |
| `--enable-compressed-debug-sections={all,gas,none}` | Compress debug sections by default               | -       |
| `--enable-x86-relax-relocations`                    | Generate x86 relax relocations by default        | -       |
| `--enable-x86-tls-check`                            | Check x86 TLS relocation by default              | -       |
| `--enable-elf-stt-common`                           | Generate ELF common symbols with STT_COMMON type | -       |
| `--enable-generate-build-notes`                     | Generate GNU Build notes if none provided        | -       |
| `--enable-mips-fix-loongson3-llsc`                  | Enable MIPS fix Loongson3 LLSC errata            | -       |
| `--enable-x86-used-note`                            | Generate GNU x86 used ISA and feature properties | -       |
| `--enable-default-riscv-attribute`                  | Generate RISC-V arch attribute by default        | -       |

### LD (Linker) Specific Options

| Option                                             | Description                                              | Default |
| -------------------------------------------------- | -------------------------------------------------------- | ------- |
| `--enable-gold[=ARG]`                              | Build gold linker                                        | -       |
| `--enable-got=<type>`                              | GOT handling scheme (target, single, negative, multigot) | -       |
| `--enable-compressed-debug-sections={all,ld,none}` | Compress debug sections by default                       | -       |
| `--enable-new-dtags`                               | Set DT_RUNPATH instead of DT_RPATH by default            | -       |
| `--enable-relro`                                   | Enable -z relro in ELF linker by default                 | -       |
| `--enable-textrel-check=[yes\|no\|warning\|error]` | Enable DT_TEXTREL check in ELF linker                    | -       |
| `--enable-rosegment`                               | Enable --rosegment in the ELF linker by default          | -       |
| `--enable-mark-plt`                                | Enable -z mark-plt in ELF x86-64 linker by default       | -       |
| `--enable-memory-seal`                             | Enable -z memory-seal in ELF linker by default           | -       |
| `--enable-warn-execstack`                          | Enable warnings when creating executable stack           | -       |
| `--enable-error-execstack`                         | Turn executable stack warnings into errors               | -       |
| `--enable-warn-rwx-segments`                       | Enable warnings when creating RWX segments               | -       |
| `--enable-error-rwx-segments`                      | Turn executable segment warnings into errors             | -       |
| `--enable-default-execstack`                       | Create executable stack if missing .note.GNU-stack       | -       |
| `--enable-error-handling-script`                   | Enable/disable --error-handling-script option            | -       |
| `--enable-default-hash-style={sysv,gnu,both}`      | Use this default hash style                              | -       |
| `--disable-initfini-array`                         | Do not use .init_array/.fini_array sections              | -       |
| `--enable-jansson`                                 | Enable jansson                                           | no      |

### GProfNG Specific Options

| Option                    | Description                             | Default |
| ------------------------- | --------------------------------------- | ------- |
| `--disable-gprofng`       | Do not build gprofng                    | -       |
| `--enable-werror-always`  | Enable -Werror despite compiler version | -       |
| `--disable-gprofng-tools` | Do not build gprofng/src directory      | -       |
| `--enable-gprofng-debug`  | Enable debugging output                 | no      |

### Opcodes Specific Options

| Option                    | Description                | Default |
| ------------------------- | -------------------------- | ------- |
| `--enable-cgen-maint=dir` | Build cgen generated files | -       |

### Libiberty Specific Options

| Option                       | Description                               | Default |
| ---------------------------- | ----------------------------------------- | ------- |
| `--enable-multilib`          | Build many library versions               | default |
| `--enable-install-libiberty` | Install headers and library for end users | -       |
| `--enable-cet`               | Enable Intel CET in host libraries        | auto    |

### LibCTF Specific Options

| Option                           | Description                                               | Default |
| -------------------------------- | --------------------------------------------------------- | ------- |
| `--enable-libctf-hash-debugging` | Enable expensive CTF deduplication type hashing debugging | no      |

### Zlib Specific Options

| Option              | Description            | Default |
| ------------------- | ---------------------- | ------- |
| `--enable-host-pie` | Build host code as PIE | -       |

## Library Dependencies

### Path Specification Options

| Option                     | Description                                            |
| -------------------------- | ------------------------------------------------------ |
| `--with-mpc=PATH`          | Specify prefix directory for installed MPC package     |
| `--with-mpc-include=PATH`  | Specify directory for installed MPC include files      |
| `--with-mpc-lib=PATH`      | Specify directory for the installed MPC library        |
| `--with-mpfr=PATH`         | Specify prefix directory for installed MPFR package    |
| `--with-mpfr-include=PATH` | Specify directory for installed MPFR include files     |
| `--with-mpfr-lib=PATH`     | Specify directory for the installed MPFR library       |
| `--with-gmp=PATH`          | Specify prefix directory for the installed GMP package |
| `--with-gmp-include=PATH`  | Specify directory for installed GMP include files      |
| `--with-gmp-lib=PATH`      | Specify directory for the installed GMP library        |
| `--with-isl=PATH`          | Specify prefix directory for the installed isl package |
| `--with-isl-include=PATH`  | Specify directory for installed isl include files      |
| `--with-isl-lib=PATH`      | Specify the directory for the installed isl library    |

### Garbage Collection Options

| Option                                  | Description                                                          |
| --------------------------------------- | -------------------------------------------------------------------- |
| `--with-target-bdw-gc=PATHLIST`         | Specify prefix directory for installed bdw-gc package                |
| `--with-target-bdw-gc-include=PATHLIST` | Specify directories for installed bdw-gc include files               |
| `--with-target-bdw-gc-lib=PATHLIST`     | Specify directories for installed bdw-gc library                     |
| `--enable-objc-gc`                      | Enable use of Boehm's garbage collector with GNU Objective-C runtime |

### Compression Libraries

| Option               | Description                            | Default |
| -------------------- | -------------------------------------- | ------- |
| `--with-system-zlib` | Use installed libz                     | -       |
| `--with-zstd`        | Support zstd compressed debug sections | auto    |

### Other Libraries

| Option              | Description                                              |
| ------------------- | -------------------------------------------------------- |
| `--with-debuginfod` | Enable debuginfo lookups with debuginfod (auto/yes/no)   |
| `--with-msgpack`    | Enable msgpack support (auto/yes/no)                     |
| `--with-jdk=PATH`   | Specify prefix directory for installed JDK               |
| `--with-xxhash`     | Use inlined libxxhash for hashing (faster) (auto/yes/no) |

### Internationalization Libraries

| Option                         | Description                                        |
| ------------------------------ | -------------------------------------------------- |
| `--with-libiconv-prefix[=DIR]` | Search for libiconv in DIR/include and DIR/lib     |
| `--without-libiconv-prefix`    | Don't search for libiconv in includedir and libdir |
| `--with-libiconv-type=TYPE`    | Type of library to search for (auto/static/shared) |
| `--with-libintl-prefix[=DIR]`  | Search for libintl in DIR/include and DIR/lib      |
| `--without-libintl-prefix`     | Don't search for libintl in includedir and libdir  |
| `--with-libintl-type=TYPE`     | Type of library to search for (auto/static/shared) |

### Build Configuration

| Option                                | Description                                             |
| ------------------------------------- | ------------------------------------------------------- |
| `--with-build-libsubdir=DIR`          | Directory where to find libraries for build system      |
| `--with-stage1-libs=LIBS`             | Libraries for stage1                                    |
| `--with-static-standard-libraries`    | Use -static-libstdc++ and -static-libgcc (default=auto) |
| `--with-stage1-ldflags=FLAGS`         | Linker flags for stage1                                 |
| `--with-boot-libs=LIBS`               | Libraries for stage2 and later                          |
| `--with-boot-ldflags=FLAGS`           | Linker flags for stage2 and later                       |
| `--with-build-sysroot=SYSROOT`        | Use sysroot as the system root during the build         |
| `--with-build-config='NAME NAME2...'` | Use config/NAME.mk build configuration                  |
| `--with-build-time-tools=PATH`        | Use given path to find target tools during the build    |

### Debugging and Development

| Option                                  | Description                                              |
| --------------------------------------- | -------------------------------------------------------- |
| `--with-separate-debug-dir=DIR`         | Look for global separate debug info in DIR               |
| `--with-debug-prefix-map='A=B C=D ...'` | Map A to B, C to D ... in debug information              |
| `--with-pkgversion=PKG`                 | Use PKG in the version string in place of "GNU Binutils" |
| `--with-bugurl=URL`                     | Direct users to URL to report a bug                      |

### Linker Specific

| Option                         | Description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| `--with-lib-path=dir1:dir2...` | Set default LIB_PATH                                         |
| `--with-sysroot=DIR`           | Search for usr/lib et al within DIR                          |
| `--with-cpu=CPU`               | Default cpu variant is CPU (currently only supported on ARC) |
| `--with-mmap`                  | Try using mmap for BFD input files if available              |

### Cross-compilation

| Option                        | Description                              |
| ----------------------------- | ---------------------------------------- |
| `--with-target-subdir=SUBDIR` | Configuring in a subdirectory for target |
| `--with-build-subdir=SUBDIR`  | Configuring in a subdirectory for build  |
| `--with-cross-host=HOST`      | Configuring with a cross compiler        |
| `--with-newlib`               | Configuring with newlib                  |

## Environment Variables

### Core Compilation Variables

| Variable   | Description                          | Used By |
| ---------- | ------------------------------------ | ------- |
| `CC`       | C compiler command                   | All     |
| `CFLAGS`   | C compiler flags                     | All     |
| `CXX`      | C++ compiler command                 | Most    |
| `CXXFLAGS` | C++ compiler flags                   | Most    |
| `CPP`      | C preprocessor                       | Most    |
| `CXXCPP`   | C++ preprocessor                     | Some    |
| `CPPFLAGS` | (Objective) C/C++ preprocessor flags | All     |
| `LDFLAGS`  | Linker flags                         | All     |
| `LIBS`     | Libraries to pass to the linker      | All     |

### Build Configuration Variables

| Variable            | Description                                           |
| ------------------- | ----------------------------------------------------- |
| `build_configargs`  | Additional configure arguments for build directories  |
| `host_configargs`   | Additional configure arguments for host directories   |
| `target_configargs` | Additional configure arguments for target directories |

### Host Tool Variables

| Variable   | Description           |
| ---------- | --------------------- |
| `AR`       | AR for the host       |
| `AS`       | AS for the host       |
| `DLLTOOL`  | DLLTOOL for the host  |
| `DSYMUTIL` | DSYMUTIL for the host |
| `LD`       | LD for the host       |
| `LIPO`     | LIPO for the host     |
| `NM`       | NM for the host       |
| `RANLIB`   | RANLIB for the host   |
| `STRIP`    | STRIP for the host    |
| `WINDRES`  | WINDRES for the host  |
| `WINDMC`   | WINDMC for the host   |
| `OBJCOPY`  | OBJCOPY for the host  |
| `OBJDUMP`  | OBJDUMP for the host  |
| `OTOOL`    | OTOOL for the host    |
| `READELF`  | READELF for the host  |

### Target Tool Variables

| Variable              | Description             |
| --------------------- | ----------------------- |
| `CC_FOR_TARGET`       | CC for the target       |
| `CXX_FOR_TARGET`      | CXX for the target      |
| `GCC_FOR_TARGET`      | GCC for the target      |
| `GFORTRAN_FOR_TARGET` | GFORTRAN for the target |
| `GOC_FOR_TARGET`      | GOC for the target      |
| `GDC_FOR_TARGET`      | GDC for the target      |
| `GM2_FOR_TARGET`      | GM2 for the target      |
| `AR_FOR_TARGET`       | AR for the target       |
| `AS_FOR_TARGET`       | AS for the target       |
| `DLLTOOL_FOR_TARGET`  | DLLTOOL for the target  |
| `DSYMUTIL_FOR_TARGET` | DSYMUTIL for the target |
| `LD_FOR_TARGET`       | LD for the target       |
| `LIPO_FOR_TARGET`     | LIPO for the target     |
| `NM_FOR_TARGET`       | NM for the target       |
| `OBJCOPY_FOR_TARGET`  | OBJCOPY for the target  |
| `OBJDUMP_FOR_TARGET`  | OBJDUMP for the target  |
| `OTOOL_FOR_TARGET`    | OTOOL for the target    |
| `RANLIB_FOR_TARGET`   | RANLIB for the target   |
| `READELF_FOR_TARGET`  | READELF for the target  |
| `STRIP_FOR_TARGET`    | STRIP for the target    |
| `WINDRES_FOR_TARGET`  | WINDRES for the target  |
| `WINDMC_FOR_TARGET`   | WINDMC for the target   |

### Parser and Build Tool Variables

| Variable            | Description                                               |
| ------------------- | --------------------------------------------------------- |
| `YACC`              | The 'Yet Another Compiler Compiler' implementation to use |
| `YFLAGS`            | Arguments passed by default to $YACC                      |
| `PKG_CONFIG`        | Path to pkg-config utility                                |
| `PKG_CONFIG_PATH`   | Directories to add to pkg-config's search path            |
| `PKG_CONFIG_LIBDIR` | Path overriding pkg-config's built-in search path         |

### Library-Specific Variables

| Variable            | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `ZSTD_CFLAGS`       | C compiler flags for ZSTD, overriding pkg-config       |
| `ZSTD_LIBS`         | Linker flags for ZSTD, overriding pkg-config           |
| `DEBUGINFOD_CFLAGS` | C compiler flags for DEBUGINFOD, overriding pkg-config |
| `DEBUGINFOD_LIBS`   | Linker flags for DEBUGINFOD, overriding pkg-config     |
| `MSGPACK_CFLAGS`    | C compiler flags for MSGPACK, overriding pkg-config    |
| `MSGPACK_LIBS`      | Linker flags for MSGPACK, overriding pkg-config        |
| `JANSSON_CFLAGS`    | C compiler flags for JANSSON, overriding pkg-config    |
| `JANSSON_LIBS`      | Linker flags for JANSSON, overriding pkg-config        |

---

_Report bugs to the package provider._
