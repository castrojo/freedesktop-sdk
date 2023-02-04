kind: autotools
description: GNU Binutils

build-depends:
- bootstrap/binutils-build-deps.bst

runtime-depends:
- bootstrap/elfutils.bst
- bootstrap/glibc.bst
- bootstrap/zlib.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/binutils-source.yml

variables:
  # Disable '-fexceptions' which breaks build on arm.
  # https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/jobs/110741993
  # FIXME: what happens when we make it depend on gcc.bst? Does it it fix it?
  target_flags_exceptions: ''
  gold-option: "--enable-gold"
  (?):
  - target_arch == "loongarch64":
      gold-option: "--disable-gold"
  conf-local: >-
    CFLAGS="${CFLAGS}"
    --disable-werror
    --with-lib-path="%{libdir}:%{indep-libdir}"
    %{gold-option}
    --enable-ld=default
    --enable-shared
    --enable-plugins
    --enable-relro=yes
    --enable-lto
    --with-system-zlib
    --with-debuginfod
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
