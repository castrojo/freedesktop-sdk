kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst

variables:
  extlibdir: "%{libdir}/openh264/extra"
  meson-local: "--libdir=%{extlibdir}"

config:
  install-commands:
    (>):
    - |
      mv "%{install-root}%{extlibdir}/pkgconfig/" "%{install-root}%{libdir}"

    - |
      ln -srL %{install-root}%{extlibdir}/libopenh264.so* %{install-root}%{libdir}

    - |
      rm %{install-root}%{extlibdir}/libopenh264.a

    - |
      ln -srL %{install-root}%{libdir}/libopenh264.so %{install-root}%{libdir}/libopenh264.so.5 

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{extlibdir}/libopenh264.so'
        - '%{libdir}/libopenh264.so'

sources:
- kind: git_tag
  url: github:endlessm/noopenh264.git
  track: master
  track-tags: true
  ref: Version_2.1.1-0-g3f95b4b6763598ae782b12905d429eabebcdc901
  exclude:
  - Release*
- kind: patch
  path: patches/noopenh264/make-version-same-as-actual-lib.patch
