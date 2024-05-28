kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make -f unix/Makefile LOCAL_UNZIP="${CFLAGS} -DNO_LCHMOD" LFLAGS2="${LDFLAGS}" generic_gcc

  install-commands:
  - |
    make -f unix/Makefile BINDIR="%{install-root}%{bindir}" MANDIR="%{install-root}%{datadir}/man/man1" install

  - |
    rm "%{install-root}%{bindir}/zipinfo"
    ln -s unzip "%{install-root}%{bindir}/zipinfo"

public:
  cpe:
    vendor: 'info-zip'
    version-match: 'unzip(\d)(\d).tar.gz'
    patches:
    - CVE-2014-9636
    - CVE-2014-9913
    - CVE-2015-7696
    - CVE-2015-7697
    - CVE-2016-9844
    - CVE-2018-18384
    - CVE-2019-13232
    ignored:
    - CVE-2008-0888

sources:
- kind: tar
  url: sourceforge_download:infozip/unzip60.tar.gz
  ref: 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37
- kind: patch
  path: patches/unzip/CVE-2014-9636.patch
- kind: patch
  path: patches/unzip/CVE-2014-9913.patch
- kind: patch
  path: patches/unzip/CVE-2015-7696.patch
- kind: patch
  path: patches/unzip/CVE-2015-7697.patch
- kind: patch
  path: patches/unzip/CVE-2016-9844.patch
- kind: patch
  path: patches/unzip/CVE-2018-18384.patch
- kind: patch
  path: patches/unzip/0001-CVE-2019-13232-fix-bug-in-undefer-input.patch
- kind: patch
  path: patches/unzip/0002-CVE-2019-13232-zip-bomb-with-overlapped-entries.patch
- kind: patch
  path: patches/unzip/0003-CVE-2019-13232-Do-not-raise-a-zip-bomb-alert-for-a-misplaced-centra.patch
- kind: patch
  path: patches/unzip/unzip-6.0-bzip2-configure.patch
- kind: patch
  path: patches/unzip/unzip-6.0-configure.patch
- kind: patch
  path: patches/unzip/unzip-gnu89-build.patch
