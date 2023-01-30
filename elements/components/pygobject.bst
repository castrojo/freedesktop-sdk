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
  - pygobject-3-42
  match:
  - "*.*[02468].*"
  ref: 3.42.2-0-gf9c363a0c2fea08b140dbb9c9f072cbeb0cf1f10
