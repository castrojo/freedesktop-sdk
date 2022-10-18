kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/which.bst
  type: build
- filename: components/gzip.bst
  type: build

config:
  build-commands:
  - |
    make OPT="${CFLAGS}" ZLIB=no SHARED=yes SHAREDIR="%{prefix}/share/hwdata" all

  install-commands:
  - |
    make SHARED=yes PREFIX="%{prefix}" SBINDIR="%{prefix}/bin" SHAREDIR="%{prefix}/share/hwdata" MANDIR="%{prefix}/share/man" LIBDIR="%{libdir}" DESTDIR="%{install-root}" install install-lib

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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpci.so'

sources:
- kind: git_tag
  track: master
  url: kernel:utils/pciutils/pciutils.git
  ref: v3.8.0-0-gd224993d423bcd0e88d8eacc0464bc3a66972e95
