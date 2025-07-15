## Optional Features

| Option                                                           | Description                                                                                                              |
| ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| --disable-option-checking                                        | Ignore unrecognized --enable/--with options                                                                              |
| --disable-FEATURE                                                | Do not include FEATURE (same as --enable-FEATURE=no)                                                                     |
| --enable-FEATURE[=ARG]                                           | Include FEATURE [ARG=yes]                                                                                                |
| --enable-darwin-at-rpath                                         | Install libraries with @rpath/library-name, requires rpaths to be added to executables                                   |
| --enable-cet                                                     | Enable Intel CET in host/target libraries [default=auto]                                                                 |
| --enable-werror-always                                           | Enable -Werror despite compiler version                                                                                  |
| --enable-plugin                                                  | Enable plugin support                                                                                                    |
| --enable-host-shared                                             | Build host code as shared libraries                                                                                      |
| --enable-host-pie                                                | Build host code as PIE                                                                                                   |
| --enable-maintainer-mode                                         | Enable make rules and dependencies not useful to the casual installer                                                    |
| --enable-checking[=LIST]                                         | Enable expensive run-time checks. With LIST, enable only specific categories of checks.                                  |
| --enable-exceptions                                              | Enable exceptions & rtti                                                                                                 |
| --enable-multilib                                                | Build many library versions (default)                                                                                    |
| --enable-silent-rules                                            | Less verbose build output (undo: "make V=1")                                                                             |
| --disable-silent-rules                                           | Verbose build output (undo: "make V=0")                                                                                  |
| --enable-dependency-tracking                                     | Do not reject slow dependency extractors                                                                                 |
| --disable-dependency-tracking                                    | Speeds up one-time build                                                                                                 |
| --enable-version-specific-runtime-libs                           | Specify that runtime libraries should be installed in a compiler-specific directory                                      |
| --enable-shared[=PKGS]                                           | Build shared libraries [default=yes]                                                                                     |
| --enable-static[=PKGS]                                           | Build static libraries [default=yes]                                                                                     |
| --enable-fast-install[=PKGS]                                     | Optimize for fast installation [default=yes]                                                                             |
| --disable-libtool-lock                                           | Avoid locking (might break parallel builds)                                                                              |
| --disable-largefile                                              | Omit support for large files                                                                                             |
| --disable-werror                                                 | Disable building with -Werror                                                                                            |
| --enable-generated-files-in-srcdir                               | Put copies of generated files in source dir for creating source tarballs                                                 |
| --enable-sjlj-exceptions                                         | Arrange to use setjmp/longjmp exception handling                                                                         |
| --disable-nls                                                    | Do not use Native Language Support                                                                                       |
| --enable-default-pie                                             | Enable Position Independent Executable as default                                                                        |
| --enable-default-ssp                                             | Enable Stack Smashing Protection as default                                                                              |
| --enable-libssp                                                  | Enable linking against libssp                                                                                            |
| --enable-libgdiagnostics                                         | Build libgdiagnostics shared library                                                                                     |
| --enable-vtable-verify                                           | Enable vtable verification feature                                                                                       |
| --enable-objc-gc                                                 | Enable use of Boehm's garbage collector with the GNU Objective-C runtime                                                 |
| --enable-link-mutex                                              | Avoid linking multiple front-ends at once                                                                                |
| --enable-link-serialization                                      | Avoid linking multiple GCC front-ends at once using make dependencies                                                    |
| --enable-pgo-build[=lto]                                         | Enable the PGO build                                                                                                     |
| --enable-lto                                                     | Enable link time optimization support                                                                                    |
| --enable-compressed-debug-sections={all,gas,gold,ld,none}        | Enable compressed debug sections for gas, gold or ld by default                                                          |
| --enable-default-compressed-debug-sections-algorithm={zlib,zstd} | Default compression algorithm for debug sections                                                                         |
| --enable-year2038                                                | Enable support for timestamps past the year 2038                                                                         |
| --disable-libquadmath                                            | Do not build libquadmath directory                                                                                       |
| --disable-libquadmath-support                                    | Disable libquadmath support for Fortran                                                                                  |
| --enable-libada                                                  | Build libada directory                                                                                                   |
| --enable-libgm2                                                  | Build libgm2 directory                                                                                                   |
| --disable-libstdcxx                                              | Do not build libstdc++-v3 directory                                                                                      |
| --enable-bootstrap                                               | Enable bootstrapping [yes if native build]                                                                               |
| --disable-isl-version-check                                      | Disable check for isl version                                                                                            |
| --enable-linker-plugin-configure-flags=FLAGS                     | Additional flags for configuring linker plugins [none]                                                                   |
| --enable-linker-plugin-flags=FLAGS                               | Additional flags for configuring and building linker plugins [none]                                                      |
| --enable-stage1-languages[=all]                                  | Choose additional languages to build during stage1                                                                       |
| --enable-serial-[{host,target,build}-]configure                  | Force sequential configuration of sub-packages                                                                           |
| --enable-stage1-checking[=all]                                   | Choose additional checking for stage1 of the compiler                                                                    |
| --enable-werror                                                  | Enable -Werror in bootstrap stage2 and later                                                                             |
| --enable-c++-tools                                               | Build auxiliary c++ tools                                                                                                |
| --enable-default-pie                                             | Enable Position Independent Executable as default                                                                        |
| --enable-host-bind-now                                           | Link host code as BIND_NOW                                                                                               |
| --enable-twoprocess                                              | Use a separate process to apply the fixes                                                                                |
| --enable-build-format-warnings                                   | Use -Wformat while building GCC                                                                                          |
| --enable-coverage[=LEVEL]                                        | Enable compiler's code coverage collection                                                                               |
| --enable-gather-detailed-mem-stats                               | Enable detailed memory allocation stats gathering                                                                        |
| --enable-valgrind-annotations                                    | Enable valgrind runtime interaction                                                                                      |
| --enable-multiarch                                               | Enable support for multiarch paths                                                                                       |
| --enable-__cxa_atexit                                            | Enable __cxa_atexit for C++                                                                                              |
| --enable-decimal-float={no,yes,bid,dpd}                          | Enable decimal float extension to C                                                                                      |
| --enable-fixed-point                                             | Enable fixed-point arithmetic extension to C                                                                             |
| --enable-threads[=LIB]                                           | Enable thread usage for target GCC, using LIB thread package                                                             |
| --enable-tls                                                     | Enable or disable generation of tls code                                                                                 |
| --disable-analyzer                                               | Disable -fanalyzer static analyzer                                                                                       |
| --disable-shared                                                 | Don't provide a shared libgcc                                                                                            |
| --disable-gcov                                                   | Don't provide libgcov and related host tools                                                                             |
| --enable-languages=LIST                                          | Specify which front-ends to build                                                                                        |
| --disable-rpath                                                  | Do not hardcode runtime library paths                                                                                    |
| --enable-secureplt                                               | Enable -msecure-plt by default for PowerPC                                                                               |
| --enable-mingw-wildcard                                          | Set whether to expand wildcard on command-line                                                                           |
| --enable-large-address-aware                                     | Link mingw executables with --large-address-aware                                                                        |
| --enable-leading-mingw64-underscores                             | Enable leading underscores on 64 bit mingw targets                                                                       |
| --enable-cld                                                     | Enable -mcld by default for 32bit x86                                                                                    |
| --enable-frame-pointer                                           | Enable -fno-omit-frame-pointer by default for x86                                                                        |
| --disable-win32-registry                                         | Disable lookup of installation paths in the Registry on Windows hosts                                                    |
| --enable-win32-registry                                          | Enable registry lookup (default)                                                                                         |
| --enable-win32-registry=KEY                                      | Use KEY instead of GCC version as the last portion of the registry key                                                   |
| --enable-fast-install[=PKGS]                                     | Optimize for fast installation [default=yes]                                                                             |
| --enable-gnu-indirect-function                                   | Enable the use of the @gnu_indirect_function to glibc systems                                                            |
| --enable-initfini-array                                          | Use .init_array/.fini_array sections                                                                                     |
| --enable-comdat                                                  | Enable COMDAT group support                                                                                              |
| --enable-newlib-nano-formatted-io                                | Use nano version formatted IO                                                                                            |
| --enable-standard-branch-protection                              | Enable Branch Target Identification Mechanism, Return Address Signing, and Guarded Control Stack by default for AArch64  |
| --disable-standard-branch-protection                             | Disable Branch Target Identification Mechanism, Return Address Signing, and Guarded Control Stack by default for AArch64 |
| --enable-fix-cortex-a53-835769                                   | Enable workaround for AArch64 Cortex-A53 erratum 835769 by default                                                       |
| --disable-fix-cortex-a53-835769                                  | Disable workaround for AArch64 Cortex-A53 erratum 835769 by default                                                      |
| --enable-fix-cortex-a53-843419                                   | Enable workaround for AArch64 Cortex-A53 erratum 843419 by default                                                       |
| --disable-fix-cortex-a53-843419                                  | Disable workaround for AArch64 Cortex-A53 erratum 843419 by default                                                      |
| --enable-gnu-unique-object                                       | Enable the use of the @gnu_unique_object ELF extension on glibc systems                                                  |
| --enable-linker-build-id                                         | Compiler will always pass --build-id to linker                                                                           |
| --enable-versioned-jit                                           | Enable versioned libgccjit build                                                                                         |
| --enable-s390-excess-float-precision                             | On s390 targets, evaluate float with double precision when in standards-conforming mode                                  |
| --enable-linux-futex                                             | Use the Linux futex system call [default=default]                                                                        |
| --enable-symvers=STYLE                                           | Enables symbol versioning of the shared library [default=yes]                                                            |
| --enable-explicit-exception-frame-registration                   | Register exception tables explicitly at module start                                                                     |
| --disable-tm-clone-registry                                      | Disable TM clone registry                                                                                                |
| --enable-libstdcxx-time[=KIND]                                   | Use KIND for check type [default=auto]                                                                                   |
| --enable-libstdcxx-pch                                           | Build pre-compiled libstdc++ headers [default=$is_hosted]                                                                |
| --enable-cstdio[=PACKAGE]                                        | Use target-specific I/O package [default=stdio]                                                                          |
| --enable-clocale[=MODEL]                                         | Use MODEL for target locale package [default=auto]                                                                       |
| --enable-nls                                                     | Use Native Language Support (default)                                                                                    |
| --enable-libstdcxx-allocator[=KIND]                              | Use KIND for target std::allocator base [default=auto]                                                                   |
| --enable-cheaders-obsolete                                       | Allow use of obsolete "C" headers for g++ [default=no]                                                                   |
| --enable-cheaders[=KIND]                                         | Construct "C" headers for g++ [default=$c_model]                                                                         |
| --enable-long-long                                               | Enable template specializations for 'long long' [default=yes]                                                            |
| --enable-wchar_t                                                 | Enable template specializations for 'wchar_t' [default=yes]                                                              |
| --enable-c99                                                     | Turns on ISO/IEC 9899:1999 support [default=yes]                                                                         |
| --enable-concept-checks                                          | Use Boost-derived template checks [default=no]                                                                           |
| --enable-libstdcxx-debug-flags=FLAGS                             | Pass compiler FLAGS when building debug library [default="-g3 -O0 -D_GLIBCXX_ASSERTIONS"]                                |
| --enable-libstdcxx-debug                                         | Build extra debug library [default=no]                                                                                   |
| --enable-cxx-flags=FLAGS                                         | Pass compiler FLAGS when building library [default=]                                                                     |
| --enable-fully-dynamic-string                                    | Do not put empty strings in per-process static memory [default=no]                                                       |
| --enable-extern-template                                         | Enable extern template [default=yes]                                                                                     |
| --enable-libstdcxx-visibility                                    | Enables visibility safe usage [default=yes]                                                                              |
| --enable-libstdcxx-dual-abi                                      | Support two versions of std::string [default=yes]                                                                        |
| --enable-libstdcxx-threads                                       | Enable C++11 threads support [default=auto]                                                                              |
| --enable-libstdcxx-filesystem-ts                                 | Turns on ISO/IEC TS 18822 support [default=auto]                                                                         |
| --enable-libstdcxx-backtrace                                     | Turns on libbacktrace support [default=auto]                                                                             |
| --enable-libstdcxx-static-eh-pool                                | Use a fixed-size static buffer for allocating exceptions if malloc fails                                                 |
| --enable-vtable-verify                                           | Enable vtable verify [default=no]                                                                                        |

## Optional Packages

| Option                                                   | Description                                                                                        |
| -------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| --with-PACKAGE[=ARG]                                     | Use PACKAGE [ARG=yes]                                                                              |
| --without-PACKAGE                                        | Do not use PACKAGE (same as --with-PACKAGE=no)                                                     |
| --with-build-libsubdir=DIR                               | Directory where to find libraries for build system                                                 |
| --with-pic                                               | Try to use only PIC/non-PIC objects [default=use both]                                             |
| --with-gnu-ld                                            | Assume the C compiler uses GNU ld [default=no]                                                     |
| --with-gcc-major-version-only                            | Use only GCC major number in filesystem paths                                                      |
| --with-local-prefix=DIR                                  | Specifies directory to put local include                                                           |
| --with-native-system-header-dir=dir                      | Use dir as the directory to look for standard system header files in. Defaults to /usr/include.    |
| --with-build-sysroot=sysroot                             | Use sysroot as the system root during the build                                                    |
| --with-sysroot[=DIR]                                     | Search for usr/lib, usr/include, et al, within DIR                                                 |
| --with-gxx-include-dir=DIR                               | Specifies directory to put g++ header files                                                        |
| --with-gxx-libcxx-include-dir=DIR                        | Specifies directory to find libc++ header files                                                    |
| --with-cpp-install-dir=DIR                               | Install the user visible C preprocessor in DIR (relative to PREFIX) as well as PREFIX/bin          |
| --with-ld                                                | Arrange to use the specified ld (full pathname)                                                    |
| --with-demangler-in-ld                                   | Try to use demangler in GNU ld                                                                     |
| --with-dsymutil                                          | Arrange to use the specified dsymutil (full pathname)                                              |
| --with-gnu-as                                            | Arrange to work with GNU as                                                                        |
| --with-as                                                | Arrange to use the specified as (full pathname)                                                    |
| --with-stack-clash-protection-guard-size=size            | Set the default stack clash protection guard size for specific targets as a power of two in bytes. |
| --with-matchpd-partitions=num                            | Set the number of partitions to make for gimple and generic when splitting match.pd. [default=10]  |
| --with-insnemit-partitions=num                           | Set the number of partitions of insn-emit.cc for genemit and genrecog to create. [default=10]      |
| --with-dwarf2                                            | Force the default debug format to be DWARF 2 (or later)                                            |
| --with-specs=SPECS                                       | Add SPECS to driver command-line processing                                                        |
| --with-pkgversion=PKG                                    | Use PKG in the version string in place of "GCC"                                                    |
| --with-bugurl=URL                                        | Direct users to URL to report a bug                                                                |
| --with-documentation-root-url=URL                        | Root for documentation URLs                                                                        |
| --with-changes-root-url=URL                              | Root for GCC changes URLs                                                                          |
| --with-multilib-list                                     | Select multilibs (AArch64, ARM, AVR, nvptx, OR1K, RISC-V, SH and x86-64 only)                      |
| --with-multilib-generator                                | Multi-libs configuration string (RISC-V only)                                                      |
| --with-zstd=PATH                                         | Specify prefix directory for installed zstd library.                                               |
| --with-zstd-include=PATH                                 | Specify directory for installed zstd include files                                                 |
| --with-zstd-lib=PATH                                     | Specify directory for the installed zstd library                                                   |
| --with-libiconv-prefix[=DIR]                             | Search for libiconv in DIR/include and DIR/lib                                                     |
| --without-libiconv-prefix                                | Don't search for libiconv in includedir and libdir                                                 |
| --with-libiconv-type=TYPE                                | Type of library to search for (auto/static/shared)                                                 |
| --with-libintl-prefix[=DIR]                              | Search for libintl in DIR/include and DIR/lib                                                      |
| --without-libintl-prefix                                 | Don't search for libintl in includedir and libdir                                                  |
| --with-libintl-type=TYPE                                 | Type of library to search for (auto/static/shared)                                                 |
| --with-darwin-extra-rpath=[ARG]                          | Specify a runpath directory, additional to those provided by the compiler                          |
| --with-plugin-ld=[ARG]                                   | Specify the plugin linker                                                                          |
| --with-glibc-version=M.N                                 | Assume GCC used with glibc version M.N or later                                                    |
| --with-long-double-128                                   | Use 128-bit long double by default                                                                 |
| --with-long-double-format={ieee,ibm}                     | Specify whether PowerPC long double uses IEEE or IBM format                                        |
| --with-gc={page,zone}                                    | (Not supported anymore) Used to choose the garbage collection mechanism                            |
| --with-system-zlib                                       | Use installed libz                                                                                 |
| --with-linker-hash-style={sysv,gnu,both}                 | Specify the linker hash style                                                                      |
| --with-diagnostics-color={never,auto,auto-if-env,always} | Specify the default of -fdiagnostics-color option                                                  |
| --with-diagnostics-urls={never,auto,auto-if-env,always}  | Specify the default of -fdiagnostics-urls option                                                   |
| --with-mpc=PATH                                          | Specify prefix directory for installed MPC package                                                 |
| --with-mpc-include=PATH                                  | Directory for installed MPC include files                                                          |
| --with-mpc-lib=PATH                                      | Directory for the installed MPC library                                                            |
| --with-mpfr=PATH                                         | Prefix directory for installed MPFR package                                                        |
| --with-mpfr-include=PATH                                 | Directory for installed MPFR include files                                                         |
| --with-mpfr-lib=PATH                                     | Directory for the installed MPFR library                                                           |
| --with-gmp=PATH                                          | Prefix directory for the installed GMP package                                                     |
| --with-gmp-include=PATH                                  | Directory for installed GMP include files                                                          |
| --with-gmp-lib=PATH                                      | Directory for the installed GMP library                                                            |
| --with-stage1-libs=LIBS                                  | Libraries for stage1                                                                               |
| --with-static-standard-libraries                         | Use -static-libstdc++ and -static-libgcc (default=auto)                                            |
| --with-stage1-ldflags=FLAGS                              | Linker flags for stage1                                                                            |
| --with-boot-libs=LIBS                                    | Libraries for stage2 and later                                                                     |
| --with-boot-ldflags=FLAGS                                | Linker flags for stage2 and later                                                                  |
| --with-isl=PATH                                          | Prefix directory for the installed isl package                                                     |
| --with-isl-include=PATH                                  | Directory for installed isl include files                                                          |
| --with-isl-lib=PATH                                      | Directory for the installed isl library                                                            |
| --with-target-bdw-gc=PATHLIST                            | Prefix directory for installed bdw-gc package                                                      |
| --with-target-bdw-gc-include=PATHLIST                    | Directories for installed bdw-gc include files                                                     |
| --with-target-bdw-gc-lib=PATHLIST                        | Directories for installed bdw-gc library                                                           |
| --with-build-config='NAME NAME2...'                      | Use config/NAME.mk build configuration                                                             |
| --with-build-time-tools=PATH                             | Use given path to find target tools during the build                                               |
| --with-toolexeclibdir=DIR                                | Install libraries built with a cross compiler within DIR                                           |
| --with-system-libunwind                                  | Use installed libunwind                                                                            |
| --with-target-subdir=SUBDIR                              | Configuring in a subdirectory for target                                                           |
| --with-cross-host=HOST                                   | Configuring with a cross compiler                                                                  |
| --with-newlib                                            | Assume newlib as a system C library                                                                |
| --with-libstdcxx-lock-policy={atomic,mutex,auto}         | Synchronization policy for shared_ptr reference counting [default=auto]                            |
| --with-python-dir                                        | The location to install Python modules (relative to prefix)                                        |
| --with-default-libstdcxx-abi                             | Set the std::string ABI to use by default                                                          |
| --with-libstdcxx-eh-pool-obj-count                       | The number of exceptions that can be allocated from the pool if malloc fails                       |
| --with-libstdcxx-zoneinfo                                | The location to use for tzdata                                                                     |
| --with-libphobos-druntime-only={yes,no,auto}             | Build only the druntime library (default: auto)                                                    |
| --with-bugurl=URL                                        | Direct users to URL to report a bug                                                                |

## Influential Environment Variables

| Variable            | Description                                                                                                             |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| CC                  | C compiler command                                                                                                      |
| CFLAGS              | C compiler flags                                                                                                        |
| LDFLAGS             | Linker flags, e.g. -L<lib dir> if you have libraries in a nonstandard directory <lib dir>                               |
| LIBS                | Libraries to pass to the linker, e.g. -l<library>                                                                       |
| CPPFLAGS            | (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if you have headers in a nonstandard directory <include dir> |
| CPP                 | C preprocessor                                                                                                          |
| CXX                 | C++ compiler command                                                                                                    |
| CXXFLAGS            | C++ compiler flags                                                                                                      |
| CXXCPP              | C++ preprocessor                                                                                                        |
| build_configargs    | Additional configure arguments for build directories                                                                    |
| host_configargs     | Additional configure arguments for host directories                                                                     |
| target_configargs   | Additional configure arguments for target directories                                                                   |
| AR                  | AR for the host                                                                                                         |
| AS                  | AS for the host                                                                                                         |
| DLLTOOL             | DLLTOOL for the host                                                                                                    |
| DSYMUTIL            | DSYMUTIL for the host                                                                                                   |
| LD                  | LD for the host                                                                                                         |
| LIPO                | LIPO for the host                                                                                                       |
| NM                  | NM for the host                                                                                                         |
| RANLIB              | RANLIB for the host                                                                                                     |
| STRIP               | STRIP for the host                                                                                                      |
| WINDRES             | WINDRES for the host                                                                                                    |
| WINDMC              | WINDMC for the host                                                                                                     |
| OBJCOPY             | OBJCOPY for the host                                                                                                    |
| OBJDUMP             | OBJDUMP for the host                                                                                                    |
| OTOOL               | OTOOL for the host                                                                                                      |
| READELF             | READELF for the host                                                                                                    |
| CC_FOR_TARGET       | CC for the target                                                                                                       |
| CXX_FOR_TARGET      | CXX for the target                                                                                                      |
| GCC_FOR_TARGET      | GCC for the target                                                                                                      |
| GFORTRAN_FOR_TARGET | GFORTRAN for the target                                                                                                 |
| GOC_FOR_TARGET      | GOC for the target                                                                                                      |
| GDC_FOR_TARGET      | GDC for the target                                                                                                      |
| GM2_FOR_TARGET      | GM2 for the target                                                                                                      |
| AR_FOR_TARGET       | AR for the target                                                                                                       |
| AS_FOR_TARGET       | AS for the target                                                                                                       |
| DLLTOOL_FOR_TARGET  | DLLTOOL for the target                                                                                                  |
| DSYMUTIL_FOR_TARGET | DSYMUTIL for the target                                                                                                 |
| LD_FOR_TARGET       | LD for the target                                                                                                       |
| LIPO_FOR_TARGET     | LIPO for the target                                                                                                     |
| NM_FOR_TARGET       | NM for the target                                                                                                       |
| OBJCOPY_FOR_TARGET  | OBJCOPY for the target                                                                                                  |
| OBJDUMP_FOR_TARGET  | OBJDUMP for the target                                                                                                  |
| OTOOL_FOR_TARGET    | OTOOL for the target                                                                                                    |
| RANLIB_FOR_TARGET   | RANLIB for the target                                                                                                   |
| READELF_FOR_TARGET  | READELF for the target                                                                                                  |
| STRIP_FOR_TARGET    | STRIP for the target                                                                                                    |
| WINDRES_FOR_TARGET  | WINDRES for the target                                                                                                  |
| WINDMC_FOR_TARGET   | WINDMC for the target                                                                                                   |
| GMPLIBS             | How to link GMP                                                                                                         |
| GMPINC              | How to find GMP include files                                                                                           |
| ISLLIBS             | How to link isl                                                                                                         |
| ISLINC              | How to find isl include files                                                                                           |
| CCAS                | Assembler compiler command (defaults to CC)                                                                             |
| CCASFLAGS           | Assembler compiler flags (defaults to CFLAGS)                                                                           |
| FC                  | Fortran compiler command                                                                                                |
| FCFLAGS             | Fortran compiler flags                                                                                                  |
| GOC                 | Go compiler command                                                                                                     |
| GOFLAGS             | Go compiler flags                                                                                                       |
