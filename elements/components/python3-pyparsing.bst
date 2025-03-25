kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: 2a857aee851f113c2de9d4bfd9061baea478cb0f1c7ca6cbf594942d6d111575
    suffix: 
      55/f0/3a81fb395058f5fc84bccb0dc9ca09eddf69b3cc86ccab6729c680121912/pyparsing-3.2.2.tar.gz
