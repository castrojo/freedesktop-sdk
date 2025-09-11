kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/expat.bst
- components/systemd-libs.bst
- components/python3.bst
- components/systemd.bst
- components/libapparmor.bst
- components/doxygen.bst
- components/docbook-xsl.bst
- components/xmlto.bst

variables:
  meson-local: >-
    -Dlibaudit=disabled
    -Dsystem_socket="/run/dbus/system_bus_socket"
    -Duser_session=true
    -Dducktype_docs=disabled
    -Dqt_help=disabled
    -Dmodular_tests=disabled
    -Drelocation=disabled
    -Dselinux=disabled
    -Dkqueue=disabled
    -Dlaunchd=disabled
    -Dx11_autolaunch=disabled
    -Ddoxygen_docs=enabled
    -Dxml_docs=enabled

config:
  install-commands:
    (>):
    - |
      rm -rf %{install-root}%{localstatedir}/run

# TODO: replace with --disable-traditional-activation
# https://gitlab.freedesktop.org/dbus/dbus/commit/94b5b236aa0743bacb2139c62d5a6e0143845634
    - |
      rm %{install-root}%{libexecdir}/dbus-daemon-launch-helper

public:
  bst:
    split-rules:
      dbus-libs:
      - '%{includedir}'
      - '%{includedir}/**'
      - '%{libdir}/dbus-1.0/include'
      - '%{libdir}/dbus-1.0/include/**'
      - '%{libdir}/libdbus-1.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/**'
      - '%{libdir}/cmake'
      - '%{libdir}/cmake/**'
      - '%{debugdir}%{libdir}/libdbus-1.so*'
      - '%{debugdir}/dwz'
      - '%{debugdir}/dwz/**'
      - '%{sourcedir}'
      - '%{sourcedir}/**'
      dbus-tools:
      - '%{bindir}/dbus-send'
      - '%{debugdir}%{bindir}/dbus-send.debug'
      dbus-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"

  cpe:
    product: d-bus

sources:
- kind: git_repo
  url: freedesktop:dbus/dbus.git
  track: dbus-[0-9].*[02468].*[02468]
  ref: dbus-1.16.2-0-g958bf9db2100553bcd2fe2a854e1ebb42e886054
