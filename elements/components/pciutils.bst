kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/which.bst
- components/gzip.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst

runtime-depends:
- components/hwdata.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    SBINDIR="%{prefix}/bin"
    SHAREDIR="%{datadir}/hwdata"
    MANDIR="%{mandir}"
    LIBDIR="%{libdir}"
    ZLIB=no
    SHARED=yes
    OPT="${CFLAGS}"
    STRIP=""
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install 
    install-lib

config:
  install-commands:
    (>):
    # This directory is provided by components/hwdata.bst; remove it to prevent overlapping
    - |
      rm -rf "%{install-root}%{datadir}/hwdata"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/pci"
      mv "%{install-root}%{includedir}/pci/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/pci/"

    - |
      cat <<EOF >"%{install-root}%{includedir}/pci/config.h"
      #if defined(__x86_64__)
      # include "x86_64-linux-gnu/pci/config.h"
      #elif defined(__i386__)
      # include "i386-linux-gnu/pci/config.h"
      #elif defined(__aarch64__)
      # include "aarch64-linux-gnu/pci/config.h"
      #elif defined(__arm__)
      # include "arm-linux-gnueabihf/pci/config.h"
      #elif defined(__powerpc64__)
      # include "powerpc64le-linux-gnu/pci/config.h"
      #else
      # error "Unknown cross-compiler"
      #endif
      EOF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpci.so'

sources:
- kind: git_repo
  url: kernel:utils/pciutils/pciutils.git
  ref: v3.14.0-0-gc6030ae1576b6bf1de9b41f53a9ed76137181d99
