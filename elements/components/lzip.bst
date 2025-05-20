kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-1.25.tar.gz
  ref: 09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f
