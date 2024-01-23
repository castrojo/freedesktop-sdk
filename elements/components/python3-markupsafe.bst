kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.c' -delete

sources:
- kind: pypi
  name: markupsafe
  ref:
    sha256sum: 3aae9af4cac263007fd6309c64c6ab4506dd2b79382d9d19a1994f9240b8db4f
    suffix: 
      fb/5a/fb1326fe32913e663c8e2d6bdf7cde6f472e51f9c21f0768d9b9080fe7c5/MarkupSafe-2.1.4.tar.gz
