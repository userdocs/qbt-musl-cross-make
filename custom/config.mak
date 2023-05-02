STAT = -static --static
FLAG = -g0 -O2 -fno-align-functions -fno-align-jumps -fno-align-loops -fno-align-labels -Wno-error

ifneq ($(NATIVE),)
COMMON_CONFIG += CC="$(HOST)-gcc ${STAT}" CXX="$(HOST)-g++ ${STAT}" FC="$(HOST)-gfortran ${STAT}"
else
COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}" FC="gfortran ${STAT}"
endif

COMMON_CONFIG += --disable-gprofng CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" FFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

BINUTILS_CONFIG += --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet

CONFIG_SUB_REV = 63acb96f
GCC_VER = 13.1.0
BINUTILS_VER = 2.40
MUSL_VER = git-f5f55d6589940fd2c2188d76686efe3a530e64e0
GMP_VER = 6.2.1
MPC_VER = 1.3.1
MPFR_VER = 4.2.0

LINUX_VER = 6.3.1
