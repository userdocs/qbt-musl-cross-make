# Optimization Flags
OPTIMIZATION_FLAGS = -O3 -pipe -fdata-sections -ffunction-sections -pthread

# Preprocessor Flags
PREPROCESSOR_FLAGS = -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS

# Security Flags
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
    -pthread \
    -s \
    -Wl,-O1,--as-needed,--sort-common,-z,nodlopen,-z,noexecstack,-z,now,-z,pack-relative-relocs,-z,relro,-z,max-page-size=65536,--no-copy-dt-needed-entries

# Static Linking Flags
STATIC_FLAGS = -static --static

# Compiler configurations
COMMON_CONFIG += CC="gcc ${STATIC_FLAGS}"
COMMON_CONFIG += CXX="g++ ${STATIC_FLAGS}"
COMMON_CONFIG += CFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${STATIC_FLAGS}"
COMMON_CONFIG += CXXFLAGS="${OPTIMIZATION_FLAGS} ${SECURITY_FLAGS} ${STATIC_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += CPPFLAGS="${PREPROCESSOR_FLAGS} ${WARNING_FLAGS}"
COMMON_CONFIG += LDFLAGS="${LINKER_FLAGS} ${STATIC_FLAGS}"

# Binutils configuration
BINUTILS_CONFIG += --disable-gprofng

# GCC configuration
GCC_CONFIG += --enable-default-pie --enable-static-pie
# GCC configuration for target - modified by workflow using triples.json
GCC_CONFIG_FOR_TARGET +=
