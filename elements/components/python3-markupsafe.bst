kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
    sha256sum: af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad
    suffix: 6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf/MarkupSafe-2.1.3.tar.gz
