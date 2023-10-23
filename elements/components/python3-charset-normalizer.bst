kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: d9137a876020661972ca6eec0766d81aef8a5627df628b664b234b73396e727e
    suffix: 
      6d/b3/aa417b4e3ace24067f243e45cceaffc12dba6b8bd50c229b43b3b163768b/charset-normalizer-3.3.1.tar.gz
