kind: manual

build-depends:
- components/python3-installer.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: meson
  exclude:
  - '*rc'
  ref:
    sha256sum: aa50a4ba4557c25e7d48446abfde857957dcdf58385fffbe670ba0e8efacce05
    suffix: 83/40/c0ea8d3072441403aa30d91b900051a961e0f6d58f702c0ec9ca812c8737/meson-1.0.0.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
