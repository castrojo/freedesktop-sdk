kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: 66eda1888b0171c998b35be2bcc0f6d75c388a7ce20c3f3f37aa8e96c2dddf58
    suffix: 
      40/bb/0ab3e58d22305b6f5440629d20683af28959bf793d98d11950e305c1c326/filelock-3.19.1.tar.gz
