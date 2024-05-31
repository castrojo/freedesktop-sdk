kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    DISPATCH=%{dispatch}
  (?):
  - target_arch in ("i686", "x86_64"):
      dispatch: 1
  - target_arch not in ("i686", "x86_64"):
      dispatch: 0
  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxxhash.so'

sources:
- kind: git_repo
  url: github:Cyan4973/xxHash.git
  track: v*
  ref: v0.8.2-0-gbbb27a5efb85b92a0486cf361a8635715a53f6ba
