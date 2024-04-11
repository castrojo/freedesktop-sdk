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
  ref: v1.5.5-0-g63779c798237346c2b245c546c40b72a5a5913fe
