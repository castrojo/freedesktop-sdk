kind: meson

depends:
- components/audit.bst
- components/libeconf.bst
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst

variables:
  meson-local: >-
    -Dpam_lastlog=enabled
    -Dexamples=false
    -Dlogind=disabled
    -Dnis=disabled
    -Dselinux=disabled
    -Ddocs=disabled
    -Delogind=disabled

config:
  install-commands:
    (>):
    - rm -rf "%{install-root}/var/run"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpam.so'
        - '%{libdir}/libpam_misc.so'
        - '%{libdir}/libpamc.so'
      vm-only:
        # Most of this is only useful for VM.
        # We keep only libraries for dependencies.
      - '%{sysconfdir}'
      - '%{sysconfdir}/**'
      - '%{bindir}'
      - '%{bindir}/**'
      - '%{datadir}'
      - '%{datadir}/**'
  cpe:
    product: linux-pam

sources:
- kind: git_repo
  url: github:linux-pam/linux-pam.git
  track: v*
  ref: v1.7.1-0-g693c4f75b10b25e09f70fe0b22f41bdcf9a48968
