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
  ref: v6.6-0-gbf598d9bbffc64c046bd288bce51535d0d98d800
