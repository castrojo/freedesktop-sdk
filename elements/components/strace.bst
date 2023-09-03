kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind.bst
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
  ref: v6.5-0-gb271519228028f77da64d958b9419cef0762e24b
