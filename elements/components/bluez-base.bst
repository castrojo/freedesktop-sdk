kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/python3-pygments.bst
- components/systemd.bst
- components/dbus.bst
- components/libical.bst
- components/ell.bst

variables:
  conf-local: >-
    --enable-library
    --enable-external-ell

public:
  bst:
    split-rules:
      bluez-libs:
      - '%{libdir}/libbluetooth*.so*'
      - '%{libdir}/pkgconfig/bluez.pc'
      - '%{includedir}/bluetooth/**'
      - '%{debugdir}/dwz/%{stripdir-suffix}/*'
      - '%{debugdir}%{libdir}/libbluetooth*.so*'
      - '%{sourcedir}/**'

  cpe:
    product: bluez

(@): elements/include/bluez.yml
