kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/hwdata.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/di-edid-decode'
        - '%{libdir}/libdisplay-info.so'

sources:
- kind: git_repo
  track: '*.*.*'
  url: freedesktop:emersion/libdisplay-info.git
  ref: 0.4.0-0-gc67a3e9bedb05ab61c7443704a1a107e76254595
