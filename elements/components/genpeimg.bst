kind: autotools_recc

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
  ref: v14.0.0-0-g9b3dd0125792fe94d16cacdc596dbd42fca1b369
