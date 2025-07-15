# Optimization Flags - Ensure no LTO flags are present
OPTIMIZATION_FLAGS = -O3 -pipe -fdata-sections -ffunction-sections

# Preprocessor Flags
PREPROCESSOR_FLAGS = -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS

# Security Flags - Remove incompatible flags for musl
SECURITY_FLAGS = \
    -fstack-clash-protection \
    -fstack-protector-strong \
    -fno-delete-null-pointer-checks \
    -fno-strict-overflow \
    -fno-strict-aliasing \
    -fexceptions

# Warning Flags
WARNING_FLAGS = -w

# Linker Flags
LINKER_FLAGS = \
    -Wl,-O1 \
    -Wl,-s \
    -Wl,--as-needed \
    -Wl,--sort-common \
    -Wl,-z,noexecstack \
    -Wl,-z,now \
    -Wl,-z,relro \
    -Wl,-z,max-page-size=65536 \
    -Wl,--no-copy-dt-needed-entries \
    -Wl,--gc-sections \
    -pthread

# Static Linking Flags
STATIC_FLAGS = -static --static
STATIC_LDFLAGS = -static --static

# Toolchain Build Flags (for building the toolchain itself statically)
TOOLCHAIN_STATIC_FLAGS = -static --static -static-libgcc -static-libstdc++

# Compiler configurations
COMMON_CONFIG += --prefix= --libdir=/lib
COMMON_CONFIG += CC="gcc"
COMMON_CONFIG += CXX="g++"
COMMON_CONFIG += CFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${STATIC_FLAGS}"
COMMON_CONFIG += CXXFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${STATIC_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += CPPFLAGS="${PREPROCESSOR_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += LDFLAGS="${LINKER_FLAGS} ${STATIC_LDFLAGS}"

# Host toolchain flags (for building the cross-compiler itself)
COMMON_CONFIG += CFLAGS_FOR_HOST="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${TOOLCHAIN_STATIC_FLAGS}"
COMMON_CONFIG += CXXFLAGS_FOR_HOST="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${TOOLCHAIN_STATIC_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += LDFLAGS_FOR_HOST="${LINKER_FLAGS} ${TOOLCHAIN_STATIC_FLAGS}"

# enable
COMMON_CONFIG += --enable-default-pie
COMMON_CONFIG += --enable-static
COMMON_CONFIG += --enable-static-pie
COMMON_CONFIG += --enable-pic
COMMON_CONFIG += --enable-threads
# with
COMMON_CONFIG += --with-pic
COMMON_CONFIG += --with-system-zlib
# disable
COMMON_CONFIG += --disable-werror
COMMON_CONFIG += --disable-multilib
COMMON_CONFIG += --disable-shared
COMMON_CONFIG += --disable-nls
COMMON_CONFIG += --disable-plugins

# Binutils configuration
BINUTILS_CONFIG += --enable-deterministic-archives
BINUTILS_CONFIG += --enable-ld=default
BINUTILS_CONFIG += --enable-relro
BINUTILS_CONFIG += --enable-64-bit-bfd
BINUTILS_CONFIG += --enable-new-dtags
# disable
BINUTILS_CONFIG += --disable-gprofng
BINUTILS_CONFIG += --disable-gdb
BINUTILS_CONFIG += --disable-gold

# GCC configuration

# enable
GCC_CONFIG += --enable-languages=c,c++
GCC_CONFIG += --enable-linker-build-id
GCC_CONFIG += --enable-libstdcxx-time=rt
GCC_CONFIG += --enable-deterministic-archives
GCC_CONFIG += --enable-fully-dynamic-strings
GCC_CONFIG += --enable-clocale=generic
# with
GCC_CONFIG += --with-stage1-ldflags="${TOOLCHAIN_STATIC_FLAGS}"
GCC_CONFIG += --with-boot-ldflags="${TOOLCHAIN_STATIC_FLAGS}"
GCC_CONFIG += --with-default-libstdcxx-abi=new
GCC_CONFIG += --with-linker-hash-style=gnu
# disable
GCC_CONFIG += --disable-bootstrap
GCC_CONFIG += --disable-assembly
GCC_CONFIG += --disable-libmudflap
GCC_CONFIG += --disable-libgomp
GCC_CONFIG += --disable-libsanitizer
GCC_CONFIG += --disable-gnu-indirect-function
GCC_CONFIG += --disable-decimal-float
GCC_CONFIG += --disable-lto

# GCC configuration for target - modified by workflow or build-helper.bash using triples.json
GCC_CONFIG_FOR_TARGET +=
