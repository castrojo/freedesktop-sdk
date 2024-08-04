kind: pip

depends:
- components/python3.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst
- components/python3-hatch-fancy-pypi-readme.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: attrs
  ref:
    sha256sum: adbdec84af72d38be7628e353a09b6a6790d15cd71819f6e9d7b0faa8a125745
    suffix: 
      39/31/ca3e2de55503d8ad75985865629f69a2c376a44428c5df1450b749d30751/attrs-24.1.0.tar.gz
