kind: autotools

build-depends:
- bootstrap/bootstrap.bst
- components/autoconf2.69.bst
- components/automake.bst
- components/libtool.bst
- components/gettext.bst
- components/tar.bst
- components/texinfo.bst
- components/flex.bst
- components/python3-minimal.bst

depends:
- bootstrap/bootstrap-base.bst

(@):
- elements/bootstrap/include/gcc-source.yml

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
      runtime:
        - '%{multiarch_libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/*'
        - '%{libexecdir}'
        - '%{libexecdir}/**'
        - '%{datadir}/man'
        - '%{datadir}/man/**'
        - '%{datadir}/info'
        - '%{datadir}/info/**'
        - '%{datadir}/locale'
        - '%{datadir}/locale/**'
        - '%{datadir}/gcc-*/python'
        - '%{datadir}/gcc-*/python/**'
        - '%{datadir}/gdb'
        - '%{datadir}/gdb/**'
        - '%{indep-libdir}/gcc'
        - '%{indep-libdir}/gcc/**'
        - '%{libdir}/gcc'
        - '%{libdir}/gcc/**'
        - '%{multiarch_libdir}/lib*.a'
        - '%{multiarch_libdir}/lib*_preinit.o'
        - '%{multiarch_libdir}/liblsan.so'
        - '%{multiarch_libdir}/libstdc++.so'
        - '%{multiarch_libdir}/libgomp.so'
        - '%{multiarch_libdir}/libatomic.so'
        - '%{multiarch_libdir}/libubsan.so'
        - '%{multiarch_libdir}/libquadmath.so'
        - '%{multiarch_libdir}/libitm.so'
        - '%{multiarch_libdir}/libtsan.so'
        - '%{multiarch_libdir}/libmpxwrappers.so'
        - '%{multiarch_libdir}/libmpx.so'
        - '%{multiarch_libdir}/libcilkrts.so'
        - '%{multiarch_libdir}/libasan.so'
        - '%{multiarch_libdir}/libgfortran.so'
        - '%{multiarch_libdir}/libcc1.so'
        - '%{multiarch_libdir}/libgcc_s.so'
        - '%{multiarch_libdir}/lib*.spec'
        - '%{multiarch_libdir}/libobjc.so'
        - '%{multiarch_libdir}/libhwasan.so'

      static-blocklist:
        (=):
        - '%{multiarch_libdir}/libasan.a'
        - '%{multiarch_libdir}/libatomic.a'
        - '%{multiarch_libdir}/libgfortran.a'
        - '%{multiarch_libdir}/libgomp.a'
        - '%{multiarch_libdir}/libitm.a'
        - '%{multiarch_libdir}/liblsan.a'
        - '%{multiarch_libdir}/libquadmath.a'
        - '%{multiarch_libdir}/libsupc++.a'
        - '%{multiarch_libdir}/libstdc++exp.a'
        - '%{multiarch_libdir}/libtsan.a'
        - '%{multiarch_libdir}/libubsan.a'
        - '%{multiarch_libdir}/libobjc.a'
        - '%{multiarch_libdir}/libhwasan.a'

      # Not actually used, included for completeness
      static-allowlist:
        - '%{multiarch_libdir}/libstdc++.a'
        - '%{indep-libdir}/gcc/**/*.a'
