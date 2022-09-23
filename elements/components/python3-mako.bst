kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: 7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd
    suffix: b9/38/c25f0874ea71802fc6f1e9f0f88a7e9666818121b28991bbc1d8eddbcdb1/Mako-1.2.3.tar.gz
