kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/systemd.bst
- components/dbus.bst
- components/libical.bst
- components/ell.bst

variables:
  conf-local: >-
    --enable-library
    --enable-external-ell

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t '%{install-root}%{sysconfdir}/bluetooth/' src/main.conf profiles/network/network.conf profiles/input/input.conf

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
