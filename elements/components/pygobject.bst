kind: distutils

depends:
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/gobject-introspection.bst
- filename: components/pkg-config.bst
  type: build
- filename: components/python3-wheel.bst

- filename: components/pycairo.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}"
      mv "%{install-root}%{indep-libdir}/pkgconfig" "%{install-root}%{libdir}/"

sources:
- kind: git_tag
  url: gnome:pygobject.git
  track: master
  track-extra:
  - pygobject-3-44
  match:
  - "*.*[02468].*"
  ref: 3.44.0-0-g894f8b1dd3246bad6edb75aa86f61f6d83531a33
