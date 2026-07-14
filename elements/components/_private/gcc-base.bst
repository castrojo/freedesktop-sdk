# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/gcc-arch-opts.yml
- elements/include/gcc-source.yml

build-depends:
- bootstrap/diffutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/zstd.bst
- bootstrap/stripper.bst
- components/autoconf2.69.bst
- components/automake.bst
- components/flex.bst
- components/gettext.bst
- components/libtool.bst
- components/pkg-config.bst
- components/_private/python3-minimal.bst
- components/tar.bst
- components/texinfo.bst

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
    --with-zstd
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

    - |
      gcc_version="$(gcc -dumpfullversion)"
      bfd_plugin_dir="%{install-root}%{prefix}/%{triplet}/%{lib}/%{gcc_triplet}/bfd-plugins"
      gcc_plugin_path="%{libexecdir}/gcc/%{triplet}/${gcc_version}/liblto_plugin.so"

      test -f "%{install-root}$gcc_plugin_path"
      mkdir -p "$bfd_plugin_dir"

      echo "Creating liblto plugin symlink for binutils in $bfd_plugin_dir"
      ln -sfv "$gcc_plugin_path" "$bfd_plugin_dir/liblto_plugin.so"

public:
  bst:
    split-rules:
      gcc-libs:
      - '%{multiarch_libdir}/libasan.so*'
      - '%{multiarch_libdir}/libatomic.so*'
      - '%{multiarch_libdir}/libgcc_s.so*'
      - '%{multiarch_libdir}/libgfortran.so*'
      - '%{multiarch_libdir}/libgomp.so*'
      - '%{multiarch_libdir}/libhwasan.so*'
      - '%{multiarch_libdir}/libitm.so*'
      - '%{multiarch_libdir}/liblsan.so*'
      - '%{multiarch_libdir}/libobjc.so*'
      - '%{multiarch_libdir}/libquadmath.so*'
      - '%{multiarch_libdir}/libstdc++.so*'
      - '%{multiarch_libdir}/libtsan.so*'
      - '%{multiarch_libdir}/libubsan.so*'
      - '%{debugdir}%{multiarch_libdir}/libasan.so*'
      - '%{debugdir}%{multiarch_libdir}/libatomic.so*'
      - '%{debugdir}%{multiarch_libdir}/libgcc_s.so*'
      - '%{debugdir}%{multiarch_libdir}/libgfortran.so*'
      - '%{debugdir}%{multiarch_libdir}/libgomp.so*'
      - '%{debugdir}%{multiarch_libdir}/libhwasan.so*'
      - '%{debugdir}%{multiarch_libdir}/libitm.so*'
      - '%{debugdir}%{multiarch_libdir}/liblsan.so*'
      - '%{debugdir}%{multiarch_libdir}/libobjc.so*'
      - '%{debugdir}%{multiarch_libdir}/libquadmath.so*'
      - '%{debugdir}%{multiarch_libdir}/libstdc++.so*'
      - '%{debugdir}%{multiarch_libdir}/libtsan.so*'
      - '%{debugdir}%{multiarch_libdir}/libubsan.so*'
      - '%{sourcedir}/%{element-name}/bst_build_dir/gcc/include/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/gcc/include-fixed/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/gmp/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/libiberty/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libatomic/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libbacktrace/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libgcc/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libgfortran/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libgomp/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libitm/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libobjc/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libquadmath/**'
      - '%{sourcedir}/%{element-name}/bst_build_dir/*/libsanitizer/**'
      - '%{sourcedir}/%{element-name}/gcc/common/config/**'
      - '%{sourcedir}/%{element-name}/gcc/config/**'
      - '%{sourcedir}/%{element-name}/gcc/fortran/**'
      - '%{sourcedir}/%{element-name}/include/**'
      - '%{sourcedir}/%{element-name}/libatomic/**'
      - '%{sourcedir}/%{element-name}/libbacktrace/**'
      - '%{sourcedir}/%{element-name}/libgcc/**'
      - '%{sourcedir}/%{element-name}/libgfortran/**'
      - '%{sourcedir}/%{element-name}/libgomp/**'
      - '%{sourcedir}/%{element-name}/libiberty/**'
      - '%{sourcedir}/%{element-name}/libitm/**'
      - '%{sourcedir}/%{element-name}/libobjc/**'
      - '%{sourcedir}/%{element-name}/libquadmath/**'
      - '%{sourcedir}/%{element-name}/libsanitizer/**'
      - '%{sourcedir}/%{element-name}/signal/bits/types/**'
      - '%{sourcedir}/%{element-name}/stdlib/**'
      - '%{sourcedir}/%{element-name}/sysdeps/pthread/**'
      - '%{sourcedir}/%{element-name}/sysdeps/unix/sysv/linux/**'
      - '%{sourcedir}/%{element-name}/sysdeps/unix/sysv/linux/bits/types/**'
      - '%{sourcedir}/%{element-name}/sysdeps/x86_64/**'
