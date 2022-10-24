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
  ref: dbus-1.12.24-0-g5ff925648e88ba29cef7d708bc2bbc5d6de5fc48
