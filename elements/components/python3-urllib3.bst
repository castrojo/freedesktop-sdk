kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca179c0b9835e032825
    suffix: d6/af/3b4cfedd46b3addab52e84a71ab26518272c23c77116de3c61ead54af903/urllib3-2.0.3.tar.gz
