kind: manual

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst


(@): elements/bootstrap/include/target.yml

config:
  build-commands:
  - |
    make -f Makefile-libbz2_so CC="%{triplet}-gcc $CFLAGS $LDFLAGS"
  - |
    make bzip2recover CC="%{triplet}-gcc $CFLAGS $LDFLAGS" AR="%{triplet}-ar" RANLIB="%{triplet}-ranlib"

  install-commands:
  - |
    full_name="$(readlink libbz2.so.1)"
    install -D -m 755 "${full_name}" --target-directory %{install-root}%{libdir}
    ln -s "${full_name}" %{install-root}%{libdir}/libbz2.so.1
    ln -s "${full_name}" %{install-root}%{libdir}/libbz2.so
    install -D -m 755 bzip2-shared %{install-root}%{bindir}/bzip2
    ln -s bzip2 %{install-root}%{bindir}/bzcat
    ln -s bzip2 %{install-root}%{bindir}/bunzip2
    install -D -m 755 bzip2recover --target-directory %{install-root}%{bindir}
    install -D -m 755 bzmore --target-directory %{install-root}%{bindir}
    ln -s bzmore %{install-root}%{bindir}/bzfless
    install -D -m 755 bzgrep --target-directory %{install-root}%{bindir}
    ln -s bzgrep %{install-root}%{bindir}/bzegrep
    ln -s bzgrep %{install-root}%{bindir}/bzfgrep
    install -D -m 755 bzdiff --target-directory %{install-root}%{bindir}
    ln -s bzdiff %{install-root}%{bindir}/bzcmp
    install -D -m 755 bzlib.h --target-directory %{install-root}%{includedir}
    install -D -m 755 bzgrep.1 bzmore.1 bzdiff.1 --target-directory %{install-root}%{mandir}/man1

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbz2.so'

sources:
- kind: git_tag
  url: sourceware:bzip2.git
  track: master
  ref: bzip2-1.0.8-0-g6a8690fc8d26c815e798c588f796eabe9d684cf0
- kind: patch
  path: patches/bzip2/soname.patch
