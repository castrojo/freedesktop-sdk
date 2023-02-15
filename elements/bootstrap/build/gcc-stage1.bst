kind: autotools
description: GNU gcc Stage 1

build-depends:
- bootstrap/base-sdk/autoconf2.69.bst
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/tar.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/build/binutils-stage1.bst

(@):
- elements/bootstrap/include/gcc-arch-opts.yml
- elements/bootstrap/include/gcc-source.yml
- elements/bootstrap/include/build.yml

environment:
  CFLAGS_FOR_TARGET:  "%{target_flags}"
  CXXFLAGS_FOR_TARGET: "%{target_flags}"
  LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
  PYTHON: python3

variables:
  conf-arch-extra: ""
  (?):
  - target_arch == "ppc64le":
      # https://sourceware.org/bugzilla/show_bug.cgi?id=26360
      conf-arch-extra: --with-long-double-128

  autogen: |
    autoreconf2.69 -fvi
    for conf in */configure.ac; do
      dir="$(dirname "${conf}")"
      case "$(dirname "${conf}")" in
        isl)
          args=()
          ;;
        *)
          args=("-I" "../config")
          ;;
      esac
      echo "autoreconf: ${dir}"
      (cd "${dir}" && autoreconf2.69 "${args[@]}" -fvi)
    done

  conf-local: >-
    --target=%{triplet}
    --with-newlib
    --enable-multiarch
    --with-sysroot=%{sysroot}
    --without-headers
    --disable-bootstrap
    --disable-nls
    --disable-shared
    --disable-threads
    --disable-libstdcxx
    --disable-decimal-float
    --disable-libatomic
    --disable-libgomp
    --disable-libmpx
    --disable-libquadmath
    --disable-libssp
    --disable-libvtv
    --disable-multilib
    --enable-default-pie
    --enable-default-ssp
    --enable-languages=c,c++
    --with-isl
    --enable-deterministic-archives
    --enable-linker-build-id
    %{conf-arch}
    %{conf-arch-extra}

  make-args: >-
    MAKEINFO=true

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/%{triplet}-c++"
      ln -s "%{triplet}-g++" "%{install-root}%{bindir}/%{triplet}-c++"

    - |
      rm "%{install-root}%{bindir}/%{triplet}-gcc"
      ln -s "%{triplet}-gcc-$(cat gcc/BASE-VER)" "%{install-root}%{bindir}/%{triplet}-gcc"

    - |
      for f in "%{install-root}%{bindir}/"*; do
        base="$(basename "${f}")"
        case "${base}" in
          %{triplet}-*)
            continue
          ;;
          *)
            if [ -f "%{install-root}%{bindir}/%{triplet}-${base}" ]; then
              rm "${f}"
              ln -s "%{triplet}-${base}" "${f}"
            fi
          ;;
        esac
      done

  strip-commands: []
