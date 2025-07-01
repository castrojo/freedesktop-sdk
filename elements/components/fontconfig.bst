kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gperf.bst

depends:
- public-stacks/runtime-minimal.bst
- components/expat.bst
- components/freetype.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Dcache-build=disabled
    -Ddoc=disabled
    -Dtemplate-dir="%{sysconfdir}/fonts/conf.avail"
    -Dxml-backend="expat"
    -Dcache-dir="%{indep-libdir}/fontconfig/cache"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfontconfig.so'

    integration-commands:
    - |
      if [ -d "%{datadir}/fonts" ]; then
        touch -d @0 "%{datadir}/fonts" /usr/share/fonts/*
        fc-cache -rs
      fi

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: freedesktop:fontconfig/fontconfig.git
  track: '*.*.*'
  exclude:
  - 2.*.9*
  ref: 2.17.0-0-ga7a03d6ce093042d1ad4c5cf68746f44b03d8bda
- kind: patch
  path: patches/fontconfig/bitmap-block.patch
- kind: patch
  path: patches/fontconfig/rename-lohit-oriya.patch
