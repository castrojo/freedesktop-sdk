kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: 73efd63936398aac78fd92b6f4865190119d6c91b531532e798977ea8dd402eb
    suffix: 35/05/f81a74656c04e94f05c1ef186127cceb913493f1f8a21bb142a93c786ee8/zipp-3.12.0.tar.gz
