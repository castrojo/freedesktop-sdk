kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
- kind: git_repo
  url: github:strace/strace.git
  track: v*
  ref: v6.14-0-g68b13a1b2a9f29e1b39c598815045bb06da66b80
