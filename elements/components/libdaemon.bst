kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: fdsdk_mirror:libdaemon/libdaemon.git
  track: v*
  ref: v0.14-0-g9fcc28e0e8f84968d1fb8b6d544a42efb13803ec
