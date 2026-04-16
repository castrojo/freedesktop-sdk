# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- multiarch/multiarch-platform-arches.bst

variables:
  strip-binaries: ''
  arches: ''
  (?):
  - target_arch == "x86_64":
      arches: >-
        i386-linux-gnu

  - target_arch == "aarch64":
      arches: >-
        arm-linux-gnueabihf

config:
  install-commands:
  - |
    mkdir -p %{install-root}%{indep-libdir}
    for i in %{arches}; do
      if [ "${i}" != "%{gcc_triplet}" ]; then
        ln -sr "%{install-root}/app/lib/${i}" "%{install-root}%{indep-libdir}/${i}"
      fi
    done
