# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU Binutils Stage 1

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/binutils-source.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/bison.bst
- bootstrap/base-sdk/flex.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/base-sdk/zstd.bst

environment:
  CFLAGS_FOR_TARGET:  "%{target_flags}"
  CXXFLAGS_FOR_TARGET: "%{target_flags}"
  LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"

variables:
  conf-local: >-
    --target=%{triplet}
    --with-sysroot=%{sysroot}
    --disable-nls
    --enable-gprofng=no
    --disable-multilib
    --disable-werror
    %{disable-source}
    --with-lib-path="%{sysroot}/usr/lib/%{gcc_triplet}:%{sysroot}/usr/lib:/usr/lib/%{gcc_triplet}:/usr/lib"
    --with-system-zlib
    --with-zstd
    --enable-deterministic-archives
  make-args: >-
    MAKEINFO=true

config:
  install-commands:
    (>):
    - |
      if [ -e "%{install-root}%{prefix}/%{triplet}/bin/ld.bfd" ]; then
        rm "%{install-root}%{prefix}/%{triplet}/bin/ld"
        ln -s ld.bfd "%{install-root}%{prefix}/%{triplet}/bin/ld"
      fi

    - |
      for tool in "%{install-root}%{prefix}/%{triplet}/bin"/*; do
        toolbase="$(basename "${tool}")"
        for link in "%{bindir}/%{triplet}-${toolbase}" "%{bindir}/${toolbase}"; do
          if [ -f "%{install-root}${link}" ]; then
            rm "%{install-root}${link}"
            ln -s "$(realpath "${tool}" --relative-to="$(dirname "%{install-root}${link}")")" "%{install-root}${link}"
          fi
        done
      done
