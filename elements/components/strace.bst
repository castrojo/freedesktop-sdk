kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
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
  ref: v7.1-0-g40bbaa53cfbe65a48ebb503aa208387989228db6
