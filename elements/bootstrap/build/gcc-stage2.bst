kind: autotools
description: GNU gcc Stage 2

build-depends:
- bootstrap/build/gcc-stage-2-build-deps.bst

runtime-depends:
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
  conf-link-args: |
    --enable-shared \
    --enable-static
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
  make-args: >-
    MAKEINFO=true

  conf-local: >-
    --target=%{triplet}
    --enable-multiarch
    --disable-multilib
    --disable-bootstrap
    --disable-nls
    --with-sysroot=%{sysroot}
    --enable-languages=c,c++,fortran,objc,obj-c++
    --enable-default-pie
    --enable-default-ssp
    --with-isl
    --disable-libssp
    --enable-deterministic-archives
    --enable-linker-build-id
    --disable-libstdcxx-filesystem-ts
    %{conf-arch}

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

  # strip-binaries fails when cross compiling because artifact
  # contains 2 architectures.
  strip-commands: []
