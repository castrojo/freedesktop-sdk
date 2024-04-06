kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/pixman.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/freetype.bst
- components/fontconfig.bst

variables:
  conf-local: >-
    --enable-xlib
    --enable-ft
    --enable-svg
    --enable-ps
    --enable-pdf
    --enable-tee
    --enable-gobject

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cairo-sphinx'
        - '%{bindir}/cairo-trace'
        - '%{libdir}/libcairo-script-interpreter.so'
        - '%{libdir}/libcairo-gobject.so'
        - '%{libdir}/libcairo.so'
        - '%{libdir}/cairo/libcairo-trace.so'
  cpe:
    patches:
    - CVE-2018-19876
    - CVE-2020-35492
    - CVE-2019-6462
    - CVE-2019-6461
    
sources:
- kind: git_repo
  url: freedesktop:cairo/cairo.git
  track: '1.16.*'
  ref: 1.16.0-0-g3ad43122b21a3299dd729dc8462d6b8f7f01142d
- kind: patch_queue
  path: patches/cairo
