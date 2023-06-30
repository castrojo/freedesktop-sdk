kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind-maybe.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

public:
  cpe:
    ignored:
    - CVE-2000-0006

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v6.4-0-g999d3a5d0e39eab0172f1cc53a5d03691fadbbc8
