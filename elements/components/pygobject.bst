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
  - pygobject-3-40
  ref: 3.43.1-0-g3c10d970270cd3ed645e8bc11a00273df00cb496
