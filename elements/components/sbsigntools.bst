kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/util-linux.bst
- components/gnu-efi.bst
- components/help2man.bst

depends:
- components/openssl.bst
- bootstrap-import.bst

variables:
  conf-local: >-
    CRTPATH=%{libdir}
    CPPFLAGS="-DOPENSSL_API_COMPAT=0x10100000L"

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/jejb/sbsigntools.git
  track: v0.9.4
  track-tags: true
  ref: v0.9.4-0-gd52f7bbb73401aab8a1d59e8d0d686ad9641035e
- kind: git_module
  path: lib/ccan.git
  url: git_https:git.ozlabs.org/~ccan/ccan
  ref: b1f28e17227f2320d07fe052a8a48942fe17caa5
- kind: patch
  path: patches/sbsigntools/openssl3.patch
