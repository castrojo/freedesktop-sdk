kind: autotools
description: GNU Binutils Stage 1

depends:
- filename: bootstrap/base-sdk/base-sdk.bst
- filename: bootstrap/gnu-config.bst
  type: build

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/binutils-source.yml

variables:
  conf-local: >-
    --target=%{triplet}
    --with-sysroot=%{sysroot}
    --disable-nls
    --disable-multilib
    --disable-werror
    %{disable-source}
    --with-lib-path="%{sysroot}/usr/lib/%{gcc_triplet}:%{sysroot}/usr/lib:/usr/lib/%{gcc_triplet}:/usr/lib"
    --with-system-zlib

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

    - |
      rm "%{install-root}%{infodir}/dir"
