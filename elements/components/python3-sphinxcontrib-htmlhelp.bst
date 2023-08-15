kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-htmlhelp
  ref:
    sha256sum: 6c26a118a05b76000738429b724a0568dbde5b72391a688577da08f11891092a
    suffix: fd/2d/abf5cd4cc1d5cd9842748b15a28295e4c4a927facfa8a0e173bd3f151bc5/sphinxcontrib_htmlhelp-2.0.4.tar.gz
