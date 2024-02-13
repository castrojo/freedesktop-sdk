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
    sha256sum: d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b
    suffix: 
      87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d/MarkupSafe-2.1.5.tar.gz
