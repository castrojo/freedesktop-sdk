kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libeconf.so'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: v*
  ref: v0.7.2-0-g0097fc5d550b69e245310ec8b05806158fcce85d
