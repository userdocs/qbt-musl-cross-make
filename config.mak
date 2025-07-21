# Optimization Flags - Ensure no LTO flags are present
OPTIMIZATION_FLAGS = -O3 -pipe -fdata-sections -ffunction-sections

# Preprocessor Flags
PREPROCESSOR_FLAGS = -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3

# Security Flags - Remove incompatible flags for musl
SECURITY_FLAGS = \
    -fstack-clash-protection \
    -fstack-protector-strong \
	-fno-plt \
    -fno-delete-null-pointer-checks \
    -fno-strict-overflow \
    -fno-strict-aliasing \
	-ftrivial-auto-var-init=zero \
    -fexceptions

# Warning Flags
WARNING_FLAGS = -w

# Linker Flags
LINKER_FLAGS = \
	-static --static -pthread \
    -Wl,-O1 \
    -Wl,-s \
    -Wl,-z,now \
    -Wl,-z,relro

# Compiler configurations
COMMON_CONFIG += CC="gcc"
COMMON_CONFIG += CXX="g++"
COMMON_CONFIG += CFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS}"
COMMON_CONFIG += CXXFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += CPPFLAGS="-I/usr/include/fortify ${PREPROCESSOR_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += LDFLAGS="${LINKER_FLAGS}"

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
GCC_CONFIG += --enable-libquadmath
GCC_CONFIG += --enable-libquadmath-support
GCC_CONFIG += --enable-initfini-array
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
GCC_CONFIG += --disable-lto

# GCC configuration for target - modified by workflow or build-helper.bash using triples.json
GCC_CONFIG_FOR_TARGET +=
