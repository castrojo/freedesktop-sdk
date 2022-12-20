kind: manual

depends:
- components/dbus.bst
- components/libnl.bst

build-depends:
- components/pkg-config.bst
- components/systemd.bst

variables:
  config: |
    # Add configuration here
  make-args: >-
    BINDIR="%{bindir}"
    LIBDIR="%{libdir}"
    DESTDIR="%{install-root}"

config:
  configure-commands:
  - cp wpa_supplicant/defconfig wpa_supplicant/.config

  - |
    cat <<\EOF >>wpa_supplicant/.config
    %{config}
    EOF

  build-commands:
  - |
    cd wpa_supplicant
    make %{make-args}

  install-commands:
  - |
    cd wpa_supplicant
    make -j1 %{make-args} install

  - |
    cd wpa_supplicant
    systemservices="$(pkg-config --variable system_bus_services_dir dbus-1)"
    install -Dm644 -t "%{install-root}${systemservices}" dbus/fi.w1.wpa_supplicant1.service

  - |
    cd wpa_supplicant
    systemdir="$(pkg-config --variable datadir dbus-1)/dbus-1/system.d"
    install -Dm644 dbus/dbus-wpa_supplicant.conf "%{install-root}${systemdir}/wpa_supplicant.conf"

  - |
    cd wpa_supplicant
    systemdsystemunitdir="$(pkg-config --variable systemdsystemunitdir systemd)"
    install -Dm644 -t "%{install-root}${systemdsystemunitdir}" systemd/*.service

sources:
- kind: git_repo
  url: git_https:w1.fi/hostap.git
  track: hostap_*
  ref: hostap_2_10-0-gcff80b4f7d3c0a47c052e8187d671710f48939e4
