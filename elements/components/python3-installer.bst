kind: manual

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

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: installer
  ref:
    sha256sum: a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631
    suffix: 05/18/ceeb4e3ab3aa54495775775b38ae42b10a92f42ce42dfa44da684289b8c8/installer-0.7.0.tar.gz
