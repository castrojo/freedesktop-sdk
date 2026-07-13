# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- public-stacks/runtime-minimal.bst

variables:
  compat_arch: i386-linux-gnu
  entrypoint: ld-linux.so.2

config:
  (?):
  - target_arch != "i686":
      commands:
      - |
        mkdir -p %{install-root}%{indep-libdir}
        ln -sf %{compat_arch}/%{entrypoint} %{install-root}%{indep-libdir}/%{entrypoint}
