GNU_SITE := $(if $(GNU_MIRROR_URL),$(GNU_MIRROR_URL),https://mirrors.dotsrc.org/gnu)
GCC_SITE = $(GNU_SITE)/gcc
BINUTILS_SITE = $(GNU_SITE)/binutils
GMP_SITE = $(GNU_SITE)/gmp
MPC_SITE = $(GNU_SITE)/mpc
MPFR_SITE = $(GNU_SITE)/mpfr
ISL_SITE = https://libisl.sourceforge.io
MUSL_SITE = https://musl.libc.org/releases
MUSL_REPO = git://git.musl-libc.org/musl
LINUX_SITE = https://cdn.kernel.org/pub/linux/kernel
CONFIG_SUB_URL = https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=$(CONFIG_SUB_REV)
