kind: meson

description: Linux D-Bus Message Broker

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/systemd.bst

config:
  install-commands:
    (>):
    - |
      ln -sf dbus-broker.service "%{install-root}%{indep-libdir}/systemd/system/dbus.service"
      ln -sf dbus-broker.service "%{install-root}%{indep-libdir}/systemd/user/dbus.service"

public:
  bst:
    overlap-whitelist:
    - "%{indep-libdir}/systemd/system/dbus.service"
    - "%{indep-libdir}/systemd/user/dbus.service"

# Cannot use git because meson subprojects are not supported https://github.com/apache/buildstream-plugins/issues/5
sources:
- kind: tar
  url: github:bus1/dbus-broker/releases/download/v37/dbus-broker-37.tar.xz
  ref: f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b
