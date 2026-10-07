kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86
    suffix: 14/21/d83d6ef28c4c912c4bb4d1dcf591f7b8c6bde87b9c66f9f454677314e16d/pytz-2026.5.tar.gz
