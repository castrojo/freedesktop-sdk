# Inheriting Best Practice Configurations

BuildStream provides a [default base project configuration](https://docs.buildstream.build/master/format_project.html#builtin-defaults)
with common settings and flags set. As part of junctioning Freedesktop SDK,
there are available includes that represents some of the best practices that
Freedesktop SDK endorses.

`include/runtime.yml` contains a series of configuration files designed for downstream consumers.
The contained files can be included individually, but the `include/runtime.yml` allows a user to
include the entire list, each of which is documented below.

## [arch.yml](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/master/include/arch.yml)

The `arch` include defines architecture specific variables for use during builds.
These values are then used by tools such as compilers, installers or the [autotools plugin](https://docs.buildstream.build/2.7/tutorial/autotools.html).
For example `triplet` defines a GNU architecture triplet such as "x86_64-linux-gnu" which
is used as part`lib` definition in [`install_dirs.yml`](#install_dirsyml).

## [flags.yml](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/master/include/flags.yml)

The 'flags' include sets global compiler and linker flags via project-wide
`environment` configuration, touching variables like:

- `CXXFLAGS`
- `CXXFLAGS`
- `LDFLAGS`
- `RUSTFLAGS`
- `CGO_CFLAGS`
- `CGO_CXXFLAGS`
- `CGO_LDFLAGS`

The 'flags' include aims to achieve the following:

1. Enable code optimisation, e.g. passing `-O2` to GCC.

2. Ensure debuggable code, e.g. passing flags like `-g`,
   `-fno-omit-frame-pointer` and `-grecord-gcc-switches` to GCC,
   and passing `-C debuginfo=2` and `-Cforce-frame-pointers=yes`
   to Rustc.

3. Hardening generated code against failure and attack, e.g.
   passing `-fstack-protector-strong` to GCC, and setting
   `-D_FORTIFY_SOURCE=3` for GLIBC.

4. Enable the RELRO (Relocation Read-Only) linker feature, another
   hardening feature.

5. Drop unused shared libraries at link time by passing `--as-needed` to the
   GNU linker.

## [install_dirs.yml](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/master/include/install_dirs.yml)

The default BuildStream project configuration sets various path variables,
such as `bindir`, `sbindir`, `datadir`, etc. These are all defined relative
to the `prefix` and `exec_prefix` variables.

The FDSDK 'install-dirs' overrides some of the defaults:

- `sbindir` is set to `%{bindir}` so there's no separate /usr/sbin
    directory.
- `lib` is set to `lib/%{gcc-triplet}`, so that libs for multiple
    architectures can be installed in parallel (known as "multi-arch").

It defines some additional variables, including:

- `indep-libdir`, which defines the "architecture independent library"
     directory.
- `sourcedir`, the location to install source code in the final system for
     use by debuggers.
- `licensedir` and `project_licensedir`, for installing component license
     files in the output system.

## [install-extra.yml](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/master/include/install-extra.yml)

This extends a number of element build plugins (commonly [`make`](https://apache.github.io/buildstream-plugins/elements/make.html),
[`meson`](https://apache.github.io/buildstream-plugins/elements/meson.html) or [`manual`](https://docs.buildstream.build/master/elements/manual.html)kinds)
to have an "Install extra" stage, which runs at the end of the element's
`install-commands` and is configured by the element's `install-extra` variable.

The global `install-extra` variable is configured to run the
`install-licenses` snippet, which ensures that files such as COPYING and
LICENSE from the element source tree are copied into `%{project_licensedir}`.

Many open source licenses stipulate that the license must be distributed
with any compiled binaries of the project, so this is essential for license
compliance.

## [strip.yml](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/master/include/strip.yml)

BuildStream provides a global `strip-binaries` variable which does nothing by
default, but can be overridden to enable stripping of debug symbols from
compiled programs. This allows having a small 'base' image distributed
separately from a much larger 'debug' image.

Freedesktop SDK provides a custom debug strip tool in `components/stripper.bst`
which is configured here.

Some variables are defined which elements can override in their per-element
config:

- `optimize-debug`: Enables the DWARF optimisation and duplicate removal tool
    `dwz`.
- `compress-debug`: Enables compression of debug symbols with elfutils
    `eu-elfcompress`.
