# GCC 15.1.0 Configuration Reference

This document provides a comprehensive reference for all configuration options available in the GCC 15.1.0 build system, organized by component and feature type.

## Table of Contents

- [Main GCC Configuration](#main-gcc-configuration)
- [Runtime Libraries](#runtime-libraries)
- [Support Libraries](#support-libraries)
- [Language-Specific Libraries](#language-specific-libraries)
- [Environment Variables](#environment-variables)
- [Cross-Compilation Support](#cross-compilation-support)

## Main GCC Configuration

### Core Compiler Features

| Option                               | Description                                       | Default       |
| ------------------------------------ | ------------------------------------------------- | ------------- |
| `--enable-bootstrap`                 | Enable bootstrapping                              | yes if native |
| `--enable-languages=LIST`            | Specify which front-ends to build                 | -             |
| `--enable-checking[=LIST]`           | Enable expensive run-time checks                  | -             |
| `--enable-coverage[=LEVEL]`          | Enable compiler's code coverage collection        | noopt         |
| `--enable-gather-detailed-mem-stats` | Enable detailed memory allocation stats gathering | -             |
| `--enable-valgrind-annotations`      | Enable valgrind runtime interaction               | -             |
| `--enable-generated-files-in-srcdir` | Put copies of generated files in source dir       | -             |
| `--enable-plugin`                    | Enable plugin support                             | -             |

### Build System Options

| Option                                   | Description                                                      | Default |
| ---------------------------------------- | ---------------------------------------------------------------- | ------- |
| `--disable-option-checking`              | Ignore unrecognized --enable/--with options                      | -       |
| `--enable-maintainer-mode`               | Enable maintainer mode rules                                     | -       |
| `--enable-version-specific-runtime-libs` | Install runtime libraries in compiler-specific directory         | -       |
| `--enable-link-mutex`                    | Avoid linking multiple front-ends at once                        | -       |
| `--enable-link-serialization`            | Avoid linking multiple GCC front-ends at once using dependencies | -       |
| `--disable-largefile`                    | Omit support for large files                                     | -       |
| `--disable-build-format-warnings`        | Don't use -Wformat while building GCC                            | -       |
| `--enable-werror-always`                 | Enable -Werror despite compiler version                          | -       |

### Library Build Configuration

| Option                         | Description                                 | Default |
| ------------------------------ | ------------------------------------------- | ------- |
| `--enable-shared[=PKGS]`       | Build shared libraries                      | yes     |
| `--enable-static[=PKGS]`       | Build static libraries                      | yes     |
| `--enable-fast-install[=PKGS]` | Optimize for fast installation              | yes     |
| `--disable-libtool-lock`       | Avoid locking (might break parallel builds) | -       |
| `--enable-multilib`            | Enable library support for multiple ABIs    | -       |
| `--enable-multiarch`           | Enable support for multiarch paths          | -       |
| `--disable-shared`             | Don't provide a shared libgcc               | -       |

### Host and Target Configuration

| Option                   | Description                                       | Default |
| ------------------------ | ------------------------------------------------- | ------- |
| `--enable-host-shared`   | Build host code as shared libraries               | -       |
| `--enable-host-pie`      | Build host code as PIE                            | -       |
| `--enable-host-bind-now` | Link host code as BIND_NOW                        | -       |
| `--enable-default-pie`   | Enable Position Independent Executable as default | -       |
| `--enable-cet`           | Enable Intel CET in host libraries                | auto    |

### Debugging and Development

| Option                     | Description                                  | Default |
| -------------------------- | -------------------------------------------- | ------- |
| `--disable-analyzer`       | Disable -fanalyzer static analyzer           | -       |
| `--disable-gcov`           | Don't provide libgcov and related host tools | -       |
| `--enable-vtable-verify`   | Enable vtable verification feature           | -       |
| `--enable-libgdiagnostics` | Build libgdiagnostics shared library         | -       |
| `--enable-versioned-jit`   | Enable versioned libgccjit build             | -       |

### Language Support

| Option                                    | Description                                                          | Default |
| ----------------------------------------- | -------------------------------------------------------------------- | ------- |
| `--enable-__cxa_atexit`                   | Enable \_\_cxa_atexit for C++                                        | -       |
| `--enable-c++-tools`                      | Build auxiliary c++ tools                                            | -       |
| `--enable-objc-gc`                        | Enable use of Boehm's garbage collector with GNU Objective-C runtime | -       |
| `--enable-decimal-float={no,yes,bid,dpd}` | Enable decimal float extension to C                                  | -       |
| `--enable-fixed-point`                    | Enable fixed-point arithmetic extension to C                         | -       |
| `--enable-threads[=LIB]`                  | Enable thread usage for target GCC                                   | -       |
| `--enable-tls`                            | Enable or disable generation of tls code                             | -       |

### Security Features

| Option                                 | Description                                                               | Default |
| -------------------------------------- | ------------------------------------------------------------------------- | ------- |
| `--enable-libssp`                      | Enable linking against libssp                                             | -       |
| `--enable-default-ssp`                 | Enable Stack Smashing Protection as default                               | -       |
| `--enable-standard-branch-protection`  | Enable BTI, Return Address Signing, and Guarded Control Stack for AArch64 | -       |
| `--disable-standard-branch-protection` | Disable branch protection for AArch64                                     | -       |

### Platform-Specific Options

#### AArch64 Options

| Option                            | Description                                              | Default |
| --------------------------------- | -------------------------------------------------------- | ------- |
| `--enable-fix-cortex-a53-835769`  | Enable workaround for AArch64 Cortex-A53 erratum 835769  | -       |
| `--disable-fix-cortex-a53-835769` | Disable workaround for AArch64 Cortex-A53 erratum 835769 | -       |
| `--enable-fix-cortex-a53-843419`  | Enable workaround for AArch64 Cortex-A53 erratum 843419  | -       |
| `--disable-fix-cortex-a53-843419` | Disable workaround for AArch64 Cortex-A53 erratum 843419 | -       |

#### x86 Options

| Option                   | Description                                       | Default |
| ------------------------ | ------------------------------------------------- | ------- |
| `--enable-cld`           | Enable -mcld by default for 32bit x86             | -       |
| `--enable-frame-pointer` | Enable -fno-omit-frame-pointer by default for x86 | -       |

#### PowerPC Options

| Option               | Description                                | Default |
| -------------------- | ------------------------------------------ | ------- |
| `--enable-secureplt` | Enable -msecure-plt by default for PowerPC | -       |

#### S390 Options

| Option                                 | Description                                                       | Default |
| -------------------------------------- | ----------------------------------------------------------------- | ------- |
| `--enable-s390-excess-float-precision` | Evaluate float with double precision in standards-conforming mode | -       |

#### Windows Options

| Option                                 | Description                                        | Default          |
| -------------------------------------- | -------------------------------------------------- | ---------------- |
| `--enable-mingw-wildcard`              | Set whether to expand wildcard on command-line     | platform default |
| `--enable-large-address-aware`         | Link mingw executables with --large-address-aware  | -                |
| `--enable-leading-mingw64-underscores` | Enable leading underscores on 64 bit mingw targets | -                |
| `--disable-win32-registry`             | Disable lookup of installation paths in Registry   | -                |
| `--enable-win32-registry[=KEY]`        | Enable registry lookup                             | default          |
| `--disable-win32-utf8-manifest`        | Disable embedding a utf8 manifest on mingw hosts   | -                |
| `--enable-win32-utf8-manifest`         | Enable embedding a utf8 manifest on mingw hosts    | default          |

### Linker Configuration

| Option                           | Description                                                     | Default |
| -------------------------------- | --------------------------------------------------------------- | ------- |
| `--enable-ld[=ARG]`              | Build ld                                                        | -       |
| `--enable-gold[=ARG]`            | Build gold                                                      | -       |
| `--enable-gnu-indirect-function` | Enable use of @gnu_indirect_function to glibc systems           | -       |
| `--enable-gnu-unique-object`     | Enable use of @gnu_unique_object ELF extension on glibc systems | -       |
| `--enable-linker-build-id`       | Compiler will always pass --build-id to linker                  | -       |
| `--enable-initfini-array`        | Use .init_array/.fini_array sections                            | -       |
| `--enable-comdat`                | Enable COMDAT group support                                     | -       |

### Darwin-Specific Options

| Option                     | Description                                | Default |
| -------------------------- | ------------------------------------------ | ------- |
| `--enable-darwin-at-rpath` | Install libraries with @rpath/library-name | -       |

### Newlib Options

| Option                              | Description                   | Default |
| ----------------------------------- | ----------------------------- | ------- |
| `--enable-newlib-nano-formatted-io` | Use nano version formatted IO | -       |

## Runtime Libraries

### GNU C Runtime Library (libgcc)

| Option                                           | Description                                          | Default |
| ------------------------------------------------ | ---------------------------------------------------- | ------- |
| `--disable-shared`                               | Don't provide a shared libgcc                        | -       |
| `--enable-vtable-verify`                         | Enable vtable verification feature                   | -       |
| `--enable-decimal-float={no,yes,bid,dpd}`        | Enable decimal float extension to C                  | -       |
| `--enable-explicit-exception-frame-registration` | Register exception tables explicitly at module start | -       |
| `--disable-tm-clone-registry`                    | Disable TM clone registry                            | -       |
| `--enable-tls`                                   | Use thread-local storage                             | yes     |

### GNU Atomic Library (libatomic)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | no      |
| `--enable-maintainer-mode`               | Enable maintainer mode                 | -       |
| `--enable-multilib`                      | Build many library versions            | default |
| `--enable-symvers[=STYLE]`               | Enable symbol versioning               | -       |

### GNU Fortran Runtime Library (libgfortran)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |
| `--enable-libquadmath-support`           | Enable libquadmath support             | -       |
| `--enable-cet`                           | Enable Intel CET in target libraries   | auto    |

### GNU Offloading and Multi Processing Runtime Library (libgomp)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |
| `--enable-linux-futex`                   | Use the Linux futex system call        | -       |
| `--enable-tls`                           | Use thread-local storage               | -       |
| `--enable-omp-nest-lock`                 | Use nested locking                     | -       |

### GNU TM Runtime Library (libitm)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |
| `--enable-linux-futex`                   | Use the Linux futex system call        | -       |
| `--enable-tls`                           | Use thread-local storage               | -       |
| `--enable-symvers[=STYLE]`               | Enable symbol versioning               | -       |

### GCC Quad-precision Math Library (libquadmath)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |
| `--enable-symvers[=STYLE]`               | Enable symbol versioning               | -       |

### Stack Smashing Protector Library (libssp)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |

## Support Libraries

### Foreign Function Interface Library (libffi)

| Option                       | Description                          | Default |
| ---------------------------- | ------------------------------------ | ------- |
| `--enable-multilib`          | Build many library versions          | default |
| `--enable-pax_emutramp`      | Enable pax emulated trampolines      | -       |
| `--enable-ntconfig`          | Enable NT config                     | -       |
| `--enable-symvers`           | Enable symbol versioning             | -       |
| `--enable-exec-static-tramp` | Enable statically linked trampolines | -       |
| `--disable-docs`             | Disable building documentation       | -       |
| `--disable-structs`          | Disable struct support               | -       |
| `--disable-raw-api`          | Disable raw api                      | -       |
| `--enable-purify-safety`     | Enable purify safety                 | -       |

### libcc1

| Option                   | Description                             | Default |
| ------------------------ | --------------------------------------- | ------- |
| `--enable-werror-always` | Enable -Werror despite compiler version | -       |

### Codylib

| Option                     | Description                      | Default |
| -------------------------- | -------------------------------- | ------- |
| `--enable-maintainer-mode` | Enable maintainer mode           | -       |
| `--enable-checking`        | Enable expensive run-time checks | -       |
| `--enable-exceptions`      | Enable exceptions                | -       |

### CPP Library (cpplib)

| Option                              | Description                         | Default |
| ----------------------------------- | ----------------------------------- | ------- |
| `--enable-maintainer-mode`          | Enable maintainer mode              | -       |
| `--enable-checking`                 | Enable expensive run-time checks    | -       |
| `--enable-canonical-system-headers` | Enable canonical system headers     | -       |
| `--enable-host-shared`              | Build host code as shared libraries | -       |
| `--enable-cet`                      | Enable Intel CET in host libraries  | auto    |
| `--enable-valgrind-annotations`     | Enable valgrind runtime interaction | -       |

### Decimal Number Library (libdecnumber)

| Option                            | Description                 | Default |
| --------------------------------- | --------------------------- | ------- |
| `--enable-maintainer-mode`        | Enable maintainer mode      | -       |
| `--enable-werror`                 | Enable -Werror              | -       |
| `--enable-decimal-float[=FORMAT]` | Enable decimal float format | -       |

### FixIncludes

| Option                     | Description                               | Default |
| -------------------------- | ----------------------------------------- | ------- |
| `--enable-werror-always`   | Enable -Werror despite compiler version   | -       |
| `--enable-twoprocess`      | Use a separate process to apply the fixes | -       |
| `--enable-host-pie`        | Build host code as PIE                    | -       |
| `--enable-maintainer-mode` | Enable maintainer mode                    | -       |

## Language-Specific Libraries

### Rust Library (libgrust)

| Option                                   | Description                            | Default |
| ---------------------------------------- | -------------------------------------- | ------- |
| `--enable-version-specific-runtime-libs` | Install in compiler-specific directory | -       |
| `--enable-multilib`                      | Build many library versions            | default |

## Package Configuration Options

### Common Package Options

| Option                                | Description                                                       |
| ------------------------------------- | ----------------------------------------------------------------- |
| `--with-build-libsubdir=DIR`          | Directory where to find libraries for build system                |
| `--with-local-prefix=DIR`             | Specifies directory to put local include                          |
| `--with-native-system-header-dir=dir` | Use dir as the directory to look for standard system header files |
| `--with-build-sysroot=sysroot`        | Use sysroot as the system root during the build                   |
| `--with-sysroot[=DIR]`                | Search for usr/lib, usr/include, et al, within DIR                |
| `--with-gcc-major-version-only`       | Use only GCC major number in filesystem paths                     |

### Development Tools

| Option                              | Description                                           |
| ----------------------------------- | ----------------------------------------------------- |
| `--with-gxx-include-dir=DIR`        | Specifies directory to put g++ header files           |
| `--with-gxx-libcxx-include-dir=DIR` | Specifies directory to find libc++ header files       |
| `--with-cpp-install-dir=DIR`        | Install the user visible C preprocessor in DIR        |
| `--with-gnu-ld`                     | Arrange to work with GNU ld                           |
| `--with-ld`                         | Arrange to use the specified ld (full pathname)       |
| `--with-demangler-in-ld`            | Try to use demangler in GNU ld                        |
| `--with-dsymutil`                   | Arrange to use the specified dsymutil (full pathname) |
| `--with-gnu-as`                     | Arrange to work with GNU as                           |
| `--with-as`                         | Arrange to use the specified as (full pathname)       |

### Mathematical Libraries

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

### Compression Libraries

| Option                     | Description                                         |
| -------------------------- | --------------------------------------------------- |
| `--with-system-zlib`       | Use installed libz                                  |
| `--with-zstd=PATH`         | Specify prefix directory for installed zstd library |
| `--with-zstd-include=PATH` | Specify directory for installed zstd include files  |
| `--with-zstd-lib=PATH`     | Specify directory for the installed zstd library    |

### Garbage Collection

| Option                                  | Description                                            |
| --------------------------------------- | ------------------------------------------------------ |
| `--with-target-bdw-gc=PATHLIST`         | Specify prefix directory for installed bdw-gc package  |
| `--with-target-bdw-gc-include=PATHLIST` | Specify directories for installed bdw-gc include files |
| `--with-target-bdw-gc-lib=PATHLIST`     | Specify directories for installed bdw-gc library       |

### Build Configuration

| Option                                  | Description                                          |
| --------------------------------------- | ---------------------------------------------------- |
| `--with-stage1-libs=LIBS`               | Libraries for stage1                                 |
| `--with-static-standard-libraries`      | Use -static-libstdc++ and -static-libgcc             |
| `--with-stage1-ldflags=FLAGS`           | Linker flags for stage1                              |
| `--with-boot-libs=LIBS`                 | Libraries for stage2 and later                       |
| `--with-boot-ldflags=FLAGS`             | Linker flags for stage2 and later                    |
| `--with-debug-prefix-map='A=B C=D ...'` | Map A to B, C to D ... in debug information          |
| `--with-build-config='NAME NAME2...'`   | Use config/NAME.mk build configuration               |
| `--with-build-time-tools=PATH`          | Use given path to find target tools during the build |

### Documentation and Reporting

| Option                              | Description                                     |
| ----------------------------------- | ----------------------------------------------- |
| `--with-pkgversion=PKG`             | Use PKG in the version string in place of "GCC" |
| `--with-bugurl=URL`                 | Direct users to URL to report a bug             |
| `--with-documentation-root-url=URL` | Root for documentation URLs                     |
| `--with-changes-root-url=URL`       | Root for GCC changes URLs                       |

### Target Configuration

| Option                                          | Description                                                                   |
| ----------------------------------------------- | ----------------------------------------------------------------------------- |
| `--with-multilib-list`                          | Select multilibs (AArch64, ARM, AVR, nvptx, OR1K, RISC-V, SH and x86-64 only) |
| `--with-multilib-generator`                     | Multi-libs configuration string (RISC-V only)                                 |
| `--with-specs=SPECS`                            | Add SPECS to driver command-line processing                                   |
| `--with-stack-clash-protection-guard-size=size` | Set default stack clash protection guard size                                 |
| `--with-matchpd-partitions=num`                 | Set number of partitions for gimple and generic when splitting match.pd       |
| `--with-insnemit-partitions=num`                | Set number of partitions of insn-emit.cc                                      |
| `--with-dwarf2`                                 | Force the default debug format to be DWARF 2 (or later)                       |

### Internationalization

| Option                         | Description                                        |
| ------------------------------ | -------------------------------------------------- |
| `--with-libiconv-prefix[=DIR]` | Search for libiconv in DIR/include and DIR/lib     |
| `--without-libiconv-prefix`    | Don't search for libiconv in includedir and libdir |
| `--with-libiconv-type=TYPE`    | Type of library to search for (auto/static/shared) |
| `--with-libintl-prefix[=DIR]`  | Search for libintl in DIR/include and DIR/lib      |
| `--without-libintl-prefix`     | Don't search for libintl in includedir and libdir  |
| `--with-libintl-type=TYPE`     | Type of library to search for (auto/static/shared) |

### Runtime Library Configuration

| Option                              | Description                                              |
| ----------------------------------- | -------------------------------------------------------- |
| `--with-toolexeclibdir=DIR`         | Install libraries built with a cross compiler within DIR |
| `--with-system-libunwind`           | Use installed libunwind                                  |
| `--with-slibdir=DIR`                | Shared libraries in DIR LIBDIR                           |
| `--with-glibc-version=M.N`          | Assume GCC used with glibc version M.N or later          |
| `--with-aix-soname=aix\|svr4\|both` | Shared library versioning variant on AIX                 |

### Darwin-Specific

| Option                            | Description                                                  |
| --------------------------------- | ------------------------------------------------------------ |
| `--with-darwin-extra-rpath=[ARG]` | Specify a runpath directory, additional to compiler-provided |

### Plugin Configuration

| Option                   | Description               |
| ------------------------ | ------------------------- |
| `--with-plugin-ld=[ARG]` | Specify the plugin linker |

### Cross-Compilation

| Option                        | Description                              |
| ----------------------------- | ---------------------------------------- |
| `--with-target-subdir=SUBDIR` | Configuring in a subdirectory for target |
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

### Specialized Compilers

| Variable    | Description                |
| ----------- | -------------------------- |
| `GOC`       | Go compiler command        |
| `GOFLAGS`   | Go compiler flags          |
| `CCAS`      | Assembler compiler command |
| `CCASFLAGS` | Assembler compiler flags   |

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

## Cross-Compilation Support

### Target Configuration Options

| Option                            | Description                                            |
| --------------------------------- | ------------------------------------------------------ |
| `--enable-as-accelerator-for=ARG` | Build as offload target compiler                       |
| `--enable-offload-targets=LIST`   | Enable offloading to devices from comma-separated LIST |
| `--enable-offload-defaulted`      | Silently ignore unconfigured offload compilers         |

### Build System Configuration

| Option                        | Description                                              |
| ----------------------------- | -------------------------------------------------------- |
| `--with-target-subdir=SUBDIR` | Configuring in a subdirectory for target                 |
| `--with-cross-host=HOST`      | Configuring with a cross compiler                        |
| `--with-toolexeclibdir=DIR`   | Install libraries built with a cross compiler within DIR |

### Runtime Library Handling

| Option                                   | Description                                              |
| ---------------------------------------- | -------------------------------------------------------- |
| `--enable-version-specific-runtime-libs` | Install runtime libraries in compiler-specific directory |
| `--with-slibdir=DIR`                     | Shared libraries in DIR LIBDIR                           |
| `--with-glibc-version=M.N`               | Assume GCC used with glibc version M.N or later          |

---

_For bug reports and additional information, refer to the specific component documentation or the GNU GCC project._
