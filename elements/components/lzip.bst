kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: anitya
  project-id: 1866
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-{version}.tar.gz
  ref:
    version: '1.25'
    sha256sum: 09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f
