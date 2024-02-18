FLAG = -g0 -O2 -fno-align-functions -fno-align-jumps -fno-align-loops -fno-align-labels -Wno-error
STAT = -static --static

COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}" CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

BINUTILS_CONFIG += --disable-gprofng --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet
GCC_CONFIG_FOR_TARGET +=
