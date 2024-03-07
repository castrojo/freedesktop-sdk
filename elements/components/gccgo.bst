kind: autotools

build-depends:
- components/python3.bst
- components/flex.bst
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

(@):
- elements/include/gcc-source.yml

variables:
  lib: lib
  conf-local:
    --target=%{triplet}
    --disable-multilib
    --enable-multiarch
    --disable-bootstrap
    --enable-languages=go
    --enable-default-pie
    --enable-default-ssp
    --with-isl
    --disable-libssp
    --enable-linker-build-id
    --disable-libstdcxx-filesystem-ts
    --enable-cet
  conf-link-args: |
    --enable-shared

config:
  install-commands:
    (>):
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

public:
  bst:
    overlap-whitelist:
    - '**'
