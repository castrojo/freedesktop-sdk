kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 0085b0afb2446e57050140240a8595846ed64d1cbd26cef936bfab3192c673b8
    suffix: 
      82/4a/7874ca44a1c9b23796c767dd94159f6c17e31c0e7d090552a1c623247d82/multidict-6.2.0.tar.gz
