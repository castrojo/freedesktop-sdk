kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/atk.bst
- filename: components/at-spi2-core.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libxml2.bst
  type: build

variables:
  meson-local: >-
    -Ddisable_p2p=true

config:
  install-commands:
    (>):
    - |
      # It contains useless at-spi2-atk.desktop file
      rm -rf "%{install-root}%{libdir}/gnome-settings-daemon-3.0"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-bridge-2.0.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-atk.git
  track: 'AT_SPI2_ATK_*_*[02468]_*'
  ref: AT_SPI2_ATK_2_38_0-0-gb91a111f040a09e804428a81e6de214e4962247b
