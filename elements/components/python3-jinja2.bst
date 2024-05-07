kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  ref:
    sha256sum: 4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369
    suffix: 
      ed/55/39036716d19cab0747a5020fc7e907f362fbf48c984b14e62127f7e68e5d/jinja2-3.1.4.tar.gz
