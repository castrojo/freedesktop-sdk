kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/expat.bst
- components/systemd-libs.bst
- components/python3.bst
- components/systemd.bst
- components/libapparmor.bst

variables:
  conf-local: >-
    runstatedir=/run
    --with-system-socket=/run/dbus/system_bus_socket
    --enable-user-session

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

  cpe:
    product: d-bus

sources:
- kind: git_tag
  url: freedesktop:dbus/dbus.git
  track: dbus-1.12
  match:
  - dbus-[0-9].*[02468].*[02468]
  ref: dbus-1.12.28-0-g7e3b7e12e5cb175722553ae950d46c39599f2a8a
