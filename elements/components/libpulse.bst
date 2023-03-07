kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/m4.bst
- components/perl-xml-parser.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libtool.bst
- components/sndfile.bst

variables:
  meson-local: >-
    -Dalsa=disabled
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=disabled
    -Dfftw=disabled
    -Ddbus=disabled
    -Dsystemd=disabled
    -Dgtk=disabled
    -Dgstreamer=disabled
    -Djack=disabled
    -Delogind=disabled
    -Dlirc=disabled
    -Dorc=disabled
    -Dsoxr=disabled
    -Dspeex=disabled
    -Dtcpwrap=disabled
    -Dtests=false
    -Dudev=disabled
    -Dwebrtc-aec=disabled
    -Dvalgrind=disabled
    -Dx11=disabled
    -Dbluez5-gstreamer=disabled
    -Ddaemon=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpulse.so'
        - '%{libdir}/libpulse-simple.so'
        - '%{libdir}/libpulse-mainloop-glib.so'


  cpe:
    product: pulseaudio

sources:
- kind: git_repo
  url: freedesktop:pulseaudio/pulseaudio.git
  track: v*
  exclude:
  - v*.99.*
  ref: v16.1-0-ge5ad31e873eed62bc580a86a61177047f9e8c491
- kind: patch
  path: patches/pulseaudio/meson-disable-doxygen.patch
