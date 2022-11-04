kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind-maybe.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v6.0-0-gfb940a0481862da4abd44f5e910713ca9e072a78
