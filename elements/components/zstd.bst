kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make -j1 install DESTDIR="%{install-root}" %{make-args}

config:
  install-commands:
    (>):
    - |
      rm -f '%{install-root}%{libdir}'/*.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libzstd.so'

sources:
- kind: git_repo
  url: github:facebook/zstd.git
  track: v*.*.*
  exclude:
  - "*-kernel"
  ref: v1.5.6-0-g794ea1b0afca0f020f4e57b6732332231fb23c70
