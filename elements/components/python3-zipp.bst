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
    sha256sum: 05b45f1ee8f807d0cc928485ca40a07cb491cf092ff587c0df9cb1fd154848d2
    suffix: 3b/e3/fb79a1ea5f3a7e9745f688855d3c673f2ef7921639a380ec76f7d4d83a85/zipp-3.8.1.tar.gz
