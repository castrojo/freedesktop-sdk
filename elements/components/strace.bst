kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
# `strace` requires `libdw`, which is part of `elfutils`.
- bootstrap/elfutils.bst
- bootstrap/libselinux.bst
- bootstrap/ncurses.bst
- components/libunwind.bst

variables:
  conf-local: --enable-mpers=check

public:
  cpe:
    ignored:
    - CVE-2000-0006

sources:
- kind: git_repo
  url: github:strace/strace.git
  track: v*
  ref: v7.3-0-ge257cd1d332d3a55284e514612f12a20a29c5f97
