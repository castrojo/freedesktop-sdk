kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Denable_tests=false
    -Dxxhash_muxer=disabled
  # Disable LTO due to https://webkit.org/b/250477
  meson-lto-flags:

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'
  cpe:
    patches:
    - CVE-2023-32570

sources:
- kind: git_repo
  url: git_https:code.videolan.org/videolan/dav1d.git
  ref: 1.0.0-0-g99172b11470776177939c3d2bc366fe8d904eab7
- kind: patch
  path: patches/dav1d/CVE-2023-32570.patch
