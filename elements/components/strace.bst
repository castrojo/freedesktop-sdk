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
- kind: git_repo
  url: github:strace/strace.git
  track: v*
  ref: v6.13-0-gdd0afd1c9cfc4e4040fe18db40345a227df12d03
