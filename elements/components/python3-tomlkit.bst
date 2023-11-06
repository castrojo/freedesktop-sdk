kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: df32fab589a81f0d7dc525a4267b6d7a64ee99619cbd1eeb0fae32c1dd426977
    suffix: 
      9b/93/93f12cdd3b9da81e94f2435d01fe6b3e9edc7704a25d4ad260ce7906ca62/tomlkit-0.12.2.tar.gz
