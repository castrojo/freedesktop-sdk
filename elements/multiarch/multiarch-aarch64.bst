# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- public-stacks/runtime-minimal.bst

variables:
  compat_arch: aarch64-linux-gnu
  entrypoint: ld-linux-aarch64.so.1

config:
  (?):
  - target_arch != "aarch64":
      commands:
      - |
        mkdir -p %{install-root}%{indep-libdir}
        ln -sf %{compat_arch}/%{entrypoint} %{install-root}%{indep-libdir}/%{entrypoint}
