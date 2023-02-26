kind: manual

depends:
- bootstrap-import.bst
- components/gzip.bst
- components/lzo.bst

variables:
  make-vars: GZIP_SUPPORT=1 XZ_SUPPORT=1 LZO_SUPPORT=1 INSTALL_DIR="%{install-root}%{bindir}"

config:
  build-commands:
  - |
    cd squashfs-tools
    make %{make-vars}

  install-commands:
  - |
    cd squashfs-tools
    make -j1 %{make-vars} install

sources:
- kind: git_repo
  url: github:plougher/squashfs-tools.git
  track: master
  ref: fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5
- kind: patch
  path: patches/squashfs-tools/fix-includes.patch
