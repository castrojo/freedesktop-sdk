kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/systemd.bst
- components/dbus.bst
- components/libical.bst

variables:
  conf-local: >-
    --enable-library

public:
  bst:
    split-rules:
      bluez-libs:
      - '%{libdir}/libbluetooth*.so.*'
      - '%{includedir}/bluetooth/**'
      - '%{debugdir}/dwz/%{element-name}/*'
      - '%{debugdir}%{libdir}/libbluetooth*.so*'
      - '%{sourcedir}/**'

(@): elements/include/bluez.yml
