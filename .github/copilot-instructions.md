# Bash Scripting

- Always use `#!/bin/bash` as the shebang.
- Use `printf '%s'` for printing strings and `printf '%b'` for escape sequences. **Avoid using `echo`.**
- Comment code to explain changes and logic.
- For Bash/shell questions, consult [mywiki.wooledge.org](https://mywiki.wooledge.org) or [BashFAQ](https://mywiki.wooledge.org/BashFAQ) first. **Provide a source link when possible.**

# GitHub Workflows

- In reusable workflows, jobs that use outputs from other jobs **must** include those jobs in their `needs` section to avoid null variables.
- Do not use outdated GitHub Actions in workflow code.
- The `gh` CLI cannot get the ID of a workflow it started with `gh run workflow`; you must list runs after and extract the ID.

# GCC / Binutils

- Only use `--static` (not `-static`) to create static toolchain binaries. Using `-static` alone can cause errors (e.g., missing POSIX threads).
- When working with `../config.mak`, always load options from both `../gcc-configure-options.md` and `../gcc-configure-options-recursive.md`.
- The binutils gold linker is deprecated. Use `ld=default` and `--disable-gold`.
- For fully static toolchains linked to musl:
    - Do **not** use `-flto` or `-fuse-linker-plugin` (LTO is not supported; plugins require dynamic loading).
    - Do **not** add any LTO settings.
- Only set linker options like `LDFLAGS` when linking, **not** when building libraries.
- GNU libtool redefines `-static`; to ensure static linking, use `--static` or `-Wl,-static` in `LDFLAGS` (possibly with `-static`).
- When building OpenSSL statically, do **not** use `openssl -static` (it disables threads, PIE, PIC). For `-static-pie` binaries with musl/Alpine, use the correct flags.
- Do **not** suggest glibc-only flags or glibcisms for musl toolchains.

# Debugging

- To debug with QEMU:  
  Run `qemu -g <port> <binary>` (e.g., `qemu -g 1234 ./qbt-nox-static`), then connect with `gdb ./qbt-nox-static` in another terminal.

---
**Reference:**  
- [mywiki.wooledge.org](https://mywiki.wooledge.org)  
- [BashFAQ](https://mywiki.wooledge.org/BashFAQ)
