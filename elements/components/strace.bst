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
  ref: v5.19-0-g9b00bd51c9040931803c6d6d1718a0faef7d7d59
