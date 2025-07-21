# Changes to musl-cross-make

## Makefile Changes

### Added Features

- **New `download_only` target**: Bootstrap all archive-type dependencies to the `sources` directory
- **GCC snapshot support**: Build against GCC snapshot versions using format like `GCC_VER = 16-20250720`
- **Musl snapshot support**: Use commit snapshot archives instead of cloning the git repository
  - Use a minimum 5-character commit SHA (12 characters recommended)
  - Ensure a corresponding hash file exists

**Example musl snapshot usage:**

```makefile
MUSL_VER = 8fd5d0318763
```

**To generate the required SHA1 hash:**

```bash
curl -sLO https://git.musl-libc.org/cgit/musl/snapshot/musl-8fd5d0318763.tar.gz && \
sha1sum musl-8fd5d0318763.tar.gz > musl-8fd5d0318763.tar.gz.sha1
```

> [!WARNING]
> When using musl snapshots the sha1 checksum will be unique to number of characters used as the top level of the archive will be named after the commit sha used.
> So you will have to make sure the hash file exists for the commit sha you are using.
>
> ```bash
> curl -sLO https://git.musl-libc.org/cgit/musl/snapshot/musl-8fd5d0318763.tar.gz && sha1sum musl-8fd5d0318763.tar.gz > musl-8fd5d0318763.tar.gz.sha1
> ef4e99c58f0cbad025a7b1ef099dfaddc115c70b musl-8fd5d0318763.tar.gz
> curl -sLO https://git.musl-libc.org/cgit/musl/snapshot/musl-8fd5d.tar.gz && sha1sum musl-8fd5d.tar.gz > musl-8fd5d.tar.gz.sha1
> 6a2ff6c242921a388e684d87f7596836bb35a1dd musl-8fd5d.tar.gz
> ```
### Modified Behavior

- **Download command**: Changed to use `curl`
- **URL management**: Moved URLs to `source_urls.mak` and included it in the `Makefile`
- **Configuration split**: Separated `versions.mak` and `config.mak` into distinct files
  - `versions.mak` is sourced into `Makefile`
  - `config.mak` is sourced into `litecross/Makefile`
- **Sources path**: Added full path via `SOURCES = $(shell pwd)/sources` to fix directory confusion during dependency downloads

> [!NOTE]
> These changes enable efficient CI bootstrapping and allow for dependency caching via `actions/cache` to only download when dependencies change.
>
> The implementation accounts for dependency changes by monitoring the `versions.mak` file. Since this file is now separated from `config.mak` and `Makefile`, it provides an efficient trigger for download minimization with minimal changes to the core `Makefile`.

## litecross/Makefile Changes

### Configuration Improvements

- **Target logic relocation**: Moved target logic from this file to `config.mak` for better user transparency
  - Configuration only applies if present in `config.mak` or `triples.json`
- **Build harmonization**: Standardized GCC and binutils build sections with intuitive variable ordering

**New configuration structure:**

```makefile
FULL_BINUTILS_CONFIG = --prefix= --libdir=/lib --target=$(TARGET) --with-sysroot=$(SYSROOT) \
	$(COMMON_CONFIG) \
	$(BINUTILS_CONFIG)

FULL_GCC_CONFIG = --prefix= --libdir=/lib --target=$(TARGET) --with-sysroot=$(SYSROOT) \
	$(COMMON_CONFIG) \
	$(GCC_CONFIG) \
	$(GCC_CONFIG_FOR_TARGET)
```

This allows setting `COMMON_CONFIG` for shared options in `config.mak`, while `GCC_CONFIG_FOR_TARGET` is configured via `triples.json` settings.

## Project Structure Changes

### Git Configuration

- **Sources directory**: Removed `sources` from `.gitignore` and added `config.sub`
  - Eliminates the need for Makefile logic workarounds

### Build Helper

- **New `builder-helper.bash`**: Interactive script for building selected triples from `triples.json` locally via Docker
  - Provides guided target selection and build process

**Usage examples:**

```bash
./builder-helper.bash                    # Interactive mode
./builder-helper.bash target             # Specify target
./builder-helper.bash target build       # Build specified target
```

## CI/CD Workflow

### Architecture

The CI system is designed around the concept of having target and architecture configurations in `triples.json` with general build configuration in `config.mak`.

Most changes above support creating a streamlined and user-friendly CI workflow.

**Workflow hierarchy:**

```
ci-main-reusable-caller.yml             # Creates matrix jobs from triples.json
└── ci-bootstrap-build-deps.yml         # Downloads and caches dependencies
    └── ci-mcm-build.yml                # Builds toolchain per config.mak/versions.mak
        └── ci-mcm-release.yml          # Releases toolchains as assets
            └── ci-docker-build.yml     # Builds Docker images
                └── ci-docker-test.yml  # Tests images with hello world + zlib
```

### Workflow Dispatch Options

Available inputs for `workflow_dispatch`:

- **Branch selection**: Choose branch to run from
- **GNU mirror URL**: Custom mirror (default: `https://mirrors.dotsrc.org/gnu`)
- **Architecture targeting**:
  - `arm64` matrix only (uses `ubuntu-24.04-arm` runners)
  - `amd64` matrix only (uses `ubuntu-24.04` runners)
  - `arm64` and `amd64` matrix (uses both runner types)
- **Build scope**:
  - Only build toolchains (skip Docker jobs)
  - Only run Docker jobs (requires existing release from toolchain build)

### Caching Implementation Notes

> [!NOTE] > **Make and Caching Interaction**: There's a peculiar interaction between caching and Make when restoring dependencies. When `actions/cache` restores files, their timestamps may be set before the `hashes/*.sha1` files from `actions/checkout`.
>
> This causes Make's hash check to trigger downloads because the archive appears older than the SHA file. The solution involves updating timestamps after cache restoration:
>
> ```yaml
> - name: Host - Cache sources (restore)
>   uses: actions/cache/restore@v4
>   with:
>     path: ${{ github.workspace }}/sources
>     key: mcm-sources-${{ hashFiles('versions.mak') }}
>
> - name: Host - Update cached file timestamps
>   run: find ${{ github.workspace }}/sources/ -type f -exec touch -a -m {} +
> ```
>
> This issue doesn't occur when using `actions/upload-artifact`/`actions/download-artifact` instead of caching, indicating it's specific to Make's timestamp-based dependency checking.

### General

Added a [help](help/) dir with some gcc and and binutils ai generated configure reference commands. There may be mistakes. Double check before applying.
