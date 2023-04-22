kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: f392ef70ad87a672f02519f99967d28a4d3047133e2d1df936511465fbb3791d
    suffix: 4d/4e/6cb8a301134315e37929763f7a45c3598dfb21e8d9b94e6846c87531886c/tomlkit-0.11.7.tar.gz
