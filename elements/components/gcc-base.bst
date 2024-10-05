kind: autotools

build-depends:
- bootstrap/diffutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/autoconf2.69.bst
- components/automake.bst
- components/flex.bst
- components/gettext.bst
- components/libtool.bst
- components/python3-minimal.bst
- components/tar.bst
- components/texinfo.bst

(@):
- elements/bootstrap/include/gcc-arch-opts.yml
- elements/include/gcc-source.yml

variables:
  # gcc installs correctly libraries in the multiarch library
  # directory, but needs to be provided /usr/lib for --libdir.
  lib: lib
  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'

  conf-local:
    --target=%{triplet}
    --disable-multilib
    --enable-multiarch
    --disable-bootstrap
    --enable-languages=c,c++,fortran,objc,obj-c++
    --enable-default-pie
    --enable-default-ssp
    --with-isl
    --disable-libssp
    --enable-linker-build-id
    --disable-libstdcxx-filesystem-ts
    --enable-cet
    --with-system-zlib
    %{conf-arch}
  conf-link-args: |
    --enable-shared

  optimize-debug: "false"

config:
  install-commands:
    (>):
    - |
      ln -s gcc %{install-root}%{bindir}/cc

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

    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      mkdir -p "%{install-root}%{datadir}/gdb/auto-load%{multiarch_libdir}"
      mv -f %{install-root}%{multiarch_libdir}/libstdc++.so.*-gdb.py "%{install-root}%{datadir}/gdb/auto-load%{multiarch_libdir}/"

public:
  bst:
    split-rules:
      libgcc-s:
      - '%{multiarch_libdir}/libgcc_s.so*'
      - '%{debugdir}%{multiarch_libdir}/libgcc_s.so*'
      - '%{sourcedir}/%{element-name}/libgcc'
      - '%{sourcedir}/%{element-name}/libgcc/**'

      libstdc++:
      - '%{multiarch_libdir}/libstdc++.so*'
      - '%{debugdir}%{multiarch_libdir}/libstdc++*'
      - '%{sourcedir}/%{element-name}/libstdc++*'
      - '%{sourcedir}/%{element-name}/libstdc++*/**'
      - '%{datadir}/gcc-*'
      - '%{datadir}/gcc-*/**'
      - '%{datadir}/gdb'
      - '%{datadir}/gdb/**'
