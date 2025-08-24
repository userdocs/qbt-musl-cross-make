GNU_SITE := $(if $(GNU_MIRROR_URL),$(GNU_MIRROR_URL),https://ftpmirror.gnu.org/gnu)
GCC_SITE = $(GNU_SITE)/gcc
GCC_SNAP = https://gcc.gnu.org/pub/gcc/snapshots
BINUTILS_SITE = $(GNU_SITE)/binutils
BINUTILS_SNAP = https://gcc.gnu.org/pub/binutils/snapshots
GMP_SITE = $(GNU_SITE)/gmp
MPC_SITE = $(GNU_SITE)/mpc
MPFR_SITE = $(GNU_SITE)/mpfr
ISL_SITE = https://libisl.sourceforge.io
# ISL_SITE = https://downloads.sourceforge.net/project/libisl
MUSL_RELEASE = https://musl.libc.org/releases
MUSL_SNAPSHOT = https://git.musl-libc.org/cgit/musl/snapshot
MUSL_REPO = https://git.musl-libc.org/git/musl
LINUX_SITE = https://cdn.kernel.org/pub/linux/kernel
CONFIG_SUB_URL = https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=$(CONFIG_SUB_REV)
