kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
# requires pypi tarball specifically
- kind: pypi
  name: protobuf
  exclude:
  - '*rc*'
  ref:
    sha256sum: 535fb4e44d0236893d5cf1263a0f706f1160b689a7ab962e9da8a9ce4050b780
    suffix: 
      55/de/8216061897a67b2ffe302fd51aaa76bbf613001f01cd96e2416a4955dd2b/protobuf-6.30.1.tar.gz
