kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:projectatomic/bubblewrap.git
  track: v*
  ref: v0.11.1-0-g124c4cdf4321f63ef17a1cb0ce8f9dd45bd7adbe
