kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: tar
  url: tar_https:bitmath.org/code/mtdev/mtdev-1.1.7.tar.gz
  ref: a55bd02a9af4dd266c0042ec608744fff3a017577614c057da09f1f4566ea32c
