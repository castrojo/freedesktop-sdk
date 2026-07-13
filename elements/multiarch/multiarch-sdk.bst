# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- multiarch/multiarch-sdk-arches.bst

variables:
  arches: '%{gcc_triplet}'

  (?):
  - target_arch == "x86_64":
      arches: >-
        x86_64-linux-gnu
        i386-linux-gnu
        arm-linux-gnueabihf
        aarch64-linux-gnu

  - target_arch == "aarch64":
      arches: >-
        arm-linux-gnueabihf
        aarch64-linux-gnu

public:
  bst:
    integration-commands:
    - |
      mkdir -p "%{libdir}"
      mkdir -p "%{debugdir}%{indep-libdir}"
      mv "%{includedir}/%{gcc_triplet}" "%{libdir}/include"
      for i in %{arches}; do
        ln -sr "%{indep-libdir}/${i}/include" "%{includedir}/${i}"
        if [ "${i}" != "%{gcc_triplet}" ]; then
          gcc_arch="${i/-*/}"
          mkdir -p "%{indep-libdir}/${i}"
          mkdir -p "%{debugdir}%{indep-libdir}/${i}"
        fi
      done
