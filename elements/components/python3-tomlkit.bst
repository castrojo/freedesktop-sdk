kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

# Don't convert to git
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79
    suffix: 
      b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa/tomlkit-0.13.2.tar.gz
