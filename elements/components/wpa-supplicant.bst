# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/pkg-config.bst
- components/systemd.bst

depends:
- components/dbus.bst
- components/libnl.bst

variables:
  license-files-extra: README

  config: |
    # Add configuration here
    CONFIG_OWE=y

  make-args: >-
    -C wpa_supplicant
    BINDIR="%{bindir}"
    LIBDIR="%{libdir}"
    DESTDIR="%{install-root}"

config:
  build-commands:
    (<):
    - |
      cp wpa_supplicant/defconfig wpa_supplicant/.config

    - |
      cat <<\EOF >>wpa_supplicant/.config
      %{config}
      EOF

  install-commands:
    (>):
    - |
      cd wpa_supplicant
      systemservices="$(pkg-config --variable system_bus_services_dir dbus-1)"
      systemdir="$(pkg-config --variable datadir dbus-1)/dbus-1/system.d"
      systemdsystemunitdir="$(pkg-config --variable systemdsystemunitdir systemd)"

      install -Dm644 -t "%{install-root}${systemservices}" dbus/fi.w1.wpa_supplicant1.service
      install -Dm644 dbus/dbus-wpa_supplicant.conf "%{install-root}${systemdir}/wpa_supplicant.conf"
      install -Dm644 -t "%{install-root}${systemdsystemunitdir}" systemd/*.service

sources:
- kind: git_repo
  url: git_https:w1.fi/hostap.git
  track: hostap_*
  ref: hostap_2_11-0-gd945ddd368085f255e68328f2d3b020ceea359af
