In a reusable workflow, to use the outputs of a job, it must be included in the needs section of the job trying to use the outputs. Always check a reusable job with outputs has the required needs to prevent null variables.

Make any workflow code provided by copilot does not use outdated actions.

gh cli cannot get the id of a workflow it started with gh run workflow. you need to list them after and get the id.
binutils gold linker is depreciated; only ude ld=default and --disable-gold
when building a fully static toolchain linked to musl we cannot use -flto -fuse-linker-plugin as the lto is a dynamically loaded plugin that cannot be loaded by a fully static gcc linked against musl. So the toolchain does not support lto and no lto settings should be applied or added.
