kind: autotools
description: GNU Binutils

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/bison.bst
- bootstrap/base-sdk/flex.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- bootstrap/build/libgcc_s.bst
- filename:
  - bootstrap/glibc.bst
  - bootstrap/zlib.bst
  - bootstrap/elfutils.bst
  - bootstrap/zstd.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/elfutils.bst
- bootstrap/glibc.bst
- bootstrap/zlib.bst
- bootstrap/zstd.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/binutils-source.yml

variables:
  # Disable '-fexceptions' which breaks build on arm.
  # https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/jobs/110741993
  # FIXME: what happens when we make it depend on gcc.bst? Does it it fix it?
  target_flags_exceptions: ''
  conf-local: >-
    CFLAGS="${CFLAGS}"
    --disable-werror
    --with-lib-path="%{libdir}:%{indep-libdir}"
    --enable-ld=default
    --enable-shared
    --enable-plugins
    --enable-relro=yes
    --enable-lto
    --with-system-zlib
    --with-debuginfod
    --with-zstd
    --enable-deterministic-archives
    %{disable-source}
    host_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"'

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

environment:
  LEXLIB: ' '
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**
