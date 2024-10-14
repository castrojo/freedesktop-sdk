kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - |
      rm %{install-root}%{libdir}/libeconf.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libeconf.so'

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: v*
  ref: v0.7.4-0-gb66629fe913fe73b90b4408093635787827b6485
