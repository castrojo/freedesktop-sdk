kind: make

depends:
- bootstrap-import.bst
- components/gzip.bst
- components/curl.bst

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
  make-install: make %{make-args} DESTDIR="%{install-root}" install install-lib

config:
  install-commands:
    (>):
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
- kind: git_repo
  track: v*
  url: kernel:utils/pciutils/pciutils.git
  ref: v3.13.0-0-g7c5bf915f87d8e4c62be66275c8e73a5f03fa5ee
