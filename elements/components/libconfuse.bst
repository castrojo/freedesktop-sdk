kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  cpe:
    ignored:
    - CVE-2022-40320   #patched

sources:
- kind: git_repo
  url: github:martinh/libconfuse.git
  track: v*.*
  ref: v3.3-0-ga42aebf13db33afd575da6e63f55163d371f776d
- kind: patch
  path: patches/libconfuse/CVE-2022-40320-Fix-163-unterminated-username-used-with-getpwnam.patch
