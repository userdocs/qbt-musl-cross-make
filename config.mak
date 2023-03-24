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
GCC_VER = 12.2.0
BINUTILS_VER = 2.40
MUSL_VER = git-7d756e1c04de6eb3f2b3d3e1141a218bb329fcfb
GMP_VER = 6.2.1
MPC_VER = 1.3.1
MPFR_VER = 4.2.0

LINUX_VER = 6.2.8
