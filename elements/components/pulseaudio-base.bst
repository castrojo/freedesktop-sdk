kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/m4.bst
- components/perl-xml-parser.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/dbus.bst
- components/gdbm.bst
- components/glib.bst
- components/libtool.bst
- components/sndfile.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xtst.bst

variables:
  meson-local: >-
    -Dalsa=disabled
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=disabled
    -Ddatabase=gdbm
    -Dfftw=disabled
    -Dgtk=disabled
    -Dgstreamer=disabled
    -Djack=disabled
    -Delogind=disabled
    -Dlirc=disabled
    -Dorc=disabled
    -Dsoxr=disabled
    -Dspeex=disabled
    -Dsystemd=enabled
    -Dtcpwrap=disabled
    -Dtests=false
    -Dudev=disabled
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d
    -Dwebrtc-aec=disabled
    -Dvalgrind=disabled
    -Dbluez5-gstreamer=disabled

public:
  bst:
    split-rules:
      libpulse:
      - '%{debugdir}/**'
      - '%{includedir}/**'
      - '%{libdir}/cmake/**'
      - '%{libdir}/pkgconfig/**'
      - '%{libdir}/pulseaudio/lib*.so*'
      - '%{libdir}/lib*.so*'
      - '%{bindir}/pacat'
      - '%{bindir}/pacmd'
      - '%{bindir}/pactl'
      - '%{bindir}/padsp'
      - '%{bindir}/pa-info'
      - '%{bindir}/pamon'
      - '%{bindir}/paplay'
      - '%{bindir}/parec'
      - '%{bindir}/parecord'
      - '%{bindir}/pax11publish'
      - '%{sysconfdir}/pulse/client.conf'

sources:
- kind: git_tag
  url: freedesktop:pulseaudio/pulseaudio.git
  ref: v15.0-0-g6329a2498eb038f8a9537888280a62b00a93f68e
- kind: patch
  path: patches/pulseaudio/meson-disable-doxygen.patch
