kind: manual

depends:
- bootstrap-import.bst
- components/alsa-lib.bst

build-depends:
- components/python3.bst
- components/systemd.bst
- components/pkg-config.bst

environment:
  JOBS: "%{max-jobs}"

environment-nocache:
- JOBS

variables:
  config: >-
    --prefix="%{prefix}"
    --bindir="%{bindir}"
    --libdir="%{libdir}"
    --mandir="%{mandir}"
    --systemd-unit
    --systemd=yes
    --db=no
    --alsa=yes
    --firewire=no
    --iio=no
    --enable-pkg-config-dbus-service-dir

config:
  configure-commands:
  - |
    python3 waf configure %{config}

  build-commands:
  - |
    python3 waf -j ${JOBS} build

  install-commands:
  - |
    python3 waf install --destdir="%{install-root}"

sources:
- kind: git_repo
  url: github:jackaudio/jack2.git
  track: v*
  ref: v1.9.22-0-g4f58969432339a250ce87fe855fb962c67d00ddb
