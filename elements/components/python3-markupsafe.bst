kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.c' -delete

sources:
- kind: pypi
  name: markupsafe
  ref:
    sha256sum: abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad678306986b09450d
    suffix: 95/7e/68018b70268fb4a2a605e2be44ab7b4dd7ce7808adae6c5ef32e34f4b55a/MarkupSafe-2.1.2.tar.gz
