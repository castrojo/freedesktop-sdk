kind: make

build-depends:
- components/help2man.bst
- components/which.bst

depends:
- bootstrap-import.bst
- components/gzip.bst
- components/lzo.bst
- components/zstd.bst

variables:
  make-args: >-
    GZIP_SUPPORT=1
    XZ_SUPPORT=1
    LZO_SUPPORT=1
    ZSTD_SUPPORT=1
    INSTALL_PREFIX=%{install-root}%{prefix}
    INSTALL_MANPAGES_DIR=%{install-root}%{mandir}/man1

  command-subdir: squashfs-tools

sources:
- kind: git_repo
  url: github:plougher/squashfs-tools.git
  track: squashfs-tools-*
  ref: squashfs-tools-4.6.1-0-gd8cb82d9840330f9344ec37b992595b5d7b44184
