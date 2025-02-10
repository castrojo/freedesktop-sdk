kind: meson

depends:
- components/audit.bst
- bootstrap-import.bst
- components/libeconf.bst

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
  ref: v1.7.0-0-gea980d991196df67cdd56b3f65d210b73218d08a
