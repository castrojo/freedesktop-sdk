kind: pyproject

build-depends:
- components/python3-flit-core.bst

depends:
- components/python3.bst

environment:
  PYTHONPATH: "%{build-root}/src"

config:
  build-commands:
  - |
    python3 -mflit_core.wheel

sources:
- kind: pypi
  name: installer
  ref:
    sha256sum: f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd5ac811953dc5d445
    suffix: 74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0/installer-0.5.1.tar.gz
