kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-cmd: mingw-w64-tools/genpeimg/configure

sources:
- kind: git_repo
  url: sourceforge_git:mingw-w64/mingw-w64.git
  track: v*
  ref: v13.0.0-0-gde62c283f3383bd825c98518cb0a42ba071d4ac2
