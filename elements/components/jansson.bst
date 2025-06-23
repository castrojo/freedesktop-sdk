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
  url: github:akheron/jansson.git
  track: v*
  ref: v2.15.0-0-g4a9a6db73d5dc553164992e87426502ab2d54512
