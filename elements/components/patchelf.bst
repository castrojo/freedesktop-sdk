kind: autotools_recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:NixOS/patchelf.git
  track: '*.*.*'
  ref: 0.18.0-0-g99c24238981b7b1084313aca8f5c493bb46f302c
